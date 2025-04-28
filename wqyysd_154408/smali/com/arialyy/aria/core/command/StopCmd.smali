.class final Lcom/arialyy/aria/core/command/StopCmd;
.super Lcom/arialyy/aria/core/command/AbsNormalCmd;
.source "StopCmd.java"


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
    iget-boolean v0, p0, Lcom/arialyy/aria/core/command/StopCmd;->canExeCmd:Z

    if-nez v0, :cond_0

    return-void

    .line 36
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/StopCmd;->getTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    if-nez v0, :cond_2

    .line 38
    iget-object v0, p0, Lcom/arialyy/aria/core/command/StopCmd;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getState()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 39
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/StopCmd;->stopTask()V

    goto :goto_0

    .line 41
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/command/StopCmd;->TAG:Ljava/lang/String;

    const-string v1, "\u505c\u6b62\u547d\u4ee4\u6267\u884c\u5931\u8d25\uff0c\u3010\u8c03\u5ea6\u5668\u4e2d\u6ca1\u6709\u8be5\u4efb\u52a1\u3011"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 44
    :cond_2
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/StopCmd;->stopTask()V

    :goto_0
    return-void
.end method
