.class Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;
.super Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;
.source "HttpGroupConfigHandler.java"


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


# instance fields
.field private mSubNameTemp:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private mUrls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/inf/AbsTarget;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTARGET;J)V"
        }
    .end annotation

    .line 47
    invoke-direct {p0, p1, p2, p3}, Lcom/arialyy/aria/core/download/target/AbsGroupConfigHandler;-><init>(Lcom/arialyy/aria/core/inf/AbsTarget;J)V

    .line 39
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mUrls:Ljava/util/List;

    .line 44
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mSubNameTemp:Ljava/util/List;

    .line 48
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mUrls:Ljava/util/List;

    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object p2

    invoke-virtual {p2}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getUrls()Ljava/util/List;

    move-result-object p2

    invoke-interface {p1, p2}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    return-void
.end method


# virtual methods
.method setGroupUrl(Ljava/util/List;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    if-eqz p1, :cond_1

    .line 52
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 55
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mUrls:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 56
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mUrls:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 57
    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->getMd5Code(Ljava/util/List;)Ljava/lang/String;

    move-result-object v0

    .line 58
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->setGroupHash(Ljava/lang/String;)V

    .line 59
    iget-object v1, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mUrls:Ljava/util/List;

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/DbDataHelper;->createHttpSubTask(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 60
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 61
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/arialyy/aria/core/download/DownloadEntity;

    const/4 v4, 0x1

    .line 62
    invoke-virtual {v3, v4}, Lcom/arialyy/aria/core/download/DownloadEntity;->setTaskType(I)V

    .line 63
    new-instance v4, Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-direct {v4, v3}, Lcom/arialyy/aria/core/download/DTaskWrapper;-><init>(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 65
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object v2

    invoke-virtual {v2, p1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->setUrls(Ljava/util/List;)V

    .line 66
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->setSubEntities(Ljava/util/List;)V

    .line 67
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getTaskWrapper()Lcom/arialyy/aria/core/download/DGTaskWrapper;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->setSubTaskWrapper(Ljava/util/List;)V

    return-void

    .line 53
    :cond_1
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "\u7ec4\u5408\u4efb\u52a1\u5b50\u4efb\u52a1\u4e0b\u8f7d\u5730\u5740\u5217\u8868\u4e3a\u7a7a"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method setSubFileName(Ljava/util/List;)Lcom/arialyy/aria/core/inf/AbsTarget;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)TTARGET;"
        }
    .end annotation

    if-eqz p1, :cond_2

    .line 74
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 78
    :cond_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getTaskWrapper()Lcom/arialyy/aria/core/download/DGTaskWrapper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->getSubTaskWrapper()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-eq v0, v1, :cond_1

    .line 79
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->TAG:Ljava/lang/String;

    const-string v0, "\u4fee\u6539\u5b50\u4efb\u52a1\u7684\u6587\u4ef6\u540d\u5931\u8d25\uff1a\u5b50\u4efb\u52a1\u6587\u4ef6\u540d\u5217\u8868\u6570\u91cf\u548c\u5b50\u4efb\u52a1\u7684\u6570\u91cf\u4e0d\u5339\u914d"

    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 80
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getTarget()Lcom/arialyy/aria/core/inf/AbsTarget;

    move-result-object p1

    return-object p1

    .line 82
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mSubNameTemp:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 83
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mSubNameTemp:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 84
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getTaskWrapper()Lcom/arialyy/aria/core/download/DGTaskWrapper;

    move-result-object p1

    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mSubNameTemp:Ljava/util/List;

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->setSubNameTemp(Ljava/util/List;)V

    .line 85
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getTarget()Lcom/arialyy/aria/core/inf/AbsTarget;

    move-result-object p1

    return-object p1

    .line 75
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->TAG:Ljava/lang/String;

    const-string v0, "\u4fee\u6539\u5b50\u4efb\u52a1\u7684\u6587\u4ef6\u540d\u5931\u8d25\uff1a\u5217\u8868\u4e3anull"

    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getTarget()Lcom/arialyy/aria/core/inf/AbsTarget;

    move-result-object p1

    return-object p1
.end method

.method updateUrls(Ljava/util/List;)Lcom/arialyy/aria/core/inf/AbsTarget;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)TTARGET;"
        }
    .end annotation

    if-eqz p1, :cond_3

    .line 94
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_3

    .line 97
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mUrls:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ne v0, v1, :cond_2

    .line 100
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mUrls:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 101
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mUrls:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 102
    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->getMd5Code(Ljava/util/List;)Ljava/lang/String;

    move-result-object p1

    .line 103
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mUrls:Ljava/util/List;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->setUrls(Ljava/util/List;)V

    .line 104
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->setGroupHash(Ljava/lang/String;)V

    .line 105
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->update()V

    .line 106
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getSubEntities()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getSubEntities()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 108
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getSubEntities()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 109
    iget-object v3, p0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->mUrls:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {v2, v3}, Lcom/arialyy/aria/core/download/DownloadEntity;->setUrl(Ljava/lang/String;)V

    .line 110
    invoke-virtual {v2, p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->setGroupHash(Ljava/lang/String;)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 113
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getEntity()Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getSubEntities()Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lcom/arialyy/aria/orm/DbEntity;->updateManyData(Ljava/util/List;)V

    .line 115
    :cond_1
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getTarget()Lcom/arialyy/aria/core/inf/AbsTarget;

    move-result-object p1

    return-object p1

    .line 98
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u65b0\u4e0b\u8f7d\u5730\u5740\u6570\u91cf\u548c\u65e7\u4e0b\u8f7d\u5730\u5740\u6570\u91cf\u4e0d\u4e00\u81f4"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 95
    :cond_3
    new-instance p1, Ljava/lang/NullPointerException;

    const-string v0, "\u4e0b\u8f7d\u5730\u5740\u5217\u8868\u4e3a\u7a7a"

    invoke-direct {p1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
