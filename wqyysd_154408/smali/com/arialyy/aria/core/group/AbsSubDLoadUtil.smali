.class public abstract Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;
.super Ljava/lang/Object;
.source "AbsSubDLoadUtil.java"

# interfaces
.implements Lcom/arialyy/aria/core/inf/IUtil;
.implements Ljava/lang/Runnable;


# instance fields
.field protected final TAG:Ljava/lang/String;

.field private isCancel:Z

.field private isStop:Z

.field protected mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

.field private mSchedulers:Landroid/os/Handler;

.field private mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

.field private needGetInfo:Z

.field private parentKey:Ljava/lang/String;


# direct methods
.method protected constructor <init>(Landroid/os/Handler;ZLjava/lang/String;)V
    .locals 1

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->isStop:Z

    iput-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->isCancel:Z

    .line 49
    iput-object p1, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mSchedulers:Landroid/os/Handler;

    .line 50
    iput-object p3, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->parentKey:Ljava/lang/String;

    .line 51
    iput-boolean p2, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->needGetInfo:Z

    return-void
.end method


# virtual methods
.method protected abstract buildLoaderStructure()Lcom/arialyy/aria/core/loader/LoaderStructure;
.end method

.method public cancel()V
    .locals 2

    .line 141
    iget-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->isCancel:Z

    if-eqz v0, :cond_0

    .line 142
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->TAG:Ljava/lang/String;

    const-string v1, "\u5b50\u4efb\u52a1\u5df2\u53d6\u6d88"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 145
    iput-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->isCancel:Z

    .line 146
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 147
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/loader/SubLoader;->cancel()V

    goto :goto_0

    .line 149
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mSchedulers:Landroid/os/Handler;

    const/4 v1, 0x5

    invoke-virtual {v0, v1, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    :goto_0
    return-void
.end method

.method public getCurrentLocation()J
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    return-object v0
.end method

.method public getFileSize()J
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 80
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/loader/SubLoader;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method protected abstract getLoader()Lcom/arialyy/aria/core/loader/SubLoader;
.end method

.method public getParentKey()Ljava/lang/String;
    .locals 1

    .line 68
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->parentKey:Ljava/lang/String;

    return-object v0
.end method

.method public getRecord()Lcom/arialyy/aria/core/TaskRecord;
    .locals 1

    .line 92
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getLoader()Lcom/arialyy/aria/core/loader/SubLoader;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/loader/SubLoader;->getRecord()Lcom/arialyy/aria/core/TaskRecord;

    move-result-object v0

    return-object v0
.end method

.method public getSchedulers()Landroid/os/Handler;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mSchedulers:Landroid/os/Handler;

    return-object v0
.end method

.method public getWrapper()Lcom/arialyy/aria/core/download/DTaskWrapper;
    .locals 1

    .line 84
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    return-object v0
.end method

.method protected isNeedGetInfo()Z
    .locals 1

    .line 72
    iget-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->needGetInfo:Z

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/loader/SubLoader;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method reStart()V
    .locals 1

    .line 115
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    if-eqz v0, :cond_0

    .line 116
    invoke-virtual {v0}, Lcom/arialyy/aria/core/loader/SubLoader;->retryTask()V

    :cond_0
    return-void
.end method

.method public run()V
    .locals 2

    .line 96
    iget-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->isStop:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->isCancel:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 99
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->buildLoaderStructure()Lcom/arialyy/aria/core/loader/LoaderStructure;

    .line 100
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    :cond_1
    :goto_0
    return-void
.end method

.method public setParams(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/listener/IEventListener;)Lcom/arialyy/aria/core/inf/IUtil;
    .locals 0

    .line 55
    check-cast p1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    iput-object p1, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    .line 56
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getLoader()Lcom/arialyy/aria/core/loader/SubLoader;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    return-object p0
.end method

.method public start()V
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 108
    new-instance v0, Ljava/lang/AssertionError;

    const-string v1, "\u8bf7\u5728\u7ebf\u7a0b\u6c60\u4e2d\u4f7f\u7528"

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public stop()V
    .locals 2

    .line 154
    iget-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->isStop:Z

    if-eqz v0, :cond_0

    .line 155
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->TAG:Ljava/lang/String;

    const-string v1, "\u4efb\u52a1\u5df2\u505c\u6b62"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x1

    .line 158
    iput-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->isStop:Z

    .line 159
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 160
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/loader/SubLoader;->stop()V

    goto :goto_0

    .line 162
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->mSchedulers:Landroid/os/Handler;

    const/4 v1, 0x3

    invoke-virtual {v0, v1, p0}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Message;->sendToTarget()V

    :goto_0
    return-void
.end method
