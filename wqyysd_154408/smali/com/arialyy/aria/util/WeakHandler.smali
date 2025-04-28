.class public Lcom/arialyy/aria/util/WeakHandler;
.super Ljava/lang/Object;
.source "WeakHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arialyy/aria/util/WeakHandler$ChainedRef;,
        Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;,
        Lcom/arialyy/aria/util/WeakHandler$ExecHandler;
    }
.end annotation


# instance fields
.field private final mCallback:Landroid/os/Handler$Callback;

.field private final mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

.field private mLock:Ljava/util/concurrent/locks/Lock;

.field final mRunnables:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mLock:Ljava/util/concurrent/locks/Lock;

    .line 51
    new-instance v1, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;-><init>(Ljava/util/concurrent/locks/Lock;Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/arialyy/aria/util/WeakHandler;->mRunnables:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    .line 62
    iput-object v2, p0, Lcom/arialyy/aria/util/WeakHandler;->mCallback:Landroid/os/Handler$Callback;

    .line 63
    new-instance v0, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-direct {v0}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    return-void
.end method

.method public constructor <init>(Landroid/os/Handler$Callback;)V
    .locals 3

    .line 76
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mLock:Ljava/util/concurrent/locks/Lock;

    .line 51
    new-instance v1, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;-><init>(Ljava/util/concurrent/locks/Lock;Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/arialyy/aria/util/WeakHandler;->mRunnables:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    .line 77
    iput-object p1, p0, Lcom/arialyy/aria/util/WeakHandler;->mCallback:Landroid/os/Handler$Callback;

    .line 78
    new-instance v0, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;-><init>(Ljava/lang/ref/WeakReference;)V

    iput-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;)V
    .locals 3

    .line 86
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mLock:Ljava/util/concurrent/locks/Lock;

    .line 51
    new-instance v1, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;-><init>(Ljava/util/concurrent/locks/Lock;Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/arialyy/aria/util/WeakHandler;->mRunnables:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    .line 87
    iput-object v2, p0, Lcom/arialyy/aria/util/WeakHandler;->mCallback:Landroid/os/Handler$Callback;

    .line 88
    new-instance v0, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-direct {v0, p1}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V
    .locals 3

    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mLock:Ljava/util/concurrent/locks/Lock;

    .line 51
    new-instance v1, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    const/4 v2, 0x0

    invoke-direct {v1, v0, v2}, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;-><init>(Ljava/util/concurrent/locks/Lock;Ljava/lang/Runnable;)V

    iput-object v1, p0, Lcom/arialyy/aria/util/WeakHandler;->mRunnables:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    .line 99
    iput-object p2, p0, Lcom/arialyy/aria/util/WeakHandler;->mCallback:Landroid/os/Handler$Callback;

    .line 100
    new-instance v0, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, p1, v1}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;-><init>(Landroid/os/Looper;Ljava/lang/ref/WeakReference;)V

    iput-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    return-void
.end method

.method private wrapRunnable(Ljava/lang/Runnable;)Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;
    .locals 2

    const-string v0, "Runnable can\'t be null"

    .line 370
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 372
    new-instance v0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    iget-object v1, p0, Lcom/arialyy/aria/util/WeakHandler;->mLock:Ljava/util/concurrent/locks/Lock;

    invoke-direct {v0, v1, p1}, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;-><init>(Ljava/util/concurrent/locks/Lock;Ljava/lang/Runnable;)V

    .line 373
    iget-object p1, p0, Lcom/arialyy/aria/util/WeakHandler;->mRunnables:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->insertAfter(Lcom/arialyy/aria/util/WeakHandler$ChainedRef;)V

    .line 374
    iget-object p1, v0, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->wrapper:Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;

    return-object p1
.end method


# virtual methods
.method public final getLooper()Landroid/os/Looper;
    .locals 1

    .line 364
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    return-object v0
.end method

.method public final hasMessages(I)Z
    .locals 1

    .line 352
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->hasMessages(I)Z

    move-result p1

    return p1
.end method

.method public final hasMessages(ILjava/lang/Object;)Z
    .locals 1

    .line 360
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1, p2}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->hasMessages(ILjava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final post(Ljava/lang/Runnable;)Z
    .locals 1

    .line 114
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-direct {p0, p1}, Lcom/arialyy/aria/util/WeakHandler;->wrapRunnable(Ljava/lang/Runnable;)Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->post(Ljava/lang/Runnable;)Z

    move-result p1

    return p1
.end method

.method public final postAtFrontOfQueue(Ljava/lang/Runnable;)Z
    .locals 1

    .line 193
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-direct {p0, p1}, Lcom/arialyy/aria/util/WeakHandler;->wrapRunnable(Ljava/lang/Runnable;)Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->postAtFrontOfQueue(Ljava/lang/Runnable;)Z

    move-result p1

    return p1
.end method

.method public final postAtTime(Ljava/lang/Runnable;J)Z
    .locals 1

    .line 134
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-direct {p0, p1}, Lcom/arialyy/aria/util/WeakHandler;->wrapRunnable(Ljava/lang/Runnable;)Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;

    move-result-object p1

    invoke-virtual {v0, p1, p2, p3}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->postAtTime(Ljava/lang/Runnable;J)Z

    move-result p1

    return p1
.end method

.method public final postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z
    .locals 1

    .line 155
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-direct {p0, p1}, Lcom/arialyy/aria/util/WeakHandler;->wrapRunnable(Ljava/lang/Runnable;)Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;

    move-result-object p1

    invoke-virtual {v0, p1, p2, p3, p4}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    move-result p1

    return p1
.end method

.method public final postDelayed(Ljava/lang/Runnable;J)Z
    .locals 1

    .line 175
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-direct {p0, p1}, Lcom/arialyy/aria/util/WeakHandler;->wrapRunnable(Ljava/lang/Runnable;)Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;

    move-result-object p1

    invoke-virtual {v0, p1, p2, p3}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->postDelayed(Ljava/lang/Runnable;J)Z

    move-result p1

    return p1
.end method

.method public final removeCallbacks(Ljava/lang/Runnable;)V
    .locals 1

    .line 200
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mRunnables:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->remove(Ljava/lang/Runnable;)Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 202
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->removeCallbacks(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method

.method public final removeCallbacks(Ljava/lang/Runnable;Ljava/lang/Object;)V
    .locals 1

    .line 212
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mRunnables:Lcom/arialyy/aria/util/WeakHandler$ChainedRef;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/util/WeakHandler$ChainedRef;->remove(Ljava/lang/Runnable;)Lcom/arialyy/aria/util/WeakHandler$WeakRunnable;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 214
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1, p2}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->removeCallbacks(Ljava/lang/Runnable;Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public final removeCallbacksAndMessages(Ljava/lang/Object;)V
    .locals 1

    .line 344
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    return-void
.end method

.method public final removeMessages(I)V
    .locals 1

    .line 326
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->removeMessages(I)V

    return-void
.end method

.method public final removeMessages(ILjava/lang/Object;)V
    .locals 1

    .line 335
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1, p2}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->removeMessages(ILjava/lang/Object;)V

    return-void
.end method

.method public final sendEmptyMessage(I)Z
    .locals 1

    .line 239
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->sendEmptyMessage(I)Z

    move-result p1

    return p1
.end method

.method public final sendEmptyMessageAtTime(IJ)Z
    .locals 1

    .line 265
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1, p2, p3}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->sendEmptyMessageAtTime(IJ)Z

    move-result p1

    return p1
.end method

.method public final sendEmptyMessageDelayed(IJ)Z
    .locals 1

    .line 252
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1, p2, p3}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->sendEmptyMessageDelayed(IJ)Z

    move-result p1

    return p1
.end method

.method public final sendMessage(Landroid/os/Message;)Z
    .locals 1

    .line 228
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->sendMessage(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public final sendMessageAtFrontOfQueue(Landroid/os/Message;)Z
    .locals 1

    .line 318
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->sendMessageAtFrontOfQueue(Landroid/os/Message;)Z

    move-result p1

    return p1
.end method

.method public sendMessageAtTime(Landroid/os/Message;J)Z
    .locals 1

    .line 302
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1, p2, p3}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->sendMessageAtTime(Landroid/os/Message;J)Z

    move-result p1

    return p1
.end method

.method public final sendMessageDelayed(Landroid/os/Message;J)Z
    .locals 1

    .line 281
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler;->mExec:Lcom/arialyy/aria/util/WeakHandler$ExecHandler;

    invoke-virtual {v0, p1, p2, p3}, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->sendMessageDelayed(Landroid/os/Message;J)Z

    move-result p1

    return p1
.end method
