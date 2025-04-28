.class Lcom/arialyy/aria/util/WeakHandler$ChainedRef;
.super Ljava/lang/Object;
.source "WeakHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arialyy/aria/util/WeakHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ChainedRef"
.end annotation


# instance fields
.field lock:Ljava/util/concurrent/locks/Lock;

.field next:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

.field prev:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

.field final runnable:Ljava/lang/Runnable;

.field final wrapper:Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;


# direct methods
.method public constructor <init>(Ljava/util/concurrent/locks/Lock;Ljava/lang/Runnable;)V
    .locals 1

    .line 439
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 440
    iput-object p2, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->runnable:Ljava/lang/Runnable;

    .line 441
    iput-object p1, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->lock:Ljava/util/concurrent/locks/Lock;

    .line 442
    new-instance p1, Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;

    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {p1, v0, p2}, Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;-><init>(Ljava/lang/ref/WeakReference;Ljava/lang/ref/WeakReference;)V

    iput-object p1, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->wrapper:Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;

    return-void
.end method


# virtual methods
.method public insertAfter(Lcom/arialyy/aria/util/WeakHandler$ChainedRef;)V
    .locals 1

    .line 463
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 465
    :try_start_0
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->next:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    if-eqz v0, :cond_0

    .line 466
    iput-object p1, v0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->prev:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    .line 469
    :cond_0
    iput-object v0, p1, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->next:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    .line 470
    iput-object p1, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->next:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    .line 471
    iput-object p0, p1, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->prev:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 473
    iget-object p1, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 474
    throw p1
.end method

.method public remove()Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;
    .locals 2

    .line 446
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 448
    :try_start_0
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->prev:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    if-eqz v0, :cond_0

    .line 449
    iget-object v1, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->next:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    iput-object v1, v0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->next:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    .line 451
    :cond_0
    iget-object v1, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->next:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    if-eqz v1, :cond_1

    .line 452
    iput-object v0, v1, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->prev:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    :cond_1
    const/4 v0, 0x0

    .line 454
    iput-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->prev:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    .line 455
    iput-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->next:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 457
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 459
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->wrapper:Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;

    return-object v0

    :catchall_0
    move-exception v0

    .line 457
    iget-object v1, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 458
    throw v0
.end method

.method public remove(Ljava/lang/Runnable;)Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;
    .locals 2

    .line 478
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 480
    :try_start_0
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->next:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    :goto_0
    if-eqz v0, :cond_1

    .line 482
    iget-object v1, v0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->runnable:Ljava/lang/Runnable;

    if-ne v1, p1, :cond_0

    .line 483
    invoke-virtual {v0}, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->remove()Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 488
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-object p1

    .line 485
    :cond_0
    :try_start_1
    iget-object v0, v0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->next:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 488
    :cond_1
    iget-object p1, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const/4 p1, 0x0

    return-object p1

    :catchall_0
    move-exception p1

    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->lock:Ljava/util/concurrent/locks/Lock;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 489
    throw p1
.end method
