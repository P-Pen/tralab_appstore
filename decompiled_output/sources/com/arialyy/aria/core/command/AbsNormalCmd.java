package com.arialyy.aria.core.command;

import com.arialyy.aria.core.download.DGTaskWrapper;
import com.arialyy.aria.core.download.DTaskWrapper;
import com.arialyy.aria.core.queue.AbsTaskQueue;
import com.arialyy.aria.core.queue.DGroupTaskQueue;
import com.arialyy.aria.core.queue.DTaskQueue;
import com.arialyy.aria.core.queue.UTaskQueue;
import com.arialyy.aria.core.task.AbsTask;
import com.arialyy.aria.core.upload.UTaskWrapper;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
/* loaded from: classes.dex */
public abstract class AbsNormalCmd<T extends AbsTaskWrapper> extends AbsCmd<T> {
    boolean canExeCmd = true;
    int taskType;

    /* JADX INFO: Access modifiers changed from: package-private */
    public AbsNormalCmd(T t, int i) {
        boolean z = true;
        this.taskType = i;
        this.mTaskWrapper = t;
        this.TAG = CommonUtil.getClassName(this);
        if (i == 1) {
            if (!(t instanceof DTaskWrapper)) {
                ALog.e(this.TAG, "任务类型错误，任务类型应该为ICM.TASK_TYPE_DOWNLOAD");
                return;
            }
            this.mQueue = DTaskQueue.getInstance();
        } else if (i == 3) {
            if (!(t instanceof DGTaskWrapper)) {
                ALog.e(this.TAG, "任务类型错误，任务类型应该为ICM.TASK_TYPE_DOWNLOAD_GROUP");
                return;
            }
            this.mQueue = DGroupTaskQueue.getInstance();
        } else if (i == 2) {
            if (!(t instanceof UTaskWrapper)) {
                ALog.e(this.TAG, "任务类型错误，任务类型应该为ICM.TASK_TYPE_UPLOAD");
                return;
            }
            this.mQueue = UTaskQueue.getInstance();
        } else {
            ALog.e(this.TAG, "任务类型错误，任务类型应该为ICM.TASK_TYPE_DOWNLOAD、TASK_TYPE_DOWNLOAD_GROUP、TASK_TYPE_UPLOAD");
            return;
        }
        if (i != 1 && i != 3) {
            z = false;
        }
        this.isDownloadCmd = z;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendWaitState() {
        AbsTask task = getTask();
        if (task == null) {
            task = createTask();
        }
        sendWaitState(task);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendWaitState(AbsTask absTask) {
        if (absTask != null) {
            absTask.getTaskWrapper().setState(3);
            absTask.getOutHandler().obtainMessage(10, absTask).sendToTarget();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void stopAll() {
        this.mQueue.stopAllTask();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void stopTask() {
        AbsTask task = getTask();
        if (task == null) {
            task = createTask();
        }
        this.mQueue.stopTask((AbsTaskQueue) task);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void removeTask() {
        AbsTask task = getTask();
        if (task == null) {
            task = createTask();
        }
        this.mQueue.cancelTask((AbsTaskQueue) task);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void removeTask(AbsTaskWrapper absTaskWrapper) {
        AbsTask task = getTask(absTaskWrapper.getKey());
        if (task == null) {
            task = createTask(absTaskWrapper);
        }
        this.mQueue.cancelTask((AbsTaskQueue) task);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void startTask() {
        AbsTask task = getTask();
        if (task == null) {
            task = createTask();
        }
        this.mQueue.startTask((AbsTaskQueue) task);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void resumeTask() {
        AbsTask task = getTask();
        if (task == null) {
            task = createTask();
        }
        this.mQueue.resumeTask((AbsTaskQueue) task);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AbsTask getTask() {
        return this.mQueue.getTask(this.mTaskWrapper.getEntity().getKey());
    }

    AbsTask getTask(String str) {
        return this.mQueue.getTask(str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public AbsTask createTask() {
        return this.mQueue.createTask((AbsTaskQueue) this.mTaskWrapper);
    }

    AbsTask createTask(AbsTaskWrapper absTaskWrapper) {
        return this.mQueue.createTask((AbsTaskQueue) absTaskWrapper);
    }
}
