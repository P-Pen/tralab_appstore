.class Lcom/arialyy/aria/orm/DatabaseContext;
.super Landroid/content/ContextWrapper;
.source "DatabaseContext.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 31
    invoke-direct {p0, p1}, Landroid/content/ContextWrapper;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public getDatabasePath(Ljava/lang/String;)Ljava/io/File;
    .locals 3

    .line 39
    invoke-virtual {p0}, Lcom/arialyy/aria/orm/DatabaseContext;->getBaseContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getAppPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    .line 41
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "DB"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 42
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 44
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 45
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 46
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    :cond_0
    const/4 v0, 0x0

    .line 52
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 53
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p1

    if-nez p1, :cond_1

    .line 55
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 57
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    :goto_0
    if-eqz v0, :cond_2

    return-object v1

    :cond_2
    const/4 p1, 0x0

    return-object p1
.end method

.method public openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 0

    .line 77
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/orm/DatabaseContext;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    return-object p1
.end method

.method public openOrCreateDatabase(Ljava/lang/String;ILandroid/database/sqlite/SQLiteDatabase$CursorFactory;Landroid/database/DatabaseErrorHandler;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 0

    .line 91
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/orm/DatabaseContext;->getDatabasePath(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    const/4 p2, 0x0

    invoke-static {p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->openOrCreateDatabase(Ljava/io/File;Landroid/database/sqlite/SQLiteDatabase$CursorFactory;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    return-object p1
.end method
