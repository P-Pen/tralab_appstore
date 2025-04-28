package com.arialyy.aria.core.command;

import com.arialyy.aria.core.download.AbsGroupTaskWrapper;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class DGSubStartCmd<T extends AbsGroupTaskWrapper> extends AbsGroupCmd<T> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public DGSubStartCmd(T t) {
        super(t);
    }

    @Override // com.arialyy.aria.core.command.ICmd
    public void executeCmd() {
        if (checkTask()) {
            this.tempTask.startSubTask(this.childUrl);
        }
    }
}
