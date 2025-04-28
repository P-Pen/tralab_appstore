.class public Lcom/arialyy/aria/core/scheduler/TaskSchedulers;
.super Ljava/lang/Object;
.source "TaskSchedulers.java"

# interfaces
.implements Lcom/arialyy/aria/core/listener/ISchedulers;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TASK::",
        "Lcom/arialyy/aria/core/task/ITask;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/arialyy/aria/core/listener/ISchedulers;"
    }
.end annotation


# static fields
.field private static volatile INSTANCE:Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

.field private static mFailureTaskHandler:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

.field private mObservers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Lcom/arialyy/annotations/TaskEnum;",
            "Ljava/lang/Object;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    .line 56
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    .line 60
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    return-void
.end method

.method private createData(IILcom/arialyy/aria/core/common/AbsEntity;)Landroid/content/Intent;
    .locals 3

    .line 504
    new-instance v0, Landroid/content/Intent;

    const-string v1, "ARIA_TASK_INFO_ACTION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 505
    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 506
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    const-string v2, "ARIA_TASK_TYPE"

    .line 507
    invoke-virtual {v1, v2, p2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p2, "ARIA_TASK_STATE"

    .line 508
    invoke-virtual {v1, p2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 509
    invoke-virtual {p3}, Lcom/arialyy/aria/core/common/AbsEntity;->getSpeed()J

    move-result-wide p1

    const-string v2, "ARIA_TASK_SPEED"

    invoke-virtual {v1, v2, p1, p2}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 510
    invoke-virtual {p3}, Lcom/arialyy/aria/core/common/AbsEntity;->getPercent()I

    move-result p1

    const-string p2, "ARIA_TASK_PERCENT"

    invoke-virtual {v1, p2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const-string p1, "ARIA_TASK_ENTITY"

    .line 511
    invoke-virtual {v1, p1, p3}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 512
    invoke-virtual {v0, v1}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    return-object v0
.end method

.method private createListener(Ljava/lang/String;)Lcom/arialyy/aria/core/scheduler/ISchedulerListener;
    .locals 1

    .line 165
    :try_start_0
    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    .line 166
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/scheduler/ISchedulerListener;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/InstantiationException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p1

    .line 172
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/IllegalAccessException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_1
    move-exception p1

    .line 170
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/InstantiationException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    :catch_2
    move-exception p1

    .line 168
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/ClassNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    const/4 p1, 0x0

    :goto_1
    return-object p1
.end method

.method public static getInstance()Lcom/arialyy/aria/core/scheduler/TaskSchedulers;
    .locals 2

    .line 64
    sget-object v0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->INSTANCE:Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

    if-nez v0, :cond_1

    .line 65
    const-class v0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

    monitor-enter v0

    .line 66
    :try_start_0
    sget-object v1, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->INSTANCE:Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

    if-nez v1, :cond_0

    .line 67
    new-instance v1, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

    invoke-direct {v1}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;-><init>()V

    sput-object v1, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->INSTANCE:Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

    .line 68
    sget-object v1, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->INSTANCE:Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

    invoke-static {v1}, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;->init(Lcom/arialyy/aria/core/scheduler/TaskSchedulers;)Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    move-result-object v1

    sput-object v1, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mFailureTaskHandler:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    .line 70
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 72
    :cond_1
    :goto_0
    sget-object v0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->INSTANCE:Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

    return-object v0
.end method

.method private getKey(Ljava/lang/Object;)Ljava/lang/String;
    .locals 2

    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private handleFailTask(Lcom/arialyy/aria/core/queue/ITaskQueue;Lcom/arialyy/aria/core/task/ITask;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/arialyy/aria/core/queue/ITaskQueue;",
            "TTASK;)V"
        }
    .end annotation

    .line 522
    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->isNeedRetry()Z

    move-result v0

    const/4 v1, 0x4

    if-eqz v0, :cond_4

    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->isStop()Z

    move-result v0

    if-nez v0, :cond_4

    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->isCancel()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 529
    :cond_0
    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getReTryNum()I

    move-result v0

    .line 530
    iget-object v2, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/AriaConfig;->getAConfig()Lcom/arialyy/aria/core/config/AppConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/arialyy/aria/core/config/AppConfig;->isNotNetRetry()Z

    move-result v2

    .line 532
    iget-object v3, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Lcom/arialyy/aria/util/NetUtils;->isConnected(Landroid/content/Context;)Z

    move-result v3

    if-nez v3, :cond_1

    if-eqz v2, :cond_2

    .line 533
    :cond_1
    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v2

    invoke-virtual {v2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/arialyy/aria/core/common/AbsEntity;->getFailNum()I

    move-result v2

    if-le v2, v0, :cond_3

    .line 534
    :cond_2
    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/arialyy/aria/core/queue/ITaskQueue;->removeTaskFormQueue(Ljava/lang/String;)V

    .line 535
    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->getSchedulerType()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->startNextTask(Lcom/arialyy/aria/core/queue/ITaskQueue;I)V

    .line 536
    invoke-static {}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getInstance()Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    move-result-object p1

    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->removeTaskWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    .line 537
    invoke-direct {p0, v1, p2}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->normalTaskCallback(ILcom/arialyy/aria/core/task/ITask;)V

    return-void

    .line 541
    :cond_3
    sget-object p1, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mFailureTaskHandler:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;->offer(Lcom/arialyy/aria/core/task/ITask;)V

    return-void

    .line 523
    :cond_4
    :goto_0
    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/arialyy/aria/core/queue/ITaskQueue;->removeTaskFormQueue(Ljava/lang/String;)V

    .line 524
    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->getSchedulerType()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->startNextTask(Lcom/arialyy/aria/core/queue/ITaskQueue;I)V

    .line 525
    invoke-direct {p0, v1, p2}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->normalTaskCallback(ILcom/arialyy/aria/core/task/ITask;)V

    return-void
.end method

.method private handleNormalEvent(Lcom/arialyy/aria/core/task/ITask;I)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK;I)V"
        }
    .end annotation

    .line 306
    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getTaskType()I

    move-result v0

    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->getQueue(I)Lcom/arialyy/aria/core/queue/ITaskQueue;

    move-result-object v0

    const/4 v1, 0x6

    const/4 v2, 0x5

    const/4 v3, 0x4

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eq p2, v4, :cond_4

    if-eq p2, v3, :cond_3

    if-eq p2, v2, :cond_1

    if-eq p2, v1, :cond_0

    goto/16 :goto_0

    .line 330
    :cond_0
    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lcom/arialyy/aria/core/queue/ITaskQueue;->removeTaskFormQueue(Ljava/lang/String;)V

    .line 331
    iget-object v4, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    new-array v6, v6, [Ljava/lang/Object;

    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getTaskName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v5

    const-string v5, "\u4efb\u52a1\u3010%s\u3011\u5904\u7406\u5b8c\u6210"

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getSchedulerType()I

    move-result v4

    invoke-virtual {p0, v0, v4}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->startNextTask(Lcom/arialyy/aria/core/queue/ITaskQueue;I)V

    goto/16 :goto_0

    .line 321
    :cond_1
    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lcom/arialyy/aria/core/queue/ITaskQueue;->removeTaskFormQueue(Ljava/lang/String;)V

    .line 322
    invoke-interface {v0}, Lcom/arialyy/aria/core/queue/ITaskQueue;->getCurrentExePoolNum()I

    move-result v4

    invoke-interface {v0}, Lcom/arialyy/aria/core/queue/ITaskQueue;->getMaxTaskNum()I

    move-result v7

    if-ge v4, v7, :cond_2

    .line 323
    iget-object v4, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    new-array v6, v6, [Ljava/lang/Object;

    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getTaskName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v5

    const-string v5, "\u5220\u9664\u4efb\u52a1\u3010%s\u3011\u6210\u529f\uff0c\u5c1d\u8bd5\u5f00\u59cb\u4e0b\u4e00\u4efb\u52a1"

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 324
    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getSchedulerType()I

    move-result v4

    invoke-virtual {p0, v0, v4}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->startNextTask(Lcom/arialyy/aria/core/queue/ITaskQueue;I)V

    goto :goto_0

    .line 326
    :cond_2
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    new-array v4, v6, [Ljava/lang/Object;

    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getTaskName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const-string v5, "\u5220\u9664\u4efb\u52a1\u3010%s\u3011\u6210\u529f"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 335
    :cond_3
    invoke-direct {p0, v0, p1}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->handleFailTask(Lcom/arialyy/aria/core/queue/ITaskQueue;Lcom/arialyy/aria/core/task/ITask;)V

    goto :goto_0

    .line 309
    :cond_4
    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getState()I

    move-result v7

    if-ne v7, v4, :cond_5

    goto :goto_0

    .line 312
    :cond_5
    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v0, v4}, Lcom/arialyy/aria/core/queue/ITaskQueue;->removeTaskFormQueue(Ljava/lang/String;)V

    .line 313
    invoke-interface {v0}, Lcom/arialyy/aria/core/queue/ITaskQueue;->getCurrentExePoolNum()I

    move-result v4

    invoke-interface {v0}, Lcom/arialyy/aria/core/queue/ITaskQueue;->getMaxTaskNum()I

    move-result v7

    if-ge v4, v7, :cond_6

    .line 314
    iget-object v4, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    new-array v6, v6, [Ljava/lang/Object;

    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getTaskName()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v5

    const-string v5, "\u505c\u6b62\u4efb\u52a1\u3010%s\u3011\u6210\u529f\uff0c\u5c1d\u8bd5\u5f00\u59cb\u4e0b\u4e00\u4efb\u52a1"

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 315
    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getSchedulerType()I

    move-result v4

    invoke-virtual {p0, v0, v4}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->startNextTask(Lcom/arialyy/aria/core/queue/ITaskQueue;I)V

    goto :goto_0

    .line 317
    :cond_6
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    new-array v4, v6, [Ljava/lang/Object;

    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getTaskName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const-string v5, "\u505c\u6b62\u4efb\u52a1\u3010%s\u3011\u6210\u529f"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v0, v4}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    if-eq p2, v3, :cond_b

    const/16 v0, 0xb

    if-ne p2, v0, :cond_7

    goto :goto_3

    :cond_7
    if-eq p2, v2, :cond_9

    if-ne p2, v1, :cond_8

    goto :goto_1

    :cond_8
    const/4 v0, 0x7

    if-eq p2, v0, :cond_a

    .line 347
    invoke-static {}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getInstance()Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    move-result-object v0

    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->putTaskWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    goto :goto_2

    .line 344
    :cond_9
    :goto_1
    invoke-static {}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getInstance()Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    move-result-object v0

    invoke-interface {p1}, Lcom/arialyy/aria/core/task/ITask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->removeTaskWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    .line 350
    :cond_a
    :goto_2
    invoke-direct {p0, p2, p1}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->normalTaskCallback(ILcom/arialyy/aria/core/task/ITask;)V

    :cond_b
    :goto_3
    return-void
.end method

.method private handlePeerEvent(Landroid/os/Message;)Z
    .locals 7

    .line 204
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    .line 205
    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 206
    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 207
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 208
    iget-object v3, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_0

    .line 209
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 212
    :cond_1
    sget-object v3, Lcom/arialyy/annotations/TaskEnum;->M3U8_PEER:Lcom/arialyy/annotations/TaskEnum;

    .line 213
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/scheduler/M3U8PeerTaskListener;

    if-nez v2, :cond_2

    goto :goto_0

    .line 218
    :cond_2
    iget v3, p1, Landroid/os/Message;->what:I

    const-string v4, "DATA_M3U8_PEER_INDEX"

    const-string v5, "DATA_M3U8_PEER_PATH"

    const-string v6, "DATA_M3U8_URL"

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 230
    :pswitch_0
    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 231
    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 232
    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 230
    invoke-interface {v2, v3, v5, v4}, Lcom/arialyy/aria/core/scheduler/M3U8PeerTaskListener;->onPeerFail(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    .line 225
    :pswitch_1
    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 226
    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 227
    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 225
    invoke-interface {v2, v3, v5, v4}, Lcom/arialyy/aria/core/scheduler/M3U8PeerTaskListener;->onPeerComplete(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    .line 220
    :pswitch_2
    invoke-virtual {v0, v6}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 221
    invoke-virtual {v0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 222
    invoke-virtual {v0, v4}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v4

    .line 220
    invoke-interface {v2, v3, v5, v4}, Lcom/arialyy/aria/core/scheduler/M3U8PeerTaskListener;->onPeerStart(Ljava/lang/String;Ljava/lang/String;I)V

    goto :goto_0

    .line 238
    :cond_3
    iget-object p1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/AriaConfig;->getAConfig()Lcom/arialyy/aria/core/config/AppConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/config/AppConfig;->isUseBroadcast()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 240
    new-instance p1, Landroid/content/Intent;

    const-string v1, "ARIA_TASK_INFO_ACTION"

    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 241
    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 242
    invoke-virtual {p1, v0}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    .line 243
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_4
    const/4 p1, 0x1

    return p1

    :pswitch_data_0
    .packed-switch 0xb1
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private handlePreFailTask(I)V
    .locals 5

    .line 359
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->getQueue(I)Lcom/arialyy/aria/core/queue/ITaskQueue;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->startNextTask(Lcom/arialyy/aria/core/queue/ITaskQueue;I)V

    .line 362
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getAConfig()Lcom/arialyy/aria/core/config/AppConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/AppConfig;->isUseBroadcast()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 364
    new-instance v0, Landroid/content/Intent;

    const-string v2, "ARIA_TASK_INFO_ACTION"

    invoke-direct {v0, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 365
    iget-object v2, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 366
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    const-string v3, "ARIA_TASK_TYPE"

    .line 367
    invoke-virtual {v2, v3, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    const/4 v3, 0x4

    const-string v4, "ARIA_TASK_STATE"

    .line 368
    invoke-virtual {v2, v4, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 369
    iget-object v2, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    .line 373
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_6

    .line 374
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 375
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 376
    iget-object v3, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/Map;

    if-eqz v3, :cond_1

    .line 377
    invoke-interface {v3}, Ljava/util/Map;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_2

    goto :goto_0

    .line 381
    :cond_2
    iget-object v4, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v4, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const/4 v4, 0x0

    if-eqz v2, :cond_5

    if-ne p1, v1, :cond_3

    .line 383
    sget-object v2, Lcom/arialyy/annotations/TaskEnum;->DOWNLOAD:Lcom/arialyy/annotations/TaskEnum;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;

    goto :goto_1

    :cond_3
    const/4 v2, 0x3

    if-ne p1, v2, :cond_4

    .line 385
    sget-object v2, Lcom/arialyy/annotations/TaskEnum;->DOWNLOAD_GROUP:Lcom/arialyy/annotations/TaskEnum;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;

    goto :goto_1

    :cond_4
    if-ne p1, v2, :cond_5

    .line 387
    sget-object v2, Lcom/arialyy/annotations/TaskEnum;->UPLOAD:Lcom/arialyy/annotations/TaskEnum;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;

    goto :goto_1

    :cond_5
    move-object v2, v4

    :goto_1
    if-eqz v2, :cond_1

    const/16 v3, 0xb

    .line 391
    invoke-direct {p0, v3, v4, v2}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->normalTaskCallback(ILcom/arialyy/aria/core/task/ITask;Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;)V

    goto :goto_0

    :cond_6
    return-void
.end method

.method private handleSubEvent(Landroid/os/Message;)Z
    .locals 7

    .line 253
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/arialyy/aria/core/group/GroupSendParams;

    .line 254
    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-lez v1, :cond_3

    .line 255
    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 256
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 257
    iget-object v3, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_0

    .line 258
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    .line 261
    :cond_1
    sget-object v3, Lcom/arialyy/annotations/TaskEnum;->DOWNLOAD_GROUP_SUB:Lcom/arialyy/annotations/TaskEnum;

    .line 262
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/scheduler/SubTaskListener;

    if-nez v2, :cond_2

    goto :goto_0

    .line 266
    :cond_2
    iget v3, p1, Landroid/os/Message;->what:I

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 287
    :pswitch_0
    iget-object v3, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->groupTask:Lcom/arialyy/aria/core/task/AbsGroupTask;

    iget-object v4, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->entity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

    invoke-interface {v2, v3, v4}, Lcom/arialyy/aria/core/scheduler/SubTaskListener;->onSubTaskComplete(Lcom/arialyy/aria/core/task/ITask;Lcom/arialyy/aria/core/common/AbsNormalEntity;)V

    goto :goto_0

    .line 281
    :pswitch_1
    iget-object v3, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->groupTask:Lcom/arialyy/aria/core/task/AbsGroupTask;

    iget-object v4, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->entity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

    invoke-interface {v2, v3, v4}, Lcom/arialyy/aria/core/scheduler/SubTaskListener;->onSubTaskRunning(Lcom/arialyy/aria/core/task/ITask;Lcom/arialyy/aria/core/common/AbsNormalEntity;)V

    goto :goto_0

    .line 277
    :pswitch_2
    iget-object v3, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->groupTask:Lcom/arialyy/aria/core/task/AbsGroupTask;

    iget-object v4, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->entity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

    iget-object v5, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->groupTask:Lcom/arialyy/aria/core/task/AbsGroupTask;

    const-string v6, "ERROR_INFO_KEY"

    .line 278
    invoke-virtual {v5, v6}, Lcom/arialyy/aria/core/task/AbsGroupTask;->getExpand(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Exception;

    .line 277
    invoke-interface {v2, v3, v4, v5}, Lcom/arialyy/aria/core/scheduler/SubTaskListener;->onSubTaskFail(Lcom/arialyy/aria/core/task/ITask;Lcom/arialyy/aria/core/common/AbsNormalEntity;Ljava/lang/Exception;)V

    goto :goto_0

    .line 284
    :pswitch_3
    iget-object v3, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->groupTask:Lcom/arialyy/aria/core/task/AbsGroupTask;

    iget-object v4, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->entity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

    invoke-interface {v2, v3, v4}, Lcom/arialyy/aria/core/scheduler/SubTaskListener;->onSubTaskCancel(Lcom/arialyy/aria/core/task/ITask;Lcom/arialyy/aria/core/common/AbsNormalEntity;)V

    goto :goto_0

    .line 274
    :pswitch_4
    iget-object v3, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->groupTask:Lcom/arialyy/aria/core/task/AbsGroupTask;

    iget-object v4, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->entity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

    invoke-interface {v2, v3, v4}, Lcom/arialyy/aria/core/scheduler/SubTaskListener;->onSubTaskStop(Lcom/arialyy/aria/core/task/ITask;Lcom/arialyy/aria/core/common/AbsNormalEntity;)V

    goto :goto_0

    .line 271
    :pswitch_5
    iget-object v3, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->groupTask:Lcom/arialyy/aria/core/task/AbsGroupTask;

    iget-object v4, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->entity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

    invoke-interface {v2, v3, v4}, Lcom/arialyy/aria/core/scheduler/SubTaskListener;->onSubTaskStart(Lcom/arialyy/aria/core/task/ITask;Lcom/arialyy/aria/core/common/AbsNormalEntity;)V

    goto :goto_0

    .line 268
    :pswitch_6
    iget-object v3, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->groupTask:Lcom/arialyy/aria/core/task/AbsGroupTask;

    iget-object v4, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->entity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

    invoke-interface {v2, v3, v4}, Lcom/arialyy/aria/core/scheduler/SubTaskListener;->onSubTaskPre(Lcom/arialyy/aria/core/task/ITask;Lcom/arialyy/aria/core/common/AbsNormalEntity;)V

    goto :goto_0

    .line 293
    :cond_3
    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/AriaConfig;->getAConfig()Lcom/arialyy/aria/core/config/AppConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/config/AppConfig;->isUseBroadcast()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 295
    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v1

    iget p1, p1, Landroid/os/Message;->what:I

    const/4 v2, 0x4

    iget-object v0, v0, Lcom/arialyy/aria/core/group/GroupSendParams;->entity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

    .line 296
    invoke-direct {p0, p1, v2, v0}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->createData(IILcom/arialyy/aria/core/common/AbsEntity;)Landroid/content/Intent;

    move-result-object p1

    .line 295
    invoke-virtual {v1, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :cond_4
    const/4 p1, 0x1

    return p1

    :pswitch_data_0
    .packed-switch 0xa1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private hasProxyListener(Ljava/util/Map;Lcom/arialyy/annotations/TaskEnum;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Lcom/arialyy/annotations/TaskEnum;",
            "Ljava/lang/Object;",
            ">;",
            "Lcom/arialyy/annotations/TaskEnum;",
            ")Z"
        }
    .end annotation

    .line 131
    invoke-interface {p1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method

.method private normalTaskCallback(ILcom/arialyy/aria/core/task/ITask;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITTASK;)V"
        }
    .end annotation

    .line 403
    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->sendNormalBroadcast(ILcom/arialyy/aria/core/task/ITask;)V

    .line 404
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_5

    .line 405
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 406
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 407
    iget-object v2, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map;

    if-eqz v2, :cond_0

    .line 408
    invoke-interface {v2}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_0

    :cond_1
    const/4 v3, 0x0

    .line 412
    iget-object v4, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_4

    .line 413
    instance-of v1, p2, Lcom/arialyy/aria/core/task/DownloadTask;

    if-eqz v1, :cond_2

    .line 414
    sget-object v1, Lcom/arialyy/annotations/TaskEnum;->DOWNLOAD:Lcom/arialyy/annotations/TaskEnum;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;

    goto :goto_1

    .line 415
    :cond_2
    instance-of v1, p2, Lcom/arialyy/aria/core/task/DownloadGroupTask;

    if-eqz v1, :cond_3

    .line 416
    sget-object v1, Lcom/arialyy/annotations/TaskEnum;->DOWNLOAD_GROUP:Lcom/arialyy/annotations/TaskEnum;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;

    goto :goto_1

    .line 417
    :cond_3
    instance-of v1, p2, Lcom/arialyy/aria/core/task/UploadTask;

    if-eqz v1, :cond_4

    .line 418
    sget-object v1, Lcom/arialyy/annotations/TaskEnum;->UPLOAD:Lcom/arialyy/annotations/TaskEnum;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;

    :cond_4
    :goto_1
    if-eqz v3, :cond_0

    .line 422
    invoke-direct {p0, p1, p2, v3}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->normalTaskCallback(ILcom/arialyy/aria/core/task/ITask;Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;)V

    goto :goto_0

    :cond_5
    return-void
.end method

.method private normalTaskCallback(ILcom/arialyy/aria/core/task/ITask;Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITTASK;",
            "Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface<",
            "TTASK;>;)V"
        }
    .end annotation

    if-eqz p3, :cond_2

    if-nez p2, :cond_0

    const/16 v0, 0xb

    if-eq p1, v0, :cond_0

    .line 431
    iget-object p1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    const-string p2, "TASK \u4e3anull\uff0c\u56de\u8c03\u5931\u8d25"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x0

    packed-switch p1, :pswitch_data_0

    goto :goto_1

    .line 467
    :pswitch_0
    invoke-interface {p3, v0, v0}, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;->onTaskFail(Lcom/arialyy/aria/core/task/ITask;Ljava/lang/Exception;)V

    goto :goto_1

    .line 436
    :pswitch_1
    invoke-interface {p3, p2}, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;->onWait(Lcom/arialyy/aria/core/task/ITask;)V

    goto :goto_1

    .line 470
    :pswitch_2
    invoke-interface {p3, p2}, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;->onNoSupportBreakPoint(Lcom/arialyy/aria/core/task/ITask;)V

    goto :goto_1

    .line 454
    :pswitch_3
    invoke-interface {p3, p2}, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;->onTaskResume(Lcom/arialyy/aria/core/task/ITask;)V

    goto :goto_1

    .line 445
    :pswitch_4
    invoke-interface {p3, p2}, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;->onTaskRunning(Lcom/arialyy/aria/core/task/ITask;)V

    goto :goto_1

    .line 460
    :pswitch_5
    invoke-interface {p3, p2}, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;->onTaskComplete(Lcom/arialyy/aria/core/task/ITask;)V

    goto :goto_1

    .line 457
    :pswitch_6
    invoke-interface {p3, p2}, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;->onTaskCancel(Lcom/arialyy/aria/core/task/ITask;)V

    goto :goto_1

    .line 463
    :pswitch_7
    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->getTaskType()I

    move-result p1

    const/4 v1, 0x6

    if-ne p1, v1, :cond_1

    goto :goto_0

    :cond_1
    move-object v0, p2

    :goto_0
    const-string p1, "ERROR_INFO_KEY"

    .line 464
    invoke-interface {p2, p1}, Lcom/arialyy/aria/core/task/ITask;->getExpand(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Exception;

    .line 463
    invoke-interface {p3, v0, p1}, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;->onTaskFail(Lcom/arialyy/aria/core/task/ITask;Ljava/lang/Exception;)V

    goto :goto_1

    .line 451
    :pswitch_8
    invoke-interface {p3, p2}, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;->onTaskStop(Lcom/arialyy/aria/core/task/ITask;)V

    goto :goto_1

    .line 448
    :pswitch_9
    invoke-interface {p3, p2}, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;->onTaskStart(Lcom/arialyy/aria/core/task/ITask;)V

    goto :goto_1

    .line 442
    :pswitch_a
    invoke-interface {p3, p2}, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;->onTaskPre(Lcom/arialyy/aria/core/task/ITask;)V

    goto :goto_1

    .line 439
    :pswitch_b
    invoke-interface {p3, p2}, Lcom/arialyy/aria/core/scheduler/NormalTaskListenerInterface;->onPre(Lcom/arialyy/aria/core/task/ITask;)V

    :cond_2
    :goto_1
    return-void

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method private sendNormalBroadcast(ILcom/arialyy/aria/core/task/ITask;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ITTASK;)V"
        }
    .end annotation

    .line 480
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getAConfig()Lcom/arialyy/aria/core/config/AppConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/AppConfig;->isUseBroadcast()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 484
    :cond_0
    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->getTaskType()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x3

    if-ne v0, v1, :cond_1

    goto :goto_0

    :cond_1
    const/4 v1, 0x2

    if-ne v0, v1, :cond_2

    .line 489
    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v1

    .line 490
    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p2

    invoke-virtual {p2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p2

    invoke-direct {p0, p1, v0, p2}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->createData(IILcom/arialyy/aria/core/common/AbsEntity;)Landroid/content/Intent;

    move-result-object p1

    .line 489
    invoke-virtual {v1, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    goto :goto_1

    .line 492
    :cond_2
    iget-object p1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    const-string p2, "\u53d1\u9001\u5e7f\u64ad\u5931\u8d25\uff0c\u6ca1\u6709\u5bf9\u5e94\u7684\u4efb\u52a1"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1

    .line 486
    :cond_3
    :goto_0
    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mAriaConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v1

    .line 487
    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p2

    invoke-virtual {p2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p2

    invoke-direct {p0, p1, v0, p2}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->createData(IILcom/arialyy/aria/core/common/AbsEntity;)Landroid/content/Intent;

    move-result-object p1

    .line 486
    invoke-virtual {v1, p1}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;)V

    :goto_1
    return-void
.end method


# virtual methods
.method getQueue(I)Lcom/arialyy/aria/core/queue/ITaskQueue;
    .locals 3

    const/4 v0, 0x1

    if-ne p1, v0, :cond_0

    .line 82
    invoke-static {}, Lcom/arialyy/aria/core/queue/DTaskQueue;->getInstance()Lcom/arialyy/aria/core/queue/DTaskQueue;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    .line 85
    invoke-static {}, Lcom/arialyy/aria/core/queue/DGroupTaskQueue;->getInstance()Lcom/arialyy/aria/core/queue/DGroupTaskQueue;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 88
    invoke-static {}, Lcom/arialyy/aria/core/queue/UTaskQueue;->getInstance()Lcom/arialyy/aria/core/queue/UTaskQueue;

    move-result-object p1

    return-object p1

    .line 90
    :cond_2
    new-instance v0, Ljava/lang/NullPointerException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u4efb\u52a1\u7c7b\u578b\u9519\u8bef\uff0ctype = "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 3

    .line 178
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    const/16 v2, 0xb

    if-ne v0, v2, :cond_0

    .line 179
    iget p1, p1, Landroid/os/Message;->arg1:I

    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->handlePreFailTask(I)V

    return v1

    .line 183
    :cond_0
    iget v0, p1, Landroid/os/Message;->arg1:I

    const/16 v2, 0xd1

    if-ne v0, v2, :cond_1

    .line 184
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->handleSubEvent(Landroid/os/Message;)Z

    move-result p1

    return p1

    .line 187
    :cond_1
    iget v0, p1, Landroid/os/Message;->arg1:I

    const/16 v2, 0xd2

    if-ne v0, v2, :cond_2

    .line 188
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->handlePeerEvent(Landroid/os/Message;)Z

    move-result p1

    return p1

    .line 191
    :cond_2
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast v0, Lcom/arialyy/aria/core/task/ITask;

    if-nez v0, :cond_3

    .line 193
    iget-object p1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    const-string v0, "\u8bf7\u4f20\u5165\u4e0b\u8f7d\u4efb\u52a1"

    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 196
    :cond_3
    iget p1, p1, Landroid/os/Message;->what:I

    invoke-direct {p0, v0, p1}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->handleNormalEvent(Lcom/arialyy/aria/core/task/ITask;I)V

    return v1
.end method

.method public register(Ljava/lang/Object;Lcom/arialyy/annotations/TaskEnum;)V
    .locals 4

    .line 100
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    .line 101
    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->getKey(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    if-nez v1, :cond_0

    .line 104
    new-instance v1, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v1}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    .line 105
    iget-object v2, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->getKey(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    :cond_0
    invoke-direct {p0, v1, p2}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->hasProxyListener(Ljava/util/Map;Lcom/arialyy/annotations/TaskEnum;)Z

    move-result v2

    if-nez v2, :cond_3

    .line 109
    instance-of v2, p1, Lcom/arialyy/aria/core/scheduler/TaskInternalListenerInterface;

    if-eqz v2, :cond_1

    .line 110
    invoke-interface {v1, p2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 113
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p2, Lcom/arialyy/annotations/TaskEnum;->proxySuffix:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 114
    invoke-direct {p0, v0}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->createListener(Ljava/lang/String;)Lcom/arialyy/aria/core/scheduler/ISchedulerListener;

    move-result-object v2

    if-eqz v2, :cond_2

    .line 116
    invoke-interface {v2, p1}, Lcom/arialyy/aria/core/scheduler/ISchedulerListener;->setListener(Ljava/lang/Object;)V

    .line 117
    invoke-interface {v1, p2, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 119
    :cond_2
    iget-object p1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u6ce8\u518c\u9519\u8bef\uff0c\u6ca1\u6709\u3010"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u3011\u89c2\u5bdf\u8005"

    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_0
    return-void
.end method

.method startNextTask(Lcom/arialyy/aria/core/queue/ITaskQueue;I)V
    .locals 2

    const/4 v0, 0x2

    if-ne p2, v0, :cond_0

    return-void

    .line 551
    :cond_0
    invoke-interface {p1}, Lcom/arialyy/aria/core/queue/ITaskQueue;->getNextTask()Lcom/arialyy/aria/core/task/ITask;

    move-result-object p2

    if-nez p2, :cond_2

    .line 553
    invoke-interface {p1}, Lcom/arialyy/aria/core/queue/ITaskQueue;->getCurrentExePoolNum()I

    move-result p1

    if-nez p1, :cond_1

    .line 554
    iget-object p1, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->TAG:Ljava/lang/String;

    const-string p2, "\u6ca1\u6709\u7b49\u5f85\u4e2d\u7684\u4efb\u52a1"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-void

    .line 558
    :cond_2
    invoke-interface {p2}, Lcom/arialyy/aria/core/task/ITask;->getState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_3

    .line 559
    invoke-interface {p1, p2}, Lcom/arialyy/aria/core/queue/ITaskQueue;->startTask(Lcom/arialyy/aria/core/task/ITask;)V

    :cond_3
    return-void
.end method

.method public unRegister(Ljava/lang/Object;)V
    .locals 3

    .line 140
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->getKey(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 143
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->mObservers:Ljava/util/Map;

    .line 144
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 145
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 147
    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->getKey(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 148
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    :cond_2
    return-void
.end method
