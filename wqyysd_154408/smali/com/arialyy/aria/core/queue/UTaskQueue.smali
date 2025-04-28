.class public Lcom/arialyy/aria/core/queue/UTaskQueue;
.super Lcom/arialyy/aria/core/queue/AbsTaskQueue;
.source "UTaskQueue.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/arialyy/aria/core/queue/AbsTaskQueue<",
        "Lcom/arialyy/aria/core/task/UploadTask;",
        "Lcom/arialyy/aria/core/upload/UTaskWrapper;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile INSTANCE:Lcom/arialyy/aria/core/queue/UTaskQueue; = null

.field private static final TAG:Ljava/lang/String; = "UploadTaskQueue"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;-><init>()V

    return-void
.end method

.method public static getInstance()Lcom/arialyy/aria/core/queue/UTaskQueue;
    .locals 3

    .line 37
    sget-object v0, Lcom/arialyy/aria/core/queue/UTaskQueue;->INSTANCE:Lcom/arialyy/aria/core/queue/UTaskQueue;

    if-nez v0, :cond_0

    .line 38
    const-class v0, Lcom/arialyy/aria/core/queue/UTaskQueue;

    monitor-enter v0

    .line 39
    :try_start_0
    new-instance v1, Lcom/arialyy/aria/core/queue/UTaskQueue;

    invoke-direct {v1}, Lcom/arialyy/aria/core/queue/UTaskQueue;-><init>()V

    sput-object v1, Lcom/arialyy/aria/core/queue/UTaskQueue;->INSTANCE:Lcom/arialyy/aria/core/queue/UTaskQueue;

    .line 40
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object v1

    sget-object v2, Lcom/arialyy/aria/core/queue/UTaskQueue;->INSTANCE:Lcom/arialyy/aria/core/queue/UTaskQueue;

    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/event/EventMsgUtil;->register(Ljava/lang/Object;)V

    .line 41
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 43
    :cond_0
    :goto_0
    sget-object v0, Lcom/arialyy/aria/core/queue/UTaskQueue;->INSTANCE:Lcom/arialyy/aria/core/queue/UTaskQueue;

    return-object v0
.end method


# virtual methods
.method public bridge synthetic createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/AbsTask;
    .locals 0

    .line 32
    check-cast p1, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/UTaskQueue;->createTask(Lcom/arialyy/aria/core/upload/UTaskWrapper;)Lcom/arialyy/aria/core/task/UploadTask;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/ITask;
    .locals 0

    .line 32
    check-cast p1, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/UTaskQueue;->createTask(Lcom/arialyy/aria/core/upload/UTaskWrapper;)Lcom/arialyy/aria/core/task/UploadTask;

    move-result-object p1

    return-object p1
.end method

.method public createTask(Lcom/arialyy/aria/core/upload/UTaskWrapper;)Lcom/arialyy/aria/core/task/UploadTask;
    .locals 2

    .line 67
    invoke-super {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/AbsTask;

    .line 69
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/UTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/upload/UTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->taskExits(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/arialyy/aria/core/queue/UTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/upload/UTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->taskExits(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 70
    invoke-static {}, Lcom/arialyy/aria/core/queue/TaskFactory;->getInstance()Lcom/arialyy/aria/core/queue/TaskFactory;

    move-result-object v0

    .line 71
    invoke-static {}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->getInstance()Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

    move-result-object v1

    invoke-virtual {v0, p1, v1}, Lcom/arialyy/aria/core/queue/TaskFactory;->createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/listener/ISchedulers;)Lcom/arialyy/aria/core/task/ITask;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/task/UploadTask;

    .line 72
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/UTaskQueue;->addTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    goto :goto_0

    :cond_0
    const-string p1, "UploadTaskQueue"

    const-string v0, "\u4efb\u52a1\u5df2\u5b58\u5728"

    .line 74
    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    :goto_0
    return-object p1
.end method

.method public getMaxTaskNum()I
    .locals 1

    .line 63
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getUConfig()Lcom/arialyy/aria/core/config/UploadConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/UploadConfig;->getMaxTaskNum()I

    move-result v0

    return v0
.end method

.method public getOldMaxNum()I
    .locals 1

    .line 59
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getUConfig()Lcom/arialyy/aria/core/config/UploadConfig;

    move-result-object v0

    iget v0, v0, Lcom/arialyy/aria/core/config/UploadConfig;->oldMaxTaskNum:I

    return v0
.end method

.method getQueueType()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method public maxTaskNum(Lcom/arialyy/aria/core/event/UMaxNumEvent;)V
    .locals 0
    .annotation runtime Lcom/arialyy/aria/core/event/Event;
    .end annotation

    .line 51
    iget p1, p1, Lcom/arialyy/aria/core/event/UMaxNumEvent;->maxNum:I

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/UTaskQueue;->setMaxTaskNum(I)V

    return-void
.end method
