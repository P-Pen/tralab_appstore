.class Lcom/arialyy/aria/core/download/target/FtpDirConfigHandler;
.super Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;
.source "FtpDirConfigHandler.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TARGET:",
        "Lcom/arialyy/aria/core/inf/AbsTarget;",
        ">",
        "Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler<",
        "TTARGET;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/inf/AbsTarget;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTARGET;J)V"
        }
    .end annotation

    .line 33
    invoke-direct {p0, p1, p2, p3}, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;-><init>(Lcom/arialyy/aria/core/inf/AbsTarget;J)V

    .line 34
    invoke-direct {p0}, Lcom/arialyy/aria/core/download/target/FtpDirConfigHandler;->init()V

    return-void
.end method

.method private init()V
    .locals 3

    .line 38
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpDirConfigHandler;->getTaskWrapper()Lcom/arialyy/aria/core/download/DGTaskWrapper;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->setRequestType(I)V

    .line 39
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpDirConfigHandler;->getTaskWrapper()Lcom/arialyy/aria/core/download/DGTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->getSubTaskWrapper()Ljava/util/List;

    move-result-object v0

    .line 40
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 41
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    const/4 v2, 0x3

    .line 42
    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setRequestType(I)V

    .line 43
    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/download/DownloadEntity;->setTaskType(I)V

    goto :goto_0

    :cond_0
    return-void
.end method
