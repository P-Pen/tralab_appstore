.class public Lcom/arialyy/aria/util/DeleteURecord;
.super Ljava/lang/Object;
.source "DeleteURecord.java"

# interfaces
.implements Lcom/arialyy/aria/util/IDeleteRecord;


# static fields
.field private static volatile INSTANCE:Lcom/arialyy/aria/util/DeleteURecord;


# instance fields
.field private TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 29
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/util/DeleteURecord;->TAG:Ljava/lang/String;

    return-void
.end method

.method private deleteEntity(ZLjava/lang/String;)V
    .locals 3

    if-eqz p1, :cond_0

    .line 96
    const-class p1, Lcom/arialyy/aria/core/upload/UploadEntity;

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/String;

    const/4 v1, 0x0

    const-string v2, "filePath=?"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object p2, v0, v1

    invoke-static {p1, v0}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public static getInstance()Lcom/arialyy/aria/util/DeleteURecord;
    .locals 2

    .line 38
    sget-object v0, Lcom/arialyy/aria/util/DeleteURecord;->INSTANCE:Lcom/arialyy/aria/util/DeleteURecord;

    if-nez v0, :cond_1

    .line 39
    const-class v0, Lcom/arialyy/aria/util/DeleteURecord;

    monitor-enter v0

    .line 40
    :try_start_0
    sget-object v1, Lcom/arialyy/aria/util/DeleteURecord;->INSTANCE:Lcom/arialyy/aria/util/DeleteURecord;

    if-nez v1, :cond_0

    .line 41
    new-instance v1, Lcom/arialyy/aria/util/DeleteURecord;

    invoke-direct {v1}, Lcom/arialyy/aria/util/DeleteURecord;-><init>()V

    sput-object v1, Lcom/arialyy/aria/util/DeleteURecord;->INSTANCE:Lcom/arialyy/aria/util/DeleteURecord;

    .line 43
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 45
    :cond_1
    :goto_0
    sget-object v0, Lcom/arialyy/aria/util/DeleteURecord;->INSTANCE:Lcom/arialyy/aria/util/DeleteURecord;

    return-object v0
.end method


# virtual methods
.method public deleteRecord(Lcom/arialyy/aria/core/common/AbsEntity;ZZ)V
    .locals 7

    if-nez p1, :cond_0

    .line 75
    iget-object p1, p0, Lcom/arialyy/aria/util/DeleteURecord;->TAG:Ljava/lang/String;

    const-string p2, "\u5220\u9664\u4e0a\u4f20\u8bb0\u5f55\u5931\u8d25\uff0c\u5b9e\u4f53\u4e3a\u7a7a"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 79
    :cond_0
    check-cast p1, Lcom/arialyy/aria/core/upload/UploadEntity;

    .line 82
    const-class v0, Lcom/arialyy/aria/core/ThreadRecord;

    const/4 v1, 0x3

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "taskKey=? AND threadType=?"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-virtual {p1}, Lcom/arialyy/aria/core/upload/UploadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    .line 83
    invoke-virtual {p1}, Lcom/arialyy/aria/core/upload/UploadEntity;->getTaskType()I

    move-result v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x2

    aput-object v3, v2, v6

    .line 82
    invoke-static {v0, v2}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    .line 84
    const-class v0, Lcom/arialyy/aria/core/TaskRecord;

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "filePath=? AND taskType=?"

    aput-object v2, v1, v4

    invoke-virtual {p1}, Lcom/arialyy/aria/core/upload/UploadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v5

    .line 85
    invoke-virtual {p1}, Lcom/arialyy/aria/core/upload/UploadEntity;->getTaskType()I

    move-result v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v6

    .line 84
    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    if-eqz p2, :cond_1

    .line 88
    invoke-virtual {p1}, Lcom/arialyy/aria/core/upload/UploadEntity;->getFilePath()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/lang/String;)Z

    .line 91
    :cond_1
    invoke-virtual {p1}, Lcom/arialyy/aria/core/upload/UploadEntity;->getFilePath()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p3, p1}, Lcom/arialyy/aria/util/DeleteURecord;->deleteEntity(ZLjava/lang/String;)V

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

    .line 64
    const-class v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    const/4 v3, 0x2

    new-array v3, v3, [Ljava/lang/String;

    const-string v4, "filePath=?"

    aput-object v4, v3, v2

    aput-object p1, v3, v1

    invoke-static {v0, v3}, Lcom/arialyy/aria/orm/DbEntity;->findFirst(Ljava/lang/Class;[Ljava/lang/String;)Lcom/arialyy/aria/orm/DbEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    if-nez v0, :cond_0

    .line 66
    iget-object p2, p0, Lcom/arialyy/aria/util/DeleteURecord;->TAG:Ljava/lang/String;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "\u5220\u9664\u4e0a\u4f20\u8bb0\u5f55\u5931\u8d25\uff0c\u6ca1\u6709\u5728\u6570\u636e\u5e93\u4e2d\u627e\u5230\u5bf9\u5e94\u7684\u5b9e\u4f53\u6587\u4ef6\uff0cfilePath\uff1a"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p2, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 69
    :cond_0
    invoke-virtual {p0, v0, p2, p3}, Lcom/arialyy/aria/util/DeleteURecord;->deleteRecord(Lcom/arialyy/aria/core/common/AbsEntity;ZZ)V

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
