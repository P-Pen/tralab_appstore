package com.arialyy.aria.util;

import android.text.TextUtils;
import com.arialyy.aria.core.TaskRecord;
import com.arialyy.aria.core.ThreadRecord;
import com.arialyy.aria.core.common.AbsEntity;
import com.arialyy.aria.core.download.DownloadEntity;
import com.arialyy.aria.core.download.M3U8Entity;
import com.arialyy.aria.orm.DbEntity;
import java.io.File;
/* loaded from: classes.dex */
public class DeleteM3u8Record implements IDeleteRecord {
    private static volatile DeleteM3u8Record INSTANCE;
    private String TAG = CommonUtil.getClassName(this);

    private DeleteM3u8Record() {
    }

    public static DeleteM3u8Record getInstance() {
        if (INSTANCE == null) {
            synchronized (DeleteM3u8Record.class) {
                if (INSTANCE == null) {
                    INSTANCE = new DeleteM3u8Record();
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
        TaskRecord taskRecord = DbDataHelper.getTaskRecord(filePath, downloadEntity.getTaskType());
        if (taskRecord == null) {
            String str = this.TAG;
            ALog.e(str, "删除下载记录失败，记录为空，将删除实体记录，filePath：" + downloadEntity.getFilePath());
            deleteEntity(downloadEntity.getTaskType(), z2, filePath);
            return;
        }
        if (z || !downloadEntity.isComplete()) {
            removeTsCache(new File(filePath), taskRecord.bandWidth);
            FileUtil.deleteFile(filePath);
        }
        deleteEntity(downloadEntity.getTaskType(), z2, filePath);
    }

    private void deleteEntity(int i, boolean z, String str) {
        DbEntity.deleteData(ThreadRecord.class, "taskKey=? AND threadType=?", str, String.valueOf(i));
        DbEntity.deleteData(TaskRecord.class, "filePath=? AND taskType=?", str, String.valueOf(i));
        DbEntity.deleteData(M3U8Entity.class, "filePath=?", str);
        if (z) {
            DbEntity.deleteData(DownloadEntity.class, "downloadPath=?", str);
        }
    }

    private static void removeTsCache(File file, long j) {
        File[] listFiles;
        M3U8Entity m3U8Entity = (M3U8Entity) DbEntity.findFirst(M3U8Entity.class, "filePath=?", file.getPath());
        if (m3U8Entity != null && !TextUtils.isEmpty(m3U8Entity.keyPath)) {
            FileUtil.deleteFile(new File(m3U8Entity.keyPath));
        }
        String format = file.isDirectory() ? null : String.format("%s/.%s_%s", file.getParent(), file.getName(), Long.valueOf(j));
        if (!TextUtils.isEmpty(format)) {
            File file2 = new File(format);
            if (!file2.exists()) {
                return;
            }
            for (File file3 : file2.listFiles()) {
                if (file3.exists()) {
                    file3.delete();
                }
            }
            File file4 = new File(format);
            if (file4.exists()) {
                file4.delete();
            }
        }
        File file5 = new File(String.format("%s.index", file.getPath()));
        if (file5.exists()) {
            file5.delete();
        }
    }
}
