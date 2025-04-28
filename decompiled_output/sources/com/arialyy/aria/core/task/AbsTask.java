package com.arialyy.aria.core.task;

import android.content.Context;
import android.os.Handler;
import android.text.TextUtils;
import com.arialyy.aria.core.inf.IUtil;
import com.arialyy.aria.core.listener.IEventListener;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import com.arialyy.aria.util.ComponentUtil;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public abstract class AbsTask<TASK_WRAPPER extends AbsTaskWrapper> implements ITask<TASK_WRAPPER> {
    public static final String ERROR_INFO_KEY = "ERROR_INFO_KEY";
    protected Context mContext;
    protected IEventListener mListener;
    protected Handler mOutHandler;
    protected TASK_WRAPPER mTaskWrapper;
    private IUtil mUtil;
    protected String TAG = CommonUtil.getClassName((Class) getClass());
    private boolean needRetry = true;
    protected boolean isHeighestTask = false;
    private boolean isCancel = false;
    private boolean isStop = false;
    private Map<String, Object> mExpand = new HashMap();
    private int mSchedulerType = 1;

    public Handler getOutHandler() {
        return this.mOutHandler;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized IUtil getUtil() {
        if (this.mUtil == null) {
            this.mUtil = ComponentUtil.getInstance().buildUtil(this.mTaskWrapper, this.mListener);
        }
        return this.mUtil;
    }

    public int getTimeLeft() {
        return getTaskWrapper().getEntity().getTimeLeft();
    }

    public String getConvertTimeLeft() {
        return CommonUtil.formatTime(getTaskWrapper().getEntity().getTimeLeft());
    }

    public void putExpand(String str, Object obj) {
        if (TextUtils.isEmpty(str)) {
            ALog.e(this.TAG, "key 为空");
        } else if (obj == null) {
            ALog.i(this.TAG, "扩展数据为空");
        } else {
            this.mExpand.put(str, obj);
        }
    }

    @Override // com.arialyy.aria.core.task.ITask
    public boolean isNeedRetry() {
        return this.needRetry;
    }

    public void setNeedRetry(boolean z) {
        this.needRetry = z;
    }

    public void setHighestPriority(boolean z) {
        this.isHeighestTask = z;
    }

    @Override // com.arialyy.aria.core.task.ITask
    public Object getExpand(String str) {
        return this.mExpand.get(str);
    }

    public boolean isComplete() {
        return this.mTaskWrapper.getEntity().isComplete();
    }

    public long getCurrentProgress() {
        return this.mTaskWrapper.getEntity().getCurrentProgress();
    }

    public String getConvertCurrentProgress() {
        return this.mTaskWrapper.getEntity().getCurrentProgress() == 0 ? "0b" : CommonUtil.formatFileSize(this.mTaskWrapper.getEntity().getCurrentProgress());
    }

    public String getConvertFileSize() {
        return this.mTaskWrapper.getEntity().getFileSize() == 0 ? "0mb" : CommonUtil.formatFileSize(this.mTaskWrapper.getEntity().getFileSize());
    }

    public long getFileSize() {
        return this.mTaskWrapper.getEntity().getFileSize();
    }

    public int getPercent() {
        return this.mTaskWrapper.getEntity().getPercent();
    }

    @Override // com.arialyy.aria.core.task.ITask
    public int getState() {
        return this.mTaskWrapper.getState();
    }

    public String getExtendField() {
        if (this.mTaskWrapper.getEntity() == null) {
            return null;
        }
        return this.mTaskWrapper.getEntity().getStr();
    }

    @Override // com.arialyy.aria.core.task.ITask
    public void start() {
        start(1);
    }

    @Override // com.arialyy.aria.core.task.ITask
    public void start(int i) {
        this.mSchedulerType = i;
        IUtil util = getUtil();
        this.mUtil = util;
        if (util == null) {
            ALog.e(this.TAG, "任务工具创建失败");
        } else if (i == 5) {
            if (getUtil().isRunning()) {
                ALog.e(this.TAG, String.format("任务【%s】重启失败", getTaskName()));
                return;
            }
            this.mUtil.start();
            ALog.d(this.TAG, String.format("任务【%s】重启成功", getTaskName()));
        } else if (getUtil().isRunning()) {
            ALog.d(this.TAG, "任务正在下载");
        } else {
            getUtil().start();
        }
    }

    @Override // com.arialyy.aria.core.task.ITask
    public void stop() {
        stop(1);
    }

    @Override // com.arialyy.aria.core.task.ITask
    public void stop(int i) {
        IUtil util = getUtil();
        this.mUtil = util;
        if (util == null) {
            ALog.e(this.TAG, "任务工具创建失败");
            return;
        }
        this.isStop = true;
        this.mSchedulerType = i;
        getUtil().stop();
    }

    @Override // com.arialyy.aria.core.task.ITask
    public void cancel() {
        cancel(1);
    }

    @Override // com.arialyy.aria.core.task.ITask
    public void cancel(int i) {
        IUtil util = getUtil();
        this.mUtil = util;
        if (util == null) {
            ALog.e(this.TAG, "任务工具创建失败");
            return;
        }
        this.isCancel = true;
        this.mSchedulerType = i;
        getUtil().cancel();
    }

    @Override // com.arialyy.aria.core.task.ITask
    public boolean isRunning() {
        return getUtil().isRunning();
    }

    @Override // com.arialyy.aria.core.task.ITask
    public int getSchedulerType() {
        return this.mSchedulerType;
    }

    @Override // com.arialyy.aria.core.task.ITask
    public boolean isCancel() {
        return this.isCancel;
    }

    @Override // com.arialyy.aria.core.task.ITask
    public boolean isStop() {
        return this.isStop;
    }

    public long getSpeed() {
        return this.mTaskWrapper.getEntity().getSpeed();
    }

    public String getConvertSpeed() {
        return this.mTaskWrapper.getEntity().getConvertSpeed();
    }

    @Override // com.arialyy.aria.core.task.ITask
    public TASK_WRAPPER getTaskWrapper() {
        return this.mTaskWrapper;
    }

    public boolean isHighestPriorityTask() {
        return this.isHeighestTask;
    }
}
