.class public abstract Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;
.super Ljava/lang/Object;
.source "AbsGroupLoaderUtil.java"

# interfaces
.implements Lcom/arialyy/aria/core/inf/IUtil;


# instance fields
.field protected TAG:Ljava/lang/String;

.field private isCancel:Z

.field private isStop:Z

.field private mListener:Lcom/arialyy/aria/core/listener/IEventListener;

.field protected mLoader:Lcom/arialyy/aria/core/group/AbsGroupLoader;

.field private mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->isStop:Z

    iput-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->isCancel:Z

    return-void
.end method


# virtual methods
.method protected abstract buildLoaderStructure()Lcom/arialyy/aria/core/loader/LoaderStructure;
.end method

.method public cancel()V
    .locals 1

    const/4 v0, 0x1

    .line 86
    iput-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->isCancel:Z

    .line 87
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->mLoader:Lcom/arialyy/aria/core/group/AbsGroupLoader;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/group/AbsGroupLoader;->cancel()V

    return-void
.end method

.method public getCurrentLocation()J
    .locals 2

    .line 67
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->mLoader:Lcom/arialyy/aria/core/group/AbsGroupLoader;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/group/AbsGroupLoader;->getCurrentProgress()J

    move-result-wide v0

    return-wide v0
.end method

.method public getFileSize()J
    .locals 2

    .line 63
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getListener()Lcom/arialyy/aria/core/listener/IEventListener;
    .locals 1

    .line 51
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    return-object v0
.end method

.method protected abstract getLoader()Lcom/arialyy/aria/core/group/AbsGroupLoader;
.end method

.method public getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;
    .locals 1

    .line 55
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    return-object v0
.end method

.method public isRunning()Z
    .locals 1

    .line 71
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->mLoader:Lcom/arialyy/aria/core/group/AbsGroupLoader;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/group/AbsGroupLoader;->isRunning()Z

    move-result v0

    return v0
.end method

.method public setParams(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/listener/IEventListener;)Lcom/arialyy/aria/core/inf/IUtil;
    .locals 0

    .line 40
    iput-object p1, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    .line 41
    iput-object p2, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    .line 42
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->getLoader()Lcom/arialyy/aria/core/group/AbsGroupLoader;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->mLoader:Lcom/arialyy/aria/core/group/AbsGroupLoader;

    return-object p0
.end method

.method public start()V
    .locals 2

    .line 99
    iget-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->isStop:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->isCancel:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 103
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    invoke-interface {v0}, Lcom/arialyy/aria/core/listener/IEventListener;->onPre()V

    .line 105
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->buildLoaderStructure()Lcom/arialyy/aria/core/loader/LoaderStructure;

    .line 106
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->mLoader:Lcom/arialyy/aria/core/group/AbsGroupLoader;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    return-void

    .line 100
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->TAG:Ljava/lang/String;

    const-string v1, "\u542f\u52a8\u7ec4\u5408\u4efb\u52a1\u5931\u8d25\uff0c\u4efb\u52a1\u5df2\u505c\u6b62\u6216\u5df2\u53d6\u6d88"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public startSubTask(Ljava/lang/String;)V
    .locals 1

    .line 75
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->getLoader()Lcom/arialyy/aria/core/group/AbsGroupLoader;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/group/AbsGroupLoader;->startSubTask(Ljava/lang/String;)V

    return-void
.end method

.method public stop()V
    .locals 1

    const/4 v0, 0x1

    .line 94
    iput-boolean v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->isStop:Z

    .line 95
    iget-object v0, p0, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->mLoader:Lcom/arialyy/aria/core/group/AbsGroupLoader;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/group/AbsGroupLoader;->stop()V

    return-void
.end method

.method public stopSubTask(Ljava/lang/String;)V
    .locals 1

    .line 79
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;->getLoader()Lcom/arialyy/aria/core/group/AbsGroupLoader;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/group/AbsGroupLoader;->stopSubTask(Ljava/lang/String;)V

    return-void
.end method
