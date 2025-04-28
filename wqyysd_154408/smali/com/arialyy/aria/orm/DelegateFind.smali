.class Lcom/arialyy/aria/orm/DelegateFind;
.super Lcom/arialyy/aria/orm/AbsDelegate;
.source "DelegateFind.java"


# instance fields
.field private final CHILD_COLUMN_ALIAS:Ljava/lang/String;

.field private final PARENT_COLUMN_ALIAS:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Lcom/arialyy/aria/orm/AbsDelegate;-><init>()V

    const-string v0, "p"

    .line 40
    iput-object v0, p0, Lcom/arialyy/aria/orm/DelegateFind;->PARENT_COLUMN_ALIAS:Ljava/lang/String;

    const-string v0, "c"

    .line 41
    iput-object v0, p0, Lcom/arialyy/aria/orm/DelegateFind;->CHILD_COLUMN_ALIAS:Ljava/lang/String;

    return-void
.end method

.method private createChild(Ljava/lang/Class;Ljava/util/List;Landroid/database/Cursor;)Lcom/arialyy/aria/orm/DbEntity;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Field;",
            ">;",
            "Landroid/database/Cursor;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 331
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/orm/DbEntity;

    const-string v6, "c"

    const-string v0, "rowid"

    .line 332
    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v0

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getInt(I)I

    move-result v0

    int-to-long v0, v0

    iput-wide v0, p1, Lcom/arialyy/aria/orm/DbEntity;->rowID:J

    .line 333
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Ljava/lang/reflect/Field;

    const/4 v0, 0x1

    .line 334
    invoke-virtual {v2, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 335
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {p3, v0}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    .line 336
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    move-object v0, p0

    move-object v4, p3

    move-object v5, p1

    invoke-direct/range {v0 .. v5}, Lcom/arialyy/aria/orm/DelegateFind;->setFieldValue(Ljava/lang/Class;Ljava/lang/reflect/Field;ILandroid/database/Cursor;Lcom/arialyy/aria/orm/DbEntity;)V

    goto :goto_0

    :cond_0
    return-object p1
.end method

.method private createChildren(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/arialyy/aria/orm/DbEntity;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Field;",
            ">;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 312
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_0
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/reflect/Field;

    const/4 v1, 0x1

    .line 313
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 314
    invoke-virtual {v0}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2, p5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 315
    invoke-virtual {v0, p6}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    .line 316
    instance-of p5, p3, Ljava/lang/String;

    if-eqz p5, :cond_1

    .line 317
    check-cast p3, Ljava/lang/String;

    invoke-static {p3}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    :cond_1
    new-array p5, v1, [Ljava/lang/String;

    const/4 p6, 0x0

    .line 319
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p4, "=\'"

    invoke-virtual {v0, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p3, "\'"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    aput-object p3, p5, p6

    invoke-virtual {p0, p1, p2, p5}, Lcom/arialyy/aria/orm/DelegateFind;->findData(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 322
    :cond_2
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    return-object p1
.end method

.method private createParent(ILjava/lang/Class;Ljava/util/List;Landroid/database/Cursor;)Lcom/arialyy/aria/orm/DbEntity;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(I",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Field;",
            ">;",
            "Landroid/database/Cursor;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InstantiationException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 347
    invoke-virtual {p2}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/arialyy/aria/orm/DbEntity;

    int-to-long v0, p1

    .line 348
    iput-wide v0, p2, Lcom/arialyy/aria/orm/DbEntity;->rowID:J

    .line 349
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    move-object v2, p3

    check-cast v2, Ljava/lang/reflect/Field;

    const/4 p3, 0x1

    .line 350
    invoke-virtual {v2, p3}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 351
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object p3

    const-string v0, "p"

    invoke-virtual {v0, p3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-interface {p4, p3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    .line 352
    invoke-virtual {v2}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v1

    move-object v0, p0

    move-object v4, p4

    move-object v5, p2

    invoke-direct/range {v0 .. v5}, Lcom/arialyy/aria/orm/DelegateFind;->setFieldValue(Ljava/lang/Class;Ljava/lang/reflect/Field;ILandroid/database/Cursor;Lcom/arialyy/aria/orm/DbEntity;)V

    goto :goto_0

    :cond_0
    return-object p2
.end method

.method private exeNormalDataSql(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            "[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 463
    invoke-static {p1, p2}, Lcom/arialyy/aria/orm/SqlUtil;->checkOrCreateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    const/4 v0, 0x0

    if-eqz p4, :cond_1

    .line 467
    array-length v1, p4

    new-array v1, v1, [Ljava/lang/String;

    .line 469
    array-length v2, p4

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v3, v2, :cond_0

    aget-object v5, p4, v3

    .line 470
    invoke-static {v5}, Lcom/arialyy/aria/orm/SqlUtil;->encodeStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v1, v4

    add-int/lit8 v4, v4, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 473
    :cond_0
    invoke-virtual {p1, p3, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    goto :goto_1

    .line 475
    :cond_1
    invoke-virtual {p1, p3, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    .line 477
    :goto_1
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p3

    if-lez p3, :cond_2

    invoke-direct {p0, p2, p1}, Lcom/arialyy/aria/orm/DelegateFind;->newInstanceEntity(Ljava/lang/Class;Landroid/database/Cursor;)Ljava/util/List;

    move-result-object v0

    .line 478
    :cond_2
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/orm/DelegateFind;->closeCursor(Landroid/database/Cursor;)V

    return-object v0
.end method

.method private varargs exeRelationSql(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;
    .locals 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/AbsDbWrapper;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "TT;>;II[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    move-object/from16 v12, p0

    move/from16 v0, p3

    move/from16 v1, p4

    move-object/from16 v2, p5

    const-string v3, "c"

    const-string v4, "p"

    .line 129
    invoke-virtual/range {p0 .. p1}, Lcom/arialyy/aria/orm/DelegateFind;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object v9

    .line 130
    invoke-static/range {p2 .. p2}, Lcom/arialyy/aria/orm/SqlUtil;->isWrapper(Ljava/lang/Class;)Z

    move-result v5

    const/4 v13, 0x0

    if-eqz v5, :cond_c

    move-object/from16 v5, p2

    .line 131
    invoke-direct {v12, v5}, Lcom/arialyy/aria/orm/DelegateFind;->getOneAndManyField(Ljava/lang/Class;)[Ljava/lang/reflect/Field;

    move-result-object v6

    if-nez v6, :cond_0

    return-object v13

    .line 135
    :cond_0
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v8, 0x0

    .line 136
    aget-object v10, v6, v8

    const/4 v11, 0x1

    aget-object v6, v6, v11

    .line 138
    :try_start_0
    const-class v14, Lcom/arialyy/aria/orm/annotation/Many;

    invoke-virtual {v6, v14}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v14

    check-cast v14, Lcom/arialyy/aria/orm/annotation/Many;

    .line 139
    invoke-virtual {v10}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v10

    .line 140
    invoke-static {v6}, Lcom/arialyy/aria/util/CommonUtil;->getListParamType(Ljava/lang/reflect/Field;)Ljava/lang/Class;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v6

    .line 142
    invoke-static {v9, v10}, Lcom/arialyy/aria/orm/SqlUtil;->checkOrCreateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    .line 143
    invoke-static {v9, v6}, Lcom/arialyy/aria/orm/SqlUtil;->checkOrCreateTable(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)V

    .line 144
    invoke-virtual {v10}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v15

    .line 145
    invoke-virtual {v6}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v13

    .line 146
    invoke-static {v10}, Lcom/arialyy/aria/orm/SqlUtil;->getAllNotIgnoreField(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v16

    .line 147
    invoke-static {v6}, Lcom/arialyy/aria/orm/SqlUtil;->getAllNotIgnoreField(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v17

    .line 148
    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 149
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_2

    const-string v5, " AS "

    const-string v12, "rowid,"

    move-object/from16 v18, v6

    const-string v6, ".rowid AS "

    move-object/from16 v19, v10

    const-string v10, ","

    move-object/from16 v20, v9

    const-string v9, "."

    if-eqz v16, :cond_1

    .line 152
    :try_start_1
    invoke-virtual {v15, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1, v12}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Ljava/lang/reflect/Field;

    move-object/from16 v22, v1

    .line 154
    invoke-virtual/range {v21 .. v21}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v23, v4

    .line 155
    invoke-virtual {v15, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v21 .. v21}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move/from16 v0, p3

    move-object/from16 v1, v22

    move-object/from16 v4, v23

    goto :goto_0

    :cond_1
    if-eqz v17, :cond_2

    .line 163
    invoke-virtual {v13, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v12}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 164
    invoke-interface/range {v17 .. v17}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    .line 165
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 166
    invoke-virtual {v13, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 168
    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 169
    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 173
    :cond_2
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 174
    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 175
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_3

    .line 176
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    const/4 v4, 0x0

    invoke-virtual {v0, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 179
    :cond_3
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_4

    .line 180
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    const/4 v4, 0x0

    invoke-virtual {v1, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    :cond_4
    const-string v3, "SELECT "

    .line 183
    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_5

    .line 186
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 188
    :cond_5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_6

    .line 189
    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 191
    :cond_6
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_7

    const-string v0, " * "

    .line 192
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_7
    const-string v0, " FROM "

    .line 195
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    invoke-virtual {v7, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " INNER JOIN "

    .line 197
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    invoke-virtual {v7, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " ON "

    .line 199
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 200
    invoke-virtual {v15, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v14}, Lcom/arialyy/aria/orm/annotation/Many;->parentColumn()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " = "

    .line 201
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    invoke-virtual {v13, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-interface {v14}, Lcom/arialyy/aria/orm/annotation/Many;->entityColumn()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz v2, :cond_a

    .line 204
    array-length v0, v2

    if-lez v0, :cond_a

    .line 205
    invoke-static/range {p5 .. p5}, Lcom/arialyy/aria/util/CommonUtil;->checkSqlExpression([Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_8

    const/4 v1, 0x0

    return-object v1

    :cond_8
    const-string v0, " WHERE "

    .line 208
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v0, 0x0

    aget-object v1, v2, v0

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " "

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 209
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "?"

    const-string v3, "%s"

    .line 210
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v0

    .line 211
    array-length v1, v2

    const/4 v3, 0x1

    sub-int/2addr v1, v3

    new-array v4, v1, [Ljava/lang/String;

    const/4 v5, 0x0

    :goto_2
    if-ge v5, v1, :cond_9

    const-string v6, "\'%s\'"

    new-array v7, v3, [Ljava/lang/Object;

    add-int/lit8 v3, v5, 0x1

    .line 213
    aget-object v8, v2, v3

    invoke-static {v8}, Lcom/arialyy/aria/orm/SqlUtil;->encodeStr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const/4 v10, 0x0

    aput-object v8, v7, v10

    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    move v5, v3

    const/4 v3, 0x1

    goto :goto_2

    .line 215
    :cond_9
    invoke-static {v0, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_3

    .line 217
    :cond_a
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_3
    const/4 v1, -0x1

    move/from16 v2, p3

    if-eq v2, v1, :cond_b

    move/from16 v3, p4

    if-eq v3, v1, :cond_b

    const-string v1, " Group by %s LIMIT %s,%s"

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    .line 223
    invoke-virtual {v15, v9}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-interface {v14}, Lcom/arialyy/aria/orm/annotation/Many;->parentColumn()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    const/4 v5, 0x1

    sub-int/2addr v2, v5

    mul-int/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v4, v5

    const/4 v2, 0x2

    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v4, v2

    .line 222
    invoke-static {v1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    move v8, v5

    goto :goto_4

    :cond_b
    const/4 v6, 0x0

    move v8, v6

    :goto_4
    move-object/from16 v9, v20

    const/4 v1, 0x0

    .line 225
    invoke-virtual {v9, v0, v1}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object v0

    .line 228
    invoke-interface {v14}, Lcom/arialyy/aria/orm/annotation/Many;->entityColumn()Ljava/lang/String;

    move-result-object v10

    invoke-interface {v14}, Lcom/arialyy/aria/orm/annotation/Many;->parentColumn()Ljava/lang/String;

    move-result-object v11

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, v19

    move-object/from16 v4, v18

    move-object v5, v0

    move-object/from16 v6, v16

    move-object/from16 v7, v17

    .line 227
    invoke-direct/range {v1 .. v11}, Lcom/arialyy/aria/orm/DelegateFind;->newInstanceEntity(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;Landroid/database/Cursor;Ljava/util/List;Ljava/util/List;ZLandroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-object/from16 v2, p0

    .line 230
    :try_start_2
    invoke-virtual {v2, v0}, Lcom/arialyy/aria/orm/DelegateFind;->closeCursor(Landroid/database/Cursor;)V
    :try_end_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_2 .. :try_end_2} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    goto :goto_5

    :catch_1
    move-exception v0

    move-object/from16 v2, p0

    goto :goto_5

    :catch_2
    move-exception v0

    move-object v2, v12

    .line 233
    :goto_5
    invoke-virtual {v0}, Ljava/lang/ClassNotFoundException;->printStackTrace()V

    const/4 v1, 0x0

    return-object v1

    :cond_c
    move-object v2, v12

    move-object v1, v13

    const-string v0, "AbsDelegate"

    const-string v3, "\u67e5\u8be2\u6570\u636e\u5931\u8d25\uff0c\u5b9e\u4f53\u7c7b\u6ca1\u6709\u4f7f\u7528@Wrapper \u6ce8\u89e3"

    .line 236
    invoke-static {v0, v3}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v1
.end method

.method private getOneAndManyField(Ljava/lang/Class;)[Ljava/lang/reflect/Field;
    .locals 13

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/reflect/Field;

    .line 53
    invoke-virtual {p1}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object p1

    .line 56
    array-length v1, p1

    const/4 v2, 0x0

    const/4 v3, 0x0

    move v4, v2

    move v7, v4

    move v8, v7

    move-object v5, v3

    move-object v6, v5

    :goto_0
    const/4 v9, 0x1

    const-string v10, "AbsDelegate"

    if-ge v4, v1, :cond_5

    aget-object v11, p1, v4

    .line 57
    invoke-static {v11}, Lcom/arialyy/aria/orm/SqlUtil;->isOne(Ljava/lang/reflect/Field;)Z

    move-result v12

    if-eqz v12, :cond_1

    if-eqz v7, :cond_0

    const-string p1, "\u67e5\u8be2\u6570\u636e\u5931\u8d25\uff0c\u5b9e\u4f53\u4e2d\u6709\u591a\u4e2a@One \u6ce8\u89e3"

    .line 59
    invoke-static {v10, p1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v3

    :cond_0
    move v7, v9

    move-object v5, v11

    .line 65
    :cond_1
    invoke-static {v11}, Lcom/arialyy/aria/orm/SqlUtil;->isMany(Ljava/lang/reflect/Field;)Z

    move-result v12

    if-eqz v12, :cond_4

    if-eqz v8, :cond_2

    const-string p1, "\u67e5\u8be2\u6570\u636e\u5931\u8d25\uff0c\u5b9e\u4f53\u4e2d\u6709\u591a\u4e2a@Many \u6ce8\u89e3"

    .line 67
    invoke-static {v10, p1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v3

    .line 70
    :cond_2
    invoke-virtual {v11}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v6

    const-class v8, Ljava/util/List;

    invoke-virtual {v6, v8}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v6

    if-nez v6, :cond_3

    const-string p1, "\u67e5\u8be2\u6570\u636e\u5931\u8d25\uff0c@Many \u6ce8\u89e3\u7684\u7c7b\u578b\u4e0d\u662fList"

    .line 71
    invoke-static {v10, p1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v3

    :cond_3
    move v8, v9

    move-object v6, v11

    :cond_4
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_5
    if-eqz v5, :cond_8

    if-nez v6, :cond_6

    goto :goto_1

    .line 84
    :cond_6
    invoke-virtual {v6}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object p1

    const-class v1, Ljava/util/List;

    if-eq p1, v1, :cond_7

    const-string p1, "\u67e5\u8be2\u6570\u636e\u5931\u8d25\uff0c@Many\u6ce8\u89e3\u7684\u5b57\u6bb5\u5fc5\u987b\u662fList"

    .line 85
    invoke-static {v10, p1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v3

    :cond_7
    aput-object v5, v0, v2

    aput-object v6, v0, v9

    return-object v0

    :cond_8
    :goto_1
    const-string p1, "\u67e5\u8be2\u6570\u636e\u5931\u8d25\uff0c\u5b9e\u4f53\u4e2d\u6ca1\u6709@One\u6216@Many\u6ce8\u89e3"

    .line 80
    invoke-static {v10, p1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v3
.end method

.method private declared-synchronized newInstanceEntity(Ljava/lang/Class;Landroid/database/Cursor;)Ljava/util/List;
    .locals 11
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Landroid/database/Cursor;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    monitor-enter p0

    .line 487
    :try_start_0
    invoke-static {p1}, Lcom/arialyy/aria/util/CommonUtil;->getAllFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 488
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    if-eqz v0, :cond_7

    .line 489
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-lez v2, :cond_7

    .line 491
    :goto_0
    :try_start_1
    invoke-interface {p2}, Landroid/database/Cursor;->moveToNext()Z

    move-result v2

    if-eqz v2, :cond_6

    .line 492
    invoke-virtual {p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/orm/DbEntity;

    const-string v3, ""

    .line 494
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_4

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    move-object v5, v4

    check-cast v5, Ljava/lang/reflect/Field;

    const/4 v4, 0x1

    .line 495
    invoke-virtual {v5, v4}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 496
    invoke-static {v5}, Lcom/arialyy/aria/orm/SqlUtil;->isIgnore(Ljava/lang/reflect/Field;)Z

    move-result v4

    if-eqz v4, :cond_0

    goto :goto_1

    .line 500
    :cond_0
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v4

    .line 501
    invoke-static {v5}, Lcom/arialyy/aria/orm/SqlUtil;->isPrimary(Ljava/lang/reflect/Field;)Z

    move-result v6

    if-eqz v6, :cond_2

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq v4, v6, :cond_1

    const-class v6, Ljava/lang/Integer;

    if-ne v4, v6, :cond_2

    .line 502
    :cond_1
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    :cond_2
    move-object v10, v3

    .line 505
    invoke-virtual {v5}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-interface {p2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v6

    const/4 v3, -0x1

    if-ne v6, v3, :cond_3

    goto :goto_2

    :cond_3
    move-object v3, p0

    move-object v7, p2

    move-object v8, v2

    .line 507
    invoke-direct/range {v3 .. v8}, Lcom/arialyy/aria/orm/DelegateFind;->setFieldValue(Ljava/lang/Class;Ljava/lang/reflect/Field;ILandroid/database/Cursor;Lcom/arialyy/aria/orm/DbEntity;)V

    :goto_2
    move-object v3, v10

    goto :goto_1

    .line 511
    :cond_4
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_5

    const-string v3, "rowid"

    :cond_5
    invoke-interface {p2, v3}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v3

    .line 510
    invoke-interface {p2, v3}, Landroid/database/Cursor;->getInt(I)I

    move-result v3

    int-to-long v3, v3

    iput-wide v3, v2, Lcom/arialyy/aria/orm/DbEntity;->rowID:J

    .line 513
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 515
    :cond_6
    invoke-virtual {p0, p2}, Lcom/arialyy/aria/orm/DelegateFind;->closeCursor(Landroid/database/Cursor;)V
    :try_end_1
    .catch Ljava/lang/InstantiationException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_3

    :catch_0
    move-exception p1

    .line 519
    :try_start_2
    invoke-virtual {p1}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_3

    :catch_1
    move-exception p1

    .line 517
    invoke-virtual {p1}, Ljava/lang/InstantiationException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 522
    :cond_7
    :goto_3
    monitor-exit p0

    return-object v1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized newInstanceEntity(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/Class;Landroid/database/Cursor;Ljava/util/List;Ljava/util/List;ZLandroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;Ljava/lang/String;)Ljava/util/List;
    .locals 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/AbsDbWrapper;",
            "P:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            "C:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/Class<",
            "TP;>;",
            "Ljava/lang/Class<",
            "TC;>;",
            "Landroid/database/Cursor;",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Field;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/reflect/Field;",
            ">;Z",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    move-object v8, p0

    move-object/from16 v0, p4

    monitor-enter p0

    .line 254
    :try_start_0
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 255
    new-instance v10, Landroid/util/SparseArray;

    invoke-direct {v10}, Landroid/util/SparseArray;-><init>()V

    .line 256
    new-instance v11, Landroid/util/SparseArray;

    invoke-direct {v11}, Landroid/util/SparseArray;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    :goto_0
    :try_start_1
    invoke-interface/range {p4 .. p4}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "p"

    const-string v2, "rowid"

    .line 260
    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {v0, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v12

    .line 261
    invoke-virtual {v10, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    if-nez v1, :cond_0

    .line 262
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v10, v12, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    move-object/from16 v13, p2

    move-object/from16 v14, p5

    .line 263
    invoke-direct {p0, v12, v13, v14, v0}, Lcom/arialyy/aria/orm/DelegateFind;->createParent(ILjava/lang/Class;Ljava/util/List;Landroid/database/Cursor;)Lcom/arialyy/aria/orm/DbEntity;

    move-result-object v1

    invoke-virtual {v11, v12, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_1

    :cond_0
    move-object/from16 v13, p2

    move-object/from16 v14, p5

    :goto_1
    if-eqz p7, :cond_2

    .line 267
    invoke-virtual {v11, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/arialyy/aria/orm/DbEntity;

    move-object v1, p0

    move-object/from16 v2, p8

    move-object/from16 v3, p3

    move-object/from16 v4, p5

    move-object/from16 v5, p9

    move-object/from16 v6, p10

    .line 266
    invoke-direct/range {v1 .. v7}, Lcom/arialyy/aria/orm/DelegateFind;->createChildren(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lcom/arialyy/aria/orm/DbEntity;)Ljava/util/List;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 269
    invoke-virtual {v10, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    :cond_1
    move-object/from16 v2, p3

    move-object/from16 v3, p6

    goto :goto_0

    .line 272
    :cond_2
    invoke-virtual {v10, v12}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    move-object/from16 v2, p3

    move-object/from16 v3, p6

    invoke-direct {p0, v2, v3, v0}, Lcom/arialyy/aria/orm/DelegateFind;->createChild(Ljava/lang/Class;Ljava/util/List;Landroid/database/Cursor;)Lcom/arialyy/aria/orm/DbEntity;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 276
    :cond_3
    invoke-static/range {p1 .. p1}, Lcom/arialyy/aria/orm/SqlUtil;->getAllNotIgnoreField(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_8

    .line 277
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    goto :goto_4

    :cond_4
    const/4 v1, 0x0

    move v2, v1

    .line 280
    :goto_2
    invoke-virtual {v11}, Landroid/util/SparseArray;->size()I

    move-result v3

    if-ge v2, v3, :cond_9

    .line 281
    invoke-virtual {v11, v2}, Landroid/util/SparseArray;->keyAt(I)I

    move-result v3

    .line 282
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Class;->newInstance()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/arialyy/aria/orm/AbsDbWrapper;

    .line 284
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    move v6, v1

    move v7, v6

    :cond_5
    :goto_3
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_7

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/reflect/Field;

    const/4 v13, 0x1

    if-nez v6, :cond_6

    .line 285
    const-class v14, Lcom/arialyy/aria/orm/annotation/One;

    invoke-virtual {v12, v14}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v14

    if-eqz v14, :cond_6

    .line 286
    invoke-virtual {v11, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v12, v4, v6}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    move v6, v13

    :cond_6
    if-nez v7, :cond_5

    .line 289
    const-class v14, Lcom/arialyy/aria/orm/annotation/Many;

    invoke-virtual {v12, v14}, Ljava/lang/reflect/Field;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object v14

    if-eqz v14, :cond_5

    .line 290
    invoke-virtual {v10, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v12, v4, v7}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    move v7, v13

    goto :goto_3

    .line 294
    :cond_7
    invoke-virtual {v4}, Lcom/arialyy/aria/orm/AbsDbWrapper;->handleConvert()V

    .line 295
    invoke-interface {v9, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_8
    :goto_4
    const/4 v0, 0x0

    .line 278
    monitor-exit p0

    return-object v0

    :catch_0
    move-exception v0

    .line 298
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 301
    :cond_9
    monitor-exit p0

    return-object v9

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method private setFieldValue(Ljava/lang/Class;Ljava/lang/reflect/Field;ILandroid/database/Cursor;Lcom/arialyy/aria/orm/DbEntity;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    if-eqz p4, :cond_12

    .line 533
    invoke-interface {p4}, Landroid/database/Cursor;->isClosed()Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_7

    .line 537
    :cond_0
    const-class v0, Ljava/lang/String;

    if-ne p1, v0, :cond_1

    .line 538
    invoke-interface {p4, p3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 539
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_11

    .line 540
    invoke-static {p1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p5, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 542
    :cond_1
    sget-object v0, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    if-eq p1, v0, :cond_10

    const-class v0, Ljava/lang/Integer;

    if-ne p1, v0, :cond_2

    goto/16 :goto_5

    .line 544
    :cond_2
    sget-object v0, Ljava/lang/Float;->TYPE:Ljava/lang/Class;

    if-eq p1, v0, :cond_f

    const-class v0, Ljava/lang/Float;

    if-ne p1, v0, :cond_3

    goto/16 :goto_4

    .line 546
    :cond_3
    sget-object v0, Ljava/lang/Double;->TYPE:Ljava/lang/Class;

    if-eq p1, v0, :cond_e

    const-class v0, Ljava/lang/Double;

    if-ne p1, v0, :cond_4

    goto/16 :goto_3

    .line 548
    :cond_4
    sget-object v0, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    if-eq p1, v0, :cond_d

    const-class v0, Ljava/lang/Long;

    if-ne p1, v0, :cond_5

    goto/16 :goto_2

    .line 550
    :cond_5
    sget-object v0, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    if-eq p1, v0, :cond_b

    const-class v0, Ljava/lang/Boolean;

    if-ne p1, v0, :cond_6

    goto :goto_1

    .line 557
    :cond_6
    const-class v0, Ljava/util/Date;

    if-eq p1, v0, :cond_a

    const-class v0, Ljava/sql/Date;

    if-ne p1, v0, :cond_7

    goto :goto_0

    .line 559
    :cond_7
    const-class v0, [B

    if-ne p1, v0, :cond_8

    .line 560
    invoke-interface {p4, p3}, Landroid/database/Cursor;->getBlob(I)[B

    move-result-object p1

    invoke-virtual {p2, p5, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_6

    .line 561
    :cond_8
    const-class v0, Ljava/util/Map;

    if-ne p1, v0, :cond_9

    .line 562
    invoke-interface {p4, p3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 563
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_11

    .line 564
    invoke-static {p1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lcom/arialyy/aria/orm/SqlUtil;->str2Map(Ljava/lang/String;)Ljava/util/Map;

    move-result-object p1

    invoke-virtual {p2, p5, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_6

    .line 566
    :cond_9
    const-class v0, Ljava/util/List;

    if-ne p1, v0, :cond_11

    .line 567
    invoke-interface {p4, p3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 568
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_11

    .line 569
    invoke-static {p1}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1, p2}, Lcom/arialyy/aria/orm/SqlUtil;->str2List(Ljava/lang/String;Ljava/lang/reflect/Field;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p2, p5, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_6

    .line 558
    :cond_a
    :goto_0
    new-instance p1, Ljava/util/Date;

    invoke-interface {p4, p3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p3

    invoke-direct {p1, p3}, Ljava/util/Date;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p5, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    goto :goto_6

    .line 551
    :cond_b
    :goto_1
    invoke-interface {p4, p3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    move-result-object p1

    .line 552
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-eqz p3, :cond_c

    const/4 p1, 0x0

    .line 553
    invoke-virtual {p2, p5, p1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    goto :goto_6

    :cond_c
    const-string p3, "false"

    .line 555
    invoke-virtual {p1, p3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    invoke-virtual {p2, p5, p1}, Ljava/lang/reflect/Field;->setBoolean(Ljava/lang/Object;Z)V

    goto :goto_6

    .line 549
    :cond_d
    :goto_2
    invoke-interface {p4, p3}, Landroid/database/Cursor;->getLong(I)J

    move-result-wide p3

    invoke-virtual {p2, p5, p3, p4}, Ljava/lang/reflect/Field;->setLong(Ljava/lang/Object;J)V

    goto :goto_6

    .line 547
    :cond_e
    :goto_3
    invoke-interface {p4, p3}, Landroid/database/Cursor;->getDouble(I)D

    move-result-wide p3

    invoke-virtual {p2, p5, p3, p4}, Ljava/lang/reflect/Field;->setDouble(Ljava/lang/Object;D)V

    goto :goto_6

    .line 545
    :cond_f
    :goto_4
    invoke-interface {p4, p3}, Landroid/database/Cursor;->getFloat(I)F

    move-result p1

    invoke-virtual {p2, p5, p1}, Ljava/lang/reflect/Field;->setFloat(Ljava/lang/Object;F)V

    goto :goto_6

    .line 543
    :cond_10
    :goto_5
    invoke-interface {p4, p3}, Landroid/database/Cursor;->getInt(I)I

    move-result p1

    invoke-virtual {p2, p5, p1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V

    :cond_11
    :goto_6
    return-void

    :cond_12
    :goto_7
    const-string p1, "AbsDelegate"

    const-string p2, "cursor\u6ca1\u6709\u521d\u59cb\u5316"

    .line 534
    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method findAllData(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "TT;>;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 450
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/orm/DelegateFind;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 451
    invoke-static {p2}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "SELECT rowid, * FROM %s"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    .line 452
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/arialyy/aria/orm/DelegateFind;->exeNormalDataSql(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method varargs findData(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "TT;>;II[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-lt p3, v1, :cond_2

    if-ge p4, v1, :cond_0

    goto :goto_0

    .line 388
    :cond_0
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/orm/DelegateFind;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    .line 389
    invoke-static {p5}, Lcom/arialyy/aria/util/CommonUtil;->checkSqlExpression([Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    return-object v0

    :cond_1
    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    .line 393
    invoke-static {p2}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    aget-object v3, p5, v4

    aput-object v3, v2, v1

    const/4 v3, 0x2

    sub-int/2addr p3, v1

    mul-int/2addr p3, p4

    .line 394
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v2, v3

    const/4 p3, 0x3

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    aput-object p4, v2, p3

    const-string p3, "SELECT rowid, * FROM %s WHERE %s LIMIT %s,%s"

    .line 392
    invoke-static {p3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    .line 396
    array-length p4, p5

    sub-int/2addr p4, v1

    new-array v2, p4, [Ljava/lang/String;

    .line 399
    :try_start_0
    invoke-static {p5, v1, v2, v4, p4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 405
    invoke-direct {p0, p1, p2, p3, v2}, Lcom/arialyy/aria/orm/DelegateFind;->exeNormalDataSql(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1

    :catch_0
    move-exception p1

    .line 401
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-object v0

    :cond_2
    :goto_0
    const-string p1, "AbsDelegate"

    const-string p2, "page, bum \u5c0f\u4e8e1"

    .line 385
    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method varargs findData(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "TT;>;[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 361
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/orm/DelegateFind;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    .line 362
    invoke-static {p3}, Lcom/arialyy/aria/util/CommonUtil;->checkSqlExpression([Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    .line 365
    invoke-static {p2}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v0, v3

    aget-object v2, p3, v3

    const/4 v4, 0x1

    aput-object v2, v0, v4

    const-string v2, "SELECT rowid, * FROM %s WHERE %s"

    invoke-static {v2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 367
    array-length v2, p3

    sub-int/2addr v2, v4

    new-array v5, v2, [Ljava/lang/String;

    .line 370
    :try_start_0
    invoke-static {p3, v4, v5, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 376
    invoke-direct {p0, p1, p2, v0, v5}, Lcom/arialyy/aria/orm/DelegateFind;->exeNormalDataSql(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1

    :catch_0
    move-exception p1

    .line 372
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    return-object v1
.end method

.method findDataByFuzzy(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;IILjava/lang/String;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "TT;>;II",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-lt p3, v1, :cond_3

    if-ge p4, v1, :cond_0

    goto :goto_0

    .line 434
    :cond_0
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/orm/DelegateFind;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    .line 435
    invoke-static {p5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_2

    .line 438
    invoke-virtual {p5}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v2

    const-string v3, "LIKE"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    .line 442
    invoke-static {p2}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    aput-object p5, v2, v1

    const/4 p5, 0x2

    sub-int/2addr p3, v1

    mul-int/2addr p3, p4

    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    aput-object p3, v2, p5

    const/4 p3, 0x3

    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p4

    aput-object p4, v2, p3

    const-string p3, "SELECT rowid, * FROM %s WHERE %s LIMIT %s,%s"

    .line 441
    invoke-static {p3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    .line 443
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/arialyy/aria/orm/DelegateFind;->exeNormalDataSql(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 439
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sql\u8bed\u53e5\u8868\u8fbe\u5f0f\u672a\u5305\u542bLIEK"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 436
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sql\u8bed\u53e5\u8868\u8fbe\u5f0f\u4e0d\u80fd\u4e3anull\u6216\"\""

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_3
    :goto_0
    const-string p1, "AbsDelegate"

    const-string p2, "page, bum \u5c0f\u4e8e1"

    .line 431
    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object v0
.end method

.method findDataByFuzzy(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "TT;>;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 413
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/orm/DelegateFind;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    .line 414
    invoke-static {p3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 417
    invoke-virtual {p3}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "LIKE"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 420
    invoke-static {p2}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object p3, v0, v1

    const-string p3, "SELECT rowid, * FROM %s, WHERE %s"

    invoke-static {p3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    const/4 v0, 0x0

    .line 422
    invoke-direct {p0, p1, p2, p3, v0}, Lcom/arialyy/aria/orm/DelegateFind;->exeNormalDataSql(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;Ljava/lang/String;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 418
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sql\u8bed\u53e5\u8868\u8fbe\u5f0f\u672a\u5305\u542bLIEK"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 415
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "sql\u8bed\u53e5\u8868\u8fbe\u5f0f\u4e0d\u80fd\u4e3anull\u6216\"\""

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method varargs findRelationData(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/AbsDbWrapper;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "TT;>;II[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    const/4 v0, 0x1

    if-lt p3, v0, :cond_1

    if-ge p4, v0, :cond_0

    goto :goto_0

    .line 118
    :cond_0
    invoke-direct/range {p0 .. p5}, Lcom/arialyy/aria/orm/DelegateFind;->exeRelationSql(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_1
    :goto_0
    const-string p1, "AbsDelegate"

    const-string p2, "page\uff0cnum \u5c0f\u4e8e1"

    .line 115
    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x0

    return-object p1
.end method

.method varargs findRelationData(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/AbsDbWrapper;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "TT;>;[",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    const/4 v3, 0x1

    const v4, 0x7fffffff

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v5, p3

    .line 102
    invoke-direct/range {v0 .. v5}, Lcom/arialyy/aria/orm/DelegateFind;->exeRelationSql(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method getRowId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;[Ljava/lang/Object;[Ljava/lang/Object;)I
    .locals 5

    .line 594
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/orm/DelegateFind;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    .line 595
    array-length v0, p3

    const/4 v1, -0x1

    const-string v2, "AbsDelegate"

    if-lez v0, :cond_4

    array-length v0, p4

    if-gtz v0, :cond_0

    goto :goto_2

    .line 598
    :cond_0
    array-length v0, p3

    array-length v3, p4

    if-eq v0, v3, :cond_1

    const-string p1, "groupHash \u548c vaule \u957f\u5ea6\u4e0d\u76f8\u7b49"

    .line 599
    invoke-static {v2, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 602
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT rowid FROM "

    .line 603
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " WHERE "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 605
    array-length p2, p3

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v1, p2, :cond_3

    aget-object v3, p3, v1

    .line 606
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\'"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v4, p4, v2

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 607
    array-length v3, p3

    add-int/lit8 v3, v3, -0x1

    if-lt v2, v3, :cond_2

    const-string v3, ""

    goto :goto_1

    :cond_2
    const-string v3, ","

    :goto_1
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v2, v2, 0x1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 610
    :cond_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    const-string p2, "rowid"

    .line 611
    invoke-interface {p1, p2}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result p2

    .line 612
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    return p2

    :cond_4
    :goto_2
    const-string p1, "\u8bf7\u8f93\u5165\u5220\u9664\u6761\u4ef6"

    .line 596
    invoke-static {v2, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1
.end method

.method getRowId(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;)[I
    .locals 2

    .line 578
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/orm/DelegateFind;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    .line 579
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT rowid, * FROM "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p2}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p1, p2, v0}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    .line 580
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p2

    new-array p2, p2, [I

    const/4 v0, 0x0

    .line 582
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->moveToNext()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "rowid"

    .line 583
    invoke-interface {p1, v1}, Landroid/database/Cursor;->getColumnIndex(Ljava/lang/String;)I

    move-result v1

    invoke-interface {p1, v1}, Landroid/database/Cursor;->getInt(I)I

    move-result v1

    aput v1, p2, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 586
    :cond_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    return-object p2
.end method

.method itemExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/Class;J)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">(",
            "Landroid/database/sqlite/SQLiteDatabase;",
            "Ljava/lang/Class<",
            "TT;>;J)Z"
        }
    .end annotation

    .line 620
    invoke-static {p2}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/arialyy/aria/orm/DelegateFind;->itemExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Z

    move-result p1

    return p1
.end method

.method itemExist(Landroid/database/sqlite/SQLiteDatabase;Ljava/lang/String;J)Z
    .locals 2

    .line 627
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/orm/DelegateFind;->checkDb(Landroid/database/sqlite/SQLiteDatabase;)Landroid/database/sqlite/SQLiteDatabase;

    move-result-object p1

    .line 628
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "SELECT rowid FROM "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " WHERE rowid="

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x0

    .line 629
    invoke-virtual {p1, p2, p3}, Landroid/database/sqlite/SQLiteDatabase;->rawQuery(Ljava/lang/String;[Ljava/lang/String;)Landroid/database/Cursor;

    move-result-object p1

    .line 630
    invoke-interface {p1}, Landroid/database/Cursor;->getCount()I

    move-result p2

    if-lez p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    .line 631
    :goto_0
    invoke-interface {p1}, Landroid/database/Cursor;->close()V

    return p2
.end method
