package com.arialyy.aria.core.task;

import com.arialyy.aria.core.ThreadRecord;
import com.arialyy.aria.core.common.SubThreadConfig;
import com.arialyy.aria.core.config.BaseTaskConfig;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.exception.AriaException;
import com.arialyy.aria.util.BandwidthLimiter;
import com.arialyy.aria.util.CommonUtil;
/* loaded from: classes.dex */
public abstract class AbsThreadTaskAdapter implements IThreadTaskAdapter {
    protected String TAG = CommonUtil.getClassName((Class) getClass());
    private IThreadTaskObserver mObserver;
    protected BandwidthLimiter mSpeedBandUtil;
    private SubThreadConfig mThreadConfig;
    private ThreadRecord mThreadRecord;
    private IThreadTask mThreadTask;
    private AbsTaskWrapper mWrapper;

    protected abstract void handlerThreadTask();

    /* JADX INFO: Access modifiers changed from: protected */
    public AbsThreadTaskAdapter(SubThreadConfig subThreadConfig) {
        this.mThreadRecord = subThreadConfig.record;
        this.mWrapper = subThreadConfig.taskWrapper;
        this.mThreadConfig = subThreadConfig;
        if (getTaskConfig().getMaxSpeed() > 0) {
            this.mSpeedBandUtil = new BandwidthLimiter(getTaskConfig().getMaxSpeed(), subThreadConfig.startThreadNum);
        }
    }

    @Override // com.arialyy.aria.core.task.IThreadTaskAdapter
    public void call(IThreadTask iThreadTask) throws Exception {
        this.mThreadTask = iThreadTask;
        handlerThreadTask();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public long getRangeProgress() {
        return this.mObserver.getThreadProgress();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public ThreadRecord getThreadRecord() {
        return this.mThreadRecord;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbsTaskWrapper getTaskWrapper() {
        return this.mWrapper;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public BaseTaskConfig getTaskConfig() {
        return getTaskWrapper().getConfig();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public IThreadTask getThreadTask() {
        return this.mThreadTask;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public SubThreadConfig getThreadConfig() {
        return this.mThreadConfig;
    }

    @Override // com.arialyy.aria.core.task.IThreadTaskAdapter
    public void attach(IThreadTaskObserver iThreadTaskObserver) {
        this.mObserver = iThreadTaskObserver;
    }

    @Override // com.arialyy.aria.core.task.IThreadTaskAdapter
    public void setMaxSpeed(int i) {
        if (this.mSpeedBandUtil == null) {
            this.mSpeedBandUtil = new BandwidthLimiter(getTaskConfig().getMaxSpeed(), getThreadConfig().startThreadNum);
        }
        this.mSpeedBandUtil.setMaxRate(i);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void complete() {
        IThreadTaskObserver iThreadTaskObserver = this.mObserver;
        if (iThreadTaskObserver != null) {
            iThreadTaskObserver.updateCompleteState();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void fail(AriaException ariaException, boolean z) {
        IThreadTaskObserver iThreadTaskObserver = this.mObserver;
        if (iThreadTaskObserver != null) {
            iThreadTaskObserver.updateFailState(ariaException, z);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void progress(long j) {
        IThreadTaskObserver iThreadTaskObserver = this.mObserver;
        if (iThreadTaskObserver != null) {
            iThreadTaskObserver.updateProgress(j);
        }
    }
}
