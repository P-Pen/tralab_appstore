.class public Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;
.super Ljava/lang/Object;
.source "BaseExecutePool.java"

# interfaces
.implements Lcom/arialyy/aria/core/queue/pool/IPool;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TASK:",
        "Lcom/arialyy/aria/core/task/AbsTask;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/arialyy/aria/core/queue/pool/IPool<",
        "TTASK;>;"
    }
.end annotation


# static fields
.field private static final LOCK:Ljava/lang/Object;


# instance fields
.field private final TAG:Ljava/lang/String;

.field mExecuteQueue:Ljava/util/Deque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Deque<",
            "TTASK;>;"
        }
    .end annotation
.end field

.field mSize:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 34
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->LOCK:Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->TAG:Ljava/lang/String;

    .line 39
    invoke-virtual {p0}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->getMaxSize()I

    move-result v0

    iput v0, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mSize:I

    .line 40
    new-instance v0, Ljava/util/concurrent/LinkedBlockingDeque;

    iget v1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mSize:I

    invoke-direct {v0, v1}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>(I)V

    iput-object v0, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mExecuteQueue:Ljava/util/Deque;

    return-void
.end method


# virtual methods
.method public getAllTask()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TTASK;>;"
        }
    .end annotation

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    return-object v0
.end method

.method protected getMaxSize()I
    .locals 1

    const/4 v0, 0x2

    return v0
.end method

.method public getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")TTASK;"
        }
    .end annotation

    .line 133
    sget-object v0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 134
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 135
    iget-object p1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->TAG:Ljava/lang/String;

    const-string v1, "key\u4e3anull"

    invoke-static {p1, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 136
    monitor-exit v0

    return-object v2

    .line 138
    :cond_0
    iget-object v1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/arialyy/aria/core/task/AbsTask;

    .line 139
    invoke-virtual {v3}, Lcom/arialyy/aria/core/task/AbsTask;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 140
    monitor-exit v0

    return-object v3

    .line 144
    :cond_2
    monitor-exit v0

    return-object v2

    :catchall_0
    move-exception p1

    .line 145
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method pollFirstTask()Z
    .locals 3

    .line 115
    sget-object v0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 116
    :try_start_0
    iget-object v1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->pollFirst()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/task/AbsTask;

    if-nez v1, :cond_0

    .line 118
    iget-object v1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->TAG:Ljava/lang/String;

    const-string v2, "\u79fb\u9664\u4efb\u52a1\u5931\u8d25\uff0c\u539f\u56e0\uff1a\u4efb\u52a1\u4e3anull"

    invoke-static {v1, v2}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v1, 0x0

    .line 119
    monitor-exit v0

    return v1

    .line 121
    :cond_0
    invoke-virtual {v1}, Lcom/arialyy/aria/core/task/AbsTask;->stop()V

    const/4 v1, 0x1

    .line 122
    monitor-exit v0

    return v1

    :catchall_0
    move-exception v1

    .line 123
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public pollTask()Lcom/arialyy/aria/core/task/AbsTask;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TTASK;"
        }
    .end annotation

    .line 127
    sget-object v0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 128
    :try_start_0
    iget-object v1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-interface {v1}, Ljava/util/Deque;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/task/AbsTask;

    monitor-exit v0

    return-object v1

    :catchall_0
    move-exception v1

    .line 129
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method putNewTask(Lcom/arialyy/aria/core/task/AbsTask;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK;)Z"
        }
    .end annotation

    .line 104
    sget-object v0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 105
    :try_start_0
    iget-object v1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-interface {v1, p1}, Ljava/util/Deque;->offer(Ljava/lang/Object;)Z

    move-result v1

    .line 106
    iget-object v2, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u4efb\u52a1\u3010"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\u3011\u8fdb\u5165\u6267\u884c\u961f\u5217"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v1, :cond_0

    const-string p1, "\u6210\u529f"

    goto :goto_0

    :cond_0
    const-string p1, "\u5931\u8d25"

    :goto_0
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 107
    monitor-exit v0

    return v1

    :catchall_0
    move-exception p1

    .line 108
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public putTask(Lcom/arialyy/aria/core/task/AbsTask;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK;)Z"
        }
    .end annotation

    .line 60
    sget-object v0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    if-nez p1, :cond_0

    .line 62
    :try_start_0
    iget-object p1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->TAG:Ljava/lang/String;

    const-string v2, "\u4efb\u52a1\u4e0d\u80fd\u4e3a\u7a7a\uff01\uff01"

    invoke-static {p1, v2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    monitor-exit v0

    return v1

    .line 65
    :cond_0
    iget-object v2, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-interface {v2, p1}, Ljava/util/Deque;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 66
    iget-object v2, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->TAG:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u4efb\u52a1\u3010"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getTaskName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "\u3011\u8fdb\u5165\u6267\u884c\u961f\u5217\u5931\u8d25\uff0c\u539f\u56e0\uff1a\u5df2\u7ecf\u5728\u6267\u884c\u961f\u5217\u4e2d"

    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    monitor-exit v0

    return v1

    .line 69
    :cond_1
    iget-object v2, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->size()I

    move-result v2

    iget v3, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mSize:I

    if-lt v2, v3, :cond_3

    .line 70
    invoke-virtual {p0}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->pollFirstTask()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 71
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->putNewTask(Lcom/arialyy/aria/core/task/AbsTask;)Z

    move-result p1

    monitor-exit v0

    return p1

    .line 77
    :cond_2
    monitor-exit v0

    return v1

    .line 74
    :cond_3
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->putNewTask(Lcom/arialyy/aria/core/task/AbsTask;)Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    .line 77
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public removeTask(Lcom/arialyy/aria/core/task/AbsTask;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TTASK;)Z"
        }
    .end annotation

    .line 153
    sget-object v0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    if-nez p1, :cond_0

    .line 155
    :try_start_0
    iget-object p1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->TAG:Ljava/lang/String;

    const-string v1, "\u4efb\u52a1\u4e0d\u80fd\u4e3a\u7a7a"

    invoke-static {p1, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    .line 156
    monitor-exit v0

    return p1

    .line 158
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/AbsTask;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->removeTask(Ljava/lang/String;)Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    .line 160
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public removeTask(Ljava/lang/String;)Z
    .locals 2

    .line 164
    sget-object v0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 165
    :try_start_0
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 166
    iget-object p1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->TAG:Ljava/lang/String;

    const-string v1, "key \u4e3anull"

    invoke-static {p1, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    .line 167
    monitor-exit v0

    return p1

    .line 170
    :cond_0
    iget-object v1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object p1

    invoke-interface {v1, p1}, Ljava/util/Deque;->remove(Ljava/lang/Object;)Z

    move-result p1

    monitor-exit v0

    return p1

    :catchall_0
    move-exception p1

    .line 171
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public setMaxNum(I)V
    .locals 3

    .line 87
    sget-object v0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 88
    :try_start_0
    new-instance v1, Ljava/util/concurrent/LinkedBlockingDeque;

    invoke-direct {v1, p1}, Ljava/util/concurrent/LinkedBlockingDeque;-><init>(I)V

    .line 90
    :goto_0
    iget-object v2, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-interface {v2}, Ljava/util/Deque;->poll()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/task/AbsTask;

    if-eqz v2, :cond_0

    .line 91
    invoke-interface {v1, v2}, Ljava/util/Deque;->offer(Ljava/lang/Object;)Z

    goto :goto_0

    .line 93
    :cond_0
    iput-object v1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mExecuteQueue:Ljava/util/Deque;

    .line 94
    iput p1, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mSize:I

    .line 95
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public size()I
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->mExecuteQueue:Ljava/util/Deque;

    invoke-interface {v0}, Ljava/util/Deque;->size()I

    move-result v0

    return v0
.end method

.method public taskExits(Ljava/lang/String;)Z
    .locals 0

    .line 149
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;->getTask(Ljava/lang/String;)Lcom/arialyy/aria/core/task/AbsTask;

    move-result-object p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    return p1
.end method
