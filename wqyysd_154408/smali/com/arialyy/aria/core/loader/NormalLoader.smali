.class public Lcom/arialyy/aria/core/loader/NormalLoader;
.super Lcom/arialyy/aria/core/loader/AbsNormalLoader;
.source "NormalLoader.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;",
        ">",
        "Lcom/arialyy/aria/core/loader/AbsNormalLoader<",
        "TT;>;"
    }
.end annotation


# instance fields
.field protected isComplete:Z

.field private looper:Landroid/os/Looper;

.field private startThreadNum:I


# direct methods
.method public constructor <init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/listener/IEventListener;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lcom/arialyy/aria/core/listener/IEventListener;",
            ")V"
        }
    .end annotation

    .line 46
    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/listener/IEventListener;)V

    const/4 p2, 0x0

    .line 42
    iput-boolean p2, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->isComplete:Z

    .line 47
    new-instance p2, Ljava/io/File;

    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFilePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object p2, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mTempFile:Ljava/io/File;

    .line 48
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object p2

    invoke-virtual {p2, p0}, Lcom/arialyy/aria/core/event/EventMsgUtil;->register(Ljava/lang/Object;)V

    .line 49
    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getUpdateInterval()J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Lcom/arialyy/aria/core/loader/NormalLoader;->setUpdateInterval(J)V

    return-void
.end method


# virtual methods
.method public addComponent(Lcom/arialyy/aria/core/inf/IThreadStateManager;)V
    .locals 0

    .line 166
    iput-object p1, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mStateManager:Lcom/arialyy/aria/core/inf/IThreadStateManager;

    return-void
.end method

.method public addComponent(Lcom/arialyy/aria/core/loader/IInfoTask;)V
    .locals 1

    .line 153
    iput-object p1, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mInfoTask:Lcom/arialyy/aria/core/loader/IInfoTask;

    .line 154
    new-instance v0, Lcom/arialyy/aria/core/loader/NormalLoader$1;

    invoke-direct {v0, p0}, Lcom/arialyy/aria/core/loader/NormalLoader$1;-><init>(Lcom/arialyy/aria/core/loader/NormalLoader;)V

    invoke-interface {p1, v0}, Lcom/arialyy/aria/core/loader/IInfoTask;->setCallback(Lcom/arialyy/aria/core/loader/IInfoTask$Callback;)V

    return-void
.end method

.method public addComponent(Lcom/arialyy/aria/core/loader/IRecordHandler;)V
    .locals 0

    .line 144
    iput-object p1, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mRecordHandler:Lcom/arialyy/aria/core/loader/IRecordHandler;

    .line 145
    invoke-interface {p1}, Lcom/arialyy/aria/core/loader/IRecordHandler;->checkTaskCompleted()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 146
    iget-object p1, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mRecord:Lcom/arialyy/aria/core/TaskRecord;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/TaskRecord;->deleteData()V

    const/4 p1, 0x1

    .line 147
    iput-boolean p1, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->isComplete:Z

    .line 148
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getListener()Lcom/arialyy/aria/core/listener/IEventListener;

    move-result-object p1

    invoke-interface {p1}, Lcom/arialyy/aria/core/listener/IEventListener;->onComplete()V

    :cond_0
    return-void
.end method

.method public addComponent(Lcom/arialyy/aria/core/loader/IThreadTaskBuilder;)V
    .locals 0

    .line 170
    iput-object p1, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mTTBuilder:Lcom/arialyy/aria/core/loader/IThreadTaskBuilder;

    return-void
.end method

.method public getCurrentProgress()J
    .locals 2

    .line 140
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mStateManager:Lcom/arialyy/aria/core/inf/IThreadStateManager;

    invoke-interface {v0}, Lcom/arialyy/aria/core/inf/IThreadStateManager;->getCurrentProgress()J

    move-result-wide v0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getCurrentProgress()J

    move-result-wide v0

    :goto_0
    return-wide v0
.end method

.method public getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;
    .locals 1

    .line 53
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/common/AbsNormalEntity;

    return-object v0
.end method

.method public getFileSize()J
    .locals 2

    .line 57
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFileSize()J

    move-result-wide v0

    return-wide v0
.end method

.method protected getLooper()Landroid/os/Looper;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->looper:Landroid/os/Looper;

    return-object v0
.end method

.method public handleTask(Landroid/os/Looper;)V
    .locals 1

    .line 97
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->isBreak()Z

    move-result v0

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->isComplete:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 100
    :cond_0
    iput-object p1, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->looper:Landroid/os/Looper;

    .line 101
    iget-object p1, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mInfoTask:Lcom/arialyy/aria/core/loader/IInfoTask;

    invoke-interface {p1}, Lcom/arialyy/aria/core/loader/IInfoTask;->run()V

    :cond_1
    :goto_0
    return-void
.end method

.method public onDestroy()V
    .locals 1

    .line 74
    invoke-super {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoader;->onDestroy()V

    .line 75
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/arialyy/aria/core/event/EventMsgUtil;->unRegister(Ljava/lang/Object;)V

    return-void
.end method

.method protected setMaxSpeed(I)V
    .locals 3

    .line 66
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getTaskList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/task/IThreadTask;

    if-eqz v1, :cond_0

    .line 67
    iget v2, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->startThreadNum:I

    if-lez v2, :cond_0

    .line 68
    div-int v2, p1, v2

    invoke-interface {v1, v2}, Lcom/arialyy/aria/core/task/IThreadTask;->setMaxSpeed(I)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method protected startThreadTask()V
    .locals 6

    .line 105
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->isBreak()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 109
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getListener()Lcom/arialyy/aria/core/listener/IEventListener;

    move-result-object v0

    instance-of v0, v0, Lcom/arialyy/aria/core/listener/IDLoadListener;

    if-eqz v0, :cond_1

    .line 110
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getListener()Lcom/arialyy/aria/core/listener/IEventListener;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/listener/IDLoadListener;

    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFileSize()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/arialyy/aria/core/listener/IDLoadListener;->onPostPre(J)V

    .line 112
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFilePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 113
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_2

    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_2

    .line 114
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->createDir(Ljava/lang/String;)Z

    .line 117
    :cond_2
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mRecordHandler:Lcom/arialyy/aria/core/loader/IRecordHandler;

    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getFileSize()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/arialyy/aria/core/loader/IRecordHandler;->getRecord(J)Lcom/arialyy/aria/core/TaskRecord;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mRecord:Lcom/arialyy/aria/core/TaskRecord;

    .line 118
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mStateManager:Lcom/arialyy/aria/core/inf/IThreadStateManager;

    iget-object v1, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v2, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->looper:Landroid/os/Looper;

    invoke-interface {v0, v1, v2}, Lcom/arialyy/aria/core/inf/IThreadStateManager;->setLooper(Lcom/arialyy/aria/core/TaskRecord;Landroid/os/Looper;)V

    .line 119
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getTaskList()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mTTBuilder:Lcom/arialyy/aria/core/loader/IThreadTaskBuilder;

    iget-object v2, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mRecord:Lcom/arialyy/aria/core/TaskRecord;

    new-instance v3, Landroid/os/Handler;

    iget-object v4, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->looper:Landroid/os/Looper;

    iget-object v5, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mStateManager:Lcom/arialyy/aria/core/inf/IThreadStateManager;

    .line 120
    invoke-interface {v5}, Lcom/arialyy/aria/core/inf/IThreadStateManager;->getHandlerCallback()Landroid/os/Handler$Callback;

    move-result-object v5

    invoke-direct {v3, v4, v5}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 119
    invoke-interface {v1, v2, v3}, Lcom/arialyy/aria/core/loader/IThreadTaskBuilder;->buildThreadTask(Lcom/arialyy/aria/core/TaskRecord;Landroid/os/Handler;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 121
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mTTBuilder:Lcom/arialyy/aria/core/loader/IThreadTaskBuilder;

    invoke-interface {v0}, Lcom/arialyy/aria/core/loader/IThreadTaskBuilder;->getCreatedThreadNum()I

    move-result v0

    iput v0, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->startThreadNum:I

    .line 123
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mStateManager:Lcom/arialyy/aria/core/inf/IThreadStateManager;

    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getCurrentProgress()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/arialyy/aria/core/inf/IThreadStateManager;->updateCurrentProgress(J)V

    .line 124
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mStateManager:Lcom/arialyy/aria/core/inf/IThreadStateManager;

    invoke-interface {v0}, Lcom/arialyy/aria/core/inf/IThreadStateManager;->getCurrentProgress()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_3

    .line 125
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getListener()Lcom/arialyy/aria/core/listener/IEventListener;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mStateManager:Lcom/arialyy/aria/core/inf/IThreadStateManager;

    invoke-interface {v1}, Lcom/arialyy/aria/core/inf/IThreadStateManager;->getCurrentProgress()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/arialyy/aria/core/listener/IEventListener;->onResume(J)V

    goto :goto_0

    .line 127
    :cond_3
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getListener()Lcom/arialyy/aria/core/listener/IEventListener;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mStateManager:Lcom/arialyy/aria/core/inf/IThreadStateManager;

    invoke-interface {v1}, Lcom/arialyy/aria/core/inf/IThreadStateManager;->getCurrentProgress()J

    move-result-wide v1

    invoke-interface {v0, v1, v2}, Lcom/arialyy/aria/core/listener/IEventListener;->onStart(J)V

    .line 131
    :goto_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->getTaskList()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/task/IThreadTask;

    .line 132
    invoke-static {}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->getInstance()Lcom/arialyy/aria/core/manager/ThreadTaskManager;

    move-result-object v2

    iget-object v3, p0, Lcom/arialyy/aria/core/loader/NormalLoader;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->startThread(Ljava/lang/String;Lcom/arialyy/aria/core/task/IThreadTask;)V

    goto :goto_1

    .line 136
    :cond_4
    invoke-virtual {p0}, Lcom/arialyy/aria/core/loader/NormalLoader;->startTimer()V

    return-void
.end method
