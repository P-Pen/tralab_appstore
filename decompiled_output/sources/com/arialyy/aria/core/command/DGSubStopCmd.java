package com.arialyy.aria.core.command;

import com.arialyy.aria.core.download.AbsGroupTaskWrapper;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class DGSubStopCmd<T extends AbsGroupTaskWrapper> extends AbsGroupCmd<T> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public DGSubStopCmd(T t) {
        super(t);
    }

    @Override // com.arialyy.aria.core.command.ICmd
    public void executeCmd() {
        if (checkTask()) {
            this.tempTask.stopSubTask(this.childUrl);
        }
    }
}
