.class final Lcom/arialyy/aria/orm/SqlHelper;
.super Landroid/database/sqlite/SQLiteOpenHelper;
.source "SqlHelper.java"


# static fields
.field private static volatile INSTANCE:Lcom/arialyy/aria/orm/SqlHelper; = null

.field private static final TAG:Ljava/lang/String; = "SqlHelper"

.field private static mainTmpDirSet:Z = false


# instance fields
.field private mContext:Landroid/content/Context;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 64
    sget-object v0, Lcom/arialyy/aria/orm/DBConfig;->DB_NAME:Ljava/lang/String;

    sget v1, Lcom/arialyy/aria/orm/DBConfig;->VERSION:I

    const/4 v2, 0x0

    invoke-direct {p0, p1, v0, v2, v1}, Landroid/database/sqlite/SQLiteOpenHelper;-><init>(Landroid/content/Context;Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)V

    .line 66
    iput-object p1, p0, Lcom/arialyy/aria/orm/SqlHelper;->mContext:Landroid/content/Context;

    return-void
.end method

.method private addTaskRecordType(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 14

    .line 349
    :try_start_0
    const-class v0, Lcom/arialyy/aria/core/ThreadRecord;

    invoke-static {p1, v0}, Lcom/arialyy/aria/orm/SqlUtil;->checkOrCreateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    .line 350
    const-class v0, Lcom/arialyy/aria/core/TaskRecord;

    invoke-static {p1, v0}, Lcom/arialyy/aria/orm/SqlUtil;->checkOrCreateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    .line 351
    const-class v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    invoke-static {p1, v0}, Lcom/arialyy/aria/orm/SqlUtil;->checkOrCreateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    .line 352
    const-class v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-static {p1, v0}, Lcom/arialyy/aria/orm/SqlUtil;->checkOrCreateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    .line 354
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    const-string v0, "SELECT downloadPath, url FROM DownloadEntity"

    const/4 v1, 0x0

    .line 359
    invoke-virtual {p1, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 360
    :goto_0
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v3, "UPDATE ThreadRecord SET threadType=? WHERE taskKey=?"

    const-string v4, "UPDATE TaskRecord SET taskType=? WHERE filePath=?"

    const-string v5, "sftp"

    const/4 v6, 0x3

    const-string v7, "ftp"

    const/4 v8, 0x2

    const/4 v9, 0x0

    const/4 v10, 0x1

    if-eqz v2, :cond_6

    .line 362
    :try_start_1
    invoke-interface {v0, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 363
    invoke-interface {v0, v10}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v11

    .line 364
    invoke-virtual {v11, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_5

    invoke-virtual {v11, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_3

    .line 367
    :cond_0
    const-class v5, Lcom/arialyy/aria/core/download/M3U8Entity;

    invoke-static {p1, v5}, Lcom/arialyy/aria/orm/SqlUtil;->tableExists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)Z

    move-result v5

    if-eqz v5, :cond_4

    .line 368
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "SELECT isLive FROM M3U8Entity WHERE filePath=\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    invoke-static {v2}, Lcom/arialyy/aria/orm/SqlUtil;->encodeStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "\""

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 368
    invoke-virtual {p1, v5, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v5

    .line 371
    invoke-interface {v5}, Landroid/database/Cursor;->moveToNext()Z

    move-result v6

    if-eqz v6, :cond_3

    .line 372
    invoke-interface {v5, v9}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v6

    .line 374
    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_1

    goto :goto_1

    :cond_1
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v6

    if-eqz v6, :cond_2

    const/16 v6, 0x8

    goto :goto_2

    :cond_2
    :goto_1
    const/4 v6, 0x7

    goto :goto_2

    :cond_3
    move v6, v10

    .line 379
    :goto_2
    invoke-interface {v5}, Landroid/database/Cursor;->close()V

    goto :goto_3

    :cond_4
    move v6, v10

    :cond_5
    :goto_3
    const-string v5, "UPDATE DownloadEntity SET taskType=? WHERE downloadPath=?"

    new-array v7, v8, [Ljava/lang/Object;

    .line 385
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    aput-object v11, v7, v9

    aput-object v2, v7, v10

    .line 384
    invoke-virtual {p1, v5, v7}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    new-array v5, v8, [Ljava/lang/Object;

    .line 387
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v5, v9

    aput-object v2, v5, v10

    .line 386
    invoke-virtual {p1, v4, v5}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    new-array v4, v8, [Ljava/lang/Object;

    .line 389
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v9

    aput-object v2, v4, v10

    .line 388
    invoke-virtual {p1, v3, v4}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    goto/16 :goto_0

    .line 391
    :cond_6
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    const-string v0, "SELECT filePath, url FROM UploadEntity"

    .line 397
    invoke-virtual {p1, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 398
    :goto_4
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_9

    const-string v1, "filePath"

    .line 400
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v1

    const-string v2, "url"

    .line 401
    invoke-interface {v0, v2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v2

    invoke-interface {v0, v2}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 402
    invoke-virtual {v2, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-nez v11, :cond_8

    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    goto :goto_5

    :cond_7
    move v2, v10

    goto :goto_6

    :cond_8
    :goto_5
    move v2, v6

    :goto_6
    const-string v11, "UPDATE UploadEntity SET taskType=? WHERE filePath=?"

    new-array v12, v8, [Ljava/lang/Object;

    .line 408
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    aput-object v13, v12, v9

    aput-object v1, v12, v10

    .line 407
    invoke-virtual {p1, v11, v12}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    new-array v11, v8, [Ljava/lang/Object;

    .line 410
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v12

    aput-object v12, v11, v9

    aput-object v1, v11, v10

    .line 409
    invoke-virtual {p1, v4, v11}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    new-array v11, v8, [Ljava/lang/Object;

    .line 412
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v11, v9

    aput-object v1, v11, v10

    .line 411
    invoke-virtual {p1, v3, v11}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V

    goto :goto_4

    .line 414
    :cond_9
    invoke-interface {v0}, Landroid/database/Cursor;->close()V

    .line 416
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 418
    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-void

    :catchall_0
    move-exception v0

    invoke-virtual {p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 419
    throw v0
.end method

.method private createDbCacheDir()V
    .locals 4

    .line 173
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/arialyy/aria/orm/SqlHelper;->mContext:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/AriaDbCacheDir"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 174
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 175
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 176
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v1

    .line 177
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "SqlHelper"

    invoke-static {v2, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    :cond_0
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "PRAGMA temp_store_directory = \'"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\'"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 180
    invoke-virtual {v1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const/4 v0, 0x1

    .line 181
    sput-boolean v0, Lcom/arialyy/aria/orm/SqlHelper;->mainTmpDirSet:Z

    return-void
.end method

.method private delRepeatThreadRecord(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    .line 426
    const-class v0, Lcom/arialyy/aria/core/ThreadRecord;

    invoke-static {p1, v0}, Lcom/arialyy/aria/orm/SqlUtil;->checkOrCreateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    const-string v0, "SqlHelper"

    const-string v1, "DELETE FROM ThreadRecord WHERE (rowid) IN (SELECT rowid FROM ThreadRecord GROUP BY taskKey, threadId, endLocation HAVING COUNT(*) > 1) AND rowid NOT IN (SELECT MIN(rowid) FROM ThreadRecord GROUP BY taskKey, threadId, endLocation HAVING COUNT(*)> 1)"

    .line 430
    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 431
    invoke-virtual {p1, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method private getDiffColumn(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 326
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 327
    invoke-interface {v0, p1}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method static getInstance()Lcom/arialyy/aria/orm/SqlHelper;
    .locals 1

    .line 60
    sget-object v0, Lcom/arialyy/aria/orm/SqlHelper;->INSTANCE:Lcom/arialyy/aria/orm/SqlHelper;

    return-object v0
.end method

.method private getNewColumn(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 339
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 340
    invoke-interface {v0, p2}, Ljava/util/List;->removeAll(Ljava/util/Collection;)Z

    return-object v0
.end method

.method private handle360AriaUpdate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4

    const-string v0, "UploadTaskEntity"

    const-string v1, "DownloadTaskEntity"

    const-string v2, "DownloadGroupTaskEntity"

    .line 471
    filled-new-array {v0, v1, v2}, [Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x3

    if-ge v1, v2, :cond_1

    .line 473
    aget-object v2, v0, v1

    .line 474
    invoke-static {p1, v2}, Lcom/arialyy/aria/orm/SqlUtil;->tableExists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 475
    invoke-static {p1, v2}, Lcom/arialyy/aria/orm/SqlUtil;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 479
    :cond_1
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 481
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "groupName"

    const-string v3, "groupHash"

    .line 482
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "DownloadEntity"

    .line 483
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "DownloadGroupEntity"

    .line 484
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 487
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "dGroupName"

    const-string v3, "dGroupHash"

    .line 488
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "TaskRecord"

    .line 489
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 492
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "key"

    const-string v3, "taskKey"

    .line 493
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "ThreadRecord"

    .line 494
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 497
    invoke-direct {p0, p1, v0}, Lcom/arialyy/aria/orm/SqlHelper;->handleDbUpdate(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/Map;)V

    .line 498
    invoke-direct {p0, p1}, Lcom/arialyy/aria/orm/SqlHelper;->delRepeatThreadRecord(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method

.method private handle365Update(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4

    .line 453
    const-class v0, Lcom/arialyy/aria/core/ThreadRecord;

    invoke-static {p1, v0}, Lcom/arialyy/aria/orm/SqlUtil;->checkOrCreateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    const-string v0, "UPDATE ThreadRecord SET threadId=0 WHERE threadId=-1"

    .line 454
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 456
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 458
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "key"

    const-string v3, "taskKey"

    .line 459
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "ThreadRecord"

    .line 460
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 463
    invoke-direct {p0, p1, v0}, Lcom/arialyy/aria/orm/SqlHelper;->handleDbUpdate(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/Map;)V

    .line 464
    invoke-direct {p0, p1}, Lcom/arialyy/aria/orm/SqlHelper;->delRepeatThreadRecord(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method

.method private handle366Update(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 4

    .line 438
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 440
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    const-string v2, "key"

    const-string v3, "taskKey"

    .line 441
    invoke-interface {v1, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v2, "ThreadRecord"

    .line 442
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 445
    invoke-direct {p0, p1, v0}, Lcom/arialyy/aria/orm/SqlHelper;->handleDbUpdate(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/Map;)V

    .line 446
    invoke-direct {p0, p1}, Lcom/arialyy/aria/orm/SqlHelper;->delRepeatThreadRecord(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method

.method private handleDbUpdate(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/Map;)V
    .locals 18
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;)V"
        }
    .end annotation

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v0, p2

    const-string v3, "SqlHelper"

    if-nez v2, :cond_0

    const-string v0, "db \u4e3a null"

    .line 192
    invoke-static {v3, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 194
    :cond_0
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v4

    if-nez v4, :cond_1

    const-string v0, "db\u5df2\u5173\u95ed"

    .line 195
    invoke-static {v3, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 200
    :cond_1
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->beginTransaction()V

    .line 201
    sget-object v4, Lcom/arialyy/aria/orm/DBConfig;->mapping:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    .line 202
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_10

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 203
    sget-object v6, Lcom/arialyy/aria/orm/DBConfig;->mapping:Ljava/util/Map;

    invoke-interface {v6, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Class;

    .line 204
    invoke-static {v2, v6}, Lcom/arialyy/aria/orm/SqlUtil;->tableExists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)Z

    move-result v7

    if-eqz v7, :cond_f

    const-string v7, "PRAGMA table_info(%s)"

    const/4 v8, 0x1

    new-array v9, v8, [Ljava/lang/Object;

    const/4 v10, 0x0

    aput-object v5, v9, v10

    .line 207
    invoke-static {v7, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x0

    invoke-virtual {v2, v7, v9}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v7

    .line 210
    invoke-static {v6}, Lcom/arialyy/aria/orm/SqlUtil;->getColumns(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v11

    .line 212
    new-instance v12, Ljava/util/ArrayList;

    invoke-direct {v12}, Ljava/util/ArrayList;-><init>()V

    .line 214
    :goto_1
    invoke-interface {v7}, Landroid/database/Cursor;->moveToNext()Z

    move-result v13

    if-eqz v13, :cond_2

    const-string v13, "name"

    .line 215
    invoke-interface {v7, v13}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v13

    invoke-interface {v7, v13}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object v13

    .line 216
    invoke-interface {v12, v13}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 218
    :cond_2
    invoke-interface {v7}, Landroid/database/Cursor;->close()V

    .line 221
    invoke-direct {v1, v11, v12}, Lcom/arialyy/aria/orm/SqlHelper;->getNewColumn(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v7

    if-eqz v0, :cond_4

    .line 225
    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Map;

    if-eqz v13, :cond_5

    .line 227
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    .line 228
    :cond_3
    :goto_2
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_5

    .line 229
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Ljava/lang/String;

    .line 230
    invoke-interface {v13, v15}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v15

    if-eqz v15, :cond_3

    .line 231
    invoke-interface {v14}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    :cond_4
    move-object v13, v9

    .line 238
    :cond_5
    invoke-interface {v7}, Ljava/util/List;->size()I

    move-result v14

    const/4 v15, 0x3

    if-lez v14, :cond_6

    const-string v14, "ALTER TABLE %s ADD COLUMN %s %s"

    .line 240
    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_3
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-eqz v16, :cond_6

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    move-object/from16 v9, v16

    check-cast v9, Ljava/lang/String;

    new-array v8, v15, [Ljava/lang/Object;

    aput-object v5, v8, v10

    const/16 v16, 0x1

    aput-object v9, v8, v16

    .line 242
    invoke-static {v6, v9}, Lcom/arialyy/aria/orm/SqlUtil;->getColumnTypeByFieldName(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const/16 v17, 0x2

    aput-object v9, v8, v17

    invoke-static {v14, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 243
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "\u6dfb\u52a0\u8868\u5b57\u6bb5\u7684sql\uff1a"

    invoke-virtual {v9, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v3, v9}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 244
    invoke-virtual {v2, v8}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const/4 v8, 0x1

    const/4 v15, 0x3

    goto :goto_3

    :cond_6
    const-string v7, "ALTER TABLE %s RENAME TO %s_temp"

    const/4 v8, 0x2

    new-array v9, v8, [Ljava/lang/Object;

    aput-object v5, v9, v10

    const/4 v8, 0x1

    aput-object v5, v9, v8

    .line 249
    invoke-static {v7, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 250
    invoke-virtual {v2, v7}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 253
    invoke-static {v2, v6}, Lcom/arialyy/aria/orm/SqlUtil;->createTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    const-string v6, "SELECT COUNT(*) FROM %s_temp"

    new-array v7, v8, [Ljava/lang/Object;

    aput-object v5, v7, v10

    .line 255
    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    .line 256
    invoke-virtual {v2, v6, v7}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v6

    .line 257
    invoke-interface {v6}, Landroid/database/Cursor;->moveToFirst()Z

    .line 258
    invoke-interface {v6, v10}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide v7

    .line 259
    invoke-interface {v6}, Landroid/database/Cursor;->close()V

    const-wide/16 v14, 0x0

    cmp-long v6, v7, v14

    if-lez v6, :cond_e

    .line 265
    invoke-direct {v1, v11, v12}, Lcom/arialyy/aria/orm/SqlHelper;->getDiffColumn(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object v6

    .line 266
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    if-eqz v0, :cond_7

    .line 271
    invoke-interface {v0, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    move-object v13, v8

    check-cast v13, Ljava/util/Map;

    .line 274
    :cond_7
    invoke-interface {v12}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_8
    :goto_4
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_a

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 275
    invoke-interface {v6}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-nez v11, :cond_9

    invoke-interface {v6, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_9

    if-eqz v13, :cond_8

    .line 277
    invoke-interface {v13, v9}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_9

    goto :goto_4

    .line 280
    :cond_9
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, ","

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 283
    :cond_a
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 284
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    const/4 v8, 0x1

    sub-int/2addr v7, v8

    invoke-virtual {v6, v10, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    if-eqz v13, :cond_c

    .line 287
    invoke-interface {v13}, Ljava/util/Map;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_c

    .line 288
    invoke-interface {v13}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v7

    .line 289
    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move-object v8, v6

    :cond_b
    :goto_5
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_d

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 290
    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v11

    if-eqz v11, :cond_b

    .line 291
    invoke-interface {v13, v9}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/CharSequence;

    invoke-virtual {v8, v9, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v8

    goto :goto_5

    :cond_c
    move-object v8, v6

    :cond_d
    const-string v7, "INSERT INTO %s (%s) SELECT %s FROM %s_temp"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    aput-object v5, v9, v10

    const/4 v10, 0x1

    aput-object v8, v9, v10

    const/4 v8, 0x2

    aput-object v6, v9, v8

    const/4 v6, 0x3

    aput-object v5, v9, v6

    .line 298
    invoke-static {v7, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 300
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u6062\u590d\u6570\u636e\u7684sql\uff1a"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v3, v7}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 302
    invoke-virtual {v2, v6}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 305
    :cond_e
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "_temp"

    invoke-virtual {v6, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v2, v5}, Lcom/arialyy/aria/orm/SqlUtil;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 307
    :cond_f
    invoke-static {v2, v6}, Lcom/arialyy/aria/orm/SqlUtil;->createTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    goto/16 :goto_0

    .line 310
    :cond_10
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_6

    :catchall_0
    move-exception v0

    goto :goto_7

    :catch_0
    move-exception v0

    .line 312
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 314
    :goto_6
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    return-void

    :goto_7
    invoke-virtual/range {p1 .. p1}, Landroid/database/sqlite/SQLiteDatabase;->endTransaction()V

    .line 315
    throw v0
.end method

.method private handleLowAriaUpdate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 16

    move-object/from16 v0, p1

    const-string v1, "UploadTaskEntity"

    const-string v2, "DownloadTaskEntity"

    const-string v3, "DownloadGroupTaskEntity"

    .line 505
    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    const/4 v4, 0x3

    if-ge v3, v4, :cond_1

    .line 507
    aget-object v4, v1, v3

    .line 508
    invoke-static {v0, v4}, Lcom/arialyy/aria/orm/SqlUtil;->tableExists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 509
    invoke-static {v0, v4}, Lcom/arialyy/aria/orm/SqlUtil;->dropTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    const-string v1, "DownloadEntity"

    const-string v3, "DownloadGroupEntity"

    .line 514
    filled-new-array {v1, v3}, [Ljava/lang/String;

    move-result-object v5

    const-string v6, "downloadPath"

    const-string v7, "groupName"

    .line 515
    filled-new-array {v6, v7}, [Ljava/lang/String;

    move-result-object v6

    move v8, v2

    move v9, v8

    :goto_1
    const/4 v10, 0x2

    if-ge v8, v10, :cond_3

    .line 517
    aget-object v11, v5, v8

    .line 518
    invoke-static {v0, v11}, Lcom/arialyy/aria/orm/SqlUtil;->tableExists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_2

    goto :goto_2

    .line 521
    :cond_2
    aget-object v12, v6, v9

    new-array v13, v4, [Ljava/lang/Object;

    aput-object v11, v13, v2

    const/4 v14, 0x1

    aput-object v12, v13, v14

    aput-object v12, v13, v10

    const-string v15, "DELETE FROM %s WHERE %s=\'\' OR %s IS NULL"

    .line 523
    invoke-static {v15, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    const-string v15, "SqlHelper"

    .line 524
    invoke-static {v15, v13}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 525
    invoke-virtual {v0, v13}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    const/4 v13, 0x6

    new-array v13, v13, [Ljava/lang/Object;

    aput-object v11, v13, v2

    aput-object v12, v13, v14

    aput-object v12, v13, v10

    aput-object v11, v13, v4

    const/4 v10, 0x4

    aput-object v12, v13, v10

    const/4 v10, 0x5

    aput-object v12, v13, v10

    const-string v10, "DELETE FROM %s WHERE %s IN(SELECT %s FROM %s GROUP BY %s HAVING COUNT(%s) > 1)"

    .line 529
    invoke-static {v10, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 533
    invoke-static {v15, v10}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 534
    invoke-virtual {v0, v10}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    add-int/lit8 v9, v9, 0x1

    :goto_2
    add-int/lit8 v8, v8, 0x1

    goto :goto_1

    .line 539
    :cond_3
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    .line 540
    new-instance v4, Ljava/util/HashMap;

    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    const-string v5, "groupHash"

    .line 541
    invoke-interface {v4, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "downloadUrl"

    const-string v8, "url"

    .line 542
    invoke-interface {v4, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v6, "isDownloadComplete"

    const-string v8, "isComplete"

    .line 543
    invoke-interface {v4, v6, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 544
    invoke-interface {v2, v1, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 546
    new-instance v1, Ljava/util/HashMap;

    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 547
    invoke-interface {v1, v7, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 548
    invoke-interface {v2, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v1, p0

    .line 550
    invoke-direct {v1, v0, v2}, Lcom/arialyy/aria/orm/SqlHelper;->handleDbUpdate(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/Map;)V

    return-void
.end method

.method static declared-synchronized init(Landroid/content/Context;)Lcom/arialyy/aria/orm/SqlHelper;
    .locals 2

    const-class v0, Lcom/arialyy/aria/orm/SqlHelper;

    monitor-enter v0

    .line 51
    :try_start_0
    sget-object v1, Lcom/arialyy/aria/orm/SqlHelper;->INSTANCE:Lcom/arialyy/aria/orm/SqlHelper;

    if-nez v1, :cond_0

    .line 52
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 53
    :try_start_1
    new-instance v1, Lcom/arialyy/aria/orm/SqlHelper;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    invoke-direct {v1, p0}, Lcom/arialyy/aria/orm/SqlHelper;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/arialyy/aria/orm/SqlHelper;->INSTANCE:Lcom/arialyy/aria/orm/SqlHelper;

    .line 54
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw p0

    .line 56
    :cond_0
    :goto_0
    sget-object p0, Lcom/arialyy/aria/orm/SqlHelper;->INSTANCE:Lcom/arialyy/aria/orm/SqlHelper;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    monitor-exit v0

    return-object p0

    :catchall_1
    move-exception p0

    monitor-exit v0

    throw p0
.end method


# virtual methods
.method getDb()Landroid/database/sqlite/SQLiteDatabase;
    .locals 3

    .line 127
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const v1, 0x10000010

    const/16 v2, 0x1c

    if-lt v0, v2, :cond_0

    .line 128
    new-instance v0, Landroid/database/sqlite/SQLiteDatabase$OpenParams$Builder;

    invoke-direct {v0}, Landroid/database/sqlite/SQLiteDatabase$OpenParams$Builder;-><init>()V

    invoke-virtual {v0, v1}, Landroid/database/sqlite/SQLiteDatabase$OpenParams$Builder;->setOpenFlags(I)Landroid/database/sqlite/SQLiteDatabase$OpenParams$Builder;

    move-result-object v0

    .line 130
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase$OpenParams$Builder;->build()Landroid/database/sqlite/SQLiteDatabase$OpenParams;

    move-result-object v0

    .line 131
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/orm/SqlHelper;->setOpenParams(Landroid/database/sqlite/SQLiteDatabase$OpenParams;)V

    .line 132
    invoke-virtual {p0}, Lcom/arialyy/aria/orm/SqlHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    goto :goto_0

    .line 135
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/orm/SqlHelper;->mContext:Landroid/content/Context;

    sget-object v2, Lcom/arialyy/aria/orm/DBConfig;->DB_NAME:Ljava/lang/String;

    invoke-virtual {v0, v2}, Landroid/content/Context;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    .line 136
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_1

    .line 137
    invoke-virtual {p0}, Lcom/arialyy/aria/orm/SqlHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    goto :goto_0

    .line 140
    :cond_1
    invoke-virtual {p0}, Lcom/arialyy/aria/orm/SqlHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v2

    .line 141
    invoke-virtual {v2}, Landroid/database/sqlite/SQLiteDatabase;->close()V

    .line 142
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    invoke-static {v0, v2, v1}, Landroid/database/sqlite/SQLiteDatabase;->openDatabase(Ljava/lang/String;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;I)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    .line 147
    :goto_0
    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteDatabase;->enableWriteAheadLogging()Z

    return-object v0
.end method

.method public getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .line 165
    sget-boolean v0, Lcom/arialyy/aria/orm/SqlHelper;->mainTmpDirSet:Z

    if-nez v0, :cond_0

    .line 166
    invoke-direct {p0}, Lcom/arialyy/aria/orm/SqlHelper;->createDbCacheDir()V

    .line 167
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0

    .line 169
    :cond_0
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getReadableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    .line 152
    sget-boolean v0, Lcom/arialyy/aria/orm/SqlHelper;->mainTmpDirSet:Z

    if-nez v0, :cond_0

    .line 153
    invoke-direct {p0}, Lcom/arialyy/aria/orm/SqlHelper;->createDbCacheDir()V

    .line 154
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0

    .line 156
    :cond_0
    invoke-super {p0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v0

    return-object v0
.end method

.method public onConfigure(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    .line 74
    invoke-super {p0, p1}, Landroid/database/sqlite/SQLiteOpenHelper;->onConfigure(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 75
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    .line 76
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->setForeignKeyConstraintsEnabled(Z)V

    goto :goto_0

    :cond_0
    const-string v0, "PRAGMA foreign_keys=ON;"

    .line 82
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :goto_0
    return-void
.end method

.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 3

    .line 87
    sget-object v0, Lcom/arialyy/aria/orm/DBConfig;->mapping:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 88
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 89
    sget-object v2, Lcom/arialyy/aria/orm/DBConfig;->mapping:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    .line 90
    invoke-static {p1, v1}, Lcom/arialyy/aria/orm/SqlUtil;->tableExists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 91
    invoke-static {p1, v1}, Lcom/arialyy/aria/orm/SqlUtil;->createTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    if-le p2, p3, :cond_0

    const/4 p2, 0x0

    .line 118
    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/orm/SqlHelper;->handleDbUpdate(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/Map;)V

    :cond_0
    return-void
.end method

.method public onOpen(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    .line 70
    invoke-super {p0, p1}, Landroid/database/sqlite/SQLiteOpenHelper;->onOpen(Landroid/database/sqlite/SQLiteDatabase;)V

    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 1

    if-ge p2, p3, :cond_4

    const/16 v0, 0x1f

    if-ge p2, v0, :cond_0

    .line 99
    invoke-direct {p0, p1}, Lcom/arialyy/aria/orm/SqlHelper;->handleLowAriaUpdate(Landroid/database/sqlite/SQLiteDatabase;)V

    goto :goto_0

    :cond_0
    const/16 v0, 0x2d

    if-ge p2, v0, :cond_1

    .line 101
    invoke-direct {p0, p1}, Lcom/arialyy/aria/orm/SqlHelper;->handle360AriaUpdate(Landroid/database/sqlite/SQLiteDatabase;)V

    goto :goto_0

    :cond_1
    const/16 v0, 0x33

    if-ge p2, v0, :cond_2

    .line 103
    invoke-direct {p0, p1}, Lcom/arialyy/aria/orm/SqlHelper;->handle365Update(Landroid/database/sqlite/SQLiteDatabase;)V

    goto :goto_0

    :cond_2
    const/16 v0, 0x35

    if-ge p2, v0, :cond_3

    .line 105
    invoke-direct {p0, p1}, Lcom/arialyy/aria/orm/SqlHelper;->handle366Update(Landroid/database/sqlite/SQLiteDatabase;)V

    goto :goto_0

    :cond_3
    const/4 p2, 0x0

    .line 107
    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/orm/SqlHelper;->handleDbUpdate(Landroid/database/sqlite/SQLiteDatabase;Ljava/util/Map;)V

    :goto_0
    const/16 p2, 0x39

    if-ne p3, p2, :cond_4

    .line 111
    invoke-direct {p0, p1}, Lcom/arialyy/aria/orm/SqlHelper;->addTaskRecordType(Landroid/database/sqlite/SQLiteDatabase;)V

    :cond_4
    return-void
.end method
