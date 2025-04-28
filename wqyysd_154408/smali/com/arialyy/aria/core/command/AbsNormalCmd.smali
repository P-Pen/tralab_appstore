.class public abstract Lcom/arialyy/aria/core/command/AbsNormalCmd;
.super Lcom/arialyy/aria/core/command/AbsCmd;
.source "AbsNormalCmd.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;",
        ">",
        "Lcom/arialyy/aria/core/command/AbsCmd<",
        "TT;>;"
    }
.end annotation


# instance fields
.field canExeCmd:Z

.field taskType:I


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .line 48
    invoke-direct {p0}, Lcom/arialyy/aria/core/command/AbsCmd;-><init>()V

    const/4 v0, 0x1

    .line 40
    iput-boolean v0, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->canExeCmd:Z

    .line 49
    iput p2, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->taskType:I

    .line 50
    iput-object p1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    .line 51
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->TAG:Ljava/lang/String;

    const/4 v1, 0x3

    if-ne p2, v0, :cond_1

    .line 53
    instance-of p1, p1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    if-nez p1, :cond_0

    .line 54
    iget-object p1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->TAG:Ljava/lang/String;

    const-string p2, "\u4efb\u52a1\u7c7b\u578b\u9519\u8bef\uff0c\u4efb\u52a1\u7c7b\u578b\u5e94\u8be5\u4e3aICM.TASK_TYPE_DOWNLOAD"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 57
    :cond_0
    invoke-static {}, Lcom/arialyy/aria/core/queue/DTaskQueue;->getInstance()Lcom/arialyy/aria/core/queue/DTaskQueue;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    goto :goto_0

    :cond_1
    if-ne p2, v1, :cond_3

    .line 59
    instance-of p1, p1, Lcom/arialyy/aria/core/download/DGTaskWrapper;

    if-nez p1, :cond_2

    .line 60
    iget-object p1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->TAG:Ljava/lang/String;

    const-string p2, "\u4efb\u52a1\u7c7b\u578b\u9519\u8bef\uff0c\u4efb\u52a1\u7c7b\u578b\u5e94\u8be5\u4e3aICM.TASK_TYPE_DOWNLOAD_GROUP"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 63
    :cond_2
    invoke-static {}, Lcom/arialyy/aria/core/queue/DGroupTaskQueue;->getInstance()Lcom/arialyy/aria/core/queue/DGroupTaskQueue;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    goto :goto_0

    :cond_3
    const/4 v2, 0x2

    if-ne p2, v2, :cond_7

    .line 65
    instance-of p1, p1, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    if-nez p1, :cond_4

    .line 66
    iget-object p1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->TAG:Ljava/lang/String;

    const-string p2, "\u4efb\u52a1\u7c7b\u578b\u9519\u8bef\uff0c\u4efb\u52a1\u7c7b\u578b\u5e94\u8be5\u4e3aICM.TASK_TYPE_UPLOAD"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 69
    :cond_4
    invoke-static {}, Lcom/arialyy/aria/core/queue/UTaskQueue;->getInstance()Lcom/arialyy/aria/core/queue/UTaskQueue;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    :goto_0
    if-eq p2, v0, :cond_6

    if-ne p2, v1, :cond_5

    goto :goto_1

    :cond_5
    const/4 v0, 0x0

    .line 74
    :cond_6
    :goto_1
    iput-boolean v0, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->isDownloadCmd:Z

    return-void

    .line 71
    :cond_7
    iget-object p1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->TAG:Ljava/lang/String;

    const-string p2, "\u4efb\u52a1\u7c7b\u578b\u9519\u8bef\uff0c\u4efb\u52a1\u7c7b\u578b\u5e94\u8be5\u4e3aICM.TASK_TYPE_DOWNLOAD\u3001TASK_TYPE_DOWNLOAD_GROUP\u3001TASK_TYPE_UPLOAD"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method createTask()Lcom/arialyy/aria/core/task/AbsTask;
    .locals 2

    .line 185
    iget-object v0, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    iget-object v1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    return-object v0
.end method

.method createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/AbsTask;
    .locals 1

    .line 196
    iget-object v0, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object p1

    return-object p1
.end method

.method getTask()Lcom/arialyy/aria/core/task/AbsTask;
    .locals 2

    .line 167
    iget-object v0, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    iget-object v1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsEntity;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    return-object v0
.end method

.method getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;
    .locals 1

    .line 176
    iget-object v0, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object p1

    return-object p1
.end method

.method removeTask()V
    .locals 2

    .line 120
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/AbsNormalCmd;->getTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    if-nez v0, :cond_0

    .line 122
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/AbsNormalCmd;->createTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    .line 124
    :cond_0
    iget-object v1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    invoke-virtual {v1, v0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->cancelTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    return-void
.end method

.method removeTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V
    .locals 1

    .line 131
    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/command/AbsNormalCmd;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    if-nez v0, :cond_0

    .line 133
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/command/AbsNormalCmd;->createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    .line 135
    :cond_0
    iget-object p1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->cancelTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    return-void
.end method

.method resumeTask()V
    .locals 2

    .line 153
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/AbsNormalCmd;->getTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    if-nez v0, :cond_0

    .line 155
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/AbsNormalCmd;->createTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    .line 157
    :cond_0
    iget-object v1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    invoke-virtual {v1, v0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->resumeTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    return-void
.end method

.method sendWaitState()V
    .locals 1

    .line 81
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/AbsNormalCmd;->getTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    if-nez v0, :cond_0

    .line 83
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/AbsNormalCmd;->createTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    .line 85
    :cond_0
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/command/AbsNormalCmd;->sendWaitState(Lcom/arialyy/aria/core/task/AbsTask;)V

    return-void
.end method

.method sendWaitState(Lcom/arialyy/aria/core/task/AbsTask;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 93
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setState(I)V

    .line 94
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getOutHandler()Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    :cond_0
    return-void
.end method

.method startTask()V
    .locals 2

    .line 142
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/AbsNormalCmd;->getTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    if-nez v0, :cond_0

    .line 144
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/AbsNormalCmd;->createTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    .line 146
    :cond_0
    iget-object v1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    invoke-virtual {v1, v0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->startTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    return-void
.end method

.method stopAll()V
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->stopAllTask()V

    return-void
.end method

.method stopTask()V
    .locals 2

    .line 109
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/AbsNormalCmd;->getTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    if-nez v0, :cond_0

    .line 111
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/AbsNormalCmd;->createTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    .line 113
    :cond_0
    iget-object v1, p0, Lcom/arialyy/aria/core/command/AbsNormalCmd;->mQueue:Lcom/arialyy/aria/core/queue/AbsTaskQueue;

    invoke-virtual {v1, v0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->stopTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    return-void
.end method
