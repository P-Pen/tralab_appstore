package com.etralab.appstoreforandroid;

import com.arialyy.aria.core.scheduler.AptNormalTaskListener;
import com.arialyy.aria.core.task.DownloadTask;
/* loaded from: classes.dex */
public final class AppActivity$$DownloadListenerProxy extends AptNormalTaskListener<DownloadTask> {
    private AppActivity obj;

    @Override // com.arialyy.aria.core.scheduler.AptNormalTaskListener, com.arialyy.aria.core.scheduler.NormalTaskListenerInterface
    public void onTaskComplete(DownloadTask downloadTask) {
        this.obj.taskComplete(downloadTask);
    }

    @Override // com.arialyy.aria.core.scheduler.AptNormalTaskListener, com.arialyy.aria.core.scheduler.NormalTaskListenerInterface
    public void onTaskFail(DownloadTask downloadTask, Exception exc) {
        this.obj.taskFail(downloadTask, exc);
    }

    @Override // com.arialyy.aria.core.scheduler.AptNormalTaskListener, com.arialyy.aria.core.scheduler.NormalTaskListenerInterface
    public void onTaskRunning(DownloadTask downloadTask) {
        this.obj.running(downloadTask);
    }

    @Override // com.arialyy.aria.core.scheduler.AptNormalTaskListener, com.arialyy.aria.core.scheduler.ISchedulerListener
    public void setListener(Object obj) {
        this.obj = (AppActivity) obj;
    }
}
