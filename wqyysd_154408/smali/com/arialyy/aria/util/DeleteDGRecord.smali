.class public Lcom/arialyy/aria/util/DeleteDGRecord;
.super Ljava/lang/Object;
.source "DeleteDGRecord.java"

# interfaces
.implements Lcom/arialyy/aria/util/IDeleteRecord;


# static fields
.field private static volatile INSTANCE:Lcom/arialyy/aria/util/DeleteDGRecord;


# instance fields
.field private TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/util/DeleteDGRecord;->TAG:Ljava/lang/String;

    return-void
.end method

.method private deleteEntity(ZLjava/lang/String;)V
    .locals 5

    if-eqz p1, :cond_0

    .line 116
    const-class p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "groupHash=?"

    aput-object v3, v1, v2

    const/4 v4, 0x1

    aput-object p2, v1, v4

    invoke-static {p1, v1}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    .line 117
    const-class p1, Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    new-array v0, v0, [Ljava/lang/String;

    aput-object v3, v0, v2

    aput-object p2, v0, v4

    invoke-static {p1, v0}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static getInstance()Lcom/arialyy/aria/util/DeleteDGRecord;
    .locals 2

    .line 42
    sget-object v0, Lcom/arialyy/aria/util/DeleteDGRecord;->INSTANCE:Lcom/arialyy/aria/util/DeleteDGRecord;

    if-nez v0, :cond_1

    .line 43
    const-class v0, Lcom/arialyy/aria/util/DeleteDGRecord;

    monitor-enter v0

    .line 44
    :try_start_0
    sget-object v1, Lcom/arialyy/aria/util/DeleteDGRecord;->INSTANCE:Lcom/arialyy/aria/util/DeleteDGRecord;

    if-nez v1, :cond_0

    .line 45
    new-instance v1, Lcom/arialyy/aria/util/DeleteDGRecord;

    invoke-direct {v1}, Lcom/arialyy/aria/util/DeleteDGRecord;-><init>()V

    sput-object v1, Lcom/arialyy/aria/util/DeleteDGRecord;->INSTANCE:Lcom/arialyy/aria/util/DeleteDGRecord;

    .line 47
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 49
    :cond_1
    :goto_0
    sget-object v0, Lcom/arialyy/aria/util/DeleteDGRecord;->INSTANCE:Lcom/arialyy/aria/util/DeleteDGRecord;

    return-object v0
.end method

.method private removeBlockFile(Lcom/arialyy/aria/core/TaskRecord;)V
    .locals 6

    .line 125
    iget v0, p1, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    .line 126
    iget-object v4, p1, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    aput-object v4, v3, v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v5, 0x1

    aput-object v4, v3, v5

    const-string v4, "%s.%s.part"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/lang/String;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method


# virtual methods
.method public deleteRecord(Lcom/arialyy/aria/core/common/AbsEntity;ZZ)V
    .locals 8

    if-nez p1, :cond_0

    .line 69
    iget-object p1, p0, Lcom/arialyy/aria/util/DeleteDGRecord;->TAG:Ljava/lang/String;

    const-string p2, "\u5220\u9664\u7ec4\u5408\u4efb\u52a1\u8bb0\u5f55\u5931\u8d25\uff0c\u7ec4\u5408\u4efb\u52a1\u5b9e\u4f53\u4e3a\u7a7a"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 72
    :cond_0
    check-cast p1, Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    .line 74
    const-class v0, Lcom/arialyy/aria/core/wrapper/RecordWrapper;

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "dGroupHash=?"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 75
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getGroupHash()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-static {v0, v2}, Lcom/arialyy/aria/orm/DbEntity;->findRelationData(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 78
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_1

    .line 81
    :cond_1
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/wrapper/RecordWrapper;

    if-eqz v2, :cond_2

    .line 82
    iget-object v3, v2, Lcom/arialyy/aria/core/wrapper/RecordWrapper;->taskRecord:Lcom/arialyy/aria/core/TaskRecord;

    if-nez v3, :cond_3

    goto :goto_0

    .line 86
    :cond_3
    iget-object v3, v2, Lcom/arialyy/aria/core/wrapper/RecordWrapper;->taskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-boolean v3, v3, Lcom/arialyy/aria/core/TaskRecord;->isBlock:Z

    if-eqz v3, :cond_4

    .line 87
    iget-object v3, v2, Lcom/arialyy/aria/core/wrapper/RecordWrapper;->taskRecord:Lcom/arialyy/aria/core/TaskRecord;

    invoke-direct {p0, v3}, Lcom/arialyy/aria/util/DeleteDGRecord;->removeBlockFile(Lcom/arialyy/aria/core/TaskRecord;)V

    .line 89
    :cond_4
    const-class v3, Lcom/arialyy/aria/core/ThreadRecord;

    new-array v6, v1, [Ljava/lang/String;

    const-string v7, "taskKey=?"

    aput-object v7, v6, v4

    iget-object v7, v2, Lcom/arialyy/aria/core/wrapper/RecordWrapper;->taskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v7, v7, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    aput-object v7, v6, v5

    invoke-static {v3, v6}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    .line 90
    iget-object v2, v2, Lcom/arialyy/aria/core/wrapper/RecordWrapper;->taskRecord:Lcom/arialyy/aria/core/TaskRecord;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/TaskRecord;->deleteData()V

    goto :goto_0

    .line 79
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/arialyy/aria/util/DeleteDGRecord;->TAG:Ljava/lang/String;

    const-string v1, "\u7ec4\u4efb\u52a1\u8bb0\u5f55\u5df2\u5220\u9664"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    :cond_6
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getSubEntities()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 97
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_7
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/download/DownloadEntity;

    if-nez p2, :cond_8

    .line 98
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->isComplete()Z

    move-result v2

    if-nez v2, :cond_7

    .line 99
    :cond_8
    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/lang/String;)Z

    goto :goto_2

    .line 105
    :cond_9
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getDirPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_b

    if-nez p2, :cond_a

    .line 106
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->isComplete()Z

    move-result p2

    if-nez p2, :cond_b

    .line 107
    :cond_a
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getDirPath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/lang/String;)Z

    .line 111
    :cond_b
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getGroupHash()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p3, p1}, Lcom/arialyy/aria/util/DeleteDGRecord;->deleteEntity(ZLjava/lang/String;)V

    return-void
.end method

.method public deleteRecord(Ljava/lang/String;ZZ)V
    .locals 1

    .line 59
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 60
    iget-object p1, p0, Lcom/arialyy/aria/util/DeleteDGRecord;->TAG:Ljava/lang/String;

    const-string p2, "\u5220\u9664\u4e0b\u8f7d\u4efb\u52a1\u7ec4\u8bb0\u5f55\u5931\u8d25\uff0c\u7ec4\u5408\u4efb\u52a1\u8def\u5f84\u4e3a\u7a7a"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 63
    :cond_0
    invoke-static {p1}, Lcom/arialyy/aria/util/DbDataHelper;->getDGEntityByPath(Ljava/lang/String;)Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    move-result-object p1

    invoke-virtual {p0, p1, p2, p3}, Lcom/arialyy/aria/util/DeleteDGRecord;->deleteRecord(Lcom/arialyy/aria/core/common/AbsEntity;ZZ)V

    return-void
.end method
