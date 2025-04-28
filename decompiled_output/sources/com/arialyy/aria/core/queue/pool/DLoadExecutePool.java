package com.arialyy.aria.core.queue.pool;

import com.arialyy.aria.core.AriaConfig;
import com.arialyy.aria.core.task.AbsTask;
import com.arialyy.aria.util.ALog;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class DLoadExecutePool<TASK extends AbsTask> extends BaseExecutePool<TASK> {
    private final String TAG = "DownloadExecutePool";

    @Override // com.arialyy.aria.core.queue.pool.BaseExecutePool
    protected int getMaxSize() {
        return AriaConfig.getInstance().getDConfig().getMaxTaskNum();
    }

    @Override // com.arialyy.aria.core.queue.pool.BaseExecutePool, com.arialyy.aria.core.queue.pool.IPool
    public boolean putTask(TASK task) {
        synchronized (DLoadExecutePool.class) {
            if (task == null) {
                ALog.e("DownloadExecutePool", "任务不能为空！！");
                return false;
            } else if (this.mExecuteQueue.contains(task)) {
                if (task.isRunning()) {
                    ALog.e("DownloadExecutePool", "任务【" + task.getTaskName() + "】进入执行队列失败，错误原因：已经在执行队列中");
                    return false;
                }
                return true;
            } else if (this.mExecuteQueue.size() >= this.mSize) {
                for (TASK task2 : this.mExecuteQueue) {
                    if (task2.isHighestPriorityTask()) {
                        return false;
                    }
                }
                if (pollFirstTask()) {
                    return putNewTask(task);
                }
                return false;
            } else {
                return putNewTask(task);
            }
        }
    }

    @Override // com.arialyy.aria.core.queue.pool.BaseExecutePool
    boolean pollFirstTask() {
        TASK pollFirst = this.mExecuteQueue.pollFirst();
        if (pollFirst == null) {
            ALog.w("DownloadExecutePool", "移除任务失败，错误原因：任务为null");
            return false;
        } else if (pollFirst.isHighestPriorityTask()) {
            return false;
        } else {
            pollFirst.stop();
            return true;
        }
    }
}
