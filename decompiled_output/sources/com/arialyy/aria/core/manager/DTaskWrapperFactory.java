package com.arialyy.aria.core.manager;

import com.arialyy.aria.core.TaskRecord;
import com.arialyy.aria.core.download.DTaskWrapper;
import com.arialyy.aria.core.download.DownloadEntity;
import com.arialyy.aria.core.loader.IRecordHandler;
import java.io.File;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class DTaskWrapperFactory implements INormalTEFactory<DownloadEntity, DTaskWrapper> {
    private static volatile DTaskWrapperFactory INSTANCE;
    private final String TAG = "DTaskWrapperFactory";

    private DTaskWrapperFactory() {
    }

    public static DTaskWrapperFactory getInstance() {
        if (INSTANCE == null) {
            synchronized (DTaskWrapperFactory.class) {
                INSTANCE = new DTaskWrapperFactory();
            }
        }
        return INSTANCE;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.arialyy.aria.core.manager.INormalTEFactory
    public DTaskWrapper create(long j) {
        DTaskWrapper dTaskWrapper;
        if (j == -1) {
            dTaskWrapper = new DTaskWrapper(new DownloadEntity());
        } else {
            dTaskWrapper = new DTaskWrapper(getEntity(j));
        }
        dTaskWrapper.setRequestType(dTaskWrapper.getEntity().getTaskType());
        return dTaskWrapper;
    }

    private DownloadEntity getEntity(long j) {
        DownloadEntity downloadEntity = (DownloadEntity) DownloadEntity.findFirst(DownloadEntity.class, "rowid=? and isGroupChild='false'", String.valueOf(j));
        if (downloadEntity == null) {
            return new DownloadEntity();
        }
        File file = new File(downloadEntity.getFilePath());
        if (!downloadEntity.isComplete()) {
            TaskRecord taskRecord = (TaskRecord) TaskRecord.findFirst(TaskRecord.class, "filePath=?", downloadEntity.getFilePath());
            if (taskRecord == null) {
                resetEntity(downloadEntity);
            } else if (taskRecord.isBlock) {
                int i = taskRecord.threadNum;
                int i2 = 0;
                for (int i3 = 0; i3 < i; i3++) {
                    if (!new File(String.format(IRecordHandler.SUB_PATH, taskRecord.filePath, Integer.valueOf(i3))).exists()) {
                        i2++;
                    }
                }
                if (i2 == taskRecord.threadNum) {
                    resetEntity(downloadEntity);
                }
            } else if (!file.exists() && taskRecord.taskType != 7) {
                resetEntity(downloadEntity);
            }
        }
        return downloadEntity;
    }

    private void resetEntity(DownloadEntity downloadEntity) {
        downloadEntity.setPercent(0);
        downloadEntity.setCompleteTime(0L);
        downloadEntity.setComplete(false);
        downloadEntity.setCurrentProgress(0L);
        downloadEntity.setState(3);
    }
}
