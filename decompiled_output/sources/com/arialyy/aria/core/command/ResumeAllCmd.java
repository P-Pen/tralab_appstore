package com.arialyy.aria.core.command;

import com.arialyy.aria.core.AriaConfig;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.NetUtils;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class ResumeAllCmd<T extends AbsTaskWrapper> extends AbsNormalCmd<T> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public ResumeAllCmd(T t, int i) {
        super(t, i);
    }

    @Override // com.arialyy.aria.core.command.ICmd
    public void executeCmd() {
        if (!NetUtils.isConnected(AriaConfig.getInstance().getAPP())) {
            ALog.w(this.TAG, "恢复任务失败，网络未连接");
        } else {
            new Thread(new ResumeThread(this.isDownloadCmd, String.format("state!=%s", 1))).start();
        }
    }
}
