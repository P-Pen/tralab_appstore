package com.arialyy.aria.core.download;

import com.arialyy.aria.core.common.AbsEntity;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import java.util.List;
/* loaded from: classes.dex */
public abstract class AbsGroupTaskWrapper<ENTITY extends AbsEntity, SUB extends AbsTaskWrapper> extends AbsTaskWrapper<ENTITY> {
    private boolean ignoreTaskOccupy;

    public abstract List<SUB> getSubTaskWrapper();

    public abstract void setSubTaskWrapper(List<SUB> list);

    public AbsGroupTaskWrapper(ENTITY entity) {
        super(entity);
        this.ignoreTaskOccupy = false;
    }

    public boolean isIgnoreTaskOccupy() {
        return this.ignoreTaskOccupy;
    }

    public void setIgnoreTaskOccupy(boolean z) {
        this.ignoreTaskOccupy = z;
    }
}
