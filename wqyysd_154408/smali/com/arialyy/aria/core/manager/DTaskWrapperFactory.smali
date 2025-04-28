.class Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;
.super Ljava/lang/Object;
.source "DTaskWrapperFactory.java"

# interfaces
.implements Lcom/arialyy/aria/core/manager/INormalTEFactory;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/arialyy/aria/core/manager/INormalTEFactory<",
        "Lcom/arialyy/aria/core/download/DownloadEntity;",
        "Lcom/arialyy/aria/core/download/DTaskWrapper;",
        ">;"
    }
.end annotation


# static fields
.field private static volatile INSTANCE:Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;


# instance fields
.field private final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 1

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "DTaskWrapperFactory"

    .line 30
    iput-object v0, p0, Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;->TAG:Ljava/lang/String;

    return-void
.end method

.method private getEntity(J)Lcom/arialyy/aria/core/download/DownloadEntity;
    .locals 9

    .line 63
    const-class v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    const/4 v1, 0x2

    new-array v2, v1, [Ljava/lang/String;

    const-string v3, "rowid=? and isGroupChild=\'false\'"

    const/4 v4, 0x0

    aput-object v3, v2, v4

    .line 65
    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x1

    aput-object p1, v2, p2

    .line 64
    invoke-static {v0, v2}, Lcom/arialyy/aria/core/download/DownloadEntity;->findFirst(Ljava/lang/Class;[Ljava/lang/String;)Lcom/arialyy/aria/orm/DbEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    if-nez p1, :cond_0

    .line 68
    new-instance p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-direct {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;-><init>()V

    return-object p1

    .line 71
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 73
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->isComplete()Z

    move-result v2

    if-nez v2, :cond_5

    .line 74
    const-class v2, Lcom/arialyy/aria/core/TaskRecord;

    new-array v3, v1, [Ljava/lang/String;

    const-string v5, "filePath=?"

    aput-object v5, v3, v4

    .line 75
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, p2

    invoke-static {v2, v3}, Lcom/arialyy/aria/core/TaskRecord;->findFirst(Ljava/lang/Class;[Ljava/lang/String;)Lcom/arialyy/aria/orm/DbEntity;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/TaskRecord;

    if-nez v2, :cond_1

    .line 77
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;->resetEntity(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    goto :goto_1

    .line 79
    :cond_1
    iget-boolean v3, v2, Lcom/arialyy/aria/core/TaskRecord;->isBlock:Z

    if-eqz v3, :cond_4

    .line 81
    iget v0, v2, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    move v3, v4

    move v5, v3

    :goto_0
    if-ge v3, v0, :cond_3

    .line 82
    new-instance v6, Ljava/io/File;

    new-array v7, v1, [Ljava/lang/Object;

    iget-object v8, v2, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    aput-object v8, v7, v4

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, p2

    const-string v8, "%s.%s.part"

    invoke-static {v8, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 83
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_2

    add-int/lit8 v5, v5, 0x1

    :cond_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 87
    :cond_3
    iget p2, v2, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    if-ne v5, p2, :cond_5

    .line 88
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;->resetEntity(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    goto :goto_1

    .line 90
    :cond_4
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p2

    if-nez p2, :cond_5

    iget p2, v2, Lcom/arialyy/aria/core/TaskRecord;->taskType:I

    const/4 v0, 0x7

    if-eq p2, v0, :cond_5

    .line 92
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;->resetEntity(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    :cond_5
    :goto_1
    return-object p1
.end method

.method public static getInstance()Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;
    .locals 2

    .line 37
    sget-object v0, Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;->INSTANCE:Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;

    if-nez v0, :cond_0

    .line 38
    const-class v0, Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;

    monitor-enter v0

    .line 39
    :try_start_0
    new-instance v1, Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;

    invoke-direct {v1}, Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;-><init>()V

    sput-object v1, Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;->INSTANCE:Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;

    .line 40
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 42
    :cond_0
    :goto_0
    sget-object v0, Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;->INSTANCE:Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;

    return-object v0
.end method

.method private resetEntity(Lcom/arialyy/aria/core/download/DownloadEntity;)V
    .locals 3

    const/4 v0, 0x0

    .line 103
    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->setPercent(I)V

    const-wide/16 v1, 0x0

    .line 104
    invoke-virtual {p1, v1, v2}, Lcom/arialyy/aria/core/download/DownloadEntity;->setCompleteTime(J)V

    .line 105
    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->setComplete(Z)V

    .line 106
    invoke-virtual {p1, v1, v2}, Lcom/arialyy/aria/core/download/DownloadEntity;->setCurrentProgress(J)V

    const/4 v0, 0x3

    .line 107
    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->setState(I)V

    return-void
.end method


# virtual methods
.method public create(J)Lcom/arialyy/aria/core/download/DTaskWrapper;
    .locals 2

    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    .line 51
    new-instance p1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    new-instance p2, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-direct {p2}, Lcom/arialyy/aria/core/download/DownloadEntity;-><init>()V

    invoke-direct {p1, p2}, Lcom/arialyy/aria/core/download/DTaskWrapper;-><init>(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    goto :goto_0

    .line 53
    :cond_0
    new-instance v0, Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;->getEntity(J)Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p1

    invoke-direct {v0, p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;-><init>(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    move-object p1, v0

    .line 55
    :goto_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p2

    check-cast p2, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {p2}, Lcom/arialyy/aria/core/download/DownloadEntity;->getTaskType()I

    move-result p2

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setRequestType(I)V

    return-object p1
.end method

.method public bridge synthetic create(J)Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;
    .locals 0

    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;->create(J)Lcom/arialyy/aria/core/download/DTaskWrapper;

    move-result-object p1

    return-object p1
.end method
