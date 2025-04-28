package com.arialyy.aria.core.scheduler;

import com.arialyy.aria.core.AriaConfig;
import com.arialyy.aria.core.manager.TaskWrapperManager;
import com.arialyy.aria.core.queue.ITaskQueue;
import com.arialyy.aria.core.task.ITask;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.locks.Condition;
import java.util.concurrent.locks.ReentrantLock;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class FailureTaskHandler<TASK extends ITask> {
    private static volatile FailureTaskHandler INSTANCE;
    private final ReentrantLock LOCK;
    private Condition mCondition;
    private TaskSchedulers mSchedulers;
    private final String TAG = CommonUtil.getClassName((Class) getClass());
    private final int MAX_EXE_NUM = 5;
    private ArrayBlockingQueue<TASK> mQueue = new ArrayBlockingQueue<>(100);
    private List<TASK> mExeQueue = new ArrayList(5);
    private List<Integer> mHashList = new ArrayList();

    /* JADX INFO: Access modifiers changed from: package-private */
    public static FailureTaskHandler init(TaskSchedulers taskSchedulers) {
        if (INSTANCE == null) {
            synchronized (FailureTaskHandler.class) {
                if (INSTANCE == null) {
                    INSTANCE = new FailureTaskHandler(taskSchedulers);
                }
            }
        }
        return INSTANCE;
    }

    private FailureTaskHandler(TaskSchedulers taskSchedulers) {
        ReentrantLock reentrantLock = new ReentrantLock();
        this.LOCK = reentrantLock;
        this.mCondition = reentrantLock.newCondition();
        this.mSchedulers = taskSchedulers;
        new Thread(new Runnable() { // from class: com.arialyy.aria.core.scheduler.FailureTaskHandler.1
            @Override // java.lang.Runnable
            public void run() {
                ITask iTask;
                while (true) {
                    try {
                        iTask = (ITask) FailureTaskHandler.this.mQueue.take();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                    if (FailureTaskHandler.this.mExeQueue.size() >= 5) {
                        FailureTaskHandler.this.LOCK.lock();
                        FailureTaskHandler.this.mCondition.await();
                        FailureTaskHandler.this.LOCK.unlock();
                    } else {
                        FailureTaskHandler.this.retryTask(iTask);
                    }
                }
            }
        }).start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void retryTask(final TASK task) {
        final ITaskQueue queue = this.mSchedulers.getQueue(task.getTaskType());
        if (task.isNeedRetry()) {
            final int reTryNum = task.getTaskWrapper().getConfig().getReTryNum();
            AriaConfig.getInstance().getAriaHandler().postDelayed(new Runnable() { // from class: com.arialyy.aria.core.scheduler.FailureTaskHandler.2
                /* JADX WARN: Multi-variable type inference failed */
                @Override // java.lang.Runnable
                public void run() {
                    if (task.getTaskWrapper().getEntity().getFailNum() <= reTryNum) {
                        ALog.d(FailureTaskHandler.this.TAG, String.format("任务【%s】开始重试", task.getTaskName()));
                        queue.reTryStart(task);
                    } else {
                        queue.removeTaskFormQueue(task.getKey());
                        FailureTaskHandler.this.mSchedulers.startNextTask(queue, task.getSchedulerType());
                        TaskWrapperManager.getInstance().removeTaskWrapper(task.getTaskWrapper());
                    }
                    FailureTaskHandler.this.next(task);
                }
            }, task.getTaskWrapper().getConfig().getReTryInterval());
            return;
        }
        queue.removeTaskFormQueue(task.getKey());
        this.mSchedulers.startNextTask(queue, task.getSchedulerType());
        TaskWrapperManager.getInstance().removeTaskWrapper(task.getTaskWrapper());
        next(task);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void next(TASK task) {
        this.mExeQueue.remove(task);
        int indexOf = this.mHashList.indexOf(Integer.valueOf(task.hashCode()));
        if (indexOf != -1) {
            this.mHashList.remove(indexOf);
        }
        if (this.LOCK.isLocked()) {
            try {
                this.LOCK.lock();
                this.mCondition.signalAll();
            } finally {
                this.LOCK.unlock();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void offer(TASK task) {
        int hashCode = task.hashCode();
        if (this.mHashList.contains(Integer.valueOf(hashCode))) {
            return;
        }
        this.mQueue.offer(task);
        this.mHashList.add(Integer.valueOf(hashCode));
    }
}
