package com.arialyy.aria.core.upload.target;

import com.arialyy.aria.core.common.AbsNormalTarget;
import com.arialyy.aria.core.common.HttpOption;
import com.arialyy.aria.util.ALog;
import java.util.Objects;
/* loaded from: classes.dex */
public class HttpNormalTarget extends AbsNormalTarget<HttpNormalTarget> {
    private UNormalConfigHandler<HttpNormalTarget> mConfigHandler;

    /* JADX INFO: Access modifiers changed from: package-private */
    public HttpNormalTarget(long j) {
        this.mConfigHandler = new UNormalConfigHandler<>(this, j);
        getTaskWrapper().setSupportBP(false);
        getTaskWrapper().setRequestType(5);
        getTaskWrapper().setNewTask(false);
    }

    public HttpNormalTarget setUploadUrl(String str) {
        this.mConfigHandler.setTempUrl(str);
        return this;
    }

    public HttpNormalTarget option(HttpOption httpOption) {
        Objects.requireNonNull(httpOption, "任务配置为空");
        getTaskWrapper().getOptionParams().setParams(httpOption);
        return this;
    }

    @Override // com.arialyy.aria.core.common.AbsNormalTarget, com.arialyy.aria.core.common.controller.INormalFeature
    public void resume() {
        ALog.e(this.TAG, "http上传任务没有恢复功能");
    }

    @Override // com.arialyy.aria.core.common.AbsNormalTarget
    public boolean isRunning() {
        return this.mConfigHandler.isRunning();
    }

    @Override // com.arialyy.aria.core.common.AbsNormalTarget
    public boolean taskExists() {
        return this.mConfigHandler.taskExists();
    }
}
