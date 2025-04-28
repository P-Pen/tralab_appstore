package com.arialyy.aria.core.queue;

import com.arialyy.aria.core.AriaConfig;
import com.arialyy.aria.core.download.DTaskWrapper;
import com.arialyy.aria.core.event.DMaxNumEvent;
import com.arialyy.aria.core.event.Event;
import com.arialyy.aria.core.event.EventMsgUtil;
import com.arialyy.aria.core.scheduler.TaskSchedulers;
import com.arialyy.aria.core.task.DownloadTask;
import com.arialyy.aria.util.ALog;
import java.util.Iterator;
import java.util.LinkedHashSet;
import java.util.List;
/* loaded from: classes.dex */
public class DTaskQueue extends AbsTaskQueue<DownloadTask, DTaskWrapper> {
    private static volatile DTaskQueue INSTANCE = null;
    private static final String TAG = "DownloadTaskQueue";

    @Override // com.arialyy.aria.core.queue.AbsTaskQueue
    int getQueueType() {
        return 1;
    }

    public static DTaskQueue getInstance() {
        if (INSTANCE == null) {
            synchronized (DTaskQueue.class) {
                INSTANCE = new DTaskQueue();
                EventMsgUtil.getDefault().register(INSTANCE);
            }
        }
        return INSTANCE;
    }

    private DTaskQueue() {
    }

    @Event
    public void maxTaskNum(DMaxNumEvent dMaxNumEvent) {
        setMaxTaskNum(dMaxNumEvent.maxNum);
    }

    @Override // com.arialyy.aria.core.queue.AbsTaskQueue
    public int getOldMaxNum() {
        return AriaConfig.getInstance().getDConfig().oldMaxTaskNum;
    }

    public void setTaskHighestPriority(DownloadTask downloadTask) {
        downloadTask.setHighestPriority(true);
        List allTask = this.mExecutePool.getAllTask();
        if (allTask == null || allTask.isEmpty()) {
            return;
        }
        Iterator it = allTask.iterator();
        while (true) {
            int i = 0;
            if (it.hasNext()) {
                DownloadTask downloadTask2 = (DownloadTask) it.next();
                if (downloadTask2 != null && downloadTask2.isRunning() && downloadTask2.isHighestPriorityTask() && !downloadTask2.getKey().equals(downloadTask.getKey())) {
                    ALog.e(TAG, "设置最高优先级任务失败，失败原因【任务中已经有最高优先级任务，请等待上一个最高优先级任务完成，或手动暂停该任务】");
                    downloadTask.setHighestPriority(false);
                    return;
                }
            } else {
                int maxTaskNum = AriaConfig.getInstance().getDConfig().getMaxTaskNum();
                int size = this.mExecutePool.size();
                if (size == 0 || size < maxTaskNum) {
                    startTask((DTaskQueue) downloadTask);
                    return;
                }
                LinkedHashSet<DownloadTask> linkedHashSet = new LinkedHashSet();
                while (true) {
                    if (i >= maxTaskNum) {
                        break;
                    }
                    DownloadTask downloadTask3 = (DownloadTask) this.mExecutePool.pollTask();
                    if (downloadTask3 != null && downloadTask3.isRunning()) {
                        if (i == maxTaskNum - 1) {
                            downloadTask3.stop(3);
                            this.mCachePool.putTaskToFirst(downloadTask3);
                            break;
                        }
                        linkedHashSet.add(downloadTask3);
                    }
                    i++;
                }
                startTask((DTaskQueue) downloadTask);
                for (DownloadTask downloadTask4 : linkedHashSet) {
                    this.mExecutePool.putTask(downloadTask4);
                }
                return;
            }
        }
    }

    @Override // com.arialyy.aria.core.queue.AbsTaskQueue, com.arialyy.aria.core.queue.ITaskQueue
    public DownloadTask createTask(DTaskWrapper dTaskWrapper) {
        super.createTask((DTaskQueue) dTaskWrapper);
        if (!this.mCachePool.taskExits(dTaskWrapper.getKey()) && !this.mExecutePool.taskExits(dTaskWrapper.getKey())) {
            DownloadTask downloadTask = (DownloadTask) TaskFactory.getInstance().createTask(dTaskWrapper, TaskSchedulers.getInstance());
            addTask(downloadTask);
            return downloadTask;
        }
        ALog.w(TAG, "任务已存在");
        return null;
    }

    @Override // com.arialyy.aria.core.queue.AbsTaskQueue, com.arialyy.aria.core.queue.ITaskQueue
    public void stopTask(DownloadTask downloadTask) {
        downloadTask.setHighestPriority(false);
        super.stopTask((DTaskQueue) downloadTask);
    }

    @Override // com.arialyy.aria.core.queue.ITaskQueue
    public int getMaxTaskNum() {
        return AriaConfig.getInstance().getDConfig().getMaxTaskNum();
    }
}
