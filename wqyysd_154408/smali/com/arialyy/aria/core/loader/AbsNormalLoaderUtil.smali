.class public abstract Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;
.super Ljava/lang/Object;
.source "AbsNormalLoaderUtil.java"

# interfaces
.implements Lcom/arialyy/aria/core/inf/IUtil;


# instance fields
.field protected TAG:Ljava/lang/String;

.field private isCancel:Z

.field private isStop:Z

.field private mListener:Lcom/arialyy/aria/core/listener/IEventListener;

.field protected mLoader:Lcom/arialyy/aria/core/loader/AbsNormalLoader;

.field private mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->TAG:Ljava/lang/String;

    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->isStop:Z

    iput-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->isCancel:Z

    return-void
.end method


# virtual methods
.method public abstract BuildLoaderStructure()Lcom/arialyy/aria/core/loader/LoaderStructure;
.end method

.method public cancel()V
    .locals 1

    const/4 v0, 0x1

    .line 81
    iput-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->isCancel:Z

    .line 82
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mLoader:Lcom/arialyy/aria/core/loader/AbsNormalLoader;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->cancel()V

    .line 83
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->onCancel()V

    return-void
.end method

.method protected fail(Lcom/arialyy/aria/exception/AriaException;Z)V
    .locals 1

    .line 144
    iget-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->isStop:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->isCancel:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 147
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    invoke-interface {v0, p2, p1}, Lcom/arialyy/aria/core/listener/IEventListener;->onFail(ZLcom/arialyy/aria/exception/AriaException;)V

    .line 148
    iget-object p1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mLoader:Lcom/arialyy/aria/core/loader/AbsNormalLoader;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->onDestroy()V

    :cond_1
    :goto_0
    return-void
.end method

.method public getCurrentLocation()J
    .locals 2

    .line 70
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mLoader:Lcom/arialyy/aria/core/loader/AbsNormalLoader;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->getCurrentProgress()J

    move-result-wide v0

    return-wide v0
.end method

.method public getFileSize()J
    .locals 2

    .line 63
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mLoader:Lcom/arialyy/aria/core/loader/AbsNormalLoader;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->getFileSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 59
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getListener()Lcom/arialyy/aria/core/listener/IEventListener;
    .locals 1

    .line 140
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    return-object v0
.end method

.method public abstract getLoader()Lcom/arialyy/aria/core/loader/AbsNormalLoader;
.end method

.method public getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;
    .locals 1

    .line 152
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    return-object v0
.end method

.method public isCancel()Z
    .locals 1

    .line 136
    iget-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->isCancel:Z

    return v0
.end method

.method public isRunning()Z
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mLoader:Lcom/arialyy/aria/core/loader/AbsNormalLoader;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->isRunning()Z

    move-result v0

    return v0
.end method

.method public isStop()Z
    .locals 1

    .line 132
    iget-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->isStop:Z

    return v0
.end method

.method protected onCancel()V
    .locals 0

    return-void
.end method

.method protected onStart()V
    .locals 0

    return-void
.end method

.method protected onStop()V
    .locals 0

    return-void
.end method

.method public setParams(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/listener/IEventListener;)Lcom/arialyy/aria/core/inf/IUtil;
    .locals 0

    .line 42
    iput-object p1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    .line 43
    iput-object p2, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    .line 44
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->getLoader()Lcom/arialyy/aria/core/loader/AbsNormalLoader;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mLoader:Lcom/arialyy/aria/core/loader/AbsNormalLoader;

    return-object p0
.end method

.method public start()V
    .locals 2

    .line 107
    iget-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->isStop:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->isCancel:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    invoke-interface {v0}, Lcom/arialyy/aria/core/listener/IEventListener;->onPre()V

    .line 122
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->BuildLoaderStructure()Lcom/arialyy/aria/core/loader/LoaderStructure;

    .line 123
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mLoader:Lcom/arialyy/aria/core/loader/AbsNormalLoader;

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 124
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->onStart()V

    return-void

    .line 108
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->TAG:Ljava/lang/String;

    const-string v1, "\u542f\u52a8\u4efb\u52a1\u5931\u8d25\uff0c\u4efb\u52a1\u5df2\u505c\u6b62\u6216\u5df2\u53d6\u6d88"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public stop()V
    .locals 1

    const/4 v0, 0x1

    .line 94
    iput-boolean v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->isStop:Z

    .line 95
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->mLoader:Lcom/arialyy/aria/core/loader/AbsNormalLoader;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->stop()V

    .line 96
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;->onStop()V

    return-void
.end method
