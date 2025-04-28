.class public Lcom/arialyy/aria/util/DeleteM3u8Record;
.super Ljava/lang/Object;
.source "DeleteM3u8Record.java"

# interfaces
.implements Lcom/arialyy/aria/util/IDeleteRecord;


# static fields
.field private static volatile INSTANCE:Lcom/arialyy/aria/util/DeleteM3u8Record;


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

    .line 31
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/util/DeleteM3u8Record;->TAG:Ljava/lang/String;

    return-void
.end method

.method private deleteEntity(IZLjava/lang/String;)V
    .locals 7

    .line 97
    const-class v0, Lcom/arialyy/aria/core/ThreadRecord;

    const/4 v1, 0x3

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "taskKey=? AND threadType=?"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    aput-object p3, v2, v3

    .line 98
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    aput-object v5, v2, v6

    .line 97
    invoke-static {v0, v2}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    .line 99
    const-class v0, Lcom/arialyy/aria/core/TaskRecord;

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "filePath=? AND taskType=?"

    aput-object v2, v1, v4

    aput-object p3, v1, v3

    .line 100
    invoke-static {p1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v6

    .line 99
    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    .line 101
    const-class p1, Lcom/arialyy/aria/core/download/M3U8Entity;

    new-array v0, v6, [Ljava/lang/String;

    const-string v1, "filePath=?"

    aput-object v1, v0, v4

    aput-object p3, v0, v3

    invoke-static {p1, v0}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    if-eqz p2, :cond_0

    .line 104
    const-class p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    new-array p2, v6, [Ljava/lang/String;

    const-string v0, "downloadPath=?"

    aput-object v0, p2, v4

    aput-object p3, p2, v3

    invoke-static {p1, p2}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static getInstance()Lcom/arialyy/aria/util/DeleteM3u8Record;
    .locals 2

    .line 40
    sget-object v0, Lcom/arialyy/aria/util/DeleteM3u8Record;->INSTANCE:Lcom/arialyy/aria/util/DeleteM3u8Record;

    if-nez v0, :cond_1

    .line 41
    const-class v0, Lcom/arialyy/aria/util/DeleteM3u8Record;

    monitor-enter v0

    .line 42
    :try_start_0
    sget-object v1, Lcom/arialyy/aria/util/DeleteM3u8Record;->INSTANCE:Lcom/arialyy/aria/util/DeleteM3u8Record;

    if-nez v1, :cond_0

    .line 43
    new-instance v1, Lcom/arialyy/aria/util/DeleteM3u8Record;

    invoke-direct {v1}, Lcom/arialyy/aria/util/DeleteM3u8Record;-><init>()V

    sput-object v1, Lcom/arialyy/aria/util/DeleteM3u8Record;->INSTANCE:Lcom/arialyy/aria/util/DeleteM3u8Record;

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
    sget-object v0, Lcom/arialyy/aria/util/DeleteM3u8Record;->INSTANCE:Lcom/arialyy/aria/util/DeleteM3u8Record;

    return-object v0
.end method

.method private static removeTsCache(Ljava/io/File;J)V
    .locals 6

    .line 114
    const-class v0, Lcom/arialyy/aria/core/download/M3U8Entity;

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "filePath=?"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    invoke-static {v0, v2}, Lcom/arialyy/aria/orm/DbEntity;->findFirst(Ljava/lang/Class;[Ljava/lang/String;)Lcom/arialyy/aria/orm/DbEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/M3U8Entity;

    if-eqz v0, :cond_0

    .line 115
    iget-object v2, v0, Lcom/arialyy/aria/core/download/M3U8Entity;->keyPath:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 116
    new-instance v2, Ljava/io/File;

    iget-object v0, v0, Lcom/arialyy/aria/core/download/M3U8Entity;->keyPath:Ljava/lang/String;

    invoke-direct {v2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 117
    invoke-static {v2}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/io/File;)Z

    :cond_0
    const/4 v0, 0x0

    .line 122
    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v2

    if-nez v2, :cond_1

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    .line 124
    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v4

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v5

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    aput-object p1, v0, v1

    const-string p1, "%s/.%s_%s"

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 127
    :cond_1
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_5

    .line 128
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 129
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p2

    if-nez p2, :cond_2

    return-void

    .line 132
    :cond_2
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p1

    .line 133
    array-length p2, p1

    move v1, v4

    :goto_0
    if-ge v1, p2, :cond_4

    aget-object v2, p1, v1

    .line 134
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 135
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 138
    :cond_4
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 139
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p2

    if-eqz p2, :cond_5

    .line 140
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 144
    :cond_5
    new-instance p1, Ljava/io/File;

    new-array p2, v5, [Ljava/lang/Object;

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    aput-object p0, p2, v4

    const-string p0, "%s.index"

    invoke-static {p0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 146
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_6

    .line 147
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    :cond_6
    return-void
.end method


# virtual methods
.method public deleteRecord(Lcom/arialyy/aria/core/common/AbsEntity;ZZ)V
    .locals 3

    if-nez p1, :cond_0

    .line 74
    iget-object p1, p0, Lcom/arialyy/aria/util/DeleteM3u8Record;->TAG:Ljava/lang/String;

    const-string p2, "\u5220\u9664\u4e0b\u8f7d\u8bb0\u5f55\u5931\u8d25\uff0c\u5b9e\u4f53\u4e3a\u7a7a"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 78
    :cond_0
    check-cast p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 79
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v0

    .line 80
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getTaskType()I

    move-result v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/DbDataHelper;->getTaskRecord(Ljava/lang/String;I)Lcom/arialyy/aria/core/TaskRecord;

    move-result-object v1

    if-nez v1, :cond_1

    .line 82
    iget-object p2, p0, Lcom/arialyy/aria/util/DeleteM3u8Record;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u5220\u9664\u4e0b\u8f7d\u8bb0\u5f55\u5931\u8d25\uff0c\u8bb0\u5f55\u4e3a\u7a7a\uff0c\u5c06\u5220\u9664\u5b9e\u4f53\u8bb0\u5f55\uff0cfilePath\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {p2, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 83
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getTaskType()I

    move-result p1

    invoke-direct {p0, p1, p3, v0}, Lcom/arialyy/aria/util/DeleteM3u8Record;->deleteEntity(IZLjava/lang/String;)V

    return-void

    :cond_1
    if-nez p2, :cond_2

    .line 87
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->isComplete()Z

    move-result p2

    if-nez p2, :cond_3

    .line 88
    :cond_2
    new-instance p2, Ljava/io/File;

    invoke-direct {p2, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iget-wide v1, v1, Lcom/arialyy/aria/core/TaskRecord;->bandWidth:J

    invoke-static {p2, v1, v2}, Lcom/arialyy/aria/util/DeleteM3u8Record;->removeTsCache(Ljava/io/File;J)V

    .line 89
    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/lang/String;)Z

    .line 92
    :cond_3
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getTaskType()I

    move-result p1

    invoke-direct {p0, p1, p3, v0}, Lcom/arialyy/aria/util/DeleteM3u8Record;->deleteEntity(IZLjava/lang/String;)V

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
    iget-object p2, p0, Lcom/arialyy/aria/util/DeleteM3u8Record;->TAG:Ljava/lang/String;

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
    invoke-virtual {p0, v0, p2, p3}, Lcom/arialyy/aria/util/DeleteM3u8Record;->deleteRecord(Lcom/arialyy/aria/core/common/AbsEntity;ZZ)V

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
