package com.arialyy.aria.core.listener;

import android.os.Handler;
import com.arialyy.aria.core.common.AbsEntity;
import com.arialyy.aria.core.task.AbsTask;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.exception.AriaException;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import com.arialyy.aria.util.ErrorHelp;
import java.lang.ref.SoftReference;
import java.lang.ref.WeakReference;
/* loaded from: classes.dex */
public abstract class BaseListener implements IEventListener {
    static final int RUN_SAVE_INTERVAL = 5000;
    private boolean isConvertSpeed;
    protected AbsEntity mEntity;
    private long mLastLen;
    long mLastSaveTime;
    private AbsTask mTask;
    protected AbsTaskWrapper mTaskWrapper;
    private long mUpdateInterval;
    protected SoftReference<Handler> outHandler;
    protected String TAG = getClass().getSimpleName();
    private boolean isFirst = true;

    protected abstract void handleCancel();

    @Override // com.arialyy.aria.core.listener.IEventListener
    public IEventListener setParams(AbsTask absTask, Handler handler) {
        this.outHandler = new SoftReference<>(handler);
        AbsTask absTask2 = (AbsTask) new WeakReference(absTask).get();
        this.mTask = absTask2;
        this.mEntity = absTask2.getTaskWrapper().getEntity();
        AbsTaskWrapper taskWrapper = this.mTask.getTaskWrapper();
        this.mTaskWrapper = taskWrapper;
        this.isConvertSpeed = taskWrapper.getConfig().isConvertSpeed();
        this.mUpdateInterval = this.mTaskWrapper.getConfig().getUpdateInterval();
        this.mLastLen = this.mEntity.getCurrentProgress();
        this.mLastSaveTime = System.currentTimeMillis();
        this.TAG = CommonUtil.getClassName((Class) getClass());
        return this;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public <TASK extends AbsTask> TASK getTask(Class<TASK> cls) {
        return (TASK) this.mTask;
    }

    @Override // com.arialyy.aria.core.listener.IEventListener
    public void onPre() {
        saveData(5, -1L);
        sendInState2Target(0);
    }

    @Override // com.arialyy.aria.core.listener.IEventListener
    public void onStart(long j) {
        saveData(4, j);
        sendInState2Target(2);
    }

    @Override // com.arialyy.aria.core.listener.IEventListener
    public void onResume(long j) {
        saveData(4, j);
        sendInState2Target(8);
    }

    @Override // com.arialyy.aria.core.listener.IEventListener
    public void onProgress(long j) {
        this.mEntity.setCurrentProgress(j);
        long j2 = j - this.mLastLen;
        if (this.isFirst) {
            j2 = 0;
            this.isFirst = false;
        }
        handleSpeed(j2);
        sendInState2Target(7);
        if (System.currentTimeMillis() - this.mLastSaveTime >= 5000) {
            saveData(4, j);
            this.mLastSaveTime = System.currentTimeMillis();
        }
        this.mLastLen = j;
    }

    @Override // com.arialyy.aria.core.listener.IEventListener
    public void onStop(long j) {
        saveData(this.mTask.getSchedulerType() == 3 ? 3 : 2, j);
        handleSpeed(0L);
        sendInState2Target(3);
    }

    @Override // com.arialyy.aria.core.listener.IEventListener
    public void onComplete() {
        saveData(1, this.mEntity.getFileSize());
        handleSpeed(0L);
        sendInState2Target(6);
    }

    @Override // com.arialyy.aria.core.listener.IEventListener
    public void onCancel() {
        saveData(7, -1L);
        handleSpeed(0L);
        if (this.mTask.getSchedulerType() != 4) {
            ALog.d(this.TAG, "删除任务完成");
            sendInState2Target(5);
        }
    }

    @Override // com.arialyy.aria.core.listener.IEventListener
    public void onFail(boolean z, AriaException ariaException) {
        AbsEntity absEntity = this.mEntity;
        absEntity.setFailNum(absEntity.getFailNum() + 1);
        saveData(0, this.mEntity.getCurrentProgress());
        handleSpeed(0L);
        this.mTask.setNeedRetry(z);
        this.mTask.putExpand(AbsTask.ERROR_INFO_KEY, ariaException);
        sendInState2Target(4);
        if (ariaException != null) {
            String exceptionString = ALog.getExceptionString(ariaException);
            ALog.e(this.TAG, exceptionString);
            ErrorHelp.saveError(ariaException.getMessage(), exceptionString);
        }
    }

    private void handleSpeed(long j) {
        long j2 = this.mUpdateInterval;
        if (j2 != 1000) {
            j = (j * 1000) / j2;
        }
        if (this.isConvertSpeed) {
            AbsEntity absEntity = this.mEntity;
            StringBuilder sb = new StringBuilder();
            sb.append(CommonUtil.formatFileSize(j < 0 ? 0.0d : j));
            sb.append("/s");
            absEntity.setConvertSpeed(sb.toString());
        }
        int i = (j > 0L ? 1 : (j == 0L ? 0 : -1));
        this.mEntity.setSpeed(i < 0 ? 0L : j);
        int requestType = this.mTaskWrapper.getRequestType();
        if (requestType != 7 && requestType != 8) {
            AbsEntity absEntity2 = this.mEntity;
            absEntity2.setPercent((int) (absEntity2.getFileSize() <= 0 ? 0L : (this.mEntity.getCurrentProgress() * 100) / this.mEntity.getFileSize()));
        }
        if (this.mEntity.getFileSize() != 0) {
            if (i == 0) {
                this.mEntity.setTimeLeft(Integer.MAX_VALUE);
                return;
            }
            AbsEntity absEntity3 = this.mEntity;
            absEntity3.setTimeLeft((int) ((absEntity3.getFileSize() - this.mEntity.getCurrentProgress()) / j));
        }
    }

    private void handleComplete() {
        this.mEntity.setComplete(true);
        this.mEntity.setCompleteTime(System.currentTimeMillis());
        AbsEntity absEntity = this.mEntity;
        absEntity.setCurrentProgress(absEntity.getFileSize());
        this.mEntity.setPercent(100);
        handleSpeed(0L);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void sendInState2Target(int i) {
        if (this.outHandler.get() != null) {
            this.outHandler.get().obtainMessage(i, this.mTask).sendToTarget();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void saveData(int i, long j) {
        this.mEntity.setState(i);
        if (i == 7) {
            handleCancel();
            return;
        }
        if (i == 2) {
            this.mEntity.setStopTime(System.currentTimeMillis());
        } else if (i == 1) {
            handleComplete();
        }
        if (j > 0) {
            this.mEntity.setCurrentProgress(j);
        }
        this.mEntity.update();
    }
}
