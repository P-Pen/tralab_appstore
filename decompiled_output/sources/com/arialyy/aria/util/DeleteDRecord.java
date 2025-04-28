package com.arialyy.aria.util;

import android.text.TextUtils;
import com.arialyy.aria.core.TaskRecord;
import com.arialyy.aria.core.ThreadRecord;
import com.arialyy.aria.core.common.AbsEntity;
import com.arialyy.aria.core.download.DownloadEntity;
import com.arialyy.aria.core.loader.IRecordHandler;
import com.arialyy.aria.orm.DbEntity;
import java.io.File;
/* loaded from: classes.dex */
public class DeleteDRecord implements IDeleteRecord {
    private static volatile DeleteDRecord INSTANCE;
    private String TAG = CommonUtil.getClassName(this);

    private DeleteDRecord() {
    }

    public static DeleteDRecord getInstance() {
        if (INSTANCE == null) {
            synchronized (DeleteDRecord.class) {
                if (INSTANCE == null) {
                    INSTANCE = new DeleteDRecord();
                }
            }
        }
        return INSTANCE;
    }

    @Override // com.arialyy.aria.util.IDeleteRecord
    public void deleteRecord(String str, boolean z, boolean z2) {
        if (TextUtils.isEmpty(str)) {
            throw new NullPointerException("删除记录失败，文件路径为空");
        }
        if (!str.startsWith("/")) {
            throw new IllegalArgumentException(String.format("文件路径错误，filePath：%s", str));
        }
        DownloadEntity downloadEntity = (DownloadEntity) DbEntity.findFirst(DownloadEntity.class, "downloadPath=?", str);
        if (downloadEntity == null) {
            String str2 = this.TAG;
            ALog.e(str2, "删除下载记录失败，没有在数据库中找到对应的实体文件，filePath：" + str);
            return;
        }
        deleteRecord(downloadEntity, z, z2);
    }

    @Override // com.arialyy.aria.util.IDeleteRecord
    public void deleteRecord(AbsEntity absEntity, boolean z, boolean z2) {
        if (absEntity == null) {
            ALog.e(this.TAG, "删除下载记录失败，实体为空");
            return;
        }
        DownloadEntity downloadEntity = (DownloadEntity) absEntity;
        String filePath = downloadEntity.getFilePath();
        File file = new File(filePath);
        if (downloadEntity.getTaskType() == 7 || downloadEntity.getTaskType() == 8) {
            DeleteM3u8Record.getInstance().deleteRecord(downloadEntity, z, z2);
            return;
        }
        TaskRecord taskRecord = DbDataHelper.getTaskRecord(downloadEntity.getFilePath(), downloadEntity.getTaskType());
        if (taskRecord == null) {
            String str = this.TAG;
            ALog.e(str, "删除下载记录失败，记录为空，将删除实体记录，filePath：" + downloadEntity.getFilePath());
            FileUtil.deleteFile(file);
            deleteEntity(z2, filePath);
            return;
        }
        DbEntity.deleteData(ThreadRecord.class, "taskKey=? AND threadType=?", filePath, String.valueOf(downloadEntity.getTaskType()));
        DbEntity.deleteData(TaskRecord.class, "filePath=? AND taskType=?", filePath, String.valueOf(downloadEntity.getTaskType()));
        if (z || !downloadEntity.isComplete()) {
            FileUtil.deleteFile(file);
            if (taskRecord.isBlock) {
                removeBlockFile(taskRecord);
            }
        }
        deleteEntity(z2, filePath);
    }

    private void deleteEntity(boolean z, String str) {
        if (z) {
            DbEntity.deleteData(DownloadEntity.class, "downloadPath=?", str);
        }
    }

    private void removeBlockFile(TaskRecord taskRecord) {
        int i = taskRecord.threadNum;
        for (int i2 = 0; i2 < i; i2++) {
            FileUtil.deleteFile(String.format(IRecordHandler.SUB_PATH, taskRecord.filePath, Integer.valueOf(i2)));
        }
    }
}
