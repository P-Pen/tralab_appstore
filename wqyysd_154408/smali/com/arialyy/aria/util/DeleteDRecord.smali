.class public Lcom/arialyy/aria/util/DeleteDRecord;
.super Ljava/lang/Object;
.source "DeleteDRecord.java"

# interfaces
.implements Lcom/arialyy/aria/util/IDeleteRecord;


# static fields
.field private static volatile INSTANCE:Lcom/arialyy/aria/util/DeleteDRecord;


# instance fields
.field private TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/util/DeleteDRecord;->TAG:Ljava/lang/String;

    return-void
.end method

.method private deleteEntity(ZLjava/lang/String;)V
    .locals 3

    if-eqz p1, :cond_0

    .line 119
    const-class p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "downloadPath=?"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-static {p1, v0}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static getInstance()Lcom/arialyy/aria/util/DeleteDRecord;
    .locals 2

    .line 40
    sget-object v0, Lcom/arialyy/aria/util/DeleteDRecord;->INSTANCE:Lcom/arialyy/aria/util/DeleteDRecord;

    if-nez v0, :cond_1

    .line 41
    const-class v0, Lcom/arialyy/aria/util/DeleteDRecord;

    monitor-enter v0

    .line 42
    :try_start_0
    sget-object v1, Lcom/arialyy/aria/util/DeleteDRecord;->INSTANCE:Lcom/arialyy/aria/util/DeleteDRecord;

    if-nez v1, :cond_0

    .line 43
    new-instance v1, Lcom/arialyy/aria/util/DeleteDRecord;

    invoke-direct {v1}, Lcom/arialyy/aria/util/DeleteDRecord;-><init>()V

    sput-object v1, Lcom/arialyy/aria/util/DeleteDRecord;->INSTANCE:Lcom/arialyy/aria/util/DeleteDRecord;

    .line 45
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 47
    :cond_1
    :goto_0
    sget-object v0, Lcom/arialyy/aria/util/DeleteDRecord;->INSTANCE:Lcom/arialyy/aria/util/DeleteDRecord;

    return-object v0
.end method

.method private removeBlockFile(Lcom/arialyy/aria/core/TaskRecord;)V
    .locals 6

    .line 127
    iget v0, p1, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_0

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/Object;

    .line 128
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
    .locals 10

    if-nez p1, :cond_0

    .line 79
    iget-object p1, p0, Lcom/arialyy/aria/util/DeleteDRecord;->TAG:Ljava/lang/String;

    const-string p2, "\u5220\u9664\u4e0b\u8f7d\u8bb0\u5f55\u5931\u8d25\uff0c\u5b9e\u4f53\u4e3a\u7a7a"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 82
    :cond_0
    check-cast p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 83
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v0

    .line 84
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 87
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getTaskType()I

    move-result v2

    const/4 v3, 0x7

    if-eq v2, v3, :cond_5

    .line 88
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getTaskType()I

    move-result v2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_1

    goto :goto_0

    .line 93
    :cond_1
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getTaskType()I

    move-result v3

    invoke-static {v2, v3}, Lcom/arialyy/aria/util/DbDataHelper;->getTaskRecord(Ljava/lang/String;I)Lcom/arialyy/aria/core/TaskRecord;

    move-result-object v2

    if-nez v2, :cond_2

    .line 95
    iget-object p2, p0, Lcom/arialyy/aria/util/DeleteDRecord;->TAG:Ljava/lang/String;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u5220\u9664\u4e0b\u8f7d\u8bb0\u5f55\u5931\u8d25\uff0c\u8bb0\u5f55\u4e3a\u7a7a\uff0c\u5c06\u5220\u9664\u5b9e\u4f53\u8bb0\u5f55\uff0cfilePath\uff1a"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 96
    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/io/File;)Z

    .line 97
    invoke-direct {p0, p3, v0}, Lcom/arialyy/aria/util/DeleteDRecord;->deleteEntity(ZLjava/lang/String;)V

    return-void

    .line 102
    :cond_2
    const-class v3, Lcom/arialyy/aria/core/ThreadRecord;

    const/4 v4, 0x3

    new-array v5, v4, [Ljava/lang/String;

    const-string v6, "taskKey=? AND threadType=?"

    const/4 v7, 0x0

    aput-object v6, v5, v7

    const/4 v6, 0x1

    aput-object v0, v5, v6

    .line 103
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getTaskType()I

    move-result v8

    invoke-static {v8}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    const/4 v9, 0x2

    aput-object v8, v5, v9

    .line 102
    invoke-static {v3, v5}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    .line 104
    const-class v3, Lcom/arialyy/aria/core/TaskRecord;

    new-array v4, v4, [Ljava/lang/String;

    const-string v5, "filePath=? AND taskType=?"

    aput-object v5, v4, v7

    aput-object v0, v4, v6

    .line 105
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getTaskType()I

    move-result v5

    invoke-static {v5}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v9

    .line 104
    invoke-static {v3, v4}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    if-nez p2, :cond_3

    .line 107
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->isComplete()Z

    move-result p1

    if-nez p1, :cond_4

    .line 108
    :cond_3
    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/io/File;)Z

    .line 109
    iget-boolean p1, v2, Lcom/arialyy/aria/core/TaskRecord;->isBlock:Z

    if-eqz p1, :cond_4

    .line 110
    invoke-direct {p0, v2}, Lcom/arialyy/aria/util/DeleteDRecord;->removeBlockFile(Lcom/arialyy/aria/core/TaskRecord;)V

    .line 114
    :cond_4
    invoke-direct {p0, p3, v0}, Lcom/arialyy/aria/util/DeleteDRecord;->deleteEntity(ZLjava/lang/String;)V

    return-void

    .line 89
    :cond_5
    :goto_0
    invoke-static {}, Lcom/arialyy/aria/util/DeleteM3u8Record;->getInstance()Lcom/arialyy/aria/util/DeleteM3u8Record;

    move-result-object v0

    invoke-virtual {v0, p1, p2, p3}, Lcom/arialyy/aria/util/DeleteM3u8Record;->deleteRecord(Lcom/arialyy/aria/core/common/AbsEntity;ZZ)V

    return-void
.end method

.method public deleteRecord(Ljava/lang/String;ZZ)V
    .locals 5

    .line 57
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "/"

    .line 60
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_1

    .line 63
    const-class v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "downloadPath=?"

    aput-object v4, v3, v2

    aput-object p1, v3, v1

    invoke-static {v0, v3}, Lcom/arialyy/aria/orm/DbEntity;->findFirst(Ljava/lang/Class;[Ljava/lang/String;)Lcom/arialyy/aria/orm/DbEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    if-nez v0, :cond_0

    .line 65
    iget-object p2, p0, Lcom/arialyy/aria/util/DeleteDRecord;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u5220\u9664\u4e0b\u8f7d\u8bb0\u5f55\u5931\u8d25\uff0c\u6ca1\u6709\u5728\u6570\u636e\u5e93\u4e2d\u627e\u5230\u5bf9\u5e94\u7684\u5b9e\u4f53\u6587\u4ef6\uff0cfilePath\uff1a"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 68
    :cond_0
    invoke-virtual {p0, v0, p2, p3}, Lcom/arialyy/aria/util/DeleteDRecord;->deleteRecord(Lcom/arialyy/aria/core/common/AbsEntity;ZZ)V

    return-void

    .line 61
    :cond_1
    new-instance p2, Ljava/lang/IllegalArgumentException;

    new-array p3, v1, [Ljava/lang/Object;

    aput-object p1, p3, v2

    const-string p1, "\u6587\u4ef6\u8def\u5f84\u9519\u8bef\uff0cfilePath\uff1a%s"

    invoke-static {p1, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 58
    :cond_2
    new-instance p1, Ljava/lang/NullPointerException;

    const-string p2, "\u5220\u9664\u8bb0\u5f55\u5931\u8d25\uff0c\u6587\u4ef6\u8def\u5f84\u4e3a\u7a7a"

    invoke-direct {p1, p2}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
