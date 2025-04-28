package com.arialyy.aria.http.upload;

import android.os.Handler;
import android.os.Looper;
import com.arialyy.aria.core.inf.IThreadStateManager;
import com.arialyy.aria.core.listener.IEventListener;
import com.arialyy.aria.core.loader.AbsNormalLoader;
import com.arialyy.aria.core.loader.IInfoTask;
import com.arialyy.aria.core.loader.IRecordHandler;
import com.arialyy.aria.core.loader.IThreadTaskBuilder;
import com.arialyy.aria.core.manager.ThreadTaskManager;
import com.arialyy.aria.core.task.IThreadTask;
import com.arialyy.aria.core.upload.UTaskWrapper;
import com.arialyy.aria.exception.AriaHTTPException;
import com.arialyy.aria.util.ALog;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
final class HttpULoader extends AbsNormalLoader<UTaskWrapper> {
    @Override // com.arialyy.aria.core.loader.ILoaderVisitor
    @Deprecated
    public void addComponent(IInfoTask iInfoTask) {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public HttpULoader(UTaskWrapper uTaskWrapper, IEventListener iEventListener) {
        super(uTaskWrapper, iEventListener);
    }

    @Override // com.arialyy.aria.core.loader.ILoaderVisitor
    public void addComponent(IRecordHandler iRecordHandler) {
        this.mRecordHandler = iRecordHandler;
    }

    @Override // com.arialyy.aria.core.loader.ILoaderVisitor
    public void addComponent(IThreadStateManager iThreadStateManager) {
        this.mStateManager = iThreadStateManager;
    }

    @Override // com.arialyy.aria.core.loader.ILoaderVisitor
    public void addComponent(IThreadTaskBuilder iThreadTaskBuilder) {
        this.mTTBuilder = iThreadTaskBuilder;
    }

    @Override // com.arialyy.aria.core.loader.AbsNormalLoader
    protected void handleTask(Looper looper) {
        this.mRecord = this.mRecordHandler.getRecord(getFileSize());
        this.mStateManager.setLooper(this.mRecord, looper);
        List<IThreadTask> buildThreadTask = this.mTTBuilder.buildThreadTask(this.mRecord, new Handler(looper, this.mStateManager.getHandlerCallback()));
        if (buildThreadTask == null || buildThreadTask.isEmpty()) {
            ALog.e(this.TAG, "创建线程任务失败");
            getListener().onFail(false, new AriaHTTPException("创建线程任务失败"));
            return;
        }
        getListener().onStart(0L);
        ThreadTaskManager.getInstance().startThread(((UTaskWrapper) this.mTaskWrapper).getKey(), buildThreadTask.get(0));
        startTimer();
    }

    @Override // com.arialyy.aria.core.loader.AbsNormalLoader
    public long getFileSize() {
        return ((UTaskWrapper) this.mTaskWrapper).getEntity().getFileSize();
    }

    @Override // com.arialyy.aria.core.loader.AbsNormalLoader
    protected void checkComponent() {
        Objects.requireNonNull(this.mRecordHandler, "任务记录组件为空");
        Objects.requireNonNull(this.mStateManager, "任务状态管理组件为空");
        Objects.requireNonNull(this.mTTBuilder, "线程任务组件为空");
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public long getCurrentProgress() {
        return this.mStateManager.getCurrentProgress();
    }
}
