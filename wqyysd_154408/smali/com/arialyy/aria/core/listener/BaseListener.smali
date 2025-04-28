.class public abstract Lcom/arialyy/aria/core/listener/BaseListener;
.super Ljava/lang/Object;
.source "BaseListener.java"

# interfaces
.implements Lcom/arialyy/aria/core/listener/IEventListener;


# static fields
.field static final RUN_SAVE_INTERVAL:I = 0x1388


# instance fields
.field protected TAG:Ljava/lang/String;

.field private isConvertSpeed:Z

.field private isFirst:Z

.field protected mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

.field private mLastLen:J

.field mLastSaveTime:J

.field private mTask:Lcom/arialyy/aria/core/task/AbsTask;

.field protected mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

.field private mUpdateInterval:J

.field protected outHandler:Ljava/lang/ref/SoftReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/SoftReference<",
            "Landroid/os/Handler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->TAG:Ljava/lang/String;

    const/4 v0, 0x1

    .line 37
    iput-boolean v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->isFirst:Z

    return-void
.end method

.method private handleComplete()V
    .locals 3

    .line 156
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/common/AbsEntity;->setComplete(Z)V

    .line 157
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/arialyy/aria/core/common/AbsEntity;->setCompleteTime(J)V

    .line 158
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/arialyy/aria/core/common/AbsEntity;->setCurrentProgress(J)V

    .line 159
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    const/16 v1, 0x64

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/common/AbsEntity;->setPercent(I)V

    const-wide/16 v0, 0x0

    .line 160
    invoke-direct {p0, v0, v1}, Lcom/arialyy/aria/core/listener/BaseListener;->handleSpeed(J)V

    return-void
.end method

.method private handleSpeed(J)V
    .locals 8

    .line 131
    iget-wide v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mUpdateInterval:J

    const-wide/16 v2, 0x3e8

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    mul-long/2addr p1, v2

    .line 132
    div-long/2addr p1, v0

    .line 134
    :cond_0
    iget-boolean v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->isConvertSpeed:Z

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_2

    .line 135
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    cmp-long v4, p1, v1

    if-gez v4, :cond_1

    const-wide/16 v4, 0x0

    goto :goto_0

    :cond_1
    long-to-double v4, p1

    :goto_0
    invoke-static {v4, v5}, Lcom/arialyy/aria/util/CommonUtil;->formatFileSize(D)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/s"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Lcom/arialyy/aria/core/common/AbsEntity;->setConvertSpeed(Ljava/lang/String;)V

    .line 137
    :cond_2
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    cmp-long v3, p1, v1

    if-gez v3, :cond_3

    move-wide v4, v1

    goto :goto_1

    :cond_3
    move-wide v4, p1

    :goto_1
    invoke-virtual {v0, v4, v5}, Lcom/arialyy/aria/core/common/AbsEntity;->setSpeed(J)V

    .line 138
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getRequestType()I

    move-result v0

    const/4 v4, 0x7

    if-eq v0, v4, :cond_5

    const/16 v4, 0x8

    if-eq v0, v4, :cond_5

    .line 140
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v4

    cmp-long v4, v4, v1

    if-gtz v4, :cond_4

    move-wide v4, v1

    goto :goto_2

    :cond_4
    iget-object v4, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    .line 141
    invoke-virtual {v4}, Lcom/arialyy/aria/core/common/AbsEntity;->getCurrentProgress()J

    move-result-wide v4

    const-wide/16 v6, 0x64

    mul-long/2addr v4, v6

    iget-object v6, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {v6}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v6

    div-long/2addr v4, v6

    :goto_2
    long-to-int v4, v4

    .line 140
    invoke-virtual {v0, v4}, Lcom/arialyy/aria/core/common/AbsEntity;->setPercent(I)V

    .line 143
    :cond_5
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v4

    cmp-long v0, v4, v1

    if-eqz v0, :cond_7

    if-nez v3, :cond_6

    .line 145
    iget-object p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    const p2, 0x7fffffff

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/common/AbsEntity;->setTimeLeft(I)V

    goto :goto_3

    .line 147
    :cond_6
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v1

    iget-object v3, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/common/AbsEntity;->getCurrentProgress()J

    move-result-wide v3

    sub-long/2addr v1, v3

    div-long/2addr v1, p1

    long-to-int p1, v1

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/common/AbsEntity;->setTimeLeft(I)V

    :cond_7
    :goto_3
    return-void
.end method


# virtual methods
.method protected getTask(Ljava/lang/Class;)Lcom/arialyy/aria/core/task/AbsTask;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TASK:",
            "Lcom/arialyy/aria/core/task/AbsTask;",
            ">(",
            "Ljava/lang/Class<",
            "TTASK;>;)TTASK;"
        }
    .end annotation

    .line 59
    iget-object p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mTask:Lcom/arialyy/aria/core/task/AbsTask;

    return-object p1
.end method

.method protected abstract handleCancel()V
.end method

.method public onCancel()V
    .locals 3

    const/4 v0, 0x7

    const-wide/16 v1, -0x1

    .line 108
    invoke-virtual {p0, v0, v1, v2}, Lcom/arialyy/aria/core/listener/BaseListener;->saveData(IJ)V

    const-wide/16 v0, 0x0

    .line 109
    invoke-direct {p0, v0, v1}, Lcom/arialyy/aria/core/listener/BaseListener;->handleSpeed(J)V

    .line 110
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mTask:Lcom/arialyy/aria/core/task/AbsTask;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/task/AbsTask;->getSchedulerType()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    .line 111
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->TAG:Ljava/lang/String;

    const-string v1, "\u5220\u9664\u4efb\u52a1\u5b8c\u6210"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v0, 0x5

    .line 112
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/listener/BaseListener;->sendInState2Target(I)V

    :cond_0
    return-void
.end method

.method public onComplete()V
    .locals 3

    .line 102
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v0

    const/4 v2, 0x1

    invoke-virtual {p0, v2, v0, v1}, Lcom/arialyy/aria/core/listener/BaseListener;->saveData(IJ)V

    const-wide/16 v0, 0x0

    .line 103
    invoke-direct {p0, v0, v1}, Lcom/arialyy/aria/core/listener/BaseListener;->handleSpeed(J)V

    const/4 v0, 0x6

    .line 104
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/listener/BaseListener;->sendInState2Target(I)V

    return-void
.end method

.method public onFail(ZLcom/arialyy/aria/exception/AriaException;)V
    .locals 3

    .line 117
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFailNum()I

    move-result v1

    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/common/AbsEntity;->setFailNum(I)V

    .line 118
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getCurrentProgress()J

    move-result-wide v0

    const/4 v2, 0x0

    invoke-virtual {p0, v2, v0, v1}, Lcom/arialyy/aria/core/listener/BaseListener;->saveData(IJ)V

    const-wide/16 v0, 0x0

    .line 119
    invoke-direct {p0, v0, v1}, Lcom/arialyy/aria/core/listener/BaseListener;->handleSpeed(J)V

    .line 120
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mTask:Lcom/arialyy/aria/core/task/AbsTask;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/task/AbsTask;->setNeedRetry(Z)V

    .line 121
    iget-object p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mTask:Lcom/arialyy/aria/core/task/AbsTask;

    const-string v0, "ERROR_INFO_KEY"

    invoke-virtual {p1, v0, p2}, Lcom/arialyy/aria/core/task/AbsTask;->putExpand(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 p1, 0x4

    .line 122
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/listener/BaseListener;->sendInState2Target(I)V

    if-eqz p2, :cond_0

    .line 124
    invoke-static {p2}, Lcom/arialyy/aria/util/ALog;->getExceptionString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p1

    .line 125
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->TAG:Ljava/lang/String;

    invoke-static {v0, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    invoke-virtual {p2}, Lcom/arialyy/aria/exception/AriaException;->getMessage()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, p1}, Lcom/arialyy/aria/util/ErrorHelp;->saveError(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onPre()V
    .locals 3

    const/4 v0, 0x5

    const-wide/16 v1, -0x1

    .line 63
    invoke-virtual {p0, v0, v1, v2}, Lcom/arialyy/aria/core/listener/BaseListener;->saveData(IJ)V

    const/4 v0, 0x0

    .line 64
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/listener/BaseListener;->sendInState2Target(I)V

    return-void
.end method

.method public onProgress(J)V
    .locals 4

    .line 78
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {v0, p1, p2}, Lcom/arialyy/aria/core/common/AbsEntity;->setCurrentProgress(J)V

    .line 79
    iget-wide v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mLastLen:J

    sub-long v0, p1, v0

    .line 80
    iget-boolean v2, p0, Lcom/arialyy/aria/core/listener/BaseListener;->isFirst:Z

    if-eqz v2, :cond_0

    const-wide/16 v0, 0x0

    const/4 v2, 0x0

    .line 82
    iput-boolean v2, p0, Lcom/arialyy/aria/core/listener/BaseListener;->isFirst:Z

    .line 84
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/arialyy/aria/core/listener/BaseListener;->handleSpeed(J)V

    const/4 v0, 0x7

    .line 85
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/listener/BaseListener;->sendInState2Target(I)V

    .line 86
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mLastSaveTime:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x1388

    cmp-long v0, v0, v2

    if-ltz v0, :cond_1

    const/4 v0, 0x4

    .line 87
    invoke-virtual {p0, v0, p1, p2}, Lcom/arialyy/aria/core/listener/BaseListener;->saveData(IJ)V

    .line 88
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mLastSaveTime:J

    .line 91
    :cond_1
    iput-wide p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mLastLen:J

    return-void
.end method

.method public onResume(J)V
    .locals 1

    const/4 v0, 0x4

    .line 73
    invoke-virtual {p0, v0, p1, p2}, Lcom/arialyy/aria/core/listener/BaseListener;->saveData(IJ)V

    const/16 p1, 0x8

    .line 74
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/listener/BaseListener;->sendInState2Target(I)V

    return-void
.end method

.method public onStart(J)V
    .locals 1

    const/4 v0, 0x4

    .line 68
    invoke-virtual {p0, v0, p1, p2}, Lcom/arialyy/aria/core/listener/BaseListener;->saveData(IJ)V

    const/4 p1, 0x2

    .line 69
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/listener/BaseListener;->sendInState2Target(I)V

    return-void
.end method

.method public onStop(J)V
    .locals 2

    .line 95
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mTask:Lcom/arialyy/aria/core/task/AbsTask;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/task/AbsTask;->getSchedulerType()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x2

    :goto_0
    invoke-virtual {p0, v0, p1, p2}, Lcom/arialyy/aria/core/listener/BaseListener;->saveData(IJ)V

    const-wide/16 p1, 0x0

    .line 97
    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/core/listener/BaseListener;->handleSpeed(J)V

    .line 98
    invoke-virtual {p0, v1}, Lcom/arialyy/aria/core/listener/BaseListener;->sendInState2Target(I)V

    return-void
.end method

.method protected saveData(IJ)V
    .locals 2

    .line 180
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/common/AbsEntity;->setState(I)V

    const/4 v0, 0x7

    if-ne p1, v0, :cond_0

    .line 183
    invoke-virtual {p0}, Lcom/arialyy/aria/core/listener/BaseListener;->handleCancel()V

    return-void

    :cond_0
    const/4 v0, 0x2

    if-ne p1, v0, :cond_1

    .line 186
    iget-object p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/arialyy/aria/core/common/AbsEntity;->setStopTime(J)V

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 188
    invoke-direct {p0}, Lcom/arialyy/aria/core/listener/BaseListener;->handleComplete()V

    :cond_2
    :goto_0
    const-wide/16 v0, 0x0

    cmp-long p1, p2, v0

    if-lez p1, :cond_3

    .line 191
    iget-object p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {p1, p2, p3}, Lcom/arialyy/aria/core/common/AbsEntity;->setCurrentProgress(J)V

    .line 193
    :cond_3
    iget-object p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsEntity;->update()V

    return-void
.end method

.method protected sendInState2Target(I)V
    .locals 2

    .line 174
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->outHandler:Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 175
    iget-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->outHandler:Ljava/lang/ref/SoftReference;

    invoke-virtual {v0}, Ljava/lang/ref/SoftReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler;

    iget-object v1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mTask:Lcom/arialyy/aria/core/task/AbsTask;

    invoke-virtual {v0, p1, v1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    :cond_0
    return-void
.end method

.method public setParams(Lcom/arialyy/aria/core/task/AbsTask;Landroid/os/Handler;)Lcom/arialyy/aria/core/listener/IEventListener;
    .locals 1

    .line 46
    new-instance v0, Ljava/lang/ref/SoftReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/SoftReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/arialyy/aria/core/listener/BaseListener;->outHandler:Ljava/lang/ref/SoftReference;

    .line 47
    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p2}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/task/AbsTask;

    iput-object p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mTask:Lcom/arialyy/aria/core/task/AbsTask;

    .line 48
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    .line 49
    iget-object p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mTask:Lcom/arialyy/aria/core/task/AbsTask;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    .line 50
    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->isConvertSpeed()Z

    move-result p1

    iput-boolean p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->isConvertSpeed:Z

    .line 51
    iget-object p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getUpdateInterval()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mUpdateInterval:J

    .line 52
    iget-object p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mEntity:Lcom/arialyy/aria/core/common/AbsEntity;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsEntity;->getCurrentProgress()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mLastLen:J

    .line 53
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->mLastSaveTime:J

    .line 54
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/listener/BaseListener;->TAG:Ljava/lang/String;

    return-object p0
.end method
