package com.arialyy.aria.core.common;

import com.arialyy.aria.core.TaskRecord;
import com.arialyy.aria.core.ThreadRecord;
import com.arialyy.aria.core.download.DownloadEntity;
import com.arialyy.aria.core.loader.ILoaderVisitor;
import com.arialyy.aria.core.loader.IRecordHandler;
import com.arialyy.aria.core.upload.UploadEntity;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.core.wrapper.RecordWrapper;
import com.arialyy.aria.orm.DbEntity;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import com.arialyy.aria.util.DbDataHelper;
import com.arialyy.aria.util.FileUtil;
import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Properties;
import java.util.Set;
/* loaded from: classes.dex */
public abstract class RecordHandler implements IRecordHandler {
    protected final String TAG = CommonUtil.getClassName(this);
    @Deprecated
    private File mConfigFile;
    private AbsNormalEntity mEntity;
    protected String mFilePath;
    protected long mFileSize;
    private TaskRecord mTaskRecord;
    private AbsTaskWrapper mTaskWrapper;

    @Override // com.arialyy.aria.core.loader.IRecordHandler
    public void onPre() {
    }

    public RecordHandler(AbsTaskWrapper absTaskWrapper) {
        this.mTaskWrapper = absTaskWrapper;
        this.mEntity = (AbsNormalEntity) absTaskWrapper.getEntity();
    }

    public AbsTaskWrapper getWrapper() {
        return this.mTaskWrapper;
    }

    public AbsNormalEntity getEntity() {
        return this.mEntity;
    }

    @Override // com.arialyy.aria.core.loader.IRecordHandler
    public TaskRecord getRecord(long j) {
        this.mFileSize = j;
        File file = new File(CommonUtil.getFileConfigPath(false, this.mEntity.getFileName()));
        this.mConfigFile = file;
        if (file.exists()) {
            convertDb();
        } else {
            onPre();
            TaskRecord taskRecord = DbDataHelper.getTaskRecord(getFilePath(), this.mEntity.getTaskType());
            this.mTaskRecord = taskRecord;
            if (taskRecord == null) {
                initRecord(true);
            } else if (taskRecord.threadRecords == null || this.mTaskRecord.threadRecords.size() == 0) {
                if (this.mTaskRecord.threadRecords == null) {
                    this.mTaskRecord.threadRecords = new ArrayList();
                }
                initRecord(false);
            }
            handlerTaskRecord(this.mTaskRecord);
        }
        saveRecord();
        return this.mTaskRecord;
    }

    private void convertDb() {
        List findRelationData = DbEntity.findRelationData(RecordWrapper.class, "TaskRecord.filePath=?", getFilePath());
        if (findRelationData == null || findRelationData.size() == 0) {
            Properties loadConfig = FileUtil.loadConfig(this.mConfigFile);
            if (loadConfig.isEmpty()) {
                ALog.d(this.TAG, "老版本的线程记录为空，任务为新任务");
                initRecord(true);
                return;
            }
            Set<Object> keySet = loadConfig.keySet();
            HashSet hashSet = new HashSet();
            for (Object obj : keySet) {
                String valueOf = String.valueOf(obj);
                hashSet.add(Integer.valueOf(Integer.parseInt(valueOf.substring(valueOf.length() - 1))));
            }
            int size = hashSet.size();
            if (size == 0) {
                ALog.d(this.TAG, "线程数为空，任务为新任务");
                initRecord(true);
                return;
            }
            this.mTaskWrapper.setNewTask(false);
            TaskRecord createTaskRecord = createTaskRecord(size);
            this.mTaskRecord = createTaskRecord;
            createTaskRecord.isBlock = false;
            File file = new File(getFilePath());
            for (int i = 0; i < size; i++) {
                ThreadRecord threadRecord = new ThreadRecord();
                threadRecord.taskKey = this.mTaskRecord.filePath;
                String property = loadConfig.getProperty(file.getName() + IRecordHandler.STATE + i);
                String property2 = loadConfig.getProperty(file.getName() + IRecordHandler.RECORD + i);
                if (property != null && Integer.parseInt(String.valueOf(property)) == 1) {
                    threadRecord.isComplete = true;
                } else {
                    if (property2 != null) {
                        long parseLong = Long.parseLong(String.valueOf(property2));
                        threadRecord.startLocation = parseLong > 0 ? parseLong : 0L;
                    } else {
                        threadRecord.startLocation = 0L;
                    }
                    this.mTaskRecord.threadRecords.add(threadRecord);
                }
            }
            FileUtil.deleteFile(this.mConfigFile);
        }
    }

    private void initRecord(boolean z) {
        if (z) {
            this.mTaskRecord = createTaskRecord(initTaskThreadNum());
        }
        this.mTaskWrapper.setNewTask(true);
        if (this.mTaskWrapper.getRequestType() == 8) {
            return;
        }
        long fileSize = getFileSize() / this.mTaskRecord.threadNum;
        int i = 0;
        while (true) {
            int i2 = i;
            if (i2 >= this.mTaskRecord.threadNum) {
                return;
            }
            i = i2 + 1;
            this.mTaskRecord.threadRecords.add(createThreadRecord(this.mTaskRecord, i2, i2 * fileSize, i * fileSize));
        }
    }

    private void saveRecord() {
        TaskRecord taskRecord = this.mTaskRecord;
        taskRecord.threadNum = taskRecord.threadRecords.size();
        this.mTaskRecord.save();
        if (this.mTaskRecord.threadRecords != null && !this.mTaskRecord.threadRecords.isEmpty()) {
            DbEntity.saveAll(this.mTaskRecord.threadRecords);
        }
        ALog.d(this.TAG, String.format("保存记录，线程记录数：%s", Integer.valueOf(this.mTaskRecord.threadRecords.size())));
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public long getFileSize() {
        return this.mFileSize;
    }

    private String getFilePath() {
        if (this.mEntity instanceof DownloadEntity) {
            return ((DownloadEntity) this.mTaskWrapper.getEntity()).getFilePath();
        }
        return ((UploadEntity) this.mTaskWrapper.getEntity()).getFilePath();
    }

    @Override // com.arialyy.aria.core.loader.ILoaderComponent
    public void accept(ILoaderVisitor iLoaderVisitor) {
        iLoaderVisitor.addComponent(this);
    }

    @Override // com.arialyy.aria.core.loader.IRecordHandler
    public boolean checkTaskCompleted() {
        TaskRecord taskRecord = this.mTaskRecord;
        if (taskRecord == null || taskRecord.threadRecords == null || this.mTaskRecord.threadRecords.isEmpty()) {
            return false;
        }
        int i = 0;
        for (ThreadRecord threadRecord : this.mTaskRecord.threadRecords) {
            if (threadRecord.isComplete) {
                i++;
            }
        }
        return i != 0 && i == this.mTaskRecord.threadNum;
    }
}
