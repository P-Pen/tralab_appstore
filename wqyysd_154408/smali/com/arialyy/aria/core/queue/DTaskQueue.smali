.class public Lcom/arialyy/aria/core/queue/DTaskQueue;
.super Lcom/arialyy/aria/core/queue/AbsTaskQueue;
.source "DTaskQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/arialyy/aria/core/queue/AbsTaskQueue<",
        "Lcom/arialyy/aria/core/task/DownloadTask;",
        "Lcom/arialyy/aria/core/download/DTaskWrapper;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile INSTANCE:Lcom/arialyy/aria/core/queue/DTaskQueue; = null

.field private static final TAG:Ljava/lang/String; = "DownloadTaskQueue"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 51
    invoke-direct {p0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/arialyy/aria/core/queue/DTaskQueue;
    .locals 3

    .line 42
    sget-object v0, Lcom/arialyy/aria/core/queue/DTaskQueue;->INSTANCE:Lcom/arialyy/aria/core/queue/DTaskQueue;

    if-nez v0, :cond_0

    .line 43
    const-class v0, Lcom/arialyy/aria/core/queue/DTaskQueue;

    monitor-enter v0

    .line 44
    :try_start_0
    new-instance v1, Lcom/arialyy/aria/core/queue/DTaskQueue;

    invoke-direct {v1}, Lcom/arialyy/aria/core/queue/DTaskQueue;-><init>()V

    sput-object v1, Lcom/arialyy/aria/core/queue/DTaskQueue;->INSTANCE:Lcom/arialyy/aria/core/queue/DTaskQueue;

    .line 45
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object v1

    sget-object v2, Lcom/arialyy/aria/core/queue/DTaskQueue;->INSTANCE:Lcom/arialyy/aria/core/queue/DTaskQueue;

    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/event/EventMsgUtil;->register(Ljava/lang/Object;)V

    .line 46
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 48
    :cond_0
    :goto_0
    sget-object v0, Lcom/arialyy/aria/core/queue/DTaskQueue;->INSTANCE:Lcom/arialyy/aria/core/queue/DTaskQueue;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/AbsTask;
    .locals 0

    .line 37
    check-cast p1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/DTaskQueue;->createTask(Lcom/arialyy/aria/core/download/DTaskWrapper;)Lcom/arialyy/aria/core/task/DownloadTask;

    move-result-object p1

    return-object p1
.end method

.method public createTask(Lcom/arialyy/aria/core/download/DTaskWrapper;)Lcom/arialyy/aria/core/task/DownloadTask;
    .locals 2

    .line 110
    invoke-super {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/AbsTask;

    .line 112
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/DTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->taskExits(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/arialyy/aria/core/queue/DTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->taskExits(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 113
    invoke-static {}, Lcom/arialyy/aria/core/queue/TaskFactory;->getInstance()Lcom/arialyy/aria/core/queue/TaskFactory;

    move-result-object v0

    .line 114
    invoke-static {}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->getInstance()Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/arialyy/aria/core/queue/TaskFactory;->createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/listener/ISchedulers;)Lcom/arialyy/aria/core/task/ITask;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    .line 115
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/DTaskQueue;->addTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    goto :goto_0

    :cond_0
    const-string p1, "DownloadTaskQueue"

    const-string v0, "\u4efb\u52a1\u5df2\u5b58\u5728"

    .line 117
    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public bridge synthetic createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/ITask;
    .locals 0

    .line 37
    check-cast p1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/DTaskQueue;->createTask(Lcom/arialyy/aria/core/download/DTaskWrapper;)Lcom/arialyy/aria/core/task/DownloadTask;

    move-result-object p1

    return-object p1
.end method

.method public getMaxTaskNum()I
    .locals 1

    .line 129
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getDConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/DownloadConfig;->getMaxTaskNum()I

    move-result v0

    return v0
.end method

.method public getOldMaxNum()I
    .locals 1

    .line 64
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getDConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object v0

    iget v0, v0, Lcom/arialyy/aria/core/config/DownloadConfig;->oldMaxTaskNum:I

    return v0
.end method

.method getQueueType()I
    .locals 1

    const/4 v0, 0x1

    return v0
.end method

.method public maxTaskNum(Lcom/arialyy/aria/core/event/DMaxNumEvent;)V
    .locals 0
    .annotation runtime Lcom/arialyy/aria/core/event/Event;
    .end annotation

    .line 60
    iget p1, p1, Lcom/arialyy/aria/core/event/DMaxNumEvent;->maxNum:I

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/DTaskQueue;->setMaxTaskNum(I)V

    return-void
.end method

.method public setTaskHighestPriority(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 5

    const/4 v0, 0x1

    .line 71
    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/task/DownloadTask;->setHighestPriority(Z)V

    .line 73
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/DTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->getAllTask()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_7

    .line 74
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_7

    .line 75
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/task/DownloadTask;

    if-eqz v1, :cond_0

    .line 76
    invoke-virtual {v1}, Lcom/arialyy/aria/core/task/DownloadTask;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1}, Lcom/arialyy/aria/core/task/DownloadTask;->isHighestPriorityTask()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-virtual {v1}, Lcom/arialyy/aria/core/task/DownloadTask;->getKey()Ljava/lang/String;

    move-result-object v1

    .line 77
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v0, "DownloadTaskQueue"

    const-string v1, "\u8bbe\u7f6e\u6700\u9ad8\u4f18\u5148\u7ea7\u4efb\u52a1\u5931\u8d25\uff0c\u5931\u8d25\u539f\u56e0\u3010\u4efb\u52a1\u4e2d\u5df2\u7ecf\u6709\u6700\u9ad8\u4f18\u5148\u7ea7\u4efb\u52a1\uff0c\u8bf7\u7b49\u5f85\u4e0a\u4e00\u4e2a\u6700\u9ad8\u4f18\u5148\u7ea7\u4efb\u52a1\u5b8c\u6210\uff0c\u6216\u624b\u52a8\u6682\u505c\u8be5\u4efb\u52a1\u3011"

    .line 78
    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    invoke-virtual {p1, v2}, Lcom/arialyy/aria/core/task/DownloadTask;->setHighestPriority(Z)V

    return-void

    .line 83
    :cond_1
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getDConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/DownloadConfig;->getMaxTaskNum()I

    move-result v0

    .line 84
    iget-object v1, p0, Lcom/arialyy/aria/core/queue/DTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->size()I

    move-result v1

    if-eqz v1, :cond_6

    if-ge v1, v0, :cond_2

    goto :goto_3

    .line 88
    :cond_2
    new-instance v1, Ljava/util/LinkedHashSet;

    invoke-direct {v1}, Ljava/util/LinkedHashSet;-><init>()V

    :goto_0
    if-ge v2, v0, :cond_5

    .line 90
    iget-object v3, p0, Lcom/arialyy/aria/core/queue/DTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->pollTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v3

    check-cast v3, Lcom/arialyy/aria/core/task/DownloadTask;

    if-eqz v3, :cond_4

    .line 91
    invoke-virtual {v3}, Lcom/arialyy/aria/core/task/DownloadTask;->isRunning()Z

    move-result v4

    if-eqz v4, :cond_4

    add-int/lit8 v4, v0, -0x1

    if-ne v2, v4, :cond_3

    const/4 v0, 0x3

    .line 93
    invoke-virtual {v3, v0}, Lcom/arialyy/aria/core/task/DownloadTask;->stop(I)V

    .line 94
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/DTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {v0, v3}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->putTaskToFirst(Lcom/arialyy/aria/core/task/AbsTask;)Z

    goto :goto_1

    .line 97
    :cond_3
    invoke-interface {v1, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 100
    :cond_5
    :goto_1
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/DTaskQueue;->startTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    .line 102
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/task/DownloadTask;

    .line 103
    iget-object v1, p0, Lcom/arialyy/aria/core/queue/DTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v1, v0}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->putTask(Lcom/arialyy/aria/core/task/AbsTask;)Z

    goto :goto_2

    .line 86
    :cond_6
    :goto_3
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/DTaskQueue;->startTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    :cond_7
    return-void
.end method

.method public bridge synthetic stopTask(Lcom/arialyy/aria/core/task/AbsTask;)V
    .locals 0

    .line 37
    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/DTaskQueue;->stopTask(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method

.method public stopTask(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 1

    const/4 v0, 0x0

    .line 124
    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/task/DownloadTask;->setHighestPriority(Z)V

    .line 125
    invoke-super {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->stopTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    return-void
.end method

.method public bridge synthetic stopTask(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    .line 37
    check-cast p1, Lcom/arialyy/aria/core/task/DownloadTask;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/DTaskQueue;->stopTask(Lcom/arialyy/aria/core/task/DownloadTask;)V

    return-void
.end method
