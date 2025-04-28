.class final Lcom/arialyy/aria/core/command/ReStartCmd;
.super Lcom/arialyy/aria/core/command/AbsNormalCmd;
.source "ReStartCmd.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;",
        ">",
        "Lcom/arialyy/aria/core/command/AbsNormalCmd<",
        "TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .line 28
    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/core/command/AbsNormalCmd;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;I)V

    return-void
.end method


# virtual methods
.method public executeCmd()V
    .locals 3

    .line 32
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/ReStartCmd;->getTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    if-nez v0, :cond_0

    .line 34
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/ReStartCmd;->createTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    :cond_0
    if-eqz v0, :cond_1

    .line 37
    iget-object v1, p0, Lcom/arialyy/aria/core/command/ReStartCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    const/4 v2, 0x4

    invoke-virtual {v1, v0, v2}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->cancelTask(Lcom/arialyy/aria/core/task/AbsTask;I)V

    .line 38
    iget-object v1, p0, Lcom/arialyy/aria/core/command/ReStartCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    const/4 v2, 0x5

    invoke-virtual {v1, v0, v2}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->startTask(Lcom/arialyy/aria/core/task/AbsTask;I)V

    :cond_1
    return-void
.end method
