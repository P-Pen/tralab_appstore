.class public final Lcom/arialyy/aria/core/command/StartCmd;
.super Lcom/arialyy/aria/core/command/AbsNormalCmd;
.source "StartCmd.java"


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


# instance fields
.field private nowStart:Z


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

    const/4 p1, 0x0

    .line 32
    iput-boolean p1, p0, Lcom/arialyy/aria/core/command/StartCmd;->nowStart:Z

    return-void
.end method

.method private findAllWaitTask()V
    .locals 6

    .line 121
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/arialyy/aria/core/command/ResumeThread;

    iget-boolean v2, p0, Lcom/arialyy/aria/core/command/StartCmd;->isDownloadCmd:Z

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x3

    .line 122
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "state=%s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/arialyy/aria/core/command/ResumeThread;-><init>(ZLjava/lang/String;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void
.end method


# virtual methods
.method public executeCmd()V
    .locals 8

    .line 48
    iget-boolean v0, p0, Lcom/arialyy/aria/core/command/StartCmd;->canExeCmd:Z

    if-nez v0, :cond_0

    return-void

    .line 49
    :cond_0
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/NetUtils;->isConnected(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 50
    iget-object v0, p0, Lcom/arialyy/aria/core/command/StartCmd;->TAG:Ljava/lang/String;

    const-string v1, "\u542f\u52a8\u4efb\u52a1\u5931\u8d25\uff0c\u7f51\u7edc\u672a\u8fde\u63a5"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 54
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/command/StartCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getMaxTaskNum()I

    move-result v0

    .line 55
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v1

    .line 56
    iget-boolean v2, p0, Lcom/arialyy/aria/core/command/StartCmd;->isDownloadCmd:Z

    if-eqz v2, :cond_2

    .line 57
    invoke-virtual {v1}, Lcom/arialyy/aria/core/AriaConfig;->getDConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/config/DownloadConfig;->getQueueMod()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 59
    :cond_2
    invoke-virtual {v1}, Lcom/arialyy/aria/core/AriaConfig;->getUConfig()Lcom/arialyy/aria/core/config/UploadConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/config/UploadConfig;->getQueueMod()Ljava/lang/String;

    move-result-object v1

    .line 62
    :goto_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/StartCmd;->getTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v2

    const-string v3, "\u4efb\u52a1\u3010%s\u3011\u5df2\u7ecf\u5728\u8fd0\u884c"

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-nez v2, :cond_9

    .line 64
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/StartCmd;->createTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v2

    .line 66
    sget-object v6, Lcom/arialyy/aria/core/common/QueueMod;->NOW:Lcom/arialyy/aria/core/common/QueueMod;

    invoke-virtual {v6}, Lcom/arialyy/aria/core/common/QueueMod;->getTag()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_3

    .line 67
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/StartCmd;->startTask()V

    goto/16 :goto_2

    .line 68
    :cond_3
    sget-object v6, Lcom/arialyy/aria/core/common/QueueMod;->WAIT:Lcom/arialyy/aria/core/common/QueueMod;

    invoke-virtual {v6}, Lcom/arialyy/aria/core/common/QueueMod;->getTag()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_e

    .line 69
    invoke-virtual {v2}, Lcom/arialyy/aria/core/task/AbsTask;->getState()I

    move-result v1

    .line 70
    iget-object v6, p0, Lcom/arialyy/aria/core/command/StartCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    invoke-virtual {v6}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getCurrentExePoolNum()I

    move-result v6

    if-ge v6, v0, :cond_7

    const/4 v0, 0x2

    if-eq v1, v0, :cond_6

    if-eqz v1, :cond_6

    const/4 v0, -0x1

    if-eq v1, v0, :cond_6

    const/4 v0, 0x5

    if-eq v1, v0, :cond_6

    const/4 v0, 0x6

    if-eq v1, v0, :cond_6

    if-ne v1, v5, :cond_4

    goto :goto_1

    :cond_4
    const/4 v0, 0x4

    if-ne v1, v0, :cond_5

    .line 79
    iget-object v0, p0, Lcom/arialyy/aria/core/command/StartCmd;->TAG:Ljava/lang/String;

    new-array v1, v5, [Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_2

    .line 81
    :cond_5
    iget-object v0, p0, Lcom/arialyy/aria/core/command/StartCmd;->TAG:Ljava/lang/String;

    new-array v2, v5, [Ljava/lang/Object;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v2, v4

    const-string v1, "\u5f00\u59cb\u65b0\u4efb\u52a1, \u4efb\u52a1\u72b6\u6001\uff1a%s"

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/StartCmd;->startTask()V

    goto :goto_2

    .line 77
    :cond_6
    :goto_1
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/StartCmd;->resumeTask()V

    goto :goto_2

    .line 85
    :cond_7
    iget-boolean v0, p0, Lcom/arialyy/aria/core/command/StartCmd;->nowStart:Z

    if-eqz v0, :cond_8

    .line 86
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/StartCmd;->startTask()V

    goto :goto_2

    .line 88
    :cond_8
    invoke-virtual {p0, v2}, Lcom/arialyy/aria/core/command/StartCmd;->sendWaitState(Lcom/arialyy/aria/core/task/AbsTask;)V

    goto :goto_2

    .line 94
    :cond_9
    iget-object v6, p0, Lcom/arialyy/aria/core/command/StartCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/task/AbsTask;->getKey()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->taskIsRunning(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_d

    .line 95
    sget-object v3, Lcom/arialyy/aria/core/common/QueueMod;->NOW:Lcom/arialyy/aria/core/common/QueueMod;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/common/QueueMod;->getTag()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_a

    .line 96
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/StartCmd;->resumeTask()V

    goto :goto_2

    .line 98
    :cond_a
    iget-object v1, p0, Lcom/arialyy/aria/core/command/StartCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getCurrentExePoolNum()I

    move-result v1

    if-ge v1, v0, :cond_b

    .line 99
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/StartCmd;->resumeTask()V

    goto :goto_2

    .line 101
    :cond_b
    iget-boolean v0, p0, Lcom/arialyy/aria/core/command/StartCmd;->nowStart:Z

    if-eqz v0, :cond_c

    .line 102
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/StartCmd;->resumeTask()V

    goto :goto_2

    .line 104
    :cond_c
    invoke-virtual {p0, v2}, Lcom/arialyy/aria/core/command/StartCmd;->sendWaitState(Lcom/arialyy/aria/core/task/AbsTask;)V

    goto :goto_2

    .line 109
    :cond_d
    iget-object v0, p0, Lcom/arialyy/aria/core/command/StartCmd;->TAG:Ljava/lang/String;

    new-array v1, v5, [Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    :cond_e
    :goto_2
    iget-object v0, p0, Lcom/arialyy/aria/core/command/StartCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getCurrentCachePoolNum()I

    move-result v0

    if-nez v0, :cond_f

    .line 113
    invoke-direct {p0}, Lcom/arialyy/aria/core/command/StartCmd;->findAllWaitTask()V

    :cond_f
    return-void
.end method

.method public setNowStart(Z)V
    .locals 0

    .line 44
    iput-boolean p1, p0, Lcom/arialyy/aria/core/command/StartCmd;->nowStart:Z

    return-void
.end method
