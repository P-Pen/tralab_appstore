package com.arialyy.aria.core.command;

import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class StopAllCmd<T extends AbsTaskWrapper> extends AbsNormalCmd<T> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public StopAllCmd(T t, int i) {
        super(t, i);
    }

    @Override // com.arialyy.aria.core.command.ICmd
    public void executeCmd() {
        stopAll();
    }
}
