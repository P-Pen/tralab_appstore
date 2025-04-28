package com.arialyy.aria.core.task;
/* loaded from: classes.dex */
public interface IThreadTaskAdapter {
    void attach(IThreadTaskObserver iThreadTaskObserver);

    void call(IThreadTask iThreadTask) throws Exception;

    void setMaxSpeed(int i);
}
