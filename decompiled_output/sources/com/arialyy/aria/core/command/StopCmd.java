package com.arialyy.aria.core.command;

import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.util.ALog;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class StopCmd<T extends AbsTaskWrapper> extends AbsNormalCmd<T> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public StopCmd(T t, int i) {
        super(t, i);
    }

    @Override // com.arialyy.aria.core.command.ICmd
    public void executeCmd() {
        if (this.canExeCmd) {
            if (getTask() == null) {
                if (this.mTaskWrapper.getEntity().getState() == 4) {
                    stopTask();
                    return;
                } else {
                    ALog.w(this.TAG, "停止命令执行失败，【调度器中没有该任务】");
                    return;
                }
            }
            stopTask();
        }
    }
}
