.class final Lcom/arialyy/aria/core/command/ResumeAllCmd;
.super Lcom/arialyy/aria/core/command/AbsNormalCmd;
.source "ResumeAllCmd.java"


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

    .line 35
    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/core/command/AbsNormalCmd;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;I)V

    return-void
.end method


# virtual methods
.method public executeCmd()V
    .locals 6

    .line 39
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/NetUtils;->isConnected(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 40
    iget-object v0, p0, Lcom/arialyy/aria/core/command/ResumeAllCmd;->TAG:Ljava/lang/String;

    const-string v1, "\u6062\u590d\u4efb\u52a1\u5931\u8d25\uff0c\u7f51\u7edc\u672a\u8fde\u63a5"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 43
    :cond_0
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/arialyy/aria/core/command/ResumeThread;

    iget-boolean v2, p0, Lcom/arialyy/aria/core/command/ResumeAllCmd;->isDownloadCmd:Z

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    const/4 v5, 0x0

    .line 44
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v4, v5

    const-string v3, "state!=%s"

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/arialyy/aria/core/command/ResumeThread;-><init>(ZLjava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method
