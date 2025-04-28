.class public abstract Lcom/arialyy/aria/orm/DbEntity;
.super Ljava/lang/Object;
.source "DbEntity.java"


# static fields
.field private static final LOCK:Ljava/lang/Object;


# instance fields
.field public rowID:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 26
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/arialyy/aria/orm/DbEntity;->LOCK:Ljava/lang/Object;

    return-void
.end method

.method protected constructor <init>()V
    .locals 2

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, -0x1

    .line 27
    iput-wide v0, p0, Lcom/arialyy/aria/orm/DbEntity;->rowID:J

    return-void
.end method

.method public static varargs checkDataExist(Ljava/lang/Class;[Ljava/lang/String;)Z
    .locals 1

    .line 77
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/arialyy/aria/orm/DelegateWrapper;->checkDataExist(Ljava/lang/Class;[Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private static checkListData(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    if-eqz p0, :cond_0

    .line 229
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_0

    return-void

    .line 230
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    const-string v0, "\u5217\u8868\u6570\u636e\u4e3a\u7a7a"

    invoke-direct {p0, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static clean(Ljava/lang/Class;)V
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

    .line 84
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/arialyy/aria/orm/DelegateWrapper;->clean(Ljava/lang/Class;)V

    return-void
.end method

.method public static varargs deleteData(Ljava/lang/Class;[Ljava/lang/String;)V
    .locals 1
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

    .line 248
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    .line 249
    invoke-virtual {v0, p0, p1}, Lcom/arialyy/aria/orm/DelegateWrapper;->delData(Ljava/lang/Class;[Ljava/lang/String;)V

    return-void
.end method

.method public static exeSql(Ljava/lang/String;)V
    .locals 1

    .line 91
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/arialyy/aria/orm/DelegateWrapper;->exeSql(Ljava/lang/String;)V

    return-void
.end method

.method public static findAllData(Ljava/lang/Class;)Ljava/util/List;
    .locals 1
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

    .line 100
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/arialyy/aria/orm/DelegateWrapper;->findAllData(Ljava/lang/Class;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static findDataByFuzzy(Ljava/lang/Class;IILjava/lang/String;)Ljava/util/List;
    .locals 1
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

    .line 165
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/arialyy/aria/orm/DelegateWrapper;->findDataByFuzzy(Ljava/lang/Class;IILjava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static findDataByFuzzy(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/List;
    .locals 1
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

    .line 150
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/arialyy/aria/orm/DelegateWrapper;->findDataByFuzzy(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static varargs findDatas(Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;
    .locals 1
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

    const/4 v0, 0x1

    if-lt p1, v0, :cond_1

    if-ge p2, v0, :cond_0

    goto :goto_0

    .line 138
    :cond_0
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/arialyy/aria/orm/DelegateWrapper;->findData(Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static varargs findDatas(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;
    .locals 1
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

    .line 120
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/arialyy/aria/orm/DelegateWrapper;->findData(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static findFirst(Ljava/lang/Class;)Lcom/arialyy/aria/orm/DbEntity;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;)TT;"
        }
    .end annotation

    .line 107
    invoke-static {p0}, Lcom/arialyy/aria/orm/DbEntity;->findAllData(Ljava/lang/Class;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 108
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/orm/DbEntity;

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x0

    :goto_1
    return-object p0
.end method

.method public static varargs findFirst(Ljava/lang/Class;[Ljava/lang/String;)Lcom/arialyy/aria/orm/DbEntity;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;[",
            "Ljava/lang/String;",
            ")TT;"
        }
    .end annotation

    .line 177
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    .line 178
    invoke-virtual {v0, p0, p1}, Lcom/arialyy/aria/orm/DelegateWrapper;->findData(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    const/4 p1, 0x0

    if-nez p0, :cond_0

    goto :goto_0

    .line 179
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_1

    const/4 p1, 0x0

    invoke-interface {p0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    move-object p1, p0

    check-cast p1, Lcom/arialyy/aria/orm/DbEntity;

    :cond_1
    :goto_0
    return-object p1
.end method

.method public static varargs findRelationData(Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;
    .locals 1
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

    const/4 v0, 0x1

    if-lt p1, v0, :cond_1

    if-ge p2, v0, :cond_0

    goto :goto_0

    .line 67
    :cond_0
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0, p1, p2, p3}, Lcom/arialyy/aria/orm/DelegateWrapper;->findRelationData(Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public static varargs findRelationData(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;
    .locals 1
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

    .line 47
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0, p1}, Lcom/arialyy/aria/orm/DelegateWrapper;->findRelationData(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static insertManyData(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 186
    invoke-static {p0}, Lcom/arialyy/aria/orm/DbEntity;->checkListData(Ljava/util/List;)V

    .line 187
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/arialyy/aria/orm/DelegateWrapper;->insertManyData(Ljava/util/List;)V

    return-void
.end method

.method public static saveAll(Ljava/util/List;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 202
    invoke-static {p0}, Lcom/arialyy/aria/orm/DbEntity;->checkListData(Ljava/util/List;)V

    .line 203
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 204
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 205
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v2

    .line 206
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/arialyy/aria/orm/DbEntity;

    .line 207
    iget-wide v4, v3, Lcom/arialyy/aria/orm/DbEntity;->rowID:J

    const-wide/16 v6, -0x1

    cmp-long v4, v4, v6

    if-nez v4, :cond_0

    .line 208
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 211
    :cond_0
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    iget-wide v5, v3, Lcom/arialyy/aria/orm/DbEntity;->rowID:J

    invoke-virtual {v2, v4, v5, v6}, Lcom/arialyy/aria/orm/DelegateWrapper;->isExist(Ljava/lang/Class;J)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 212
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 214
    :cond_1
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 217
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_3

    .line 218
    invoke-virtual {v2, v0}, Lcom/arialyy/aria/orm/DelegateWrapper;->insertManyData(Ljava/util/List;)V

    .line 220
    :cond_3
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_4

    .line 221
    invoke-virtual {v2, v1}, Lcom/arialyy/aria/orm/DelegateWrapper;->updateManyData(Ljava/util/List;)V

    :cond_4
    return-void
.end method

.method public static tableExists(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">;)Z"
        }
    .end annotation

    .line 286
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/arialyy/aria/orm/DelegateWrapper;->tableExists(Ljava/lang/Class;)Z

    move-result p0

    return p0
.end method

.method private thisIsExist()Z
    .locals 5

    .line 276
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    .line 277
    iget-wide v1, p0, Lcom/arialyy/aria/orm/DbEntity;->rowID:J

    const-wide/16 v3, -0x1

    cmp-long v1, v1, v3

    if-eqz v1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    iget-wide v2, p0, Lcom/arialyy/aria/orm/DbEntity;->rowID:J

    invoke-virtual {v0, v1, v2, v3}, Lcom/arialyy/aria/orm/DelegateWrapper;->isExist(Ljava/lang/Class;J)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public static updateManyData(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 194
    invoke-static {p0}, Lcom/arialyy/aria/orm/DbEntity;->checkListData(Ljava/util/List;)V

    .line 195
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/arialyy/aria/orm/DelegateWrapper;->updateManyData(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public deleteData()V
    .locals 5

    .line 238
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "rowid=?"

    aput-object v3, v1, v2

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-wide v3, p0, Lcom/arialyy/aria/orm/DbEntity;->rowID:J

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v3, ""

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v1, v3

    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->deleteData(Ljava/lang/Class;[Ljava/lang/String;)V

    return-void
.end method

.method protected getRowID()J
    .locals 2

    .line 34
    iget-wide v0, p0, Lcom/arialyy/aria/orm/DbEntity;->rowID:J

    return-wide v0
.end method

.method public insert()V
    .locals 1

    .line 293
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/arialyy/aria/orm/DelegateWrapper;->insertData(Lcom/arialyy/aria/orm/DbEntity;)V

    return-void
.end method

.method public save()V
    .locals 2

    .line 263
    sget-object v0, Lcom/arialyy/aria/orm/DbEntity;->LOCK:Ljava/lang/Object;

    monitor-enter v0

    .line 264
    :try_start_0
    invoke-direct {p0}, Lcom/arialyy/aria/orm/DbEntity;->thisIsExist()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 265
    invoke-virtual {p0}, Lcom/arialyy/aria/orm/DbEntity;->update()V

    goto :goto_0

    .line 267
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/orm/DbEntity;->insert()V

    .line 269
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method public update()V
    .locals 1

    .line 256
    invoke-static {}, Lcom/arialyy/aria/orm/DelegateWrapper;->getInstance()Lcom/arialyy/aria/orm/DelegateWrapper;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/arialyy/aria/orm/DelegateWrapper;->updateData(Lcom/arialyy/aria/orm/DbEntity;)V

    return-void
.end method
