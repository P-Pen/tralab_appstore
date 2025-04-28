.class Lcom/arialyy/aria/util/WeakHandler$ExecHandler;
.super Landroid/os/Handler;
.source "WeakHandler.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arialyy/aria/util/WeakHandler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "ExecHandler"
.end annotation


# instance fields
.field private final mCallback:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/os/Handler$Callback;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>()V
    .locals 1

    .line 380
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    const/4 v0, 0x0

    .line 381
    iput-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->mCallback:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method constructor <init>(Landroid/os/Looper;)V
    .locals 0

    .line 389
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    const/4 p1, 0x0

    .line 390
    iput-object p1, p0, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->mCallback:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method constructor <init>(Landroid/os/Looper;Ljava/lang/ref/WeakReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/os/Looper;",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/os/Handler$Callback;",
            ">;)V"
        }
    .end annotation

    .line 394
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 395
    iput-object p2, p0, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->mCallback:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference<",
            "Landroid/os/Handler$Callback;",
            ">;)V"
        }
    .end annotation

    .line 384
    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    .line 385
    iput-object p1, p0, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->mCallback:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 1

    .line 399
    iget-object v0, p0, Lcom/arialyy/aria/util/WeakHandler$ExecHandler;->mCallback:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    return-void

    .line 402
    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Handler$Callback;

    if-nez v0, :cond_1

    return-void

    .line 406
    :cond_1
    invoke-interface {v0, p1}, Landroid/os/Handler$Callback;->handleMessage(Landroid/os/Message;)Z

    return-void
.end method
