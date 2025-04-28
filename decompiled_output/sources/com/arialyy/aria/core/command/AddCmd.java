package com.arialyy.aria.core.command;

import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.util.ALog;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class AddCmd<T extends AbsTaskWrapper> extends AbsNormalCmd<T> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public AddCmd(T t, int i) {
        super(t, i);
    }

    @Override // com.arialyy.aria.core.command.ICmd
    public void executeCmd() {
        if (this.canExeCmd) {
            if (getTask() == null) {
                this.mTaskWrapper.getEntity().setState(3);
                createTask();
                sendWaitState();
                return;
            }
            ALog.w(this.TAG, "添加命令执行失败，【该任务已经存在】");
        }
    }
}
