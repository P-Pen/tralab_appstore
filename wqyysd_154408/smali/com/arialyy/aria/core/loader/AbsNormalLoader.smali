.class public abstract Lcom/arialyy/aria/core/loader/AbsNormalLoader;
.super Ljava/lang/Object;
.source "AbsNormalLoader.java"

# interfaces
.implements Lcom/arialyy/aria/core/loader/ILoaderVisitor;
.implements Lcom/arialyy/aria/core/loader/ILoader;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/arialyy/aria/core/loader/ILoaderVisitor;",
        "Lcom/arialyy/aria/core/loader/ILoader;"
    }
.end annotation


# instance fields
.field protected final TAG:Ljava/lang/String;

.field protected isCancel:Z

.field private isRuning:Z

.field protected isStop:Z

.field protected mInfoTask:Lcom/arialyy/aria/core/loader/IInfoTask;

.field private mListener:Lcom/arialyy/aria/core/listener/IEventListener;

.field protected mRecord:Lcom/arialyy/aria/core/TaskRecord;

.field protected mRecordHandler:Lcom/arialyy/aria/core/loader/IRecordHandler;

.field protected mStateManager:Lcom/arialyy/aria/core/inf/IThreadStateManager;

.field protected mTTBuilder:Lcom/arialyy/aria/core/loader/IThreadTaskBuilder;

.field private mTask:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/task/IThreadTask;",
            ">;"
        }
    .end annotation
.end field

.field protected mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field protected mTempFile:Ljava/io/File;

.field private mTimer:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

.field private mUpdateInterval:J


# direct methods
.method protected constructor <init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/listener/IEventListener;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/arialyy/aria/core/listener/IEventListener;",
            ")V"
        }
    .end annotation

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->TAG:Ljava/lang/String;

    .line 49
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTask:Ljava/util/List;

    const-wide/16 v0, 0x3e8

    .line 55
    iput-wide v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mUpdateInterval:J

    const/4 v0, 0x0

    .line 57
    iput-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isCancel:Z

    iput-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isStop:Z

    .line 58
    iput-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isRuning:Z

    .line 66
    iput-object p2, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    .line 67
    iput-object p1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    return-void
.end method

.method static synthetic access$000(Lcom/arialyy/aria/core/loader/AbsNormalLoader;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->closeTimer()V

    return-void
.end method

.method static synthetic access$100(Lcom/arialyy/aria/core/loader/AbsNormalLoader;)Lcom/arialyy/aria/core/listener/IEventListener;
    .locals 0

    .line 43
    iget-object p0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    return-object p0
.end method

.method private declared-synchronized closeTimer()V
    .locals 1

    monitor-enter p0

    .line 198
    :try_start_0
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTimer:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->isShutdown()Z

    move-result v0

    if-nez v0, :cond_0

    .line 199
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTimer:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->shutdown()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 201
    :cond_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private resetState()V
    .locals 2

    .line 100
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->closeTimer()V

    .line 101
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTask:Ljava/util/List;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    .line 102
    :goto_0
    iget-object v1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTask:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 103
    iget-object v1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTask:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/task/IThreadTask;

    invoke-interface {v1}, Lcom/arialyy/aria/core/task/IThreadTask;->breakTask()V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 105
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTask:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    :cond_1
    return-void
.end method

.method private startFlow()V
    .locals 2

    .line 122
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isBreak()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 125
    :cond_0
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 126
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    .line 127
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-eq v0, v1, :cond_1

    const/4 v1, 0x1

    .line 130
    iput-boolean v1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isRuning:Z

    .line 131
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->resetState()V

    .line 132
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->onPostPre()V

    .line 133
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->handleTask(Landroid/os/Looper;)V

    .line 134
    invoke-static {}, Landroid/os/Looper;->loop()V

    return-void

    .line 128
    :cond_1
    new-instance v0, Ljava/lang/IllegalThreadStateException;

    const-string v1, "\u4e0d\u80fd\u5728\u4e3b\u7ebf\u7a0b\u7a0b\u5e8f\u4e2d\u8c03\u7528Loader"

    invoke-direct {v0, v1}, Ljava/lang/IllegalThreadStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method public final declared-synchronized cancel()V
    .locals 5

    monitor-enter p0

    .line 228
    :try_start_0
    iget-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isCancel:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_0

    .line 229
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->TAG:Ljava/lang/String;

    const-string v3, "\u4efb\u52a1\u3010%s\u3011\u6b63\u5728\u5220\u9664\uff0c\u5220\u9664\u4efb\u52a1\u5931\u8d25"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v4}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v1

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 230
    monitor-exit p0

    return-void

    .line 232
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->closeTimer()V

    .line 233
    iput-boolean v2, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isCancel:Z

    .line 234
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->onCancel()V

    .line 235
    :goto_0
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTask:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-ge v1, v0, :cond_2

    .line 236
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTask:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/task/IThreadTask;

    if-eqz v0, :cond_1

    .line 237
    invoke-interface {v0}, Lcom/arialyy/aria/core/task/IThreadTask;->isThreadComplete()Z

    move-result v2

    if-nez v2, :cond_1

    .line 238
    invoke-interface {v0}, Lcom/arialyy/aria/core/task/IThreadTask;->cancel()V

    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 241
    :cond_2
    invoke-static {}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->getInstance()Lcom/arialyy/aria/core/manager/ThreadTaskManager;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->removeTaskThread(Ljava/lang/String;)V

    .line 242
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->onPostCancel()V

    .line 243
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->onDestroy()V

    .line 244
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    invoke-interface {v0}, Lcom/arialyy/aria/core/listener/IEventListener;->onCancel()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 245
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected checkComponent()V
    .locals 2

    .line 321
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mRecordHandler:Lcom/arialyy/aria/core/loader/IRecordHandler;

    const-string v1, "\u4efb\u52a1\u8bb0\u5f55\u7ec4\u4ef6\u4e3a\u7a7a"

    .line 322
    invoke-static {v0, v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 324
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mInfoTask:Lcom/arialyy/aria/core/loader/IInfoTask;

    const-string v1, "\u6587\u4ef6\u4fe1\u606f\u7ec4\u4ef6\u4e3a\u7a7a"

    .line 325
    invoke-static {v0, v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 327
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mStateManager:Lcom/arialyy/aria/core/inf/IThreadStateManager;

    const-string v1, "\u4efb\u52a1\u72b6\u6001\u7ba1\u7406\u7ec4\u4ef6\u4e3a\u7a7a"

    .line 328
    invoke-static {v0, v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 330
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTTBuilder:Lcom/arialyy/aria/core/loader/IThreadTaskBuilder;

    const-string v1, "\u7ebf\u7a0b\u4efb\u52a1\u7ec4\u4ef6\u4e3a\u7a7a"

    .line 331
    invoke-static {v0, v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    return-void
.end method

.method protected delayTimer()J
    .locals 2

    const-wide/16 v0, 0x3e8

    return-wide v0
.end method

.method public abstract getFileSize()J
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected getListener()Lcom/arialyy/aria/core/listener/IEventListener;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    return-object v0
.end method

.method protected getStateManager()Lcom/arialyy/aria/core/inf/IThreadStateManager;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mStateManager:Lcom/arialyy/aria/core/inf/IThreadStateManager;

    return-object v0
.end method

.method public getTaskList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/task/IThreadTask;",
            ">;"
        }
    .end annotation

    .line 93
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTask:Ljava/util/List;

    return-object v0
.end method

.method protected abstract handleTask(Landroid/os/Looper;)V
.end method

.method public isBreak()Z
    .locals 5

    .line 308
    iget-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isCancel:Z

    const/4 v1, 0x0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isStop:Z

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    return v1

    .line 310
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "isCancel = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isCancel:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v3, ", isStop = "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v3, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isStop:Z

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->TAG:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v4}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    const-string v1, "\u4efb\u52a1\u3010%s\u3011\u5df2\u505c\u6b62\u6216\u53d6\u6d88\u4e86"

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v2
.end method

.method public declared-synchronized isRunning()Z
    .locals 2

    monitor-enter p0

    .line 222
    :try_start_0
    invoke-static {}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->getInstance()Lcom/arialyy/aria/core/manager/ThreadTaskManager;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->taskIsRunning(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 224
    iget-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isRuning:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method protected onCancel()V
    .locals 0

    return-void
.end method

.method public onDestroy()V
    .locals 1

    const/4 v0, 0x0

    .line 204
    iput-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isRuning:Z

    return-void
.end method

.method protected onPostCancel()V
    .locals 0

    return-void
.end method

.method protected onPostPre()V
    .locals 0

    return-void
.end method

.method protected onPostStop()V
    .locals 0

    return-void
.end method

.method protected onStop()V
    .locals 0

    return-void
.end method

.method public retryTask()V
    .locals 4

    .line 298
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->TAG:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v2, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "\u4efb\u52a1\u3010%s\u3011\u5f00\u59cb\u91cd\u8bd5"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 299
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->startFlow()V

    return-void
.end method

.method public run()V
    .locals 4

    .line 110
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->checkComponent()V

    .line 111
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 112
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->TAG:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "\u4efb\u52a1\u3010%s\u3011\u6b63\u5728\u6267\u884c\uff0c\u542f\u52a8\u4efb\u52a1\u5931\u8d25"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 115
    :cond_0
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->startFlow()V

    return-void
.end method

.method protected setUpdateInterval(J)V
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    .line 214
    iget-object p1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->TAG:Ljava/lang/String;

    const-string p2, "\u66f4\u65b0\u95f4\u9694\u4e0d\u80fd\u5c0f\u4e8e0\uff0c\u9ed8\u8ba4\u4e3a1000\u6beb\u79d2"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 217
    :cond_0
    iput-wide p1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mUpdateInterval:J

    return-void
.end method

.method protected declared-synchronized startTimer()V
    .locals 12

    monitor-enter p0

    .line 155
    :try_start_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isBreak()Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 156
    monitor-exit p0

    return-void

    .line 158
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->TAG:Ljava/lang/String;

    const-string v1, "\u542f\u52a8\u5b9a\u65f6\u5668\uff0cdelayTimer = %s, updateInterval = %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->delayTimer()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v2, v3

    iget-wide v3, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mUpdateInterval:J

    .line 159
    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x1

    aput-object v3, v2, v4

    .line 158
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 160
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->closeTimer()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 162
    :try_start_2
    new-instance v5, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-direct {v5, v4}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(I)V

    iput-object v5, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTimer:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 163
    new-instance v6, Lcom/arialyy/aria/core/loader/AbsNormalLoader$1;

    invoke-direct {v6, p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader$1;-><init>(Lcom/arialyy/aria/core/loader/AbsNormalLoader;)V

    .line 190
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->delayTimer()J

    move-result-wide v7

    iget-wide v9, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mUpdateInterval:J

    sget-object v11, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 163
    invoke-virtual/range {v5 .. v11}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 192
    :try_start_3
    iget-object v1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->TAG:Ljava/lang/String;

    const-string v2, "\u542f\u52a8\u5b9a\u65f6\u5668\u5931\u8d25"

    invoke-static {v1, v2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 195
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public final declared-synchronized stop()V
    .locals 3

    monitor-enter p0

    .line 262
    :try_start_0
    iget-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isStop:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 263
    monitor-exit p0

    return-void

    .line 265
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->closeTimer()V

    const/4 v0, 0x1

    .line 266
    iput-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isStop:Z

    .line 267
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->onStop()V

    const/4 v0, 0x0

    .line 268
    :goto_0
    iget-object v1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTask:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_2

    .line 269
    iget-object v1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTask:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/task/IThreadTask;

    if-eqz v1, :cond_1

    .line 270
    invoke-interface {v1}, Lcom/arialyy/aria/core/task/IThreadTask;->isThreadComplete()Z

    move-result v2

    if-nez v2, :cond_1

    .line 271
    invoke-interface {v1}, Lcom/arialyy/aria/core/task/IThreadTask;->stop()V

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 274
    :cond_2
    invoke-static {}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->getInstance()Lcom/arialyy/aria/core/manager/ThreadTaskManager;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->removeTaskThread(Ljava/lang/String;)V

    .line 275
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->onPostStop()V

    .line 276
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->onDestroy()V

    .line 277
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->getCurrentProgress()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/arialyy/aria/core/listener/IEventListener;->onStop(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 278
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method
