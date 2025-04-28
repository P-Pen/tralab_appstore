package com.arialyy.aria.core.loader;

import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.os.Message;
import android.text.TextUtils;
import com.arialyy.aria.core.TaskRecord;
import com.arialyy.aria.core.common.AbsEntity;
import com.arialyy.aria.core.common.CompleteInfo;
import com.arialyy.aria.core.inf.IThreadStateManager;
import com.arialyy.aria.core.loader.IInfoTask;
import com.arialyy.aria.core.manager.ThreadTaskManager;
import com.arialyy.aria.core.task.IThreadTask;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.exception.AriaException;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public final class SubLoader implements ILoader, ILoaderVisitor {
    private IInfoTask infoTask;
    protected IThreadStateManager mStateManager;
    private String parentKey;
    private TaskRecord record;
    private IRecordHandler recordHandler;
    private Handler schedulers;
    private IThreadTaskBuilder ttBuild;
    private AbsTaskWrapper wrapper;
    private String TAG = CommonUtil.getClassName(this);
    private boolean needGetInfo = true;
    private boolean isCancel = false;
    private boolean isStop = false;
    private List<IThreadTask> mTask = new ArrayList();

    public SubLoader(AbsTaskWrapper absTaskWrapper, Handler handler) {
        this.wrapper = absTaskWrapper;
        this.schedulers = handler;
    }

    public AbsTaskWrapper getWrapper() {
        return this.wrapper;
    }

    private void sendNormalState(int i) {
        Message obtainMessage = this.schedulers.obtainMessage();
        Bundle data = obtainMessage.getData();
        if (data == null) {
            data = new Bundle();
        }
        data.putString(IThreadStateManager.DATA_THREAD_NAME, getKey());
        obtainMessage.what = i;
        obtainMessage.setData(data);
        obtainMessage.sendToTarget();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void sendFailState(boolean z) {
        Message obtainMessage = this.schedulers.obtainMessage();
        Bundle data = obtainMessage.getData();
        if (data == null) {
            data = new Bundle();
        }
        data.putString(IThreadStateManager.DATA_THREAD_NAME, getKey());
        data.putBoolean(IThreadStateManager.DATA_RETRY, z);
        obtainMessage.what = 2;
        obtainMessage.setData(data);
        obtainMessage.sendToTarget();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void handlerTask() {
        if (isBreak()) {
            return;
        }
        Looper myLooper = Looper.myLooper();
        if (myLooper == null) {
            Looper.prepare();
            myLooper = Looper.myLooper();
        }
        TaskRecord record = this.recordHandler.getRecord(this.wrapper.getEntity().getFileSize());
        this.record = record;
        if (record == null) {
            ALog.d(this.TAG, "子任务记录为空");
            sendFailState(false);
        } else if (record.threadRecords != null && !TextUtils.isEmpty(this.record.filePath) && new File(this.record.filePath).exists() && !this.record.threadRecords.isEmpty() && this.record.threadRecords.get(0).isComplete) {
            String str = this.TAG;
            ALog.d(str, "子任务已完成，key：" + this.wrapper.getKey());
            sendNormalState(4);
        } else {
            List<IThreadTask> buildThreadTask = this.ttBuild.buildThreadTask(this.record, new Handler(myLooper, this.mStateManager.getHandlerCallback()));
            this.mStateManager.setLooper(this.record, myLooper);
            if (buildThreadTask == null || buildThreadTask.isEmpty()) {
                String str2 = this.TAG;
                ALog.e(str2, "创建子任务的线程任务失败，key：" + this.wrapper.getKey());
                sendFailState(false);
            } else if (TextUtils.isEmpty(this.parentKey)) {
                ALog.e(this.TAG, "parentKey为空");
                sendFailState(false);
            } else {
                sendNormalState(7);
                this.mTask.addAll(buildThreadTask);
                try {
                    for (IThreadTask iThreadTask : this.mTask) {
                        ThreadTaskManager.getInstance().startThread(this.parentKey, iThreadTask);
                    }
                    sendNormalState(8);
                    this.mStateManager.updateCurrentProgress(getWrapper().getEntity().getCurrentProgress());
                } catch (Exception e) {
                    e.printStackTrace();
                }
                Looper.loop();
            }
        }
    }

    public TaskRecord getRecord() {
        return this.record;
    }

    public void setParentKey(String str) {
        this.parentKey = str;
    }

    public void setNeedGetInfo(boolean z) {
        this.needGetInfo = z;
    }

    public void retryTask() {
        try {
            if (!this.mTask.isEmpty()) {
                for (IThreadTask iThreadTask : this.mTask) {
                    iThreadTask.call();
                }
                return;
            }
            ALog.e(this.TAG, "子任务的线程任务为空");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public void stop() {
        if (this.isStop) {
            ALog.w(this.TAG, "子任务已停止");
            return;
        }
        this.isStop = true;
        for (IThreadTask iThreadTask : this.mTask) {
            iThreadTask.stop();
        }
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public boolean isRunning() {
        if (this.mTask.isEmpty()) {
            return false;
        }
        for (IThreadTask iThreadTask : this.mTask) {
            if (!iThreadTask.isBreak()) {
                return true;
            }
        }
        return false;
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public void cancel() {
        if (this.isCancel) {
            ALog.w(this.TAG, "子任务已取消");
            return;
        }
        this.isCancel = true;
        for (IThreadTask iThreadTask : this.mTask) {
            iThreadTask.cancel();
        }
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public boolean isBreak() {
        if (this.isCancel || this.isStop) {
            String str = this.TAG;
            ALog.d(str, "isCancel = " + this.isCancel + ", isStop = " + this.isStop);
            ALog.d(this.TAG, String.format("任务【%s】已停止或取消了", this.wrapper.getKey()));
            return true;
        }
        return false;
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public String getKey() {
        return CommonUtil.getThreadName(this.wrapper.getKey(), 0);
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public long getCurrentProgress() {
        return isRunning() ? this.mStateManager.getCurrentProgress() : getWrapper().getEntity().getCurrentProgress();
    }

    @Override // com.arialyy.aria.core.loader.ILoaderVisitor
    public void addComponent(IRecordHandler iRecordHandler) {
        this.recordHandler = iRecordHandler;
    }

    @Override // com.arialyy.aria.core.loader.ILoaderVisitor
    public void addComponent(IInfoTask iInfoTask) {
        this.infoTask = iInfoTask;
        iInfoTask.setCallback(new IInfoTask.Callback() { // from class: com.arialyy.aria.core.loader.SubLoader.1
            @Override // com.arialyy.aria.core.loader.IInfoTask.Callback
            public void onSucceed(String str, CompleteInfo completeInfo) {
                SubLoader.this.handlerTask();
            }

            @Override // com.arialyy.aria.core.loader.IInfoTask.Callback
            public void onFail(AbsEntity absEntity, AriaException ariaException, boolean z) {
                SubLoader.this.sendFailState(z);
            }
        });
    }

    @Override // com.arialyy.aria.core.loader.ILoaderVisitor
    public void addComponent(IThreadStateManager iThreadStateManager) {
        this.mStateManager = iThreadStateManager;
    }

    @Override // com.arialyy.aria.core.loader.ILoaderVisitor
    public void addComponent(IThreadTaskBuilder iThreadTaskBuilder) {
        this.ttBuild = iThreadTaskBuilder;
    }

    @Override // java.lang.Runnable
    public void run() {
        checkComponent();
        if (isBreak()) {
            return;
        }
        if (this.needGetInfo) {
            this.infoTask.run();
        } else {
            handlerTask();
        }
    }

    private void checkComponent() {
        Objects.requireNonNull(this.recordHandler, "任务记录组件为空");
        Objects.requireNonNull(this.infoTask, "文件信息组件为空");
        Objects.requireNonNull(this.ttBuild, "线程任务组件为空");
    }
}
