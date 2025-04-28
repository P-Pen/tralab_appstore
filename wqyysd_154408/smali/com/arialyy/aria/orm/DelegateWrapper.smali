.class public Lcom/arialyy/aria/orm/DelegateWrapper;
.super Ljava/lang/Object;
.source "DelegateWrapper.java"


# static fields
.field private static volatile INSTANCE:Lcom/arialyy/aria/orm/DelegateWrapper; = null

.field private static final TAG:Ljava/lang/String; = "DelegateWrapper"


# instance fields
.field private mDManager:Lcom/arialyy/aria/orm/DelegateManager;

.field private mDb:Landroid/database/sqlite/SQLiteDatabase;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Lcom/arialyy/aria/orm/SqlHelper;->init(Landroid/content/Context;)Lcom/arialyy/aria/orm/SqlHelper;

    move-result-object p1

    .line 39
    invoke-virtual {p1}, Lcom/arialyy/aria/orm/SqlHelper;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    .line 40
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateManager;->getInstance()Lcom/arialyy/aria/orm/DelegateManager;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    return-void
.end method

.method static getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;
    .locals 2

    .line 55
    sget-object v0, Lcom/arialyy/aria/orm/DelegateWrapper;->INSTANCE:Lcom/arialyy/aria/orm/DelegateWrapper;

    const-string v1, "\u8bf7\u5728Application\u4e2d\u8c03\u7528init\u8fdb\u884c\u6570\u636e\u5e93\u5de5\u5177\u6ce8\u518c\u6ce8\u518c"

    .line 56
    invoke-static {v0, v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 58
    sget-object v0, Lcom/arialyy/aria/orm/DelegateWrapper;->INSTANCE:Lcom/arialyy/aria/orm/DelegateWrapper;

    return-object v0
.end method

.method public static init(Landroid/content/Context;)Lcom/arialyy/aria/orm/DelegateWrapper;
    .locals 2

    .line 44
    sget-object v0, Lcom/arialyy/aria/orm/DelegateWrapper;->INSTANCE:Lcom/arialyy/aria/orm/DelegateWrapper;

    if-nez v0, :cond_1

    .line 45
    const-class v0, Lcom/arialyy/aria/orm/DelegateWrapper;

    monitor-enter v0

    .line 46
    :try_start_0
    sget-object v1, Lcom/arialyy/aria/orm/DelegateWrapper;->INSTANCE:Lcom/arialyy/aria/orm/DelegateWrapper;

    if-nez v1, :cond_0

    .line 47
    new-instance v1, Lcom/arialyy/aria/orm/DelegateWrapper;

    invoke-direct {v1, p0}, Lcom/arialyy/aria/orm/DelegateWrapper;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/arialyy/aria/orm/DelegateWrapper;->INSTANCE:Lcom/arialyy/aria/orm/DelegateWrapper;

    .line 49
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 51
    :cond_1
    :goto_0
    sget-object p0, Lcom/arialyy/aria/orm/DelegateWrapper;->INSTANCE:Lcom/arialyy/aria/orm/DelegateWrapper;

    return-object p0
.end method


# virtual methods
.method varargs checkDataExist(Ljava/lang/Class;[Ljava/lang/String;)Z
    .locals 1

    .line 88
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {v0, p1, p2}, Lcom/arialyy/aria/orm/SqlUtil;->checkDataExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;[Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method clean(Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)V"
        }
    .end annotation

    .line 95
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {v0, p1}, Lcom/arialyy/aria/orm/SqlUtil;->clean(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    return-void
.end method

.method varargs delData(Ljava/lang/Class;[Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;[",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 109
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateUpdate;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/DelegateUpdate;

    iget-object v1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1, p1, p2}, Lcom/arialyy/aria/orm/DelegateUpdate;->delData(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;[Ljava/lang/String;)V

    return-void
.end method

.method exeSql(Ljava/lang/String;)V
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, p1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method findAllData(Ljava/lang/Class;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 130
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateFind;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/DelegateFind;

    iget-object v1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1, p1}, Lcom/arialyy/aria/orm/DelegateFind;->findAllData(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method varargs findData(Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;II[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 144
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateFind;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/arialyy/aria/orm/DelegateFind;

    iget-object v2, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    move-object v3, p1

    move v4, p2

    move v5, p3

    move-object v6, p4

    invoke-virtual/range {v1 .. v6}, Lcom/arialyy/aria/orm/DelegateFind;->findData(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method varargs findData(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 137
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateFind;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/DelegateFind;

    iget-object v1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1, p1, p2}, Lcom/arialyy/aria/orm/DelegateFind;->findData(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method findDataByFuzzy(Ljava/lang/Class;IILjava/lang/String;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;II",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 159
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateFind;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/arialyy/aria/orm/DelegateFind;

    iget-object v2, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    move-object v3, p1

    move v4, p2

    move v5, p3

    move-object v6, p4

    .line 160
    invoke-virtual/range {v1 .. v6}, Lcom/arialyy/aria/orm/DelegateFind;->findDataByFuzzy(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;IILjava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method findDataByFuzzy(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 151
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateFind;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/DelegateFind;

    iget-object v1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1, p1, p2}, Lcom/arialyy/aria/orm/DelegateFind;->findDataByFuzzy(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method varargs findRelationData(Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/AbsDbWrapper;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;II[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 77
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateFind;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lcom/arialyy/aria/orm/DelegateFind;

    iget-object v2, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    move-object v3, p1

    move v4, p2

    move v5, p3

    move-object v6, p4

    .line 78
    invoke-virtual/range {v1 .. v6}, Lcom/arialyy/aria/orm/DelegateFind;->findRelationData(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method varargs findRelationData(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/AbsDbWrapper;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateFind;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/DelegateFind;

    iget-object v1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1, p1, p2}, Lcom/arialyy/aria/orm/DelegateFind;->findRelationData(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method getRowId(Ljava/lang/Class;[Ljava/lang/Object;[Ljava/lang/Object;)I
    .locals 2

    .line 209
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateFind;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/DelegateFind;

    iget-object v1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/arialyy/aria/orm/DelegateFind;->getRowId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;[Ljava/lang/Object;[Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method getRowId(Ljava/lang/Class;)[I
    .locals 2

    .line 202
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateFind;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/DelegateFind;

    iget-object v1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1, p1}, Lcom/arialyy/aria/orm/DelegateFind;->getRowId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)[I

    move-result-object p1

    return-object p1
.end method

.method insertData(Lcom/arialyy/aria/orm/DbEntity;)V
    .locals 2

    .line 181
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateUpdate;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/DelegateUpdate;

    iget-object v1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1, p1}, Lcom/arialyy/aria/orm/DelegateUpdate;->insertData(Landroid/database/sqlite/SQLiteDatabase;Lcom/arialyy/aria/orm/DbEntity;)V

    return-void
.end method

.method insertManyData(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 188
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateUpdate;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/DelegateUpdate;

    iget-object v1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1, p1}, Lcom/arialyy/aria/orm/DelegateUpdate;->insertManyData(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;)V

    return-void
.end method

.method isExist(Ljava/lang/Class;J)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;J)Z"
        }
    .end annotation

    .line 167
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateFind;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/DelegateFind;

    iget-object v1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/arialyy/aria/orm/DelegateFind;->itemExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;J)Z

    move-result p1

    return p1
.end method

.method isExist(Ljava/lang/String;J)Z
    .locals 2

    .line 174
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateFind;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/DelegateFind;

    iget-object v1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1, p1, p2, p3}, Lcom/arialyy/aria/orm/DelegateFind;->itemExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Z

    move-result p1

    return p1
.end method

.method public tableExists(Ljava/lang/Class;)Z
    .locals 1

    .line 195
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-static {v0, p1}, Lcom/arialyy/aria/orm/SqlUtil;->tableExists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)Z

    move-result p1

    return p1
.end method

.method updateData(Lcom/arialyy/aria/orm/DbEntity;)V
    .locals 2

    .line 116
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateUpdate;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/DelegateUpdate;

    iget-object v1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1, p1}, Lcom/arialyy/aria/orm/DelegateUpdate;->updateData(Landroid/database/sqlite/SQLiteDatabase;Lcom/arialyy/aria/orm/DbEntity;)V

    return-void
.end method

.method updateManyData(Ljava/util/List;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 123
    iget-object v0, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDManager:Lcom/arialyy/aria/orm/DelegateManager;

    const-class v1, Lcom/arialyy/aria/orm/DelegateUpdate;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/orm/DelegateManager;->getDelegate(Ljava/lang/Class;)Lcom/arialyy/aria/orm/AbsDelegate;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/DelegateUpdate;

    iget-object v1, p0, Lcom/arialyy/aria/orm/DelegateWrapper;->mDb:Landroid/database/sqlite/SQLiteDatabase;

    invoke-virtual {v0, v1, p1}, Lcom/arialyy/aria/orm/DelegateUpdate;->updateManyData(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/List;)V

    return-void
.end method
