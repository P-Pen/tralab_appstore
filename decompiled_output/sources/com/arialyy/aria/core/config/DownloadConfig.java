package com.arialyy.aria.core.config;

import com.arialyy.aria.core.event.DMaxNumEvent;
import com.arialyy.aria.core.event.DSpeedEvent;
import com.arialyy.aria.core.event.EventMsgUtil;
import com.arialyy.aria.util.ALog;
import java.io.Serializable;
/* loaded from: classes.dex */
public class DownloadConfig extends BaseTaskConfig implements Serializable {
    int threadNum = 3;
    boolean useBlock = true;
    boolean useHeadRequest = false;

    @Override // com.arialyy.aria.core.config.BaseConfig
    int getType() {
        return 1;
    }

    public boolean isUseHeadRequest() {
        return this.useHeadRequest;
    }

    public DownloadConfig setUseHeadRequest(boolean z) {
        this.useHeadRequest = z;
        save();
        return this;
    }

    public boolean isUseBlock() {
        return this.useBlock;
    }

    @Override // com.arialyy.aria.core.config.BaseTaskConfig
    public DownloadConfig setMaxSpeed(int i) {
        super.setMaxSpeed(i);
        EventMsgUtil.getDefault().post(new DSpeedEvent(i));
        return this;
    }

    public DownloadConfig setUseBlock(boolean z) {
        this.useBlock = z;
        save();
        return this;
    }

    @Override // com.arialyy.aria.core.config.BaseTaskConfig
    public DownloadConfig setMaxTaskNum(int i) {
        if (i <= 0) {
            ALog.e(this.TAG, "下载任务最大任务数不能小于0");
            return this;
        }
        super.setMaxTaskNum(i);
        EventMsgUtil.getDefault().post(new DMaxNumEvent(i));
        return this;
    }

    public DownloadConfig setThreadNum(int i) {
        this.threadNum = i;
        save();
        return this;
    }

    public int getThreadNum() {
        return this.threadNum;
    }
}
