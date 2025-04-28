.class public Lcom/arialyy/aria/core/command/ResumeThread;
.super Ljava/lang/Object;
.source "ResumeThread.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private TAG:Ljava/lang/String;

.field private isDownloadCmd:Z

.field private mWaitList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private sqlCondition:Ljava/lang/String;


# direct methods
.method constructor <init>(ZLjava/lang/String;)V
    .locals 1

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 47
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/command/ResumeThread;->TAG:Ljava/lang/String;

    .line 48
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/command/ResumeThread;->mWaitList:Ljava/util/List;

    .line 53
    iput-boolean p1, p0, Lcom/arialyy/aria/core/command/ResumeThread;->isDownloadCmd:Z

    .line 54
    iput-object p2, p0, Lcom/arialyy/aria/core/command/ResumeThread;->sqlCondition:Ljava/lang/String;

    return-void
.end method

.method private addResumeEntity(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V
    .locals 1

    if-eqz p1, :cond_1

    .line 104
    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 107
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/command/ResumeThread;->mWaitList:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_1
    :goto_0
    return-void
.end method

.method private findTaskData(I)V
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p1, v1, :cond_0

    .line 64
    const-class p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    new-array v2, v1, [Ljava/lang/String;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/arialyy/aria/core/command/ResumeThread;->sqlCondition:Ljava/lang/String;

    aput-object v3, v1, v0

    const-string v3, "NOT(isGroupChild) AND NOT(isComplete) AND %s ORDER BY stopTime DESC"

    .line 66
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v0

    .line 65
    invoke-static {p1, v2}, Lcom/arialyy/aria/orm/DbEntity;->findDatas(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 68
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 69
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 70
    invoke-static {}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getInstance()Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    move-result-object v1

    const-class v2, Lcom/arialyy/aria/core/download/DTaskWrapper;

    .line 71
    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getId()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getNormalTaskWrapper(Ljava/lang/Class;J)Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    .line 70
    invoke-direct {p0, v0}, Lcom/arialyy/aria/core/command/ResumeThread;->addResumeEntity(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    goto :goto_0

    :cond_0
    const/4 v2, 0x2

    const-string v3, "NOT(isComplete) AND %s ORDER BY stopTime DESC"

    if-ne p1, v2, :cond_1

    .line 75
    const-class p1, Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    new-array v2, v1, [Ljava/lang/String;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/arialyy/aria/core/command/ResumeThread;->sqlCondition:Ljava/lang/String;

    aput-object v4, v1, v0

    .line 77
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v0

    .line 76
    invoke-static {p1, v2}, Lcom/arialyy/aria/orm/DbEntity;->findDatas(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 79
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 80
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    .line 82
    invoke-static {}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getInstance()Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    move-result-object v1

    const-class v2, Lcom/arialyy/aria/core/download/DGTaskWrapper;

    .line 83
    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getId()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getGroupWrapper(Ljava/lang/Class;J)Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    .line 81
    invoke-direct {p0, v0}, Lcom/arialyy/aria/core/command/ResumeThread;->addResumeEntity(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    goto :goto_1

    :cond_1
    const/4 v2, 0x3

    if-ne p1, v2, :cond_2

    .line 87
    const-class p1, Lcom/arialyy/aria/core/upload/UploadEntity;

    new-array v2, v1, [Ljava/lang/String;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/arialyy/aria/core/command/ResumeThread;->sqlCondition:Ljava/lang/String;

    aput-object v4, v1, v0

    .line 89
    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v2, v0

    .line 88
    invoke-static {p1, v2}, Lcom/arialyy/aria/orm/DbEntity;->findDatas(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 91
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_2

    .line 92
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    .line 93
    invoke-static {}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getInstance()Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    move-result-object v1

    const-class v2, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    .line 94
    invoke-virtual {v0}, Lcom/arialyy/aria/core/upload/UploadEntity;->getId()J

    move-result-wide v3

    invoke-virtual {v1, v2, v3, v4}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getNormalTaskWrapper(Ljava/lang/Class;J)Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    .line 93
    invoke-direct {p0, v0}, Lcom/arialyy/aria/core/command/ResumeThread;->addResumeEntity(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    goto :goto_2

    :cond_2
    return-void
.end method

.method private handleWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V
    .locals 2

    .line 171
    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getRequestType()I

    move-result v0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    const/4 v1, 0x6

    if-eq v0, v1, :cond_0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    .line 175
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    .line 177
    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsEntity;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->getFtpUrlInfo(Ljava/lang/String;)Lcom/arialyy/aria/core/FtpUrlEntity;

    move-result-object p1

    const-string v1, "urlEntity"

    .line 176
    invoke-virtual {v0, v1, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Ljava/lang/String;Ljava/lang/Object;)Lcom/arialyy/aria/core/TaskOptionParams;

    :cond_1
    return-void
.end method

.method private resumeWaitTask()V
    .locals 7

    .line 115
    iget-object v0, p0, Lcom/arialyy/aria/core/command/ResumeThread;->mWaitList:Ljava/util/List;

    if-eqz v0, :cond_b

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_3

    .line 118
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 120
    iget-object v1, p0, Lcom/arialyy/aria/core/command/ResumeThread;->mWaitList:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_a

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    const/4 v3, 0x0

    .line 122
    instance-of v4, v2, Lcom/arialyy/aria/core/download/DTaskWrapper;

    if-eqz v4, :cond_1

    .line 123
    invoke-static {}, Lcom/arialyy/aria/core/queue/DTaskQueue;->getInstance()Lcom/arialyy/aria/core/queue/DTaskQueue;

    move-result-object v3

    goto :goto_1

    .line 124
    :cond_1
    instance-of v4, v2, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    if-eqz v4, :cond_2

    .line 125
    invoke-static {}, Lcom/arialyy/aria/core/queue/UTaskQueue;->getInstance()Lcom/arialyy/aria/core/queue/UTaskQueue;

    move-result-object v3

    goto :goto_1

    .line 126
    :cond_2
    instance-of v4, v2, Lcom/arialyy/aria/core/download/DGTaskWrapper;

    if-eqz v4, :cond_3

    .line 127
    invoke-static {}, Lcom/arialyy/aria/core/queue/DGroupTaskQueue;->getInstance()Lcom/arialyy/aria/core/queue/DGroupTaskQueue;

    move-result-object v3

    :cond_3
    :goto_1
    if-nez v3, :cond_4

    .line 131
    iget-object v2, p0, Lcom/arialyy/aria/core/command/ResumeThread;->TAG:Ljava/lang/String;

    const-string v3, "\u4efb\u52a1\u7c7b\u578b\u9519\u8bef"

    invoke-static {v2, v3}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 135
    :cond_4
    invoke-virtual {v2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v4

    if-eqz v4, :cond_9

    invoke-virtual {v2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_5

    goto :goto_2

    .line 140
    :cond_5
    invoke-virtual {v2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v4

    if-eqz v4, :cond_6

    .line 142
    iget-object v2, p0, Lcom/arialyy/aria/core/command/ResumeThread;->TAG:Ljava/lang/String;

    const-string v3, "\u4efb\u52a1\u5df2\u5b58\u5728"

    invoke-static {v2, v3}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 146
    :cond_6
    invoke-virtual {v3}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getMaxTaskNum()I

    move-result v4

    .line 147
    invoke-virtual {v3, v2}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v5

    if-nez v5, :cond_7

    goto :goto_0

    .line 152
    :cond_7
    invoke-direct {p0, v2}, Lcom/arialyy/aria/core/command/ResumeThread;->handleWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    .line 154
    invoke-virtual {v3}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->getCurrentExePoolNum()I

    move-result v6

    if-ge v6, v4, :cond_8

    .line 155
    invoke-virtual {v3, v5}, Lcom/arialyy/aria/core/queue/AbsTaskQueue;->startTask(Lcom/arialyy/aria/core/task/AbsTask;)V

    goto :goto_0

    .line 157
    :cond_8
    invoke-virtual {v2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v3

    const/4 v4, 0x3

    invoke-virtual {v3, v4}, Lcom/arialyy/aria/core/common/AbsEntity;->setState(I)V

    .line 158
    invoke-direct {p0, v5}, Lcom/arialyy/aria/core/command/ResumeThread;->sendWaitState(Lcom/arialyy/aria/core/task/AbsTask;)V

    .line 159
    invoke-virtual {v2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 136
    :cond_9
    :goto_2
    iget-object v2, p0, Lcom/arialyy/aria/core/command/ResumeThread;->TAG:Ljava/lang/String;

    const-string v3, "\u4efb\u52a1\u5b9e\u4f53\u4e3a\u7a7a\u6216key\u4e3a\u7a7a"

    invoke-static {v2, v3}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 162
    :cond_a
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_b

    .line 163
    invoke-static {v0}, Lcom/arialyy/aria/orm/DbEntity;->updateManyData(Ljava/util/List;)V

    :cond_b
    :goto_3
    return-void
.end method

.method private sendWaitState(Lcom/arialyy/aria/core/task/AbsTask;)V
    .locals 2

    if-eqz p1, :cond_0

    .line 186
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setState(I)V

    .line 187
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getOutHandler()Landroid/os/Handler;

    move-result-object v0

    const/16 v1, 0xa

    invoke-virtual {v0, v1, p1}, Landroid/os/Handler;->obtainMessage(ILjava/lang/Object;)Landroid/os/Message;

    move-result-object p1

    invoke-virtual {p1}, Landroid/os/Message;->sendToTarget()V

    :cond_0
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 192
    iget-boolean v0, p0, Lcom/arialyy/aria/core/command/ResumeThread;->isDownloadCmd:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    .line 193
    invoke-direct {p0, v0}, Lcom/arialyy/aria/core/command/ResumeThread;->findTaskData(I)V

    const/4 v0, 0x2

    .line 194
    invoke-direct {p0, v0}, Lcom/arialyy/aria/core/command/ResumeThread;->findTaskData(I)V

    goto :goto_0

    :cond_0
    const/4 v0, 0x3

    .line 196
    invoke-direct {p0, v0}, Lcom/arialyy/aria/core/command/ResumeThread;->findTaskData(I)V

    .line 198
    :goto_0
    invoke-direct {p0}, Lcom/arialyy/aria/core/command/ResumeThread;->resumeWaitTask()V

    return-void
.end method
