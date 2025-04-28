.class Lcom/arialyy/aria/core/queue/TaskFactory;
.super Ljava/lang/Object;
.source "TaskFactory.java"


# static fields
.field private static volatile INSTANCE:Lcom/arialyy/aria/core/queue/TaskFactory;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private createDownloadGroupTask(Lcom/arialyy/aria/core/download/DGTaskWrapper;Lcom/arialyy/aria/core/listener/ISchedulers;)Lcom/arialyy/aria/core/task/DownloadGroupTask;
    .locals 1

    .line 79
    new-instance v0, Lcom/arialyy/aria/core/task/DownloadGroupTask$Builder;

    invoke-direct {v0, p1}, Lcom/arialyy/aria/core/task/DownloadGroupTask$Builder;-><init>(Lcom/arialyy/aria/core/download/DGTaskWrapper;)V

    .line 80
    invoke-virtual {v0, p2}, Lcom/arialyy/aria/core/task/DownloadGroupTask$Builder;->setOutHandler(Lcom/arialyy/aria/core/listener/ISchedulers;)Lcom/arialyy/aria/core/task/DownloadGroupTask$Builder;

    .line 81
    invoke-virtual {v0}, Lcom/arialyy/aria/core/task/DownloadGroupTask$Builder;->build()Lcom/arialyy/aria/core/task/DownloadGroupTask;

    move-result-object p1

    return-object p1
.end method

.method private createDownloadTask(Lcom/arialyy/aria/core/download/DTaskWrapper;Lcom/arialyy/aria/core/listener/ISchedulers;)Lcom/arialyy/aria/core/task/DownloadTask;
    .locals 1

    .line 100
    new-instance v0, Lcom/arialyy/aria/core/task/DownloadTask$Builder;

    invoke-direct {v0, p1}, Lcom/arialyy/aria/core/task/DownloadTask$Builder;-><init>(Lcom/arialyy/aria/core/download/DTaskWrapper;)V

    .line 101
    invoke-virtual {v0, p2}, Lcom/arialyy/aria/core/task/DownloadTask$Builder;->setOutHandler(Lcom/arialyy/aria/core/listener/ISchedulers;)Lcom/arialyy/aria/core/task/DownloadTask$Builder;

    .line 102
    invoke-virtual {v0}, Lcom/arialyy/aria/core/task/DownloadTask$Builder;->build()Lcom/arialyy/aria/core/task/DownloadTask;

    move-result-object p1

    return-object p1
.end method

.method private createUploadTask(Lcom/arialyy/aria/core/upload/UTaskWrapper;Lcom/arialyy/aria/core/listener/ISchedulers;)Lcom/arialyy/aria/core/task/UploadTask;
    .locals 1

    .line 89
    new-instance v0, Lcom/arialyy/aria/core/task/UploadTask$Builder;

    invoke-direct {v0}, Lcom/arialyy/aria/core/task/UploadTask$Builder;-><init>()V

    .line 90
    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/task/UploadTask$Builder;->setUploadTaskEntity(Lcom/arialyy/aria/core/upload/UTaskWrapper;)V

    .line 91
    invoke-virtual {v0, p2}, Lcom/arialyy/aria/core/task/UploadTask$Builder;->setOutHandler(Lcom/arialyy/aria/core/listener/ISchedulers;)V

    .line 92
    invoke-virtual {v0}, Lcom/arialyy/aria/core/task/UploadTask$Builder;->build()Lcom/arialyy/aria/core/task/UploadTask;

    move-result-object p1

    return-object p1
.end method

.method public static getInstance()Lcom/arialyy/aria/core/queue/TaskFactory;
    .locals 2

    .line 42
    sget-object v0, Lcom/arialyy/aria/core/queue/TaskFactory;->INSTANCE:Lcom/arialyy/aria/core/queue/TaskFactory;

    if-nez v0, :cond_0

    .line 43
    const-class v0, Lcom/arialyy/aria/core/queue/TaskFactory;

    monitor-enter v0

    .line 44
    :try_start_0
    new-instance v1, Lcom/arialyy/aria/core/queue/TaskFactory;

    invoke-direct {v1}, Lcom/arialyy/aria/core/queue/TaskFactory;-><init>()V

    sput-object v1, Lcom/arialyy/aria/core/queue/TaskFactory;->INSTANCE:Lcom/arialyy/aria/core/queue/TaskFactory;

    .line 45
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 47
    :cond_0
    :goto_0
    sget-object v0, Lcom/arialyy/aria/core/queue/TaskFactory;->INSTANCE:Lcom/arialyy/aria/core/queue/TaskFactory;

    return-object v0
.end method


# virtual methods
.method createTask(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/listener/ISchedulers;)Lcom/arialyy/aria/core/task/ITask;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TASK_ENTITY:",
            "Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;",
            "SCHEDU",
            "LER::Lcom/arialyy/aria/core/listener/ISchedulers;",
            ">(TTASK_ENTITY;TSCHEDU",
            "LER;",
            ")",
            "Lcom/arialyy/aria/core/task/ITask;"
        }
    .end annotation

    .line 61
    instance-of v0, p1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    if-eqz v0, :cond_0

    .line 62
    check-cast p1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/core/queue/TaskFactory;->createDownloadTask(Lcom/arialyy/aria/core/download/DTaskWrapper;Lcom/arialyy/aria/core/listener/ISchedulers;)Lcom/arialyy/aria/core/task/DownloadTask;

    move-result-object p1

    return-object p1

    .line 63
    :cond_0
    instance-of v0, p1, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    if-eqz v0, :cond_1

    .line 64
    check-cast p1, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/core/queue/TaskFactory;->createUploadTask(Lcom/arialyy/aria/core/upload/UTaskWrapper;Lcom/arialyy/aria/core/listener/ISchedulers;)Lcom/arialyy/aria/core/task/UploadTask;

    move-result-object p1

    return-object p1

    .line 65
    :cond_1
    instance-of v0, p1, Lcom/arialyy/aria/core/download/DGTaskWrapper;

    if-eqz v0, :cond_2

    .line 66
    check-cast p1, Lcom/arialyy/aria/core/download/DGTaskWrapper;

    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/core/queue/TaskFactory;->createDownloadGroupTask(Lcom/arialyy/aria/core/download/DGTaskWrapper;Lcom/arialyy/aria/core/listener/ISchedulers;)Lcom/arialyy/aria/core/task/DownloadGroupTask;

    move-result-object p1

    return-object p1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method
