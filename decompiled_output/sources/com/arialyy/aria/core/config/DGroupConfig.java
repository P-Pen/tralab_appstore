package com.arialyy.aria.core.config;

import com.arialyy.aria.core.AriaConfig;
import com.arialyy.aria.core.event.DGMaxNumEvent;
import com.arialyy.aria.core.event.DSpeedEvent;
import com.arialyy.aria.core.event.EventMsgUtil;
import com.arialyy.aria.util.ALog;
import java.io.Serializable;
/* loaded from: classes.dex */
public class DGroupConfig extends BaseTaskConfig implements Serializable {
    private DownloadConfig subConfig;
    int subMaxTaskNum = 3;
    private boolean subFailAsStop = true;
    int subReTryNum = 5;
    int subReTryInterval = 2000;

    @Override // com.arialyy.aria.core.config.BaseConfig
    int getType() {
        return 4;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public DGroupConfig() {
        getSubConfig();
    }

    @Override // com.arialyy.aria.core.config.BaseTaskConfig
    public DGroupConfig setMaxSpeed(int i) {
        super.setMaxSpeed(i);
        EventMsgUtil.getDefault().post(new DSpeedEvent(i));
        return this;
    }

    public DownloadConfig getSubConfig() {
        DownloadConfig dConfig = AriaConfig.getInstance().getDConfig();
        this.subConfig = dConfig;
        return dConfig;
    }

    @Override // com.arialyy.aria.core.config.BaseTaskConfig
    public DGroupConfig setMaxTaskNum(int i) {
        if (i <= 0) {
            ALog.e(this.TAG, "组合任务最大任务数不能小于0");
            return this;
        }
        super.setMaxTaskNum(i);
        EventMsgUtil.getDefault().post(new DGMaxNumEvent(i));
        return this;
    }

    public int getSubMaxTaskNum() {
        return this.subMaxTaskNum;
    }

    public DGroupConfig setSubMaxTaskNum(int i) {
        this.subMaxTaskNum = i;
        save();
        return this;
    }

    public int getSubReTryNum() {
        return this.subReTryNum;
    }

    public DGroupConfig setSubReTryNum(int i) {
        this.subReTryNum = i;
        this.subConfig.reTryNum = i;
        save();
        return this;
    }

    public int getSubReTryInterval() {
        return this.subReTryInterval;
    }

    public DGroupConfig setSubReTryInterval(int i) {
        this.subReTryInterval = i;
        this.subConfig.reTryInterval = i;
        save();
        return this;
    }

    public boolean isSubFailAsStop() {
        return this.subFailAsStop;
    }

    public DGroupConfig setSubFailAsStop(boolean z) {
        this.subFailAsStop = z;
        save();
        return this;
    }
}
