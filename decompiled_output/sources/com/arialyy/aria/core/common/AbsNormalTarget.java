package com.arialyy.aria.core.common;

import com.arialyy.aria.core.common.AbsNormalTarget;
import com.arialyy.aria.core.common.controller.INormalFeature;
import com.arialyy.aria.core.common.controller.NormalController;
import com.arialyy.aria.core.download.DownloadGroupEntity;
import com.arialyy.aria.core.inf.AbsTarget;
import com.arialyy.aria.core.manager.TaskWrapperManager;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import com.arialyy.aria.util.DeleteDGRecord;
import com.arialyy.aria.util.RecordUtil;
/* loaded from: classes.dex */
public abstract class AbsNormalTarget<TARGET extends AbsNormalTarget> extends AbsTarget<TARGET> implements INormalFeature {
    private NormalController mNormalController;

    public boolean isRunning() {
        return false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onPre() {
    }

    public boolean taskExists() {
        return false;
    }

    public TARGET ignoreCheckPermissions() {
        getController().ignoreCheckPermissions();
        return this;
    }

    private synchronized NormalController getController() {
        if (this.mNormalController == null) {
            this.mNormalController = new NormalController(getTaskWrapper());
        }
        return this.mNormalController;
    }

    public void removeRecord() {
        if (isRunning()) {
            ALog.d("AbsTarget", "任务正在下载，即将删除任务");
            cancel();
            return;
        }
        if (getEntity() instanceof AbsNormalEntity) {
            RecordUtil.delNormalTaskRecord((AbsNormalEntity) getEntity(), getTaskWrapper().isRemoveFile());
        } else if (getEntity() instanceof DownloadGroupEntity) {
            DeleteDGRecord.getInstance().deleteRecord(getEntity(), getTaskWrapper().isRemoveFile(), true);
        }
        TaskWrapperManager.getInstance().removeTaskWrapper(getTaskWrapper());
    }

    public long getCurrentProgress() {
        if (getEntity() == null) {
            return -1L;
        }
        return getEntity().getCurrentProgress();
    }

    public long getFileSize() {
        if (getEntity() == null) {
            return 0L;
        }
        return getEntity().getFileSize();
    }

    public String getConvertFileSize() {
        return getEntity() == null ? "0b" : CommonUtil.formatFileSize(getEntity().getFileSize());
    }

    public String getExtendField() {
        return getEntity().getStr();
    }

    public int getTaskState() {
        return getEntity().getState();
    }

    public int getPercent() {
        if (getEntity() == null) {
            ALog.e("AbsTarget", "下载管理器中没有该任务");
            return 0;
        } else if (getEntity().getFileSize() != 0) {
            return (int) ((getEntity().getCurrentProgress() * 100) / getEntity().getFileSize());
        } else {
            return 0;
        }
    }

    @Override // com.arialyy.aria.core.common.controller.INormalFeature
    public void stop() {
        onPre();
        getController().stop();
    }

    @Override // com.arialyy.aria.core.common.controller.INormalFeature
    public void resume() {
        resume(false);
    }

    @Override // com.arialyy.aria.core.common.controller.INormalFeature
    public void resume(boolean z) {
        onPre();
        getController().resume(z);
    }

    @Override // com.arialyy.aria.core.common.controller.INormalFeature
    public void cancel() {
        cancel(false);
    }

    @Override // com.arialyy.aria.core.common.controller.INormalFeature
    public void reTry() {
        onPre();
        getController().reTry();
    }

    @Override // com.arialyy.aria.core.common.controller.INormalFeature
    public void cancel(boolean z) {
        onPre();
        getController().cancel(z);
    }

    @Override // com.arialyy.aria.core.common.controller.INormalFeature
    public long reStart() {
        onPre();
        return getController().reStart();
    }

    @Override // com.arialyy.aria.core.common.controller.INormalFeature
    public void save() {
        onPre();
        getController().save();
    }
}
