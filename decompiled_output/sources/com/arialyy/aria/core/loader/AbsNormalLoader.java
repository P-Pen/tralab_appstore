package com.arialyy.aria.core.loader;

import android.os.Looper;
import android.util.Log;
import com.arialyy.aria.core.TaskRecord;
import com.arialyy.aria.core.inf.IThreadStateManager;
import com.arialyy.aria.core.listener.IEventListener;
import com.arialyy.aria.core.manager.ThreadTaskManager;
import com.arialyy.aria.core.task.IThreadTask;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public abstract class AbsNormalLoader<T extends AbsTaskWrapper> implements ILoaderVisitor, ILoader {
    protected IInfoTask mInfoTask;
    private IEventListener mListener;
    protected TaskRecord mRecord;
    protected IRecordHandler mRecordHandler;
    protected IThreadStateManager mStateManager;
    protected IThreadTaskBuilder mTTBuilder;
    protected T mTaskWrapper;
    protected File mTempFile;
    private ScheduledThreadPoolExecutor mTimer;
    protected final String TAG = CommonUtil.getClassName((Class) getClass());
    private List<IThreadTask> mTask = new ArrayList();
    private long mUpdateInterval = 1000;
    protected boolean isCancel = false;
    protected boolean isStop = false;
    private boolean isRuning = false;

    protected long delayTimer() {
        return 1000L;
    }

    public abstract long getFileSize();

    protected abstract void handleTask(Looper looper);

    protected void onCancel() {
    }

    protected void onPostCancel() {
    }

    protected void onPostPre() {
    }

    protected void onPostStop() {
    }

    protected void onStop() {
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbsNormalLoader(T t, IEventListener iEventListener) {
        this.mListener = iEventListener;
        this.mTaskWrapper = t;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public IEventListener getListener() {
        return this.mListener;
    }

    protected IThreadStateManager getStateManager() {
        return this.mStateManager;
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public String getKey() {
        return this.mTaskWrapper.getKey();
    }

    public List<IThreadTask> getTaskList() {
        return this.mTask;
    }

    private void resetState() {
        closeTimer();
        List<IThreadTask> list = this.mTask;
        if (list == null || list.size() == 0) {
            return;
        }
        for (int i = 0; i < this.mTask.size(); i++) {
            this.mTask.get(i).breakTask();
        }
        this.mTask.clear();
    }

    @Override // java.lang.Runnable
    public void run() {
        checkComponent();
        if (isRunning()) {
            ALog.d(this.TAG, String.format("任务【%s】正在执行，启动任务失败", this.mTaskWrapper.getKey()));
        } else {
            startFlow();
        }
    }

    private void startFlow() {
        if (isBreak()) {
            return;
        }
        Looper.prepare();
        Looper myLooper = Looper.myLooper();
        if (myLooper == Looper.getMainLooper()) {
            throw new IllegalThreadStateException("不能在主线程程序中调用Loader");
        }
        this.isRuning = true;
        resetState();
        onPostPre();
        handleTask(myLooper);
        Looper.loop();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public synchronized void startTimer() {
        if (isBreak()) {
            return;
        }
        ALog.d(this.TAG, String.format("启动定时器，delayTimer = %s, updateInterval = %s", Long.valueOf(delayTimer()), Long.valueOf(this.mUpdateInterval)));
        closeTimer();
        try {
            ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(1);
            this.mTimer = scheduledThreadPoolExecutor;
            scheduledThreadPoolExecutor.scheduleWithFixedDelay(new Runnable() { // from class: com.arialyy.aria.core.loader.AbsNormalLoader.1
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        if (AbsNormalLoader.this.mStateManager == null) {
                            ALog.e(AbsNormalLoader.this.TAG, "stateManager is null");
                        } else {
                            if (!AbsNormalLoader.this.mStateManager.isComplete() && !AbsNormalLoader.this.mStateManager.isFail() && AbsNormalLoader.this.isRunning() && !AbsNormalLoader.this.isBreak()) {
                                if (AbsNormalLoader.this.mStateManager.getCurrentProgress() >= 0) {
                                    Log.d(AbsNormalLoader.this.TAG, "running...");
                                    AbsNormalLoader.this.mListener.onProgress(AbsNormalLoader.this.mStateManager.getCurrentProgress());
                                } else {
                                    Log.d(AbsNormalLoader.this.TAG, "未知状态");
                                }
                            }
                            ThreadTaskManager.getInstance().removeTaskThread(AbsNormalLoader.this.mTaskWrapper.getKey());
                            AbsNormalLoader.this.closeTimer();
                            AbsNormalLoader.this.onDestroy();
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }, delayTimer(), this.mUpdateInterval, TimeUnit.MILLISECONDS);
        } catch (Exception e) {
            ALog.e(this.TAG, "启动定时器失败");
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void closeTimer() {
        ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = this.mTimer;
        if (scheduledThreadPoolExecutor != null && !scheduledThreadPoolExecutor.isShutdown()) {
            this.mTimer.shutdown();
        }
    }

    public void onDestroy() {
        this.isRuning = false;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void setUpdateInterval(long j) {
        if (j < 0) {
            ALog.w(this.TAG, "更新间隔不能小于0，默认为1000毫秒");
        } else {
            this.mUpdateInterval = j;
        }
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public synchronized boolean isRunning() {
        boolean z;
        if (ThreadTaskManager.getInstance().taskIsRunning(this.mTaskWrapper.getKey())) {
            z = this.isRuning;
        }
        return z;
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public final synchronized void cancel() {
        if (this.isCancel) {
            ALog.d(this.TAG, String.format("任务【%s】正在删除，删除任务失败", this.mTaskWrapper.getKey()));
            return;
        }
        closeTimer();
        this.isCancel = true;
        onCancel();
        for (int i = 0; i < this.mTask.size(); i++) {
            IThreadTask iThreadTask = this.mTask.get(i);
            if (iThreadTask != null && !iThreadTask.isThreadComplete()) {
                iThreadTask.cancel();
            }
        }
        ThreadTaskManager.getInstance().removeTaskThread(this.mTaskWrapper.getKey());
        onPostCancel();
        onDestroy();
        this.mListener.onCancel();
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public final synchronized void stop() {
        if (this.isStop) {
            return;
        }
        closeTimer();
        this.isStop = true;
        onStop();
        for (int i = 0; i < this.mTask.size(); i++) {
            IThreadTask iThreadTask = this.mTask.get(i);
            if (iThreadTask != null && !iThreadTask.isThreadComplete()) {
                iThreadTask.stop();
            }
        }
        ThreadTaskManager.getInstance().removeTaskThread(this.mTaskWrapper.getKey());
        onPostStop();
        onDestroy();
        this.mListener.onStop(getCurrentProgress());
    }

    public void retryTask() {
        ALog.w(this.TAG, String.format("任务【%s】开始重试", this.mTaskWrapper.getKey()));
        startFlow();
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public boolean isBreak() {
        if (this.isCancel || this.isStop) {
            String str = this.TAG;
            ALog.d(str, "isCancel = " + this.isCancel + ", isStop = " + this.isStop);
            ALog.d(this.TAG, String.format("任务【%s】已停止或取消了", this.mTaskWrapper.getKey()));
            return true;
        }
        return false;
    }

    protected void checkComponent() {
        Objects.requireNonNull(this.mRecordHandler, "任务记录组件为空");
        Objects.requireNonNull(this.mInfoTask, "文件信息组件为空");
        Objects.requireNonNull(this.mStateManager, "任务状态管理组件为空");
        Objects.requireNonNull(this.mTTBuilder, "线程任务组件为空");
    }
}
