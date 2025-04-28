package com.arialyy.aria.core.listener;

import com.arialyy.aria.core.task.UploadTask;
import com.arialyy.aria.util.DeleteURecord;
/* loaded from: classes.dex */
public class BaseUListener extends BaseListener implements IUploadListener {
    @Override // com.arialyy.aria.core.listener.BaseListener
    protected void handleCancel() {
        if (((UploadTask) getTask(UploadTask.class)).getSchedulerType() == 4) {
            this.mEntity.setComplete(false);
            this.mEntity.setState(3);
            DeleteURecord.getInstance().deleteRecord(this.mEntity, this.mTaskWrapper.isRemoveFile(), false);
            return;
        }
        DeleteURecord.getInstance().deleteRecord(this.mEntity, this.mTaskWrapper.isRemoveFile(), true);
    }
}
