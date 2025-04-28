.class public Lcom/arialyy/aria/core/manager/TaskWrapperManager;
.super Ljava/lang/Object;
.source "TaskWrapperManager.java"


# static fields
.field private static volatile INSTANCE:Lcom/arialyy/aria/core/manager/TaskWrapperManager; = null

.field private static final TAG:Ljava/lang/String; = "TaskWrapperManager"


# instance fields
.field private cache:Landroid/util/LruCache;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/LruCache<",
            "Ljava/lang/String;",
            "Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;",
            ">;"
        }
    .end annotation
.end field

.field private lock:Ljava/util/concurrent/locks/Lock;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    new-instance v0, Landroid/util/LruCache;

    const/16 v1, 0x400

    invoke-direct {v0, v1}, Landroid/util/LruCache;-><init>(I)V

    iput-object v0, p0, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->cache:Landroid/util/LruCache;

    .line 49
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->lock:Ljava/util/concurrent/locks/Lock;

    return-void
.end method

.method private chooseGroupFactory(Ljava/lang/Class;)Lcom/arialyy/aria/core/manager/IGroupWrapperFactory;
    .locals 1

    .line 53
    const-class v0, Lcom/arialyy/aria/core/download/DGTaskWrapper;

    if-ne p1, v0, :cond_0

    .line 54
    invoke-static {}, Lcom/arialyy/aria/core/manager/DGTaskWrapperFactory;->getInstance()Lcom/arialyy/aria/core/manager/DGTaskWrapperFactory;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method private chooseNormalFactory(Ljava/lang/Class;)Lcom/arialyy/aria/core/manager/INormalTEFactory;
    .locals 1

    .line 60
    const-class v0, Lcom/arialyy/aria/core/download/DTaskWrapper;

    if-ne p1, v0, :cond_0

    .line 61
    invoke-static {}, Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;->getInstance()Lcom/arialyy/aria/core/manager/DTaskWrapperFactory;

    move-result-object p1

    return-object p1

    .line 62
    :cond_0
    const-class v0, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    if-ne p1, v0, :cond_1

    .line 63
    invoke-static {}, Lcom/arialyy/aria/core/manager/UTaskWrapperFactory;->getInstance()Lcom/arialyy/aria/core/manager/UTaskWrapperFactory;

    move-result-object p1

    return-object p1

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method

.method private convertKey(Ljava/lang/Class;J)Ljava/lang/String;
    .locals 1

    .line 154
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->keyToHashKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static getInstance()Lcom/arialyy/aria/core/manager/TaskWrapperManager;
    .locals 2

    .line 38
    sget-object v0, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->INSTANCE:Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    if-nez v0, :cond_1

    .line 39
    const-class v0, Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    monitor-enter v0

    .line 40
    :try_start_0
    sget-object v1, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->INSTANCE:Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    if-nez v1, :cond_0

    .line 41
    new-instance v1, Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    invoke-direct {v1}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;-><init>()V

    sput-object v1, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->INSTANCE:Lcom/arialyy/aria/core/manager/TaskWrapperManager;

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
    sget-object v0, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->INSTANCE:Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    return-object v0
.end method


# virtual methods
.method public getGroupWrapper(Ljava/lang/Class;J)Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TW:",
            "Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;",
            ">(",
            "Ljava/lang/Class<",
            "TTW;>;J)TTW;"
        }
    .end annotation

    .line 101
    iget-object v0, p0, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->lock:Ljava/util/concurrent/locks/Lock;

    .line 102
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 104
    :try_start_0
    iget-object v1, p0, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->cache:Landroid/util/LruCache;

    invoke-direct {p0, p1, p2, p3}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->convertKey(Ljava/lang/Class;J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    if-eqz v1, :cond_0

    .line 105
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v2, p1, :cond_2

    .line 106
    :cond_0
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->chooseGroupFactory(Ljava/lang/Class;)Lcom/arialyy/aria/core/manager/IGroupWrapperFactory;

    move-result-object p1

    if-nez p1, :cond_1

    const-string p1, "TaskWrapperManager"

    const-string p2, "\u4efb\u52a1\u5b9e\u4f53\u521b\u5efa\u5931\u8d25"

    .line 108
    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    .line 116
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object p1

    .line 111
    :cond_1
    :try_start_1
    invoke-interface {p1, p2, p3}, Lcom/arialyy/aria/core/manager/IGroupWrapperFactory;->getGroupWrapper(J)Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    .line 112
    invoke-virtual {p0, v1}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->putTaskWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 116
    :cond_2
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v1

    :catchall_0
    move-exception p1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 117
    throw p1
.end method

.method public getNormalTaskWrapper(Ljava/lang/Class;J)Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<TW:",
            "Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;",
            ">(",
            "Ljava/lang/Class<",
            "TTW;>;J)TTW;"
        }
    .end annotation

    .line 74
    iget-object v0, p0, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->lock:Ljava/util/concurrent/locks/Lock;

    .line 75
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 78
    :try_start_0
    iget-object v1, p0, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->cache:Landroid/util/LruCache;

    invoke-direct {p0, p1, p2, p3}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->convertKey(Ljava/lang/Class;J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/util/LruCache;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    if-eqz v1, :cond_0

    .line 79
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v2, p1, :cond_2

    .line 80
    :cond_0
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->chooseNormalFactory(Ljava/lang/Class;)Lcom/arialyy/aria/core/manager/INormalTEFactory;

    move-result-object p1

    if-nez p1, :cond_1

    const-string p1, "TaskWrapperManager"

    const-string p2, "\u4efb\u52a1\u5b9e\u4f53\u521b\u5efa\u5931\u8d25"

    .line 82
    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 p1, 0x0

    .line 90
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object p1

    .line 85
    :cond_1
    :try_start_1
    invoke-interface {p1, p2, p3}, Lcom/arialyy/aria/core/manager/INormalTEFactory;->create(J)Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    .line 86
    invoke-virtual {p0, v1}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->putTaskWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 90
    :cond_2
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object v1

    :catchall_0
    move-exception p1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 91
    throw p1
.end method

.method public putTaskWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V
    .locals 5

    if-nez p1, :cond_0

    const-string p1, "TaskWrapperManager"

    const-string v0, "\u4efb\u52a1\u5b9e\u4f53\u6dfb\u52a0\u5931\u8d25"

    .line 125
    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 128
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    if-eqz v0, :cond_2

    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getId()J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    goto :goto_0

    .line 131
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->lock:Ljava/util/concurrent/locks/Lock;

    .line 132
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 134
    :try_start_0
    iget-object v1, p0, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->cache:Landroid/util/LruCache;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/arialyy/aria/core/common/AbsEntity;->getId()J

    move-result-wide v3

    invoke-direct {p0, v2, v3, v4}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->convertKey(Ljava/lang/Class;J)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2, p1}, Landroid/util/LruCache;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 136
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 137
    throw p1

    :cond_2
    :goto_0
    return-void
.end method

.method public removeTaskWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V
    .locals 5

    .line 144
    iget-object v0, p0, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->lock:Ljava/util/concurrent/locks/Lock;

    .line 145
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 147
    :try_start_0
    iget-object v1, p0, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->cache:Landroid/util/LruCache;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsEntity;->getId()J

    move-result-wide v3

    invoke-direct {p0, v2, v3, v4}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->convertKey(Ljava/lang/Class;J)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Landroid/util/LruCache;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 149
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 150
    throw p1
.end method
