.class final Lcom/arialyy/aria/orm/SqlUtil;
.super Ljava/lang/Object;
.source "SqlUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "SqlUtil"

    .line 47
    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/arialyy/aria/orm/SqlUtil;->TAG:Ljava/lang/String;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static checkData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    const-string v0, "java.lang.String"

    .line 579
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    return-object p1

    :cond_0
    const-string v0, "int"

    .line 581
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6

    const-string v0, "java.lang.Integer"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_2

    :cond_1
    const-string v0, "double"

    .line 583
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "java.lang.Double"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    goto :goto_1

    :cond_2
    const-string v0, "float"

    .line 585
    invoke-virtual {p0, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    const-string v0, "java.lang.Float"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_3

    goto :goto_0

    :cond_3
    const/4 p0, 0x0

    return-object p0

    .line 586
    :cond_4
    :goto_0
    invoke-static {p1}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p0

    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    .line 584
    :cond_5
    :goto_1
    invoke-static {p1}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide p0

    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p0

    return-object p0

    .line 582
    :cond_6
    :goto_2
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    return-object p0
.end method

.method static varargs checkDataExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;[Ljava/lang/String;)Z
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">;[",
            "Ljava/lang/String;",
            ")Z"
        }
    .end annotation

    .line 174
    invoke-static {p0}, Lcom/arialyy/aria/orm/SqlUtil;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    .line 175
    invoke-static {p2}, Lcom/arialyy/aria/util/CommonUtil;->checkSqlExpression([Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    .line 178
    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v0, v1

    aget-object p1, p2, v1

    const/4 v2, 0x1

    aput-object p1, v0, v2

    const-string p1, "SELECT rowid, * FROM %s WHERE %s "

    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "?"

    const-string v3, "%s"

    .line 180
    invoke-virtual {p1, v0, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 181
    array-length v0, p2

    sub-int/2addr v0, v2

    new-array v3, v0, [Ljava/lang/String;

    move v4, v1

    :goto_0
    if-ge v4, v0, :cond_1

    new-array v5, v2, [Ljava/lang/Object;

    add-int/lit8 v6, v4, 0x1

    .line 183
    aget-object v7, p2, v6

    invoke-static {v7}, Lcom/arialyy/aria/orm/SqlUtil;->encodeStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aput-object v7, v5, v1

    const-string v7, "\'%s\'"

    invoke-static {v7, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    move v4, v6

    goto :goto_0

    .line 185
    :cond_1
    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const/4 p2, 0x0

    .line 186
    invoke-virtual {p0, p1, p2}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p0

    .line 187
    invoke-interface {p0}, Landroid/database/Cursor;->getCount()I

    move-result p1

    if-lez p1, :cond_2

    move v1, v2

    .line 188
    :cond_2
    invoke-static {p0}, Lcom/arialyy/aria/orm/SqlUtil;->closeCursor(Landroid/database/Cursor;)V

    return v1
.end method

.method static checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;
    .locals 1

    if-eqz p0, :cond_0

    .line 216
    invoke-virtual {p0}, Landroid/database/sqlite/SQLiteDatabase;->isOpen()Z

    move-result v0

    if-nez v0, :cond_1

    .line 217
    :cond_0
    invoke-static {}, Lcom/arialyy/aria/orm/SqlHelper;->getInstance()Lcom/arialyy/aria/orm/SqlHelper;

    move-result-object p0

    invoke-virtual {p0}, Lcom/arialyy/aria/orm/SqlHelper;->getDb()Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    :cond_1
    return-object p0
.end method

.method static checkList(Ljava/lang/reflect/Field;)Z
    .locals 1

    .line 114
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getListParamType(Ljava/lang/reflect/Field;)Ljava/lang/Class;

    move-result-object p0

    .line 115
    const-class v0, Ljava/lang/String;

    if-ne p0, v0, :cond_0

    const/4 p0, 0x1

    return p0

    .line 118
    :cond_0
    sget-object p0, Lcom/arialyy/aria/orm/SqlUtil;->TAG:Ljava/lang/String;

    const-string v0, "map\u53c2\u6570\u9519\u8bef\uff0c\u652f\u6301List<String>\u7684\u53c2\u6570\u5b57\u6bb5"

    invoke-static {p0, v0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return p0
.end method

.method static checkMap(Ljava/lang/reflect/Field;)Z
    .locals 4

    .line 129
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getMapParamType(Ljava/lang/reflect/Field;)[Ljava/lang/Class;

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_0

    .line 130
    aget-object v1, p0, v0

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    aget-object v2, p0, v1

    if-eqz v2, :cond_0

    aget-object v2, p0, v0

    const-class v3, Ljava/lang/String;

    if-ne v2, v3, :cond_0

    aget-object p0, p0, v1

    const-class v2, Ljava/lang/String;

    if-ne p0, v2, :cond_0

    return v1

    .line 137
    :cond_0
    sget-object p0, Lcom/arialyy/aria/orm/SqlUtil;->TAG:Ljava/lang/String;

    const-string v1, "map\u53c2\u6570\u9519\u8bef\uff0c\u652f\u6301Map<String,String>\u7684\u53c2\u6570\u5b57\u6bb5"

    invoke-static {p0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v0
.end method

.method static checkOrCreateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">;)V"
        }
    .end annotation

    .line 53
    invoke-static {p0, p1}, Lcom/arialyy/aria/orm/SqlUtil;->tableExists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 54
    invoke-static {p0, p1}, Lcom/arialyy/aria/orm/SqlUtil;->createTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    :cond_0
    return-void
.end method

.method static clean(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">;)V"
        }
    .end annotation

    .line 158
    invoke-static {p0}, Lcom/arialyy/aria/orm/SqlUtil;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    .line 159
    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    .line 160
    invoke-static {p0, p1}, Lcom/arialyy/aria/orm/SqlUtil;->tableExists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 161
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "DELETE FROM "

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 162
    invoke-virtual {p0, p1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method static closeCursor(Landroid/database/Cursor;)V
    .locals 2

    .line 59
    const-class v0, Lcom/arialyy/aria/orm/AbsDelegate;

    monitor-enter v0

    if-eqz p0, :cond_0

    .line 60
    :try_start_0
    invoke-interface {p0}, Landroid/database/Cursor;->isClosed()Z

    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 62
    :try_start_1
    invoke-interface {p0}, Landroid/database/Cursor;->close()V
    :try_end_1
    .catch Landroid/database/SQLException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 64
    :try_start_2
    invoke-virtual {p0}, Landroid/database/SQLException;->printStackTrace()V

    .line 67
    :cond_0
    :goto_0
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method static createTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">;)V"
        }
    .end annotation

    .line 228
    invoke-static {p0}, Lcom/arialyy/aria/orm/SqlUtil;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    .line 229
    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->getAllFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 230
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_c

    .line 232
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 233
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "CREATE TABLE IF NOT EXISTS "

    .line 234
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " ("

    .line 236
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const-string v3, ","

    const/4 v4, 0x1

    if-eqz v0, :cond_8

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    .line 238
    invoke-virtual {v0, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 239
    invoke-static {v0}, Lcom/arialyy/aria/orm/SqlUtil;->isIgnore(Ljava/lang/reflect/Field;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_0

    .line 242
    :cond_0
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    .line 243
    invoke-static {v4}, Lcom/arialyy/aria/orm/SqlUtil;->getColumnType(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v5

    if-nez v5, :cond_1

    goto :goto_0

    .line 247
    :cond_1
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, " "

    .line 248
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    invoke-static {v0}, Lcom/arialyy/aria/orm/SqlUtil;->isPrimary(Ljava/lang/reflect/Field;)Z

    move-result v5

    if-eqz v5, :cond_3

    .line 251
    const-class v5, Lcom/arialyy/aria/orm/annotation/Primary;

    invoke-virtual {v0, v5}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v5

    check-cast v5, Lcom/arialyy/aria/orm/annotation/Primary;

    const-string v6, " PRIMARY KEY"

    .line 252
    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    invoke-interface {v5}, Lcom/arialyy/aria/orm/annotation/Primary;->autoincrement()Z

    move-result v5

    if-eqz v5, :cond_3

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq v4, v5, :cond_2

    const-class v5, Ljava/lang/Integer;

    if-ne v4, v5, :cond_3

    :cond_2
    const-string v4, " AUTOINCREMENT"

    .line 254
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 258
    :cond_3
    invoke-static {v0}, Lcom/arialyy/aria/orm/SqlUtil;->isForeign(Ljava/lang/reflect/Field;)Z

    move-result v4

    if-eqz v4, :cond_4

    .line 259
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 262
    :cond_4
    invoke-static {v0}, Lcom/arialyy/aria/orm/SqlUtil;->isNoNull(Ljava/lang/reflect/Field;)Z

    move-result v4

    if-eqz v4, :cond_5

    const-string v4, " NOT NULL"

    .line 263
    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    :cond_5
    invoke-static {v0}, Lcom/arialyy/aria/orm/SqlUtil;->isDefault(Ljava/lang/reflect/Field;)Z

    move-result v4

    if-eqz v4, :cond_6

    .line 267
    const-class v4, Lcom/arialyy/aria/orm/annotation/Default;

    invoke-virtual {v0, v4}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v4

    check-cast v4, Lcom/arialyy/aria/orm/annotation/Default;

    .line 268
    invoke-interface {v4}, Lcom/arialyy/aria/orm/annotation/Default;->value()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_6

    const-string v5, " ERROR "

    .line 269
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "\'"

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v4}, Lcom/arialyy/aria/orm/annotation/Default;->value()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    :cond_6
    invoke-static {v0}, Lcom/arialyy/aria/orm/SqlUtil;->isUnique(Ljava/lang/reflect/Field;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, " UNIQUE"

    .line 274
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 277
    :cond_7
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto/16 :goto_0

    .line 280
    :cond_8
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    .line 281
    const-class v1, Lcom/arialyy/aria/orm/annotation/Foreign;

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/orm/annotation/Foreign;

    const-string v5, "FOREIGN KEY ("

    .line 282
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 283
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ") REFERENCES "

    .line 284
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 285
    invoke-interface {v1}, Lcom/arialyy/aria/orm/annotation/Foreign;->parent()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "("

    .line 286
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 287
    invoke-interface {v1}, Lcom/arialyy/aria/orm/annotation/Foreign;->column()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ")"

    .line 288
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 289
    invoke-interface {v1}, Lcom/arialyy/aria/orm/annotation/Foreign;->onUpdate()Lcom/arialyy/aria/orm/ActionPolicy;

    move-result-object v0

    .line 290
    invoke-interface {v1}, Lcom/arialyy/aria/orm/annotation/Foreign;->onDelete()Lcom/arialyy/aria/orm/ActionPolicy;

    move-result-object v1

    .line 291
    sget-object v5, Lcom/arialyy/aria/orm/ActionPolicy;->NO_ACTION:Lcom/arialyy/aria/orm/ActionPolicy;

    if-eq v0, v5, :cond_9

    const-string v5, " ON UPDATE "

    .line 292
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v0, Lcom/arialyy/aria/orm/ActionPolicy;->function:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 295
    :cond_9
    sget-object v5, Lcom/arialyy/aria/orm/ActionPolicy;->NO_ACTION:Lcom/arialyy/aria/orm/ActionPolicy;

    if-eq v1, v5, :cond_a

    const-string v1, " ON DELETE "

    .line 296
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, v0, Lcom/arialyy/aria/orm/ActionPolicy;->function:Ljava/lang/String;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 298
    :cond_a
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 301
    :cond_b
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 302
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    sub-int/2addr v2, v4

    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ");"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 303
    sget-object v0, Lcom/arialyy/aria/orm/SqlUtil;->TAG:Ljava/lang/String;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u521b\u5efa\u8868\u7684sql\uff1a"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 304
    invoke-virtual {p0, p1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    :cond_c
    return-void
.end method

.method static dropTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)V
    .locals 2

    .line 146
    invoke-static {p0}, Lcom/arialyy/aria/orm/SqlUtil;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p1, v0, v1

    const-string p1, "DROP TABLE IF EXISTS %s"

    .line 147
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 149
    invoke-virtual {p0, p1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    return-void
.end method

.method static encodeStr(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, "\\+"

    const-string v1, "%2B"

    .line 355
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 356
    invoke-static {p0}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static getAllNotIgnoreField(Ljava/lang/Class;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Field;",
            ">;"
        }
    .end annotation

    .line 382
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getAllFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object p0

    .line 383
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    if-eqz p0, :cond_2

    .line 384
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v1

    if-lez v1, :cond_2

    .line 385
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    const/4 v2, 0x1

    .line 386
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 387
    invoke-static {v1}, Lcom/arialyy/aria/orm/SqlUtil;->isIgnore(Ljava/lang/reflect/Field;)Z

    move-result v2

    if-nez v2, :cond_0

    .line 388
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method

.method static getColumnType(Ljava/lang/Class;)Ljava/lang/String;
    .locals 1

    .line 325
    const-class v0, Ljava/lang/String;

    if-eq p0, v0, :cond_11

    invoke-virtual {p0}, Ljava/lang/Class;->isEnum()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_8

    .line 327
    :cond_0
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_10

    const-class v0, Ljava/lang/Integer;

    if-ne p0, v0, :cond_1

    goto :goto_7

    .line 329
    :cond_1
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_f

    const-class v0, Ljava/lang/Float;

    if-ne p0, v0, :cond_2

    goto :goto_6

    .line 331
    :cond_2
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_e

    const-class v0, Ljava/lang/Double;

    if-ne p0, v0, :cond_3

    goto :goto_5

    .line 333
    :cond_3
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_d

    const-class v0, Ljava/lang/Long;

    if-ne p0, v0, :cond_4

    goto :goto_4

    .line 335
    :cond_4
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_c

    const-class v0, Ljava/lang/Boolean;

    if-ne p0, v0, :cond_5

    goto :goto_3

    .line 337
    :cond_5
    const-class v0, Ljava/util/Date;

    if-eq p0, v0, :cond_b

    const-class v0, Ljava/sql/Date;

    if-ne p0, v0, :cond_6

    goto :goto_2

    .line 339
    :cond_6
    sget-object v0, Ljava/lang/Byte;->TYPE:Ljava/lang/Class;

    if-eq p0, v0, :cond_a

    const-class v0, Ljava/lang/Byte;

    if-ne p0, v0, :cond_7

    goto :goto_1

    .line 341
    :cond_7
    const-class v0, Ljava/util/Map;

    if-eq p0, v0, :cond_9

    const-class v0, Ljava/util/List;

    if-ne p0, v0, :cond_8

    goto :goto_0

    :cond_8
    const/4 p0, 0x0

    return-object p0

    :cond_9
    :goto_0
    const-string p0, "TEXT"

    return-object p0

    :cond_a
    :goto_1
    const-string p0, "BLOB"

    return-object p0

    :cond_b
    :goto_2
    const-string p0, "DATA"

    return-object p0

    :cond_c
    :goto_3
    const-string p0, "BOOLEAN"

    return-object p0

    :cond_d
    :goto_4
    const-string p0, "BIGINT"

    return-object p0

    :cond_e
    :goto_5
    const-string p0, "DOUBLE"

    return-object p0

    :cond_f
    :goto_6
    const-string p0, "FLOAT"

    return-object p0

    :cond_10
    :goto_7
    const-string p0, "INTEGER"

    return-object p0

    :cond_11
    :goto_8
    const-string p0, "VARCHAR"

    return-object p0
.end method

.method static getColumnTypeByFieldName(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .line 312
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getAllFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object p0

    .line 313
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    .line 314
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 315
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object p0

    invoke-static {p0}, Lcom/arialyy/aria/orm/SqlUtil;->getColumnType(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method static getColumns(Ljava/lang/Class;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 198
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 199
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getAllFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object p0

    .line 200
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    const/4 v2, 0x1

    .line 201
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 202
    invoke-static {v1}, Lcom/arialyy/aria/orm/SqlUtil;->isIgnore(Ljava/lang/reflect/Field;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 205
    :cond_0
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method static getPrimaryName(Ljava/lang/Class;)Ljava/lang/String;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 363
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getAllFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object p0

    if-eqz p0, :cond_1

    .line 365
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    .line 367
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    const/4 v1, 0x1

    .line 368
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 369
    invoke-static {v0}, Lcom/arialyy/aria/orm/SqlUtil;->isPrimary(Ljava/lang/reflect/Field;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 370
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method static isDefault(Ljava/lang/reflect/Field;)Z
    .locals 1

    .line 564
    const-class v0, Lcom/arialyy/aria/orm/annotation/Default;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/orm/annotation/Default;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isForeign(Ljava/lang/reflect/Field;)Z
    .locals 1

    .line 544
    const-class v0, Lcom/arialyy/aria/orm/annotation/Foreign;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/orm/annotation/Foreign;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isIgnore(Ljava/lang/reflect/Field;)Z
    .locals 3

    .line 493
    const-class v0, Lcom/arialyy/aria/orm/annotation/Ignore;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/orm/annotation/Ignore;

    .line 494
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getModifiers()I

    move-result v1

    .line 495
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    if-eqz v0, :cond_0

    .line 496
    invoke-interface {v0}, Lcom/arialyy/aria/orm/annotation/Ignore;->value()Z

    move-result v0

    if-nez v0, :cond_2

    :cond_0
    const-string v0, "rowID"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "shadow$_klass_"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    const-string v0, "shadow$_monitor_"

    .line 497
    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 498
    invoke-virtual {p0}, Ljava/lang/reflect/Field;->isSynthetic()Z

    move-result p0

    if-nez p0, :cond_2

    .line 499
    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result p0

    if-nez p0, :cond_2

    invoke-static {v1}, Ljava/lang/reflect/Modifier;->isFinal(I)Z

    move-result p0

    if-eqz p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method

.method static isMany(Ljava/lang/reflect/Field;)Z
    .locals 1

    .line 516
    const-class v0, Lcom/arialyy/aria/orm/annotation/Many;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/orm/annotation/Many;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isNoNull(Ljava/lang/reflect/Field;)Z
    .locals 1

    .line 554
    const-class v0, Lcom/arialyy/aria/orm/annotation/NoNull;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/orm/annotation/NoNull;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isOne(Ljava/lang/reflect/Field;)Z
    .locals 1

    .line 524
    const-class v0, Lcom/arialyy/aria/orm/annotation/One;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/orm/annotation/One;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isPrimary(Ljava/lang/reflect/Field;)Z
    .locals 1

    .line 534
    const-class v0, Lcom/arialyy/aria/orm/annotation/Primary;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/orm/annotation/Primary;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isUnique(Ljava/lang/reflect/Field;)Z
    .locals 1

    .line 574
    const-class v0, Lcom/arialyy/aria/orm/annotation/Unique;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/orm/annotation/Unique;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static isWrapper(Ljava/lang/Class;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Lcom/arialyy/aria/orm/AbsDbWrapper;",
            ">;)Z"
        }
    .end annotation

    .line 508
    const-class v0, Lcom/arialyy/aria/orm/annotation/Wrapper;

    invoke-virtual {p0, v0}, Ljava/lang/Class;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/orm/annotation/Wrapper;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static list2Str(Lcom/arialyy/aria/orm/DbEntity;Ljava/lang/reflect/Field;)Ljava/lang/String;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 403
    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    if-eqz p0, :cond_2

    .line 404
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_1

    .line 405
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 406
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 407
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v0, "$$"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 409
    :cond_1
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    :goto_1
    const-string p0, ""

    return-object p0
.end method

.method static map2Str(Ljava/util/Map;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/lang/String;"
        }
    .end annotation

    .line 468
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 469
    invoke-interface {p0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 470
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 471
    invoke-static {v2}, Lcom/arialyy/aria/util/CommonUtil;->encryptBASE64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "$"

    .line 472
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 473
    invoke-interface {p0, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-static {v2}, Lcom/arialyy/aria/util/CommonUtil;->encryptBASE64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    .line 474
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 476
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 477
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    const/4 v1, 0x0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 479
    :goto_1
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result p0

    if-eqz p0, :cond_2

    .line 480
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "_&_decode_&_"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_2
    return-object v0
.end method

.method static str2List(Ljava/lang/String;Ljava/lang/reflect/Field;)Ljava/util/List;
    .locals 4

    .line 419
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const-string v0, "\\$\\$"

    .line 420
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 421
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 422
    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->getListParamType(Ljava/lang/reflect/Field;)Ljava/lang/Class;

    move-result-object p1

    if-eqz p1, :cond_1

    .line 424
    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    .line 425
    array-length v1, p0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, p0, v2

    .line 426
    invoke-static {p1, v3}, Lcom/arialyy/aria/orm/SqlUtil;->checkData(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method static str2Map(Ljava/lang/String;)Ljava/util/Map;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 440
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 441
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    return-object v0

    :cond_0
    const-string v1, "_&_decode_&_"

    .line 445
    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    .line 447
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0xc

    invoke-virtual {p0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    move v1, v2

    goto :goto_0

    :cond_1
    move v1, v3

    :goto_0
    const-string v4, ","

    .line 449
    invoke-virtual {p0, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p0

    .line 450
    array-length v4, p0

    move v5, v3

    :goto_1
    if-ge v5, v4, :cond_3

    aget-object v6, p0, v5

    const-string v7, "\\$"

    .line 451
    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v6

    if-eqz v1, :cond_2

    .line 453
    aget-object v7, v6, v3

    invoke-static {v7}, Lcom/arialyy/aria/util/CommonUtil;->decryptBASE64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    aget-object v6, v6, v2

    invoke-static {v6}, Lcom/arialyy/aria/util/CommonUtil;->decryptBASE64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v0, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_2

    .line 455
    :cond_2
    aget-object v7, v6, v3

    aget-object v6, v6, v2

    invoke-interface {v0, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    :cond_3
    return-object v0
.end method

.method static tableExists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">;)Z"
        }
    .end annotation

    .line 77
    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p0, p1}, Lcom/arialyy/aria/orm/SqlUtil;->tableExists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method static tableExists(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;)Z
    .locals 5

    .line 87
    invoke-static {p0}, Lcom/arialyy/aria/orm/SqlUtil;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p0

    const/4 v0, 0x0

    const/4 v1, 0x0

    :try_start_0
    const-string v2, "SELECT COUNT(*) FROM sqlite_master WHERE type=\'table\' AND name=\'%s\'"

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    aput-object p1, v4, v1

    .line 91
    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 93
    invoke-virtual {p0, p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 94
    invoke-interface {v0}, Landroid/database/Cursor;->moveToNext()Z

    move-result p0

    if-eqz p0, :cond_0

    .line 95
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lez p0, :cond_0

    .line 103
    invoke-static {v0}, Lcom/arialyy/aria/orm/SqlUtil;->closeCursor(Landroid/database/Cursor;)V

    return v3

    :catchall_0
    move-exception p0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 101
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 103
    :cond_0
    invoke-static {v0}, Lcom/arialyy/aria/orm/SqlUtil;->closeCursor(Landroid/database/Cursor;)V

    return v1

    :goto_0
    invoke-static {v0}, Lcom/arialyy/aria/orm/SqlUtil;->closeCursor(Landroid/database/Cursor;)V

    .line 104
    throw p0
.end method
