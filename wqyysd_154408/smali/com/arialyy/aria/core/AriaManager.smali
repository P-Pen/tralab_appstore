.class public Lcom/arialyy/aria/core/AriaManager;
.super Ljava/lang/Object;
.source "AriaManager.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arialyy/aria/core/AriaManager$LifeCallback;
    }
.end annotation


# static fields
.field private static APP:Landroid/content/Context; = null

.field private static volatile INSTANCE:Lcom/arialyy/aria/core/AriaManager; = null

.field private static final LOCK:Ljava/lang/Object;

.field private static final TAG:Ljava/lang/String; = "AriaManager"


# instance fields
.field private mConfig:Lcom/arialyy/aria/core/AriaConfig;

.field private mDbWrapper:Lcom/arialyy/aria/orm/DelegateWrapper;

.field private mReceivers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/arialyy/aria/core/inf/AbsReceiver;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 61
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/arialyy/aria/core/AriaManager;->LOCK:Ljava/lang/Object;

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 69
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 64
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/AriaManager;->mReceivers:Ljava/util/Map;

    .line 70
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    sput-object p1, Lcom/arialyy/aria/core/AriaManager;->APP:Landroid/content/Context;

    return-void
.end method

.method private amendTaskState()V
    .locals 7

    const/4 v0, 0x3

    new-array v1, v0, [Ljava/lang/Class;

    .line 131
    const-class v2, Lcom/arialyy/aria/core/download/DownloadEntity;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-class v2, Lcom/arialyy/aria/core/upload/UploadEntity;

    const/4 v4, 0x1

    aput-object v2, v1, v4

    const/4 v2, 0x2

    const-class v5, Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    aput-object v5, v1, v2

    move v2, v3

    :goto_0
    if-ge v2, v0, :cond_1

    .line 135
    aget-object v5, v1, v2

    .line 136
    iget-object v6, p0, Lcom/arialyy/aria/core/AriaManager;->mDbWrapper:Lcom/arialyy/aria/orm/DelegateWrapper;

    invoke-virtual {v6, v5}, Lcom/arialyy/aria/orm/DelegateWrapper;->tableExists(Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_0

    goto :goto_1

    :cond_0
    new-array v6, v4, [Ljava/lang/Object;

    .line 139
    invoke-virtual {v5}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v6, v3

    const-string v5, "UPDATE %s SET state=2 WHERE state IN (4,5,6)"

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 140
    invoke-static {v5}, Lcom/arialyy/aria/orm/DbEntity;->exeSql(Ljava/lang/String;)V

    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-void
.end method

.method public static getInstance()Lcom/arialyy/aria/core/AriaManager;
    .locals 1

    .line 74
    sget-object v0, Lcom/arialyy/aria/core/AriaManager;->INSTANCE:Lcom/arialyy/aria/core/AriaManager;

    return-object v0
.end method

.method private getKey(Lcom/arialyy/aria/core/inf/ReceiverType;Ljava/lang/Object;)Ljava/lang/String;
    .locals 3

    const/4 v0, 0x3

    new-array v0, v0, [Ljava/lang/Object;

    .line 292
    invoke-static {p2}, Lcom/arialyy/aria/util/CommonUtil;->getTargetName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-virtual {p1}, Lcom/arialyy/aria/core/inf/ReceiverType;->name()Ljava/lang/String;

    move-result-object p1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    invoke-virtual {p2}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    const/4 p2, 0x2

    aput-object p1, v0, p2

    const-string p1, "%s_%s_%s"

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method static init(Landroid/content/Context;)Lcom/arialyy/aria/core/AriaManager;
    .locals 2

    .line 78
    sget-object v0, Lcom/arialyy/aria/core/AriaManager;->INSTANCE:Lcom/arialyy/aria/core/AriaManager;

    if-nez v0, :cond_1

    .line 79
    sget-object v0, Lcom/arialyy/aria/core/AriaManager;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 80
    :try_start_0
    sget-object v1, Lcom/arialyy/aria/core/AriaManager;->INSTANCE:Lcom/arialyy/aria/core/AriaManager;

    if-nez v1, :cond_0

    .line 81
    new-instance v1, Lcom/arialyy/aria/core/AriaManager;

    invoke-direct {v1, p0}, Lcom/arialyy/aria/core/AriaManager;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/arialyy/aria/core/AriaManager;->INSTANCE:Lcom/arialyy/aria/core/AriaManager;

    .line 82
    sget-object p0, Lcom/arialyy/aria/core/AriaManager;->INSTANCE:Lcom/arialyy/aria/core/AriaManager;

    invoke-direct {p0}, Lcom/arialyy/aria/core/AriaManager;->initData()V

    .line 84
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 86
    :cond_1
    :goto_0
    sget-object p0, Lcom/arialyy/aria/core/AriaManager;->INSTANCE:Lcom/arialyy/aria/core/AriaManager;

    return-object p0
.end method

.method private initAria()V
    .locals 2

    .line 119
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaManager;->mConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getAConfig()Lcom/arialyy/aria/core/config/AppConfig;

    move-result-object v0

    .line 120
    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/AppConfig;->getUseAriaCrashHandler()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 121
    new-instance v1, Lcom/arialyy/aria/util/AriaCrashHandler;

    invoke-direct {v1}, Lcom/arialyy/aria/util/AriaCrashHandler;-><init>()V

    invoke-static {v1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 123
    :cond_0
    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/AppConfig;->getLogLevel()I

    move-result v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/config/AppConfig;->setLogLevel(I)Lcom/arialyy/aria/core/config/AppConfig;

    .line 124
    invoke-static {}, Lcom/arialyy/aria/core/command/CommandManager;->init()V

    return-void
.end method

.method private initData()V
    .locals 1

    .line 90
    sget-object v0, Lcom/arialyy/aria/core/AriaManager;->APP:Landroid/content/Context;

    invoke-static {v0}, Lcom/arialyy/aria/core/AriaConfig;->init(Landroid/content/Context;)Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/AriaManager;->mConfig:Lcom/arialyy/aria/core/AriaConfig;

    .line 91
    sget-object v0, Lcom/arialyy/aria/core/AriaManager;->APP:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/arialyy/aria/core/AriaManager;->initDb(Landroid/content/Context;)V

    .line 92
    sget-object v0, Lcom/arialyy/aria/core/AriaManager;->APP:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/arialyy/aria/core/AriaManager;->regAppLifeCallback(Landroid/content/Context;)V

    .line 93
    invoke-direct {p0}, Lcom/arialyy/aria/core/AriaManager;->initAria()V

    return-void
.end method

.method private initDb(Landroid/content/Context;)V
    .locals 8

    const-string v0, "AriaLyyDb"

    .line 105
    invoke-virtual {p1, v0}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 106
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 107
    new-instance v1, Ljava/io/File;

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    const-string v4, "AriaLyyDb-journal"

    const/4 v6, 0x1

    aput-object v4, v3, v6

    const-string v4, "%s/%s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 108
    new-instance v3, Ljava/io/File;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v2, v5

    const-string v5, "AndroidAria.db"

    aput-object v5, v2, v6

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 110
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 111
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 114
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/arialyy/aria/orm/DelegateWrapper;->init(Landroid/content/Context;)Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/AriaManager;->mDbWrapper:Lcom/arialyy/aria/orm/DelegateWrapper;

    .line 115
    invoke-direct {p0}, Lcom/arialyy/aria/core/AriaManager;->amendTaskState()V

    return-void
.end method

.method private putReceiver(Lcom/arialyy/aria/core/inf/ReceiverType;Ljava/lang/Object;)Lcom/arialyy/aria/core/inf/IReceiver;
    .locals 2

    .line 271
    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/core/AriaManager;->getKey(Lcom/arialyy/aria/core/inf/ReceiverType;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 272
    iget-object v1, p0, Lcom/arialyy/aria/core/AriaManager;->mReceivers:Ljava/util/Map;

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/inf/IReceiver;

    if-nez v1, :cond_1

    .line 275
    sget-object v1, Lcom/arialyy/aria/core/inf/ReceiverType;->DOWNLOAD:Lcom/arialyy/aria/core/inf/ReceiverType;

    .line 276
    invoke-virtual {p1, v1}, Lcom/arialyy/aria/core/inf/ReceiverType;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    new-instance p1, Lcom/arialyy/aria/core/download/DownloadReceiver;

    invoke-direct {p1, p2}, Lcom/arialyy/aria/core/download/DownloadReceiver;-><init>(Ljava/lang/Object;)V

    goto :goto_0

    :cond_0
    new-instance p1, Lcom/arialyy/aria/core/upload/UploadReceiver;

    invoke-direct {p1, p2}, Lcom/arialyy/aria/core/upload/UploadReceiver;-><init>(Ljava/lang/Object;)V

    :goto_0
    move-object v1, p1

    .line 277
    iget-object p1, p0, Lcom/arialyy/aria/core/AriaManager;->mReceivers:Ljava/util/Map;

    invoke-interface {p1, v0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_1
    return-object v1
.end method

.method private regAppLifeCallback(Landroid/content/Context;)V
    .locals 2

    .line 299
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    .line 300
    instance-of v0, p1, Landroid/app/Application;

    if-eqz v0, :cond_0

    .line 301
    new-instance v0, Lcom/arialyy/aria/core/AriaManager$LifeCallback;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/arialyy/aria/core/AriaManager$LifeCallback;-><init>(Lcom/arialyy/aria/core/AriaManager;Lcom/arialyy/aria/core/AriaManager$1;)V

    .line 302
    check-cast p1, Landroid/app/Application;

    invoke-virtual {p1, v0}, Landroid/app/Application;->registerActivityLifecycleCallbacks(Landroid/app/Application$ActivityLifecycleCallbacks;)V

    :cond_0
    return-void
.end method


# virtual methods
.method public delRecord(ILjava/lang/String;Z)V
    .locals 2

    const/4 v0, 0x1

    if-eq p1, v0, :cond_2

    const/4 v1, 0x2

    if-eq p1, v1, :cond_1

    const/4 v1, 0x3

    if-eq p1, v1, :cond_0

    goto :goto_0

    .line 265
    :cond_0
    invoke-static {}, Lcom/arialyy/aria/util/DeleteURecord;->getInstance()Lcom/arialyy/aria/util/DeleteURecord;

    move-result-object p1

    invoke-virtual {p1, p2, p3, v0}, Lcom/arialyy/aria/util/DeleteURecord;->deleteRecord(Ljava/lang/String;ZZ)V

    goto :goto_0

    .line 262
    :cond_1
    invoke-static {p2, p3}, Lcom/arialyy/aria/util/RecordUtil;->delGroupTaskRecordByHash(Ljava/lang/String;Z)V

    goto :goto_0

    .line 259
    :cond_2
    invoke-static {p2, v0, p3, v0}, Lcom/arialyy/aria/util/RecordUtil;->delTaskRecord(Ljava/lang/String;IZZ)V

    :goto_0
    return-void
.end method

.method download(Ljava/lang/Object;)Lcom/arialyy/aria/core/download/DownloadReceiver;
    .locals 2

    .line 231
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaManager;->mReceivers:Ljava/util/Map;

    sget-object v1, Lcom/arialyy/aria/core/inf/ReceiverType;->DOWNLOAD:Lcom/arialyy/aria/core/inf/ReceiverType;

    invoke-direct {p0, v1, p1}, Lcom/arialyy/aria/core/AriaManager;->getKey(Lcom/arialyy/aria/core/inf/ReceiverType;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/inf/IReceiver;

    if-nez v0, :cond_0

    .line 233
    sget-object v0, Lcom/arialyy/aria/core/inf/ReceiverType;->DOWNLOAD:Lcom/arialyy/aria/core/inf/ReceiverType;

    invoke-direct {p0, v0, p1}, Lcom/arialyy/aria/core/AriaManager;->putReceiver(Lcom/arialyy/aria/core/inf/ReceiverType;Ljava/lang/Object;)Lcom/arialyy/aria/core/inf/IReceiver;

    move-result-object v0

    .line 235
    :cond_0
    instance-of p1, v0, Lcom/arialyy/aria/core/download/DownloadReceiver;

    if-eqz p1, :cond_1

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadReceiver;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method

.method public getAPP()Landroid/content/Context;
    .locals 1

    .line 97
    sget-object v0, Lcom/arialyy/aria/core/AriaManager;->APP:Landroid/content/Context;

    return-object v0
.end method

.method public getAppConfig()Lcom/arialyy/aria/core/config/AppConfig;
    .locals 1

    .line 210
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaManager;->mConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getAConfig()Lcom/arialyy/aria/core/config/AppConfig;

    move-result-object v0

    return-object v0
.end method

.method public getDGroupConfig()Lcom/arialyy/aria/core/config/DGroupConfig;
    .locals 1

    .line 223
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaManager;->mConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getDGConfig()Lcom/arialyy/aria/core/config/DGroupConfig;

    move-result-object v0

    return-object v0
.end method

.method public getDownloadConfig()Lcom/arialyy/aria/core/config/DownloadConfig;
    .locals 1

    .line 190
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaManager;->mConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getDConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object v0

    return-object v0
.end method

.method public getReceiver()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/arialyy/aria/core/inf/AbsReceiver;",
            ">;"
        }
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaManager;->mReceivers:Ljava/util/Map;

    return-object v0
.end method

.method public getUploadConfig()Lcom/arialyy/aria/core/config/UploadConfig;
    .locals 1

    .line 203
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaManager;->mConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getUConfig()Lcom/arialyy/aria/core/config/UploadConfig;

    move-result-object v0

    return-object v0
.end method

.method public removeReceiver(Ljava/lang/Object;)V
    .locals 8

    const-string v0, "AriaManager"

    if-nez p1, :cond_0

    const-string p1, "target obj is null"

    .line 311
    invoke-static {v0, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 315
    :cond_0
    iget-object v1, p0, Lcom/arialyy/aria/core/AriaManager;->mReceivers:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 316
    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 317
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 318
    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 319
    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/inf/AbsReceiver;

    .line 321
    invoke-virtual {v2}, Lcom/arialyy/aria/core/inf/AbsReceiver;->isFragment()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 322
    iget-object v4, v2, Lcom/arialyy/aria/core/inf/AbsReceiver;->obj:Ljava/lang/Object;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const/4 v5, 0x0

    new-array v6, v5, [Ljava/lang/Class;

    const-string v7, "getActivity"

    invoke-static {v4, v7, v6}, Lcom/arialyy/aria/util/CommonUtil;->getMethod(Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v4

    if-eqz v4, :cond_2

    .line 325
    :try_start_0
    iget-object v6, v2, Lcom/arialyy/aria/core/inf/AbsReceiver;->obj:Ljava/lang/Object;

    new-array v5, v5, [Ljava/lang/Object;

    invoke-virtual {v4, v6, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/app/Activity;

    if-ne v4, p1, :cond_2

    .line 327
    invoke-virtual {v2}, Lcom/arialyy/aria/core/inf/AbsReceiver;->destroy()V

    .line 328
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v4

    .line 334
    invoke-virtual {v4}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_1

    :catch_1
    move-exception v4

    .line 332
    invoke-virtual {v4}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    .line 340
    :cond_2
    :goto_1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v4

    .line 341
    iget-boolean v5, v2, Lcom/arialyy/aria/core/inf/AbsReceiver;->isLocalOrAnonymousClass:Z

    if-eqz v5, :cond_3

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    .line 342
    invoke-virtual {v2}, Lcom/arialyy/aria/core/inf/AbsReceiver;->destroy()V

    .line 343
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_0

    .line 347
    :cond_3
    sget-object v4, Lcom/arialyy/aria/core/inf/ReceiverType;->DOWNLOAD:Lcom/arialyy/aria/core/inf/ReceiverType;

    invoke-direct {p0, v4, p1}, Lcom/arialyy/aria/core/AriaManager;->getKey(Lcom/arialyy/aria/core/inf/ReceiverType;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_4

    sget-object v4, Lcom/arialyy/aria/core/inf/ReceiverType;->UPLOAD:Lcom/arialyy/aria/core/inf/ReceiverType;

    .line 348
    invoke-direct {p0, v4, p1}, Lcom/arialyy/aria/core/AriaManager;->getKey(Lcom/arialyy/aria/core/inf/ReceiverType;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 350
    :cond_4
    invoke-virtual {v2}, Lcom/arialyy/aria/core/inf/AbsReceiver;->destroy()V

    .line 351
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto/16 :goto_0

    :cond_5
    const-string p1, "debug"

    .line 354
    invoke-static {v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public setDownloadQueueMod(Lcom/arialyy/aria/core/common/QueueMod;)Lcom/arialyy/aria/core/AriaManager;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 176
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaManager;->mConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getDConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object v0

    iget-object p1, p1, Lcom/arialyy/aria/core/common/QueueMod;->tag:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/config/DownloadConfig;->setQueueMod(Ljava/lang/String;)Lcom/arialyy/aria/core/config/BaseTaskConfig;

    return-object p0
.end method

.method public setUploadQueueMod(Lcom/arialyy/aria/core/common/QueueMod;)Lcom/arialyy/aria/core/AriaManager;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 160
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaManager;->mConfig:Lcom/arialyy/aria/core/AriaConfig;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getUConfig()Lcom/arialyy/aria/core/config/UploadConfig;

    move-result-object v0

    iget-object p1, p1, Lcom/arialyy/aria/core/common/QueueMod;->tag:Ljava/lang/String;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/config/UploadConfig;->setQueueMod(Ljava/lang/String;)Lcom/arialyy/aria/core/config/BaseTaskConfig;

    return-object p0
.end method

.method upload(Ljava/lang/Object;)Lcom/arialyy/aria/core/upload/UploadReceiver;
    .locals 2

    .line 242
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaManager;->mReceivers:Ljava/util/Map;

    sget-object v1, Lcom/arialyy/aria/core/inf/ReceiverType;->UPLOAD:Lcom/arialyy/aria/core/inf/ReceiverType;

    invoke-direct {p0, v1, p1}, Lcom/arialyy/aria/core/AriaManager;->getKey(Lcom/arialyy/aria/core/inf/ReceiverType;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/inf/IReceiver;

    if-nez v0, :cond_0

    .line 244
    sget-object v0, Lcom/arialyy/aria/core/inf/ReceiverType;->UPLOAD:Lcom/arialyy/aria/core/inf/ReceiverType;

    invoke-direct {p0, v0, p1}, Lcom/arialyy/aria/core/AriaManager;->putReceiver(Lcom/arialyy/aria/core/inf/ReceiverType;Ljava/lang/Object;)Lcom/arialyy/aria/core/inf/IReceiver;

    move-result-object v0

    .line 246
    :cond_0
    instance-of p1, v0, Lcom/arialyy/aria/core/upload/UploadReceiver;

    if-eqz p1, :cond_1

    check-cast v0, Lcom/arialyy/aria/core/upload/UploadReceiver;

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return-object v0
.end method
