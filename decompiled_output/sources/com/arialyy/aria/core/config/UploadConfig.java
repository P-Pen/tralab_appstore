package com.arialyy.aria.core.config;

import com.arialyy.aria.core.event.EventMsgUtil;
import com.arialyy.aria.core.event.UMaxNumEvent;
import com.arialyy.aria.core.event.USpeedEvent;
import com.arialyy.aria.util.ALog;
import java.io.Serializable;
/* loaded from: classes.dex */
public class UploadConfig extends BaseTaskConfig implements Serializable {
    @Override // com.arialyy.aria.core.config.BaseConfig
    int getType() {
        return 2;
    }

    @Override // com.arialyy.aria.core.config.BaseTaskConfig
    public UploadConfig setMaxSpeed(int i) {
        super.setMaxSpeed(i);
        EventMsgUtil.getDefault().post(new USpeedEvent(i));
        return this;
    }

    @Override // com.arialyy.aria.core.config.BaseTaskConfig
    public UploadConfig setMaxTaskNum(int i) {
        if (i <= 0) {
            ALog.e(this.TAG, "上传任务最大任务数不能小于0");
            return this;
        }
        super.setMaxTaskNum(i);
        EventMsgUtil.getDefault().post(new UMaxNumEvent(i));
        return this;
    }
}
