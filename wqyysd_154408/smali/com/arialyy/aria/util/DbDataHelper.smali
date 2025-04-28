.class public Lcom/arialyy/aria/util/DbDataHelper;
.super Ljava/lang/Object;
.source "DbDataHelper.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static createDGSubTaskWrapper(Lcom/arialyy/aria/core/download/DownloadGroupEntity;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/arialyy/aria/core/download/DownloadGroupEntity;",
            ")",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/download/DTaskWrapper;",
            ">;"
        }
    .end annotation

    .line 146
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 147
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getSubEntities()Ljava/util/List;

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

    .line 148
    new-instance v3, Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-direct {v3, v2}, Lcom/arialyy/aria/core/download/DTaskWrapper;-><init>(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    .line 149
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setGroupHash(Ljava/lang/String;)V

    const/4 v2, 0x1

    .line 150
    invoke-virtual {v3, v2}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setGroupTask(Z)V

    .line 151
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_0
    return-object v0
.end method

.method public static createHttpSubTask(Ljava/lang/String;Ljava/util/List;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/download/DownloadEntity;",
            ">;"
        }
    .end annotation

    .line 101
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 102
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    .line 103
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 104
    new-instance v4, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-direct {v4}, Lcom/arialyy/aria/core/download/DownloadEntity;-><init>()V

    .line 105
    invoke-virtual {v4, v3}, Lcom/arialyy/aria/core/download/DownloadEntity;->setUrl(Ljava/lang/String;)V

    .line 106
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "_"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/arialyy/aria/core/download/DownloadEntity;->setFilePath(Ljava/lang/String;)Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 107
    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v5

    const-string v6, "?"

    .line 109
    invoke-virtual {v3, v6}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v6

    if-ltz v6, :cond_0

    if-ge v6, v5, :cond_1

    .line 111
    :cond_0
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v6

    :cond_1
    add-int/lit8 v5, v5, 0x1

    .line 112
    invoke-virtual {v3, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Lcom/arialyy/aria/core/download/DownloadEntity;->setFileName(Ljava/lang/String;)V

    .line 113
    invoke-virtual {v4, p0}, Lcom/arialyy/aria/core/download/DownloadEntity;->setGroupHash(Ljava/lang/String;)V

    const/4 v3, 0x1

    .line 114
    invoke-virtual {v4, v3}, Lcom/arialyy/aria/core/download/DownloadEntity;->setGroupChild(Z)V

    .line 115
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    return-object v0
.end method

.method public static getDGEntity(J)Lcom/arialyy/aria/core/download/DownloadGroupEntity;
    .locals 4

    .line 90
    const-class v0, Lcom/arialyy/aria/core/download/DGEntityWrapper;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "DownloadGroupEntity.rowid=?"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 92
    invoke-static {p0, p1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    const/4 p1, 0x1

    aput-object p0, v1, p1

    .line 91
    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->findRelationData(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 94
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/core/download/DGEntityWrapper;

    iget-object p0, p0, Lcom/arialyy/aria/core/download/DGEntityWrapper;->groupEntity:Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    return-object p0
.end method

.method public static getDGEntityByHash(Ljava/lang/String;)Lcom/arialyy/aria/core/download/DownloadGroupEntity;
    .locals 4

    .line 62
    const-class v0, Lcom/arialyy/aria/core/download/DGEntityWrapper;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "DownloadGroupEntity.groupHash=?"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p0, v1, v2

    .line 63
    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->findRelationData(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 66
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/core/download/DGEntityWrapper;

    iget-object p0, p0, Lcom/arialyy/aria/core/download/DGEntityWrapper;->groupEntity:Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    return-object p0
.end method

.method public static getDGEntityByPath(Ljava/lang/String;)Lcom/arialyy/aria/core/download/DownloadGroupEntity;
    .locals 4

    .line 76
    const-class v0, Lcom/arialyy/aria/core/download/DGEntityWrapper;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "DownloadGroupEntity.dirPath=?"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p0, v1, v2

    .line 77
    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->findRelationData(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 80
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/core/download/DGEntityWrapper;

    iget-object p0, p0, Lcom/arialyy/aria/core/download/DGEntityWrapper;->groupEntity:Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    return-object p0
.end method

.method public static getOrCreateFtpDGEntity(Ljava/lang/String;)Lcom/arialyy/aria/core/download/DownloadGroupEntity;
    .locals 4

    .line 126
    const-class v0, Lcom/arialyy/aria/core/download/DGEntityWrapper;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "DownloadGroupEntity.groupHash=?"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p0, v1, v2

    .line 127
    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->findRelationData(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 130
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 131
    invoke-interface {v0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DGEntityWrapper;

    iget-object v0, v0, Lcom/arialyy/aria/core/download/DGEntityWrapper;->groupEntity:Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    if-nez v0, :cond_1

    .line 133
    new-instance v0, Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    invoke-direct {v0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;-><init>()V

    goto :goto_0

    .line 136
    :cond_0
    new-instance v0, Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    invoke-direct {v0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;-><init>()V

    .line 138
    :cond_1
    :goto_0
    invoke-virtual {v0, p0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->setGroupHash(Ljava/lang/String;)V

    return-object v0
.end method

.method public static getTaskRecord(Ljava/lang/String;I)Lcom/arialyy/aria/core/TaskRecord;
    .locals 7

    .line 43
    const-class v0, Lcom/arialyy/aria/core/TaskRecord;

    const/4 v1, 0x3

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "filePath=? AND taskType=?"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p0, v2, v3

    .line 45
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    aput-object v5, v2, v6

    .line 44
    invoke-static {v0, v2}, Lcom/arialyy/aria/orm/DbEntity;->findFirst(Ljava/lang/Class;[Ljava/lang/String;)Lcom/arialyy/aria/orm/DbEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/TaskRecord;

    if-eqz v0, :cond_0

    .line 47
    const-class v2, Lcom/arialyy/aria/core/ThreadRecord;

    new-array v1, v1, [Ljava/lang/String;

    const-string v5, "taskKey=? AND threadType=?"

    aput-object v5, v1, v4

    aput-object p0, v1, v3

    .line 49
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    aput-object p0, v1, v6

    .line 48
    invoke-static {v2, v1}, Lcom/arialyy/aria/orm/DbEntity;->findDatas(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    iput-object p0, v0, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    :cond_0
    return-object v0
.end method
