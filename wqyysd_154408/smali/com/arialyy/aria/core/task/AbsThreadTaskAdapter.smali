.class public abstract Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;
.super Ljava/lang/Object;
.source "AbsThreadTaskAdapter.java"

# interfaces
.implements Lcom/arialyy/aria/core/task/IThreadTaskAdapter;


# instance fields
.field protected TAG:Ljava/lang/String;

.field private mObserver:Lcom/arialyy/aria/core/task/IThreadTaskObserver;

.field protected mSpeedBandUtil:Lcom/arialyy/aria/util/BandwidthLimiter;

.field private mThreadConfig:Lcom/arialyy/aria/core/common/SubThreadConfig;

.field private mThreadRecord:Lcom/arialyy/aria/core/ThreadRecord;

.field private mThreadTask:Lcom/arialyy/aria/core/task/IThreadTask;

.field private mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;


# direct methods
.method protected constructor <init>(Lcom/arialyy/aria/core/common/SubThreadConfig;)V
    .locals 2

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->TAG:Ljava/lang/String;

    .line 44
    iget-object v0, p1, Lcom/arialyy/aria/core/common/SubThreadConfig;->record:Lcom/arialyy/aria/core/ThreadRecord;

    iput-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mThreadRecord:Lcom/arialyy/aria/core/ThreadRecord;

    .line 45
    iget-object v0, p1, Lcom/arialyy/aria/core/common/SubThreadConfig;->taskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    iput-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    .line 46
    iput-object p1, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mThreadConfig:Lcom/arialyy/aria/core/common/SubThreadConfig;

    .line 47
    invoke-virtual {p0}, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->getTaskConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getMaxSpeed()I

    move-result v0

    if-lez v0, :cond_0

    .line 48
    new-instance v0, Lcom/arialyy/aria/util/BandwidthLimiter;

    invoke-virtual {p0}, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->getTaskConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getMaxSpeed()I

    move-result v1

    iget p1, p1, Lcom/arialyy/aria/core/common/SubThreadConfig;->startThreadNum:I

    invoke-direct {v0, v1, p1}, Lcom/arialyy/aria/util/BandwidthLimiter;-><init>(II)V

    iput-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mSpeedBandUtil:Lcom/arialyy/aria/util/BandwidthLimiter;

    :cond_0
    return-void
.end method


# virtual methods
.method public attach(Lcom/arialyy/aria/core/task/IThreadTaskObserver;)V
    .locals 0

    .line 96
    iput-object p1, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mObserver:Lcom/arialyy/aria/core/task/IThreadTaskObserver;

    return-void
.end method

.method public call(Lcom/arialyy/aria/core/task/IThreadTask;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 53
    iput-object p1, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mThreadTask:Lcom/arialyy/aria/core/task/IThreadTask;

    .line 54
    invoke-virtual {p0}, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->handlerThreadTask()V

    return-void
.end method

.method protected complete()V
    .locals 1

    .line 108
    iget-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mObserver:Lcom/arialyy/aria/core/task/IThreadTaskObserver;

    if-eqz v0, :cond_0

    .line 109
    invoke-interface {v0}, Lcom/arialyy/aria/core/task/IThreadTaskObserver;->updateCompleteState()V

    :cond_0
    return-void
.end method

.method protected fail(Lcom/arialyy/aria/exception/AriaException;Z)V
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mObserver:Lcom/arialyy/aria/core/task/IThreadTaskObserver;

    if-eqz v0, :cond_0

    .line 115
    invoke-interface {v0, p1, p2}, Lcom/arialyy/aria/core/task/IThreadTaskObserver;->updateFailState(Lcom/arialyy/aria/exception/AriaException;Z)V

    :cond_0
    return-void
.end method

.method protected getRangeProgress()J
    .locals 2

    .line 66
    iget-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mObserver:Lcom/arialyy/aria/core/task/IThreadTaskObserver;

    invoke-interface {v0}, Lcom/arialyy/aria/core/task/IThreadTaskObserver;->getThreadProgress()J

    move-result-wide v0

    return-wide v0
.end method

.method protected getTaskConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;
    .locals 1

    .line 81
    invoke-virtual {p0}, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object v0

    return-object v0
.end method

.method protected getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    return-object v0
.end method

.method protected getThreadConfig()Lcom/arialyy/aria/core/common/SubThreadConfig;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mThreadConfig:Lcom/arialyy/aria/core/common/SubThreadConfig;

    return-object v0
.end method

.method protected getThreadRecord()Lcom/arialyy/aria/core/ThreadRecord;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mThreadRecord:Lcom/arialyy/aria/core/ThreadRecord;

    return-object v0
.end method

.method protected getThreadTask()Lcom/arialyy/aria/core/task/IThreadTask;
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mThreadTask:Lcom/arialyy/aria/core/task/IThreadTask;

    return-object v0
.end method

.method protected abstract handlerThreadTask()V
.end method

.method protected progress(J)V
    .locals 1

    .line 120
    iget-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mObserver:Lcom/arialyy/aria/core/task/IThreadTaskObserver;

    if-eqz v0, :cond_0

    .line 121
    invoke-interface {v0, p1, p2}, Lcom/arialyy/aria/core/task/IThreadTaskObserver;->updateProgress(J)V

    :cond_0
    return-void
.end method

.method public setMaxSpeed(I)V
    .locals 3

    .line 100
    iget-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mSpeedBandUtil:Lcom/arialyy/aria/util/BandwidthLimiter;

    if-nez v0, :cond_0

    .line 101
    new-instance v0, Lcom/arialyy/aria/util/BandwidthLimiter;

    .line 102
    invoke-virtual {p0}, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->getTaskConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getMaxSpeed()I

    move-result v1

    invoke-virtual {p0}, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->getThreadConfig()Lcom/arialyy/aria/core/common/SubThreadConfig;

    move-result-object v2

    iget v2, v2, Lcom/arialyy/aria/core/common/SubThreadConfig;->startThreadNum:I

    invoke-direct {v0, v1, v2}, Lcom/arialyy/aria/util/BandwidthLimiter;-><init>(II)V

    iput-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mSpeedBandUtil:Lcom/arialyy/aria/util/BandwidthLimiter;

    .line 104
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;->mSpeedBandUtil:Lcom/arialyy/aria/util/BandwidthLimiter;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/util/BandwidthLimiter;->setMaxRate(I)V

    return-void
.end method
