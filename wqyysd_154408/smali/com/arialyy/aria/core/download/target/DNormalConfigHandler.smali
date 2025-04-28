.class Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;
.super Ljava/lang/Object;
.source "DNormalConfigHandler.java"

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
.field private final TAG:Ljava/lang/String;

.field private mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

.field private mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TTARGET;"
        }
    .end annotation
.end field

.field private mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/inf/AbsTarget;J)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTARGET;J)V"
        }
    .end annotation

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "DNormalDelegate"

    .line 35
    iput-object v0, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->TAG:Ljava/lang/String;

    .line 45
    iput-object p1, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    .line 46
    invoke-direct {p0, p2, p3}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->initTarget(J)V

    return-void
.end method

.method private getWrapper()Lcom/arialyy/aria/core/download/DTaskWrapper;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    return-object v0
.end method

.method private initTarget(J)V
    .locals 5

    .line 50
    invoke-static {}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getInstance()Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    move-result-object v0

    const-class v1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v0, v1, p1, p2}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getNormalTaskWrapper(Ljava/lang/Class;J)Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DTaskWrapper;

    iput-object v0, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    .line 52
    iget-object v1, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    instance-of v1, v1, Lcom/arialyy/aria/core/common/AbsNormalTarget;

    if-eqz v1, :cond_1

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-gez v3, :cond_0

    .line 54
    new-instance v1, Lcom/arialyy/aria/core/event/ErrorEvent;

    const-string v2, "\u4efb\u52a1id\u4e3a\u7a7a"

    invoke-direct {v1, p1, p2, v2}, Lcom/arialyy/aria/core/event/ErrorEvent;-><init>(JLjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setErrorEvent(Lcom/arialyy/aria/core/event/ErrorEvent;)V

    goto :goto_0

    .line 55
    :cond_0
    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getId()J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-gez v0, :cond_1

    .line 56
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    new-instance v1, Lcom/arialyy/aria/core/event/ErrorEvent;

    const-string v2, "\u4efb\u52a1\u4fe1\u606f\u4e0d\u5b58\u5728"

    invoke-direct {v1, p1, p2, v2}, Lcom/arialyy/aria/core/event/ErrorEvent;-><init>(JLjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setErrorEvent(Lcom/arialyy/aria/core/event/ErrorEvent;)V

    .line 60
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    iput-object p1, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 61
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    iget-object p2, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/inf/AbsTarget;->setTaskWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    .line 62
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    if-eqz p1, :cond_2

    .line 63
    invoke-direct {p0}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->getWrapper()Lcom/arialyy/aria/core/download/DTaskWrapper;

    move-result-object p1

    iget-object p2, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {p2}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setTempFilePath(Ljava/lang/String;)V

    :cond_2
    return-void
.end method


# virtual methods
.method public bridge synthetic getEntity()Lcom/arialyy/aria/core/common/AbsEntity;
    .locals 1

    .line 34
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v0

    return-object v0
.end method

.method public getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;
    .locals 1

    .line 83
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/inf/AbsTarget;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    return-object v0
.end method

.method getUrl()Ljava/lang/String;
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public isRunning()Z
    .locals 2

    .line 92
    invoke-static {}, Lcom/arialyy/aria/core/queue/DTaskQueue;->getInstance()Lcom/arialyy/aria/core/queue/DTaskQueue;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/queue/DTaskQueue;->taskIsRunning(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method setForceDownload(Z)V
    .locals 1

    .line 96
    invoke-direct {p0}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->getWrapper()Lcom/arialyy/aria/core/download/DTaskWrapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setIgnoreFilePathOccupy(Z)V

    return-void
.end method

.method setTempFilePath(Ljava/lang/String;)V
    .locals 1

    .line 109
    invoke-direct {p0}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->getWrapper()Lcom/arialyy/aria/core/download/DTaskWrapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setTempFilePath(Ljava/lang/String;)V

    return-void
.end method

.method setUrl(Ljava/lang/String;)V
    .locals 1

    .line 100
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->setUrl(Ljava/lang/String;)V

    .line 101
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setTempUrl(Ljava/lang/String;)V

    return-void
.end method

.method public taskExists()Z
    .locals 4

    .line 87
    const-class v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "rowid=?"

    aput-object v3, v1, v2

    iget-object v2, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 88
    invoke-virtual {v2}, Lcom/arialyy/aria/core/download/DownloadEntity;->getId()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    .line 87
    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->checkDataExist(Ljava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method updateUrl(Ljava/lang/String;)Lcom/arialyy/aria/core/inf/AbsTarget;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TTARGET;"
        }
    .end annotation

    .line 68
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "DNormalDelegate"

    if-eqz v0, :cond_0

    const-string p1, "url\u66f4\u65b0\u5931\u8d25\uff0cnewUrl\u4e3anull"

    .line 69
    invoke-static {v1, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 70
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    return-object p1

    .line 72
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string p1, "url\u66f4\u65b0\u5931\u8d25\uff0c\u65b0\u7684\u4e0b\u8f7durl\u548c\u65e7\u7684url\u4e00\u81f4"

    .line 73
    invoke-static {v1, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    return-object p1

    .line 76
    :cond_1
    invoke-direct {p0}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->getWrapper()Lcom/arialyy/aria/core/download/DTaskWrapper;

    move-result-object v0

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setRefreshInfo(Z)V

    .line 77
    invoke-direct {p0}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->getWrapper()Lcom/arialyy/aria/core/download/DTaskWrapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setTempUrl(Ljava/lang/String;)V

    const-string p1, "\u66f4\u65b0url\u6210\u529f"

    .line 78
    invoke-static {v1, p1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 79
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    return-object p1
.end method
