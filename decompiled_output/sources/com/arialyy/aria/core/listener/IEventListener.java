package com.arialyy.aria.core.listener;

import android.os.Handler;
import com.arialyy.aria.core.task.AbsTask;
import com.arialyy.aria.exception.AriaException;
/* loaded from: classes.dex */
public interface IEventListener {
    void onCancel();

    void onComplete();

    void onFail(boolean z, AriaException ariaException);

    void onPre();

    void onProgress(long j);

    void onResume(long j);

    void onStart(long j);

    void onStop(long j);

    IEventListener setParams(AbsTask absTask, Handler handler);
}
