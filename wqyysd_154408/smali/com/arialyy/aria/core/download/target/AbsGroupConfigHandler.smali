.class abstract Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;
.super Ljava/lang/Object;
.source "AbsGroupConfigHandler.java"

# interfaces
.implements Lcom/arialyy/aria/core/inf/IConfigHandler;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TARGET:",
        "Lcom/arialyy/aria/core/inf/AbsTarget;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/arialyy/aria/core/inf/IConfigHandler;"
    }
.end annotation


# instance fields
.field protected TAG:Ljava/lang/String;

.field private mSubTaskManager:Lcom/arialyy/aria/core/manager/SubTaskManager;

.field private mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TTARGET;"
        }
    .end annotation
.end field

.field private mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/inf/AbsTarget;J)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTARGET;J)V"
        }
    .end annotation

    .line 43
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 44
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->TAG:Ljava/lang/String;

    .line 45
    iput-object p1, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    .line 46
    invoke-static {}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getInstance()Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    move-result-object p1

    const-class v0, Lcom/arialyy/aria/core/download/DGTaskWrapper;

    invoke-virtual {p1, v0, p2, p3}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getGroupWrapper(Ljava/lang/Class;J)Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/download/DGTaskWrapper;

    iput-object p1, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;

    .line 48
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    instance-of v0, v0, Lcom/arialyy/aria/core/common/AbsNormalTarget;

    if-eqz v0, :cond_1

    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-gez v2, :cond_0

    .line 50
    new-instance v0, Lcom/arialyy/aria/core/event/ErrorEvent;

    const-string v1, "\u4efb\u52a1id\u4e3a\u7a7a"

    invoke-direct {v0, p2, p3, v1}, Lcom/arialyy/aria/core/event/ErrorEvent;-><init>(JLjava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->setErrorEvent(Lcom/arialyy/aria/core/event/ErrorEvent;)V

    goto :goto_0

    .line 51
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getId()J

    move-result-wide v2

    cmp-long p1, v2, v0

    if-gez p1, :cond_1

    .line 52
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;

    new-instance v0, Lcom/arialyy/aria/core/event/ErrorEvent;

    const-string v1, "\u4efb\u52a1\u4fe1\u606f\u4e0d\u5b58\u5728"

    invoke-direct {v0, p2, p3, v1}, Lcom/arialyy/aria/core/event/ErrorEvent;-><init>(JLjava/lang/String;)V

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->setErrorEvent(Lcom/arialyy/aria/core/event/ErrorEvent;)V

    .line 56
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    iget-object p2, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/inf/AbsTarget;->setTaskWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    .line 57
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 58
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->getTaskWrapper()Lcom/arialyy/aria/core/download/DGTaskWrapper;

    move-result-object p1

    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object p2

    invoke-virtual {p2}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getDirPath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->setDirPathTemp(Ljava/lang/String;)V

    :cond_2
    return-void
.end method


# virtual methods
.method public bridge synthetic getEntity()Lcom/arialyy/aria/core/common/AbsEntity;
    .locals 1

    .line 36
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object v0

    return-object v0
.end method

.method public getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;
    .locals 1

    .line 95
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    return-object v0
.end method

.method getSubTaskManager()Lcom/arialyy/aria/core/manager/SubTaskManager;
    .locals 2

    .line 68
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mSubTaskManager:Lcom/arialyy/aria/core/manager/SubTaskManager;

    if-nez v0, :cond_0

    .line 69
    new-instance v0, Lcom/arialyy/aria/core/manager/SubTaskManager;

    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->getTaskWrapper()Lcom/arialyy/aria/core/download/DGTaskWrapper;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/arialyy/aria/core/manager/SubTaskManager;-><init>(Lcom/arialyy/aria/core/download/DGTaskWrapper;)V

    iput-object v0, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mSubTaskManager:Lcom/arialyy/aria/core/manager/SubTaskManager;

    .line 71
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mSubTaskManager:Lcom/arialyy/aria/core/manager/SubTaskManager;

    return-object v0
.end method

.method getTarget()Lcom/arialyy/aria/core/inf/AbsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TTARGET;"
        }
    .end annotation

    .line 108
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    return-object v0
.end method

.method getTaskWrapper()Lcom/arialyy/aria/core/download/DGTaskWrapper;
    .locals 1

    .line 104
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;

    return-object v0
.end method

.method public isRunning()Z
    .locals 2

    .line 85
    invoke-static {}, Lcom/arialyy/aria/core/queue/DGroupTaskQueue;->getInstance()Lcom/arialyy/aria/core/queue/DGroupTaskQueue;

    move-result-object v0

    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/queue/DGroupTaskQueue;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/task/DownloadGroupTask;

    if-eqz v0, :cond_0

    .line 86
    invoke-virtual {v0}, Lcom/arialyy/aria/core/task/DownloadGroupTask;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method setDirPath(Ljava/lang/String;)Lcom/arialyy/aria/core/inf/AbsTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TTARGET;"
        }
    .end annotation

    .line 90
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->setDirPathTemp(Ljava/lang/String;)V

    .line 91
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    return-object p1
.end method

.method setGroupAlias(Ljava/lang/String;)V
    .locals 1

    .line 78
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 81
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->setAlias(Ljava/lang/String;)V

    return-void
.end method

.method public taskExists()Z
    .locals 6

    .line 99
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getId()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const-class v0, Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "rowid=?"

    aput-object v4, v3, v2

    .line 100
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getId()J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v1

    .line 99
    invoke-static {v0, v3}, Lcom/arialyy/aria/orm/DbEntity;->checkDataExist(Ljava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    return v1
.end method
