.class final Lcom/arialyy/aria/core/command/DGSubStopCmd;
.super Lcom/arialyy/aria/core/command/AbsGroupCmd;
.source "DGSubStopCmd.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/arialyy/aria/core/download/AbsGroupTaskWrapper;",
        ">",
        "Lcom/arialyy/aria/core/command/AbsGroupCmd<",
        "TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/download/AbsGroupTaskWrapper;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 26
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/command/AbsGroupCmd;-><init>(Lcom/arialyy/aria/core/download/AbsGroupTaskWrapper;)V

    return-void
.end method


# virtual methods
.method public executeCmd()V
    .locals 2

    .line 30
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/DGSubStopCmd;->checkTask()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 31
    iget-object v0, p0, Lcom/arialyy/aria/core/command/DGSubStopCmd;->tempTask:Lcom/arialyy/aria/core/task/AbsGroupTask;

    iget-object v1, p0, Lcom/arialyy/aria/core/command/DGSubStopCmd;->childUrl:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/task/AbsGroupTask;->stopSubTask(Ljava/lang/String;)V

    :cond_0
    return-void
.end method
