.class public Lcom/arialyy/aria/util/AriaCrashHandler;
.super Ljava/lang/Object;
.source "AriaCrashHandler.java"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field private mDefaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

.field private mExecutorService:Ljava/util/concurrent/ExecutorService;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/util/AriaCrashHandler;->mDefaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 33
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/util/AriaCrashHandler;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method private exit()V
    .locals 1

    .line 71
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    const/4 v0, 0x1

    .line 72
    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    return-void
.end method

.method private handleException(Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 1

    if-nez p2, :cond_0

    return-void

    .line 59
    :cond_0
    iget-object p1, p0, Lcom/arialyy/aria/util/AriaCrashHandler;->mExecutorService:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Lcom/arialyy/aria/util/AriaCrashHandler$1;

    invoke-direct {v0, p0, p2}, Lcom/arialyy/aria/util/AriaCrashHandler$1;-><init>(Lcom/arialyy/aria/util/AriaCrashHandler;Ljava/lang/Throwable;)V

    invoke-interface {p1, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 2

    .line 38
    invoke-virtual {p2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 40
    invoke-virtual {p1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p2}, Lcom/arialyy/aria/util/AriaCrashHandler;->handleException(Ljava/lang/String;Ljava/lang/Throwable;)V

    const-wide/16 v0, 0x3e8

    .line 42
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    :goto_0
    iget-object v0, p0, Lcom/arialyy/aria/util/AriaCrashHandler;->mDefaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 47
    invoke-direct {p0}, Lcom/arialyy/aria/util/AriaCrashHandler;->exit()V

    goto :goto_1

    :catchall_0
    move-exception v0

    goto :goto_2

    :catch_0
    move-exception v0

    .line 44
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :goto_1
    return-void

    .line 46
    :goto_2
    iget-object v1, p0, Lcom/arialyy/aria/util/AriaCrashHandler;->mDefaultHandler:Ljava/lang/Thread$UncaughtExceptionHandler;

    invoke-interface {v1, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 47
    invoke-direct {p0}, Lcom/arialyy/aria/util/AriaCrashHandler;->exit()V

    .line 48
    throw v0
.end method
