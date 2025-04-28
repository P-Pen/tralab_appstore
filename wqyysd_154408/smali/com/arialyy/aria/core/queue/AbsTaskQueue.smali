.class public abstract Lcom/arialyy/aria/core/queue/AbsTaskQueue;
.super Ljava/lang/Object;
.source "AbsTaskQueue.java"

# interfaces
.implements Lcom/arialyy/aria/core/queue/ITaskQueue;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TASK:",
        "Lcom/arialyy/aria/core/task/AbsTask;",
        "TASK_WRAPPER:",
        "Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/arialyy/aria/core/queue/ITaskQueue<",
        "TTASK;TTASK_WRAPPER;>;"
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field final TYPE_DG_QUEUE:I

.field final TYPE_D_QUEUE:I

.field final TYPE_U_QUEUE:I

.field mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/arialyy/aria/core/queue/pool/BaseCachePool<",
            "TTASK;>;"
        }
    .end annotation
.end field

.field mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/arialyy/aria/core/queue/pool/BaseExecutePool<",
            "TTASK;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 4

    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x1

    .line 46
    iput v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TYPE_D_QUEUE:I

    const/4 v1, 0x2

    .line 47
    iput v1, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TYPE_DG_QUEUE:I

    const/4 v2, 0x3

    .line 48
    iput v2, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TYPE_U_QUEUE:I

    .line 50
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    iput-object v3, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    .line 55
    invoke-virtual {p0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getQueueType()I

    move-result v3

    if-eq v3, v0, :cond_2

    if-eq v3, v1, :cond_1

    if-eq v3, v2, :cond_0

    goto :goto_0

    .line 65
    :cond_0
    invoke-static {}, Lcom/arialyy/aria/core/queue/pool/UploadSharePool;->getInstance()Lcom/arialyy/aria/core/queue/pool/UploadSharePool;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/queue/pool/UploadSharePool;->cachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    iput-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    .line 66
    invoke-static {}, Lcom/arialyy/aria/core/queue/pool/UploadSharePool;->getInstance()Lcom/arialyy/aria/core/queue/pool/UploadSharePool;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/queue/pool/UploadSharePool;->executePool:Lcom/arialyy/aria/core/queue/pool/UploadExecutePool;

    iput-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    goto :goto_0

    .line 61
    :cond_1
    invoke-static {}, Lcom/arialyy/aria/core/queue/pool/DGLoadSharePool;->getInstance()Lcom/arialyy/aria/core/queue/pool/DGLoadSharePool;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/queue/pool/DGLoadSharePool;->cachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    iput-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    .line 62
    invoke-static {}, Lcom/arialyy/aria/core/queue/pool/DGLoadSharePool;->getInstance()Lcom/arialyy/aria/core/queue/pool/DGLoadSharePool;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/queue/pool/DGLoadSharePool;->executePool:Lcom/arialyy/aria/core/queue/pool/DGLoadExecutePool;

    iput-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    goto :goto_0

    .line 57
    :cond_2
    invoke-static {}, Lcom/arialyy/aria/core/queue/pool/DLoadSharePool;->getInstance()Lcom/arialyy/aria/core/queue/pool/DLoadSharePool;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/queue/pool/DLoadSharePool;->cachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    iput-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    .line 58
    invoke-static {}, Lcom/arialyy/aria/core/queue/pool/DLoadSharePool;->getInstance()Lcom/arialyy/aria/core/queue/pool/DLoadSharePool;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/queue/pool/DLoadSharePool;->executePool:Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;

    iput-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    :goto_0
    return-void
.end method


# virtual methods
.method addTask(Lcom/arialyy/aria/core/task/AbsTask;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 248
    iget-object p1, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    const-string v0, "add task fail, task is null"

    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 251
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->taskExits(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 252
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->putTask(Lcom/arialyy/aria/core/task/AbsTask;)Z

    :cond_1
    return-void
.end method

.method public cancelTask(Lcom/arialyy/aria/core/task/AbsTask;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 361
    invoke-virtual {p0, p1, v0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->cancelTask(Lcom/arialyy/aria/core/task/AbsTask;I)V

    return-void
.end method

.method public cancelTask(Lcom/arialyy/aria/core/task/AbsTask;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK;I)V"
        }
    .end annotation

    .line 365
    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/task/AbsTask;->cancel(I)V

    return-void
.end method

.method public bridge synthetic cancelTask(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    .line 44
    check-cast p1, Lcom/arialyy/aria/core/task/AbsTask;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->cancelTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    return-void
.end method

.method public bridge synthetic cancelTask(Lcom/arialyy/aria/core/task/ITask;I)V
    .locals 0

    .line 44
    check-cast p1, Lcom/arialyy/aria/core/task/AbsTask;

    invoke-virtual {p0, p1, p2}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->cancelTask(Lcom/arialyy/aria/core/task/AbsTask;I)V

    return-void
.end method

.method public createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/AbsTask;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK_WRAPPER;)TTASK;"
        }
    .end annotation

    .line 224
    invoke-static {}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getInstance()Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->putTaskWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    const/4 p1, 0x0

    return-object p1
.end method

.method public bridge synthetic createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/ITask;
    .locals 0

    .line 44
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object p1

    return-object p1
.end method

.method public getCachePool()Lcom/arialyy/aria/core/queue/pool/BaseCachePool;
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    return-object v0
.end method

.method public getCurrentCachePoolNum()I
    .locals 1

    .line 184
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->size()I

    move-result v0

    return v0
.end method

.method public getCurrentExePoolNum()I
    .locals 1

    .line 193
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->size()I

    move-result v0

    return v0
.end method

.method public getExecutePool()Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;
    .locals 1

    .line 168
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    return-object v0
.end method

.method public getNextTask()Lcom/arialyy/aria/core/task/AbsTask;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TTASK;"
        }
    .end annotation

    .line 369
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->pollTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic getNextTask()Lcom/arialyy/aria/core/task/ITask;
    .locals 1

    .line 44
    invoke-virtual {p0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getNextTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    return-object v0
.end method

.method public abstract getOldMaxNum()I
.end method

.method abstract getQueueType()I
.end method

.method public getRunningTask(Ljava/lang/Class;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/core/common/AbsEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 79
    iget-object p1, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->getAllTask()Ljava/util/List;

    move-result-object p1

    .line 80
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->getAllTask()Ljava/util/List;

    move-result-object v0

    .line 81
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    if-eqz p1, :cond_0

    .line 82
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 83
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/task/AbsTask;

    .line 84
    invoke-virtual {v2}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    if-eqz v0, :cond_1

    .line 87
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1

    .line 88
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/task/AbsTask;

    .line 89
    invoke-virtual {v0}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 92
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 v1, 0x0

    :cond_2
    return-object v1
.end method

.method public getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TTASK;"
        }
    .end annotation

    .line 233
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    if-nez v0, :cond_0

    .line 235
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    .line 237
    :cond_0
    iget-object v1, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u83b7\u53d6\u4efb\u52a1\uff0ckey\uff1a"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p1}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method public bridge synthetic getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/ITask;
    .locals 0

    .line 44
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object p1

    return-object p1
.end method

.method public reTryStart(Lcom/arialyy/aria/core/task/AbsTask;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 332
    iget-object p1, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    const-string v0, "reTry fail, task is null"

    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 336
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getState()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    goto :goto_0

    .line 352
    :pswitch_0
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskName()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v1

    const-string p1, "\u4efb\u52a1\u3010%s\u3011\u91cd\u8bd5\u5931\u8d25\uff0c\u539f\u56e0\uff1a\u4efb\u52a1\u5df2\u5220\u9664"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 341
    :pswitch_1
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    const-string v1, "\u4efb\u52a1\u3010%s\u3011\u6ca1\u6709\u505c\u6b62\uff0c\u5373\u5c06\u91cd\u65b0\u4e0b\u8f7d"

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x2

    .line 342
    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/task/AbsTask;->stop(I)V

    .line 343
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->start()V

    goto :goto_0

    .line 355
    :pswitch_2
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskName()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v2, v1

    const-string p1, "\u4efb\u52a1\u3010%s\u3011\u91cd\u8bd5\u5931\u8d25\uff0c\u539f\u56e0\uff1a\u5df2\u5b8c\u6210"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 349
    :pswitch_3
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->start()V

    :goto_0
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_3
        :pswitch_3
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic reTryStart(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    .line 44
    check-cast p1, Lcom/arialyy/aria/core/task/AbsTask;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->reTryStart(Lcom/arialyy/aria/core/task/AbsTask;)V

    return-void
.end method

.method public removeTaskFormQueue(Ljava/lang/String;)V
    .locals 9

    .line 318
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    const-string v1, "\u6210\u529f"

    const-string v2, "\u5931\u8d25"

    const/4 v3, 0x1

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-eqz v0, :cond_1

    .line 320
    iget-object v6, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    new-array v7, v5, [Ljava/lang/Object;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskName()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v4

    iget-object v8, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    .line 321
    invoke-virtual {v8, v0}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->removeTask(Lcom/arialyy/aria/core/task/AbsTask;)Z

    move-result v0

    if-eqz v0, :cond_0

    move-object v0, v1

    goto :goto_0

    :cond_0
    move-object v0, v2

    :goto_0
    aput-object v0, v7, v3

    const-string v0, "\u4ece\u6267\u884c\u6c60\u5220\u9664\u4efb\u52a1\u3010%s\u3011%s"

    .line 320
    invoke-static {v0, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v6, v0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 323
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 325
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v4

    iget-object v4, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    .line 326
    invoke-virtual {v4, p1}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->removeTask(Lcom/arialyy/aria/core/task/AbsTask;)Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_1

    :cond_2
    move-object v1, v2

    :goto_1
    aput-object v1, v5, v3

    const-string p1, "\u4ece\u7f13\u5b58\u6c60\u5220\u9664\u4efb\u52a1\u3010%s\u3011%s"

    .line 325
    invoke-static {p1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    return-void
.end method

.method public resumeTask(Lcom/arialyy/aria/core/task/AbsTask;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 114
    iget-object p1, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    const-string v0, "resume task fail, task is null"

    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 117
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->taskExits(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 118
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getKey()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    const-string p1, "task\u3010%s\u3011running"

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 121
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->size()I

    move-result v0

    invoke-virtual {p0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getMaxTaskNum()I

    move-result v1

    if-lt v0, v1, :cond_2

    .line 122
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/common/AbsEntity;->setState(I)V

    .line 123
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->putTaskToFirst(Lcom/arialyy/aria/core/task/AbsTask;)Z

    .line 124
    iget-object p1, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->pollTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->stopTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    goto :goto_0

    .line 126
    :cond_2
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->startTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    :goto_0
    return-void
.end method

.method public bridge synthetic resumeTask(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    .line 44
    check-cast p1, Lcom/arialyy/aria/core/task/AbsTask;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->resumeTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    return-void
.end method

.method public setMaxTaskNum(I)V
    .locals 5

    .line 197
    invoke-virtual {p0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getOldMaxNum()I

    move-result v0

    sub-int v1, p1, v0

    if-ne v0, p1, :cond_0

    .line 200
    iget-object p1, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    const-string v0, "\u8bbe\u7f6e\u7684\u4e0b\u8f7d\u4efb\u52a1\u6570\u548c\u914d\u7f6e\u6587\u4ef6\u7684\u4e0b\u8f7d\u4efb\u52a1\u6570\u4e00\u76f4\uff0c\u8df3\u8fc7"

    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v2, -0x1

    const/4 v3, 0x0

    if-gt v1, v2, :cond_2

    .line 204
    iget-object v2, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->size()I

    move-result v2

    if-lt v2, v0, :cond_2

    .line 205
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v0

    move v2, v3

    :goto_0
    if-ge v2, v0, :cond_2

    .line 206
    iget-object v4, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v4}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->pollTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v4

    if-eqz v4, :cond_1

    .line 208
    invoke-virtual {p0, v4}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->stopTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 212
    :cond_2
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->setMaxNum(I)V

    const/4 p1, 0x1

    if-lt v1, p1, :cond_4

    :goto_1
    if-ge v3, v1, :cond_4

    .line 215
    invoke-virtual {p0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getNextTask()Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 216
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getState()I

    move-result v0

    const/4 v2, 0x3

    if-ne v0, v2, :cond_3

    .line 217
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->startTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    :cond_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    :cond_4
    return-void
.end method

.method public startTask(Lcom/arialyy/aria/core/task/AbsTask;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK;)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 257
    invoke-virtual {p0, p1, v0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->startTask(Lcom/arialyy/aria/core/task/AbsTask;I)V

    return-void
.end method

.method public startTask(Lcom/arialyy/aria/core/task/AbsTask;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK;I)V"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 262
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    const-string v1, "create fail, task is null"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 264
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->taskExits(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 265
    iget-object p2, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getKey()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v1

    const-string p1, "\u4efb\u52a1\u3010%s\u3011\u6267\u884c\u4e2d"

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 268
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u6dfb\u52a0\u4efb\u52a1\uff0ckey\uff1a"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 269
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->removeTask(Lcom/arialyy/aria/core/task/AbsTask;)Z

    .line 270
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->putTask(Lcom/arialyy/aria/core/task/AbsTask;)Z

    .line 271
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/common/AbsEntity;->setFailNum(I)V

    .line 272
    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/task/AbsTask;->start(I)V

    return-void
.end method

.method public bridge synthetic startTask(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    .line 44
    check-cast p1, Lcom/arialyy/aria/core/task/AbsTask;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->startTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    return-void
.end method

.method public bridge synthetic startTask(Lcom/arialyy/aria/core/task/ITask;I)V
    .locals 0

    .line 44
    check-cast p1, Lcom/arialyy/aria/core/task/AbsTask;

    invoke-virtual {p0, p1, p2}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->startTask(Lcom/arialyy/aria/core/task/AbsTask;I)V

    return-void
.end method

.method public stopAllTask()V
    .locals 5

    .line 134
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->getAllTask()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x2

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/task/AbsTask;

    if-eqz v1, :cond_0

    .line 136
    invoke-virtual {v1}, Lcom/arialyy/aria/core/task/AbsTask;->getState()I

    move-result v3

    .line 137
    invoke-virtual {v1}, Lcom/arialyy/aria/core/task/AbsTask;->isRunning()Z

    move-result v4

    if-nez v4, :cond_1

    const/4 v4, 0x1

    if-eq v3, v4, :cond_0

    const/4 v4, 0x7

    if-eq v3, v4, :cond_0

    .line 139
    :cond_1
    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/task/AbsTask;->stop(I)V

    goto :goto_0

    .line 150
    :cond_2
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->getAllTask()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/task/AbsTask;

    if-eqz v1, :cond_3

    .line 152
    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/task/AbsTask;->stop(I)V

    goto :goto_1

    .line 155
    :cond_4
    invoke-static {}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->getInstance()Lcom/arialyy/aria/core/manager/ThreadTaskManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->removeAllThreadTask()V

    .line 156
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->clear()V

    return-void
.end method

.method public stopTask(Lcom/arialyy/aria/core/task/AbsTask;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 277
    iget-object p1, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    const-string v0, "stop fail, task is null"

    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 280
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getState()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    packed-switch v0, :pswitch_data_0

    goto/16 :goto_1

    .line 305
    :pswitch_0
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    const-string v3, "\u505c\u6b62\u4efb\u52a1\u3010%s\u3011\u5931\u8d25\uff0c\u539f\u56e0\uff1a\u4efb\u52a1\u5df2\u5220\u9664"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 290
    :pswitch_1
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->removeTask(Lcom/arialyy/aria/core/task/AbsTask;)Z

    goto :goto_0

    .line 284
    :pswitch_2
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mCachePool:Lcom/arialyy/aria/core/queue/pool/BaseCachePool;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseCachePool;->removeTask(Lcom/arialyy/aria/core/task/AbsTask;)Z

    :goto_0
    move v1, v2

    goto :goto_1

    .line 308
    :pswitch_3
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    const-string v3, "\u505c\u6b62\u4efb\u52a1\u3010%s\u3011\u5931\u8d25\uff0c\u539f\u56e0\uff1a\u5df2\u5b8c\u6210"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 296
    :pswitch_4
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v1

    const-string v3, "\u505c\u6b62\u4efb\u52a1\u3010%s\u3011\u5931\u8d25\uff0c\u539f\u56e0\uff1a\u5df2\u505c\u6b62"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 297
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->taskIsRunning(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 298
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->removeTaskFormQueue(Ljava/lang/String;)V

    .line 299
    invoke-static {}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->getInstance()Lcom/arialyy/aria/core/manager/ThreadTaskManager;

    move-result-object v0

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->taskIsRunning(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 300
    invoke-static {}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->getInstance()Lcom/arialyy/aria/core/manager/ThreadTaskManager;

    move-result-object v0

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->removeTaskThread(Ljava/lang/String;)V

    :cond_1
    :goto_1
    if-eqz v1, :cond_2

    .line 313
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->stop()V

    :cond_2
    return-void

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_4
        :pswitch_4
        :pswitch_3
        :pswitch_4
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic stopTask(Lcom/arialyy/aria/core/task/ITask;)V
    .locals 0

    .line 44
    check-cast p1, Lcom/arialyy/aria/core/task/AbsTask;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->stopTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    return-void
.end method

.method public taskExists(Ljava/lang/String;)Z
    .locals 0

    .line 229
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method public taskIsRunning(Ljava/lang/String;)Z
    .locals 3

    .line 96
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 97
    iget-object p1, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->TAG:Ljava/lang/String;

    const-string v0, "key\u4e3a\u7a7a\uff0c\u65e0\u6cd5\u786e\u8ba4\u4efb\u52a1\u662f\u5426\u6267\u884c"

    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 100
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->mExecutePool:Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    if-nez v0, :cond_1

    .line 101
    invoke-static {}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->getInstance()Lcom/arialyy/aria/core/manager/ThreadTaskManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->taskIsRunning(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 102
    invoke-static {}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->getInstance()Lcom/arialyy/aria/core/manager/ThreadTaskManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->removeTaskThread(Ljava/lang/String;)V

    :cond_1
    if-eqz v0, :cond_2

    .line 104
    invoke-virtual {v0}, Lcom/arialyy/aria/core/task/AbsTask;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->taskExists(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    const/4 v1, 0x1

    :cond_2
    return v1
.end method
