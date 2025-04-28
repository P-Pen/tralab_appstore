package com.arialyy.aria.core.upload;

import android.text.TextUtils;
import com.arialyy.annotations.TaskEnum;
import com.arialyy.aria.core.AriaConfig;
import com.arialyy.aria.core.AriaManager;
import com.arialyy.aria.core.command.CancelAllCmd;
import com.arialyy.aria.core.command.CmdHelper;
import com.arialyy.aria.core.command.NormalCmdFactory;
import com.arialyy.aria.core.common.ProxyHelper;
import com.arialyy.aria.core.event.EventMsgUtil;
import com.arialyy.aria.core.inf.AbsReceiver;
import com.arialyy.aria.core.inf.ReceiverType;
import com.arialyy.aria.core.queue.UTaskQueue;
import com.arialyy.aria.core.scheduler.TaskInternalListenerInterface;
import com.arialyy.aria.core.scheduler.TaskSchedulers;
import com.arialyy.aria.core.upload.target.FtpBuilderTarget;
import com.arialyy.aria.core.upload.target.FtpNormalTarget;
import com.arialyy.aria.core.upload.target.HttpBuilderTarget;
import com.arialyy.aria.core.upload.target.HttpNormalTarget;
import com.arialyy.aria.core.upload.target.UTargetFactory;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.orm.DbEntity;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CheckUtil;
import com.arialyy.aria.util.ComponentUtil;
import java.util.List;
import java.util.Set;
/* loaded from: classes.dex */
public class UploadReceiver extends AbsReceiver {
    public UploadReceiver(Object obj) {
        super(obj);
    }

    @Deprecated
    public UploadReceiver setMaxSpeed(int i) {
        AriaConfig.getInstance().getUConfig().setMaxSpeed(i);
        return this;
    }

    public HttpBuilderTarget load(String str) {
        ComponentUtil.getInstance().checkComponentExist(1);
        CheckUtil.checkUploadPathIsEmpty(str);
        return (HttpBuilderTarget) UTargetFactory.getInstance().generateBuilderTarget(HttpBuilderTarget.class, str);
    }

    public HttpNormalTarget load(long j) {
        ComponentUtil.getInstance().checkComponentExist(1);
        return (HttpNormalTarget) UTargetFactory.getInstance().generateNormalTarget(HttpNormalTarget.class, j);
    }

    public FtpBuilderTarget loadFtp(String str) {
        ComponentUtil.getInstance().checkComponentExist(2);
        CheckUtil.checkUploadPathIsEmpty(str);
        return (FtpBuilderTarget) UTargetFactory.getInstance().generateBuilderTarget(FtpBuilderTarget.class, str);
    }

    public FtpNormalTarget loadFtp(long j) {
        ComponentUtil.getInstance().checkComponentExist(2);
        return (FtpNormalTarget) UTargetFactory.getInstance().generateNormalTarget(FtpNormalTarget.class, j);
    }

    public UploadEntity getUploadEntity(long j) {
        if (j == -1) {
            return null;
        }
        return (UploadEntity) DbEntity.findFirst(UploadEntity.class, "rowid=?", String.valueOf(j));
    }

    public UploadEntity getFirstUploadEntity(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return (UploadEntity) DbEntity.findFirst(UploadEntity.class, "filePath=?", str);
    }

    public List<UploadEntity> getUploadEntity(String str) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        return DbEntity.findDatas(UploadEntity.class, "filePath=?", str);
    }

    public boolean taskExists(String str) {
        return DbEntity.checkDataExist(UTaskWrapper.class, "key=?", str);
    }

    public List<UploadEntity> getTaskList() {
        return DbEntity.findAllData(UploadEntity.class);
    }

    public List<UploadEntity> getTaskList(int i, int i2) {
        CheckUtil.checkPageParams(i, i2);
        return DbEntity.findDatas(UploadEntity.class, i, i2, "isGroupChild=? and downloadPath!=''", "false");
    }

    public List<UploadEntity> getAllNotCompleteTask() {
        return DbEntity.findDatas(UploadEntity.class, "isGroupChild=? and isComplete=?", "false", "false");
    }

    public List<UploadEntity> getAllNotCompleteTask(int i, int i2) {
        CheckUtil.checkPageParams(i, i2);
        return DbEntity.findDatas(UploadEntity.class, i, i2, "isGroupChild=? and downloadPath!='' and isComplete=?", "false", "false");
    }

    public List<UploadEntity> getAllCompleteTask() {
        return DbEntity.findDatas(UploadEntity.class, "isGroupChild=? and isComplete=?", "false", "true");
    }

    public List<UploadEntity> getAllCompleteTask(int i, int i2) {
        CheckUtil.checkPageParams(i, i2);
        return DbEntity.findDatas(UploadEntity.class, "isGroupChild=? and downloadPath!='' and isComplete=?", "false", "true");
    }

    public void stopAllTask() {
        EventMsgUtil.getDefault().post(NormalCmdFactory.getInstance().createCmd((AbsTaskWrapper) new UTaskWrapper(null), NormalCmdFactory.TASK_STOP_ALL, 2));
    }

    public List<UploadEntity> getURunningTask() {
        return UTaskQueue.getInstance().getRunningTask(UploadEntity.class);
    }

    public void removeAllTask(boolean z) {
        AriaManager ariaManager = AriaManager.getInstance();
        CancelAllCmd cancelAllCmd = (CancelAllCmd) CmdHelper.createNormalCmd(new UTaskWrapper(null), NormalCmdFactory.TASK_CANCEL_ALL, 2);
        cancelAllCmd.removeFile = z;
        EventMsgUtil.getDefault().post(cancelAllCmd);
        for (String str : ariaManager.getReceiver().keySet()) {
            ariaManager.getReceiver().remove(str);
        }
    }

    @Override // com.arialyy.aria.core.inf.IReceiver
    public void register() {
        if (this.obj == null) {
            ALog.e(this.TAG, String.format("【%s】观察者为空", getTargetName()));
        } else if (this.obj instanceof TaskInternalListenerInterface) {
            if (this.obj instanceof UploadTaskListener) {
                TaskSchedulers.getInstance().register(this.obj, TaskEnum.UPLOAD);
            }
        } else {
            Set<Integer> checkProxyType = ProxyHelper.getInstance().checkProxyType(this.obj.getClass());
            if (checkProxyType != null && !checkProxyType.isEmpty()) {
                for (Integer num : checkProxyType) {
                    if (num.intValue() == ProxyHelper.PROXY_TYPE_UPLOAD) {
                        TaskSchedulers.getInstance().register(this.obj, TaskEnum.UPLOAD);
                    }
                }
                return;
            }
            ALog.e(this.TAG, "没有Aria的注解方法，详情见：https://aria.laoyuyu.me/aria_doc/other/annotaion_invalid.html");
        }
    }

    @Override // com.arialyy.aria.core.inf.IReceiver
    public void unRegister() {
        if (isNeedRmListener()) {
            unRegisterListener();
        }
        AriaManager.getInstance().removeReceiver(this.obj);
    }

    @Override // com.arialyy.aria.core.inf.IReceiver
    public ReceiverType getType() {
        return ReceiverType.UPLOAD;
    }

    @Override // com.arialyy.aria.core.inf.AbsReceiver
    protected void unRegisterListener() {
        if (this.obj == null) {
            ALog.e(this.TAG, String.format("【%s】观察者为空", getTargetName()));
            return;
        }
        Set<Integer> set = ProxyHelper.getInstance().mProxyCache.get(this.obj.getClass().getName());
        if (set != null) {
            for (Integer num : set) {
                if (num.intValue() == ProxyHelper.PROXY_TYPE_UPLOAD) {
                    TaskSchedulers.getInstance().unRegister(this.obj);
                }
            }
        }
    }
}
