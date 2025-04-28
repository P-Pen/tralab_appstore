package com.arialyy.aria.core.common;

import com.arialyy.aria.core.common.AbsBuilderTarget;
import com.arialyy.aria.core.common.controller.BuilderController;
import com.arialyy.aria.core.common.controller.IStartFeature;
import com.arialyy.aria.core.inf.AbsTarget;
/* loaded from: classes.dex */
public abstract class AbsBuilderTarget<TARGET extends AbsBuilderTarget> extends AbsTarget<TARGET> implements IStartFeature {
    private BuilderController mStartController;

    protected void onPre() {
    }

    private synchronized BuilderController getController() {
        if (this.mStartController == null) {
            this.mStartController = new BuilderController(getTaskWrapper());
        }
        return this.mStartController;
    }

    public TARGET ignoreCheckPermissions() {
        getController().ignoreCheckPermissions();
        return this;
    }

    public TARGET ignoreFilePathOccupy() {
        getController().ignoreFilePathOccupy();
        return this;
    }

    @Override // com.arialyy.aria.core.common.controller.IStartFeature
    public long add() {
        onPre();
        return getController().add();
    }

    @Override // com.arialyy.aria.core.common.controller.IStartFeature
    public long create() {
        onPre();
        return getController().create();
    }

    @Override // com.arialyy.aria.core.common.controller.IStartFeature
    public long setHighestPriority() {
        onPre();
        return getController().setHighestPriority();
    }
}
