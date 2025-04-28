.class final Lcom/arialyy/aria/core/command/AddCmd;
.super Lcom/arialyy/aria/core/command/AbsNormalCmd;
.source "AddCmd.java"


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

    .line 31
    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/core/command/AbsNormalCmd;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;I)V

    return-void
.end method


# virtual methods
.method public executeCmd()V
    .locals 2

    .line 35
    iget-boolean v0, p0, Lcom/arialyy/aria/core/command/AddCmd;->canExeCmd:Z

    if-nez v0, :cond_0

    return-void

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/AddCmd;->getTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    if-nez v0, :cond_1

    .line 38
    iget-object v0, p0, Lcom/arialyy/aria/core/command/AddCmd;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/common/AbsEntity;->setState(I)V

    .line 39
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/AddCmd;->createTask()Lcom/arialyy/aria/core/task/AbsTask;

    .line 40
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/AddCmd;->sendWaitState()V

    goto :goto_0

    .line 42
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/command/AddCmd;->TAG:Ljava/lang/String;

    const-string v1, "\u6dfb\u52a0\u547d\u4ee4\u6267\u884c\u5931\u8d25\uff0c\u3010\u8be5\u4efb\u52a1\u5df2\u7ecf\u5b58\u5728\u3011"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method
