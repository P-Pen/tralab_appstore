.class Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;
.super Ljava/lang/Object;
.source "UNormalConfigHandler.java"

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
.field private mEntity:Lcom/arialyy/aria/core/upload/UploadEntity;

.field private mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TTARGET;"
        }
    .end annotation
.end field

.field private mWrapper:Lcom/arialyy/aria/core/upload/UTaskWrapper;


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/inf/AbsTarget;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTARGET;J)V"
        }
    .end annotation

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 42
    iput-object p1, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    .line 43
    invoke-direct {p0, p2, p3}, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->initTarget(J)V

    return-void
.end method

.method private getTaskWrapper()Lcom/arialyy/aria/core/upload/UTaskWrapper;
    .locals 1

    .line 87
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mWrapper:Lcom/arialyy/aria/core/upload/UTaskWrapper;

    return-object v0
.end method

.method private initTarget(J)V
    .locals 5

    .line 47
    invoke-static {}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getInstance()Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    move-result-object v0

    const-class v1, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    invoke-virtual {v0, v1, p1, p2}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getNormalTaskWrapper(Ljava/lang/Class;J)Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    iput-object v0, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mWrapper:Lcom/arialyy/aria/core/upload/UTaskWrapper;

    .line 49
    iget-object v1, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    instance-of v1, v1, Lcom/arialyy/aria/core/common/AbsNormalTarget;

    if-eqz v1, :cond_1

    const-wide/16 v1, 0x0

    cmp-long v3, p1, v1

    if-gez v3, :cond_0

    .line 51
    new-instance v1, Lcom/arialyy/aria/core/event/ErrorEvent;

    const-string v2, "\u4efb\u52a1id\u4e3a\u7a7a"

    invoke-direct {v1, p1, p2, v2}, Lcom/arialyy/aria/core/event/ErrorEvent;-><init>(JLjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/upload/UTaskWrapper;->setErrorEvent(Lcom/arialyy/aria/core/event/ErrorEvent;)V

    goto :goto_0

    .line 52
    :cond_0
    invoke-virtual {v0}, Lcom/arialyy/aria/core/upload/UTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/upload/UploadEntity;->getId()J

    move-result-wide v3

    cmp-long v0, v3, v1

    if-gez v0, :cond_1

    .line 53
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mWrapper:Lcom/arialyy/aria/core/upload/UTaskWrapper;

    new-instance v1, Lcom/arialyy/aria/core/event/ErrorEvent;

    const-string v2, "\u4efb\u52a1\u4fe1\u606f\u4e0d\u5b58\u5728"

    invoke-direct {v1, p1, p2, v2}, Lcom/arialyy/aria/core/event/ErrorEvent;-><init>(JLjava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/upload/UTaskWrapper;->setErrorEvent(Lcom/arialyy/aria/core/event/ErrorEvent;)V

    .line 57
    :cond_1
    :goto_0
    iget-object p1, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mWrapper:Lcom/arialyy/aria/core/upload/UTaskWrapper;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/upload/UTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/upload/UploadEntity;

    iput-object p1, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/upload/UploadEntity;

    .line 58
    iget-object p1, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mTarget:Lcom/arialyy/aria/core/inf/AbsTarget;

    iget-object p2, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mWrapper:Lcom/arialyy/aria/core/upload/UTaskWrapper;

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/inf/AbsTarget;->setTaskWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    .line 59
    invoke-direct {p0}, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->getTaskWrapper()Lcom/arialyy/aria/core/upload/UTaskWrapper;

    move-result-object p1

    iget-object p2, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/upload/UploadEntity;

    invoke-virtual {p2}, Lcom/arialyy/aria/core/upload/UploadEntity;->getUrl()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/upload/UTaskWrapper;->setTempUrl(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public getEntity()Lcom/arialyy/aria/core/common/AbsEntity;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/upload/UploadEntity;

    return-object v0
.end method

.method public isRunning()Z
    .locals 2

    .line 78
    invoke-static {}, Lcom/arialyy/aria/core/queue/UTaskQueue;->getInstance()Lcom/arialyy/aria/core/queue/UTaskQueue;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/upload/UploadEntity;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/upload/UploadEntity;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/queue/UTaskQueue;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/task/UploadTask;

    if-eqz v0, :cond_0

    .line 79
    invoke-virtual {v0}, Lcom/arialyy/aria/core/task/UploadTask;->isRunning()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method setFilePath(Ljava/lang/String;)V
    .locals 2

    .line 63
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 64
    iget-object v1, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/upload/UploadEntity;

    invoke-virtual {v1, p1}, Lcom/arialyy/aria/core/upload/UploadEntity;->setFilePath(Ljava/lang/String;)V

    .line 65
    iget-object p1, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/upload/UploadEntity;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/arialyy/aria/core/upload/UploadEntity;->setFileName(Ljava/lang/String;)V

    .line 66
    iget-object p1, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/upload/UploadEntity;

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Lcom/arialyy/aria/core/upload/UploadEntity;->setFileSize(J)V

    return-void
.end method

.method setTempUrl(Ljava/lang/String;)V
    .locals 1

    .line 83
    invoke-direct {p0}, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->getTaskWrapper()Lcom/arialyy/aria/core/upload/UTaskWrapper;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/upload/UTaskWrapper;->setTempUrl(Ljava/lang/String;)V

    return-void
.end method

.method public taskExists()Z
    .locals 4

    .line 74
    const-class v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "key=?"

    aput-object v3, v1, v2

    iget-object v2, p0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->mEntity:Lcom/arialyy/aria/core/upload/UploadEntity;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/upload/UploadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->checkDataExist(Ljava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    return v0
.end method
