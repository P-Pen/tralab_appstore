.class Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;
.super Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;
.source "DLoadExecutePool.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TASK:",
        "Lcom/arialyy/aria/core/task/AbsTask;",
        ">",
        "Lcom/arialyy/aria/core/queue/pool/BaseExecutePool<",
        "TTASK;>;"
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 26
    invoke-direct {p0}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;-><init>()V

    const-string v0, "DownloadExecutePool"

    .line 27
    iput-object v0, p0, Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;->TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected getMaxSize()I
    .locals 1

    .line 30
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getDConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/DownloadConfig;->getMaxTaskNum()I

    move-result v0

    return v0
.end method

.method pollFirstTask()Z
    .locals 3

    .line 62
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->pollFirst()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/task/AbsTask;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    const-string v0, "DownloadExecutePool"

    const-string v2, "\u79fb\u9664\u4efb\u52a1\u5931\u8d25\uff0c\u9519\u8bef\u539f\u56e0\uff1a\u4efb\u52a1\u4e3anull"

    .line 64
    invoke-static {v0, v2}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 67
    :cond_0
    invoke-virtual {v0}, Lcom/arialyy/aria/core/task/AbsTask;->isHighestPriorityTask()Z

    move-result v2

    if-eqz v2, :cond_1

    return v1

    .line 70
    :cond_1
    invoke-virtual {v0}, Lcom/arialyy/aria/core/task/AbsTask;->stop()V

    const/4 v0, 0x1

    return v0
.end method

.method public putTask(Lcom/arialyy/aria/core/task/AbsTask;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK;)Z"
        }
    .end annotation

    .line 34
    const-class v0, Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;

    monitor-enter v0

    const/4 v1, 0x0

    if-nez p1, :cond_0

    :try_start_0
    const-string p1, "DownloadExecutePool"

    const-string v2, "\u4efb\u52a1\u4e0d\u80fd\u4e3a\u7a7a\uff01\uff01"

    .line 36
    invoke-static {p1, v2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 37
    monitor-exit v0

    return v1

    .line 39
    :cond_0
    iget-object v2, p0, Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-interface {v2, p1}, Ljava/util/Deque;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 40
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->isRunning()Z

    move-result v2

    if-nez v2, :cond_1

    const/4 p1, 0x1

    monitor-exit v0

    return p1

    :cond_1
    const-string v2, "DownloadExecutePool"

    .line 41
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u4efb\u52a1\u3010"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\u3011\u8fdb\u5165\u6267\u884c\u961f\u5217\u5931\u8d25\uff0c\u9519\u8bef\u539f\u56e0\uff1a\u5df2\u7ecf\u5728\u6267\u884c\u961f\u5217\u4e2d"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 42
    monitor-exit v0

    return v1

    .line 44
    :cond_2
    iget-object v2, p0, Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->size()I

    move-result v2

    iget v3, p0, Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;->mSize:I

    if-lt v2, v3, :cond_6

    .line 45
    iget-object v2, p0, Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_3
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/arialyy/aria/core/task/AbsTask;

    .line 46
    invoke-virtual {v3}, Lcom/arialyy/aria/core/task/AbsTask;->isHighestPriorityTask()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 47
    monitor-exit v0

    return v1

    .line 50
    :cond_4
    invoke-virtual {p0}, Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;->pollFirstTask()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 51
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;->putNewTask(Lcom/arialyy/aria/core/task/AbsTask;)Z

    move-result p1

    monitor-exit v0

    return p1

    .line 57
    :cond_5
    monitor-exit v0

    return v1

    .line 54
    :cond_6
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;->putNewTask(Lcom/arialyy/aria/core/task/AbsTask;)Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    .line 57
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method
