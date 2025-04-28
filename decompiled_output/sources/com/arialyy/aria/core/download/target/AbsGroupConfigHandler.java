package com.arialyy.aria.core.download.target;

import android.text.TextUtils;
import com.arialyy.aria.core.common.AbsNormalTarget;
import com.arialyy.aria.core.download.DGTaskWrapper;
import com.arialyy.aria.core.download.DownloadGroupEntity;
import com.arialyy.aria.core.event.ErrorEvent;
import com.arialyy.aria.core.inf.AbsTarget;
import com.arialyy.aria.core.inf.IConfigHandler;
import com.arialyy.aria.core.manager.SubTaskManager;
import com.arialyy.aria.core.manager.TaskWrapperManager;
import com.arialyy.aria.core.queue.DGroupTaskQueue;
import com.arialyy.aria.core.task.DownloadGroupTask;
import com.arialyy.aria.orm.DbEntity;
import com.arialyy.aria.util.CommonUtil;
/* loaded from: classes.dex */
abstract class AbsGroupConfigHandler<TARGET extends AbsTarget> implements IConfigHandler {
    protected String TAG = CommonUtil.getClassName((Class) getClass());
    private SubTaskManager mSubTaskManager;
    private TARGET mTarget;
    private DGTaskWrapper mWrapper;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AbsGroupConfigHandler(TARGET target, long j) {
        this.mTarget = target;
        DGTaskWrapper dGTaskWrapper = (DGTaskWrapper) TaskWrapperManager.getInstance().getGroupWrapper(DGTaskWrapper.class, j);
        this.mWrapper = dGTaskWrapper;
        if (this.mTarget instanceof AbsNormalTarget) {
            if (j < 0) {
                dGTaskWrapper.setErrorEvent(new ErrorEvent(j, "任务id为空"));
            } else if (((DownloadGroupEntity) dGTaskWrapper.getEntity()).getId() < 0) {
                this.mWrapper.setErrorEvent(new ErrorEvent(j, "任务信息不存在"));
            }
        }
        this.mTarget.setTaskWrapper(this.mWrapper);
        if (getEntity() != null) {
            getTaskWrapper().setDirPathTemp(getEntity().getDirPath());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public SubTaskManager getSubTaskManager() {
        if (this.mSubTaskManager == null) {
            this.mSubTaskManager = new SubTaskManager(getTaskWrapper());
        }
        return this.mSubTaskManager;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setGroupAlias(String str) {
        if (TextUtils.isEmpty(str)) {
            return;
        }
        getEntity().setAlias(str);
    }

    @Override // com.arialyy.aria.core.inf.IConfigHandler
    public boolean isRunning() {
        DownloadGroupTask task = DGroupTaskQueue.getInstance().getTask(getEntity().getKey());
        return task != null && task.isRunning();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public TARGET setDirPath(String str) {
        this.mWrapper.setDirPathTemp(str);
        return this.mTarget;
    }

    @Override // com.arialyy.aria.core.inf.IConfigHandler
    public DownloadGroupEntity getEntity() {
        return (DownloadGroupEntity) this.mWrapper.getEntity();
    }

    @Override // com.arialyy.aria.core.inf.IConfigHandler
    public boolean taskExists() {
        return getEntity().getId() != -1 && DbEntity.checkDataExist(DownloadGroupEntity.class, "rowid=?", String.valueOf(getEntity().getId()));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public DGTaskWrapper getTaskWrapper() {
        return this.mWrapper;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public TARGET getTarget() {
        return this.mTarget;
    }
}
