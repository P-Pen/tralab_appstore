package com.arialyy.aria.http;

import com.arialyy.aria.core.common.AbsNormalEntity;
import com.arialyy.aria.core.common.SubThreadConfig;
import com.arialyy.aria.core.task.AbsThreadTaskAdapter;
/* loaded from: classes.dex */
public abstract class BaseHttpThreadTaskAdapter extends AbsThreadTaskAdapter {
    protected HttpTaskOption mTaskOption;

    /* JADX INFO: Access modifiers changed from: protected */
    public BaseHttpThreadTaskAdapter(SubThreadConfig subThreadConfig) {
        super(subThreadConfig);
        this.mTaskOption = (HttpTaskOption) getTaskWrapper().getTaskOption();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String getFileName() {
        return getEntity().getFileName();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbsNormalEntity getEntity() {
        return (AbsNormalEntity) getTaskWrapper().getEntity();
    }
}
