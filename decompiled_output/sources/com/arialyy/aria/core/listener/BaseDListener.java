package com.arialyy.aria.core.listener;

import com.arialyy.aria.core.task.DownloadTask;
import com.arialyy.aria.util.CommonUtil;
import com.arialyy.aria.util.DeleteDRecord;
/* loaded from: classes.dex */
public class BaseDListener extends BaseListener implements IDLoadListener {
    @Override // com.arialyy.aria.core.listener.IDLoadListener
    public void onPostPre(long j) {
        this.mEntity.setFileSize(j);
        this.mEntity.setConvertFileSize(CommonUtil.formatFileSize(j));
        saveData(6, -1L);
        sendInState2Target(1);
    }

    @Override // com.arialyy.aria.core.listener.IDLoadListener
    public void supportBreakpoint(boolean z) {
        if (z) {
            return;
        }
        sendInState2Target(9);
    }

    @Override // com.arialyy.aria.core.listener.BaseListener
    protected void handleCancel() {
        if (((DownloadTask) getTask(DownloadTask.class)).getSchedulerType() == 4) {
            this.mEntity.setComplete(false);
            this.mEntity.setState(3);
            DeleteDRecord.getInstance().deleteRecord(this.mEntity, this.mTaskWrapper.isRemoveFile(), false);
            return;
        }
        DeleteDRecord.getInstance().deleteRecord(this.mEntity, this.mTaskWrapper.isRemoveFile(), true);
    }
}
