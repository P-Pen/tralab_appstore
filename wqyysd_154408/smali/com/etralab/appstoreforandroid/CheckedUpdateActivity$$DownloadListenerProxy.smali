.class public final Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$$DownloadListenerProxy;
.super Lcom/arialyy/aria/core/scheduler/AptNormalTaskListener;
.source "CheckedUpdateActivity$$DownloadListenerProxy.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/arialyy/aria/core/scheduler/AptNormalTaskListener<",
        "Lcom/arialyy/aria/core/task/DownloadTask;",
        ">;"
    }
.end annotation


# instance fields
.field private obj:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 15
    invoke-direct {p0}, Lcom/arialyy/aria/core/scheduler/AptNormalTaskListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onTaskComplete(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 1

    .line 20
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$$DownloadListenerProxy;->obj:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    invoke-virtual {v0, p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->taskComplete(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public bridge synthetic onTaskComplete(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    .line 12
    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$$DownloadListenerProxy;->onTaskComplete(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public onTaskFail(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;)V
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$$DownloadListenerProxy;->obj:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    invoke-virtual {v0, p1, p2}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->taskFail(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;)V

    return-void
.end method

.method public bridge synthetic onTaskFail(Lcom/arialyy/aria/core/task/ITask;Ljava/lang/Exception;)V
    .locals 0

    .line 12
    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1, p2}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$$DownloadListenerProxy;->onTaskFail(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;)V

    return-void
.end method

.method public onTaskRunning(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 1

    .line 30
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$$DownloadListenerProxy;->obj:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    invoke-virtual {v0, p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->running(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public bridge synthetic onTaskRunning(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    .line 12
    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$$DownloadListenerProxy;->onTaskRunning(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public setListener(Ljava/lang/Object;)V
    .locals 0

    .line 35
    check-cast p1, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$$DownloadListenerProxy;->obj:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    return-void
.end method
