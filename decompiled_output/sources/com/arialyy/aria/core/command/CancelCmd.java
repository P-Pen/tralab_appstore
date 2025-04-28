package com.arialyy.aria.core.command;

import com.arialyy.aria.core.task.AbsTask;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
/* loaded from: classes.dex */
public final class CancelCmd<T extends AbsTaskWrapper> extends AbsNormalCmd<T> {
    public boolean removeFile;

    /* JADX INFO: Access modifiers changed from: package-private */
    public CancelCmd(T t, int i) {
        super(t, i);
        this.removeFile = false;
    }

    @Override // com.arialyy.aria.core.command.ICmd
    public void executeCmd() {
        if (this.canExeCmd) {
            AbsTask task = getTask();
            if (task == null) {
                task = createTask();
            }
            if (task != null) {
                this.mTaskWrapper.setRemoveFile(this.removeFile);
                removeTask();
            }
        }
    }
}
