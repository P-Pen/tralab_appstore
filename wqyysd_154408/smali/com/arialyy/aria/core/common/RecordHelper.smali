.class public Lcom/arialyy/aria/core/common/RecordHelper;
.super Ljava/lang/Object;
.source "RecordHelper.java"


# instance fields
.field private TAG:Ljava/lang/String;

.field protected mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

.field private mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;


# direct methods
.method public constructor <init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/TaskRecord;)V
    .locals 1

    .line 41
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/common/RecordHelper;->TAG:Ljava/lang/String;

    .line 42
    iput-object p1, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    .line 43
    iput-object p2, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    return-void
.end method

.method private createPlaceHolderFile(Ljava/io/File;)V
    .locals 3

    .line 88
    :try_start_0
    new-instance v0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;

    const-string v1, "rw"

    invoke-direct {v0, p1, v1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 89
    iget-object p1, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->setLength(J)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 91
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-void
.end method


# virtual methods
.method public handleBlockRecord()V
    .locals 15

    .line 100
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v0

    iget-object v2, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v2, v2, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    int-to-long v2, v2

    div-long/2addr v0, v2

    .line 101
    iget-object v2, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v2, v2, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/arialyy/aria/core/ThreadRecord;

    .line 102
    iget-wide v5, v3, Lcom/arialyy/aria/core/ThreadRecord;->blockLen:J

    .line 104
    new-instance v7, Ljava/io/File;

    const/4 v8, 0x2

    new-array v9, v8, [Ljava/lang/Object;

    iget-object v10, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v10, v10, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    aput-object v10, v9, v4

    iget v10, v3, Lcom/arialyy/aria/core/ThreadRecord;->threadId:I

    .line 105
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/4 v11, 0x1

    aput-object v10, v9, v11

    const-string v10, "%s.%s.part"

    invoke-static {v10, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 106
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v9

    if-nez v9, :cond_0

    .line 107
    iget-object v5, p0, Lcom/arialyy/aria/core/common/RecordHelper;->TAG:Ljava/lang/String;

    new-array v6, v11, [Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    const-string v7, "\u5206\u5757\u6587\u4ef6\u3010%s\u3011\u4e0d\u5b58\u5728\uff0c\u8be5\u5206\u5757\u5c06\u91cd\u65b0\u5f00\u59cb"

    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    iput-boolean v4, v3, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    .line 109
    iget v4, v3, Lcom/arialyy/aria/core/ThreadRecord;->threadId:I

    int-to-long v4, v4

    mul-long/2addr v4, v0

    iput-wide v4, v3, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    goto :goto_0

    .line 111
    :cond_0
    iget-boolean v9, v3, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    if-nez v9, :cond_4

    .line 112
    iget-object v9, p0, Lcom/arialyy/aria/core/common/RecordHelper;->TAG:Ljava/lang/String;

    const/4 v10, 0x5

    new-array v10, v10, [Ljava/lang/Object;

    iget-wide v12, v3, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    .line 114
    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v4

    iget-wide v12, v3, Lcom/arialyy/aria/core/ThreadRecord;->endLocation:J

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v11

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    aput-object v12, v10, v8

    invoke-virtual {v7}, Ljava/io/File;->length()J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v12

    const/4 v13, 0x3

    aput-object v12, v10, v13

    const/4 v12, 0x4

    iget v14, v3, Lcom/arialyy/aria/core/ThreadRecord;->threadId:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v10, v12

    const-string v12, "startLocation = %s; endLocation = %s; block = %s; tempLen = %s; threadId = %s"

    .line 112
    invoke-static {v12, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v9, v10}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 116
    invoke-virtual {v7}, Ljava/io/File;->length()J

    move-result-wide v9

    cmp-long v12, v9, v5

    if-lez v12, :cond_1

    .line 121
    iget-object v12, p0, Lcom/arialyy/aria/core/common/RecordHelper;->TAG:Ljava/lang/String;

    new-array v13, v13, [Ljava/lang/Object;

    iget v14, v3, Lcom/arialyy/aria/core/ThreadRecord;->threadId:I

    .line 122
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    aput-object v14, v13, v4

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v13, v11

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v13, v8

    const-string v4, "\u5206\u5757\u3010%s\u3011\u9519\u8bef\uff0c\u5206\u5757\u957f\u5ea6\u3010%s\u3011 > \u7ebf\u7a0b\u533a\u95f4\u957f\u5ea6\u3010%s\u3011\uff0c\u5c06\u91cd\u65b0\u5f00\u59cb\u8be5\u5206\u5757"

    .line 121
    invoke-static {v4, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v12, v4}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 123
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 124
    iget v4, v3, Lcom/arialyy/aria/core/ThreadRecord;->threadId:I

    int-to-long v7, v4

    mul-long/2addr v7, v5

    iput-wide v7, v3, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    goto/16 :goto_0

    .line 128
    :cond_1
    iget v5, v3, Lcom/arialyy/aria/core/ThreadRecord;->threadId:I

    int-to-long v5, v5

    mul-long/2addr v5, v0

    add-long/2addr v5, v9

    if-nez v12, :cond_2

    const-wide/16 v12, 0x0

    cmp-long v12, v9, v12

    if-eqz v12, :cond_2

    .line 134
    iget-object v5, p0, Lcom/arialyy/aria/core/common/RecordHelper;->TAG:Ljava/lang/String;

    new-array v6, v11, [Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v6, v4

    const-string v4, "\u5206\u5757\u3010%s\u3011\u5df2\u5b8c\u6210\uff0c\u66f4\u65b0\u8bb0\u5f55"

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v5, v4}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 135
    iput-wide v9, v3, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    .line 136
    iput-boolean v11, v3, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    goto/16 :goto_0

    .line 137
    :cond_2
    iget-wide v9, v3, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    cmp-long v9, v9, v5

    const-string v10, "\u4fee\u6b63\u5206\u5757\u3010%s\u3011\u7684\u8fdb\u5ea6\u8bb0\u5f55\u4e3a\uff1a%s"

    if-eqz v9, :cond_3

    .line 138
    iget-object v9, p0, Lcom/arialyy/aria/core/common/RecordHelper;->TAG:Ljava/lang/String;

    new-array v8, v8, [Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v8, v4

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v8, v11

    invoke-static {v10, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v9, v4}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 139
    iput-wide v5, v3, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    goto/16 :goto_0

    .line 141
    :cond_3
    iget-object v9, p0, Lcom/arialyy/aria/core/common/RecordHelper;->TAG:Ljava/lang/String;

    new-array v8, v8, [Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v7

    aput-object v7, v8, v4

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    aput-object v7, v8, v11

    invoke-static {v10, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v9, v7}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 142
    iput-wide v5, v3, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    .line 143
    iput-boolean v4, v3, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    goto/16 :goto_0

    .line 146
    :cond_4
    iget-object v3, p0, Lcom/arialyy/aria/core/common/RecordHelper;->TAG:Ljava/lang/String;

    new-array v5, v11, [Ljava/lang/Object;

    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v4

    const-string v4, "\u5206\u5757\u3010%s\u3011\u5df2\u5b8c\u6210"

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto/16 :goto_0

    .line 150
    :cond_5
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0, v4}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setNewTask(Z)V

    return-void
.end method

.method public handleMultiRecord()V
    .locals 11

    .line 51
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v0

    iget-object v2, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v2, v2, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    int-to-long v2, v2

    div-long/2addr v0, v2

    .line 52
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v3, v3, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 54
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-nez v3, :cond_0

    .line 55
    invoke-direct {p0, v2}, Lcom/arialyy/aria/core/common/RecordHelper;->createPlaceHolderFile(Ljava/io/File;)V

    move v2, v5

    goto :goto_0

    .line 57
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v6

    iget-object v3, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v8

    cmp-long v3, v6, v8

    if-eqz v3, :cond_1

    .line 58
    invoke-static {v2}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/io/File;)Z

    .line 59
    invoke-direct {p0, v2}, Lcom/arialyy/aria/core/common/RecordHelper;->createPlaceHolderFile(Ljava/io/File;)V

    :cond_1
    move v2, v4

    :goto_0
    if-nez v2, :cond_3

    .line 65
    iget-object v2, p0, Lcom/arialyy/aria/core/common/RecordHelper;->TAG:Ljava/lang/String;

    new-array v3, v4, [Ljava/lang/Object;

    iget-object v6, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v6, v6, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    aput-object v6, v3, v5

    const-string v6, "\u6587\u4ef6\u3010%s\u3011\u88ab\u5220\u9664\uff0c\u91cd\u65b0\u5206\u914d\u7ebf\u7a0b\u533a\u95f4"

    invoke-static {v6, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    move v2, v5

    .line 66
    :goto_1
    iget-object v3, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget v3, v3, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    if-ge v2, v3, :cond_3

    int-to-long v6, v2

    mul-long/2addr v6, v0

    add-int/lit8 v3, v2, 0x1

    int-to-long v8, v3

    mul-long/2addr v8, v0

    .line 68
    iget-object v10, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v10, v10, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v10, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/ThreadRecord;

    .line 69
    iput-wide v6, v2, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    .line 70
    iput-boolean v5, v2, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    .line 73
    iget v6, v2, Lcom/arialyy/aria/core/ThreadRecord;->threadId:I

    iget-object v7, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget v7, v7, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    sub-int/2addr v7, v4

    if-ne v6, v7, :cond_2

    .line 74
    iget-object v6, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v6}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v8

    .line 76
    :cond_2
    iput-wide v8, v2, Lcom/arialyy/aria/core/ThreadRecord;->endLocation:J

    move v2, v3

    goto :goto_1

    .line 79
    :cond_3
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0, v5}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setNewTask(Z)V

    return-void
.end method

.method public handleNoSupportBPRecord()V
    .locals 4

    .line 200
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v0, v0, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/ThreadRecord;

    const-wide/16 v2, 0x0

    .line 201
    iput-wide v2, v0, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    .line 202
    iget-object v2, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v2

    iput-wide v2, v0, Lcom/arialyy/aria/core/ThreadRecord;->endLocation:J

    .line 203
    iget-object v2, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v2, v2, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    iput-object v2, v0, Lcom/arialyy/aria/core/ThreadRecord;->taskKey:Ljava/lang/String;

    .line 204
    iget-wide v2, v0, Lcom/arialyy/aria/core/ThreadRecord;->endLocation:J

    iput-wide v2, v0, Lcom/arialyy/aria/core/ThreadRecord;->blockLen:J

    .line 205
    iput-boolean v1, v0, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    return-void
.end method

.method public handleSingleThreadRecord()V
    .locals 12

    .line 158
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-boolean v1, v1, Lcom/arialyy/aria/core/TaskRecord;->isBlock:Z

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_0

    new-array v1, v2, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v5, v5, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    aput-object v5, v1, v4

    .line 159
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v1, v3

    const-string v5, "%s.%s.part"

    invoke-static {v5, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    iget-object v1, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v1, v1, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    :goto_0
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 161
    iget-object v1, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v1, v1, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/ThreadRecord;

    .line 162
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v5

    const-wide/16 v6, 0x0

    if-nez v5, :cond_2

    .line 164
    new-instance v2, Ljava/io/File;

    iget-object v5, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v5, v5, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 166
    iget-boolean v5, v1, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    if-eqz v5, :cond_1

    .line 167
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 168
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v8

    cmp-long v5, v8, v6

    if-eqz v5, :cond_1

    .line 169
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v8

    iget-object v2, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v10

    cmp-long v2, v8, v10

    if-nez v2, :cond_1

    .line 170
    iput-boolean v3, v1, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    goto/16 :goto_1

    .line 172
    :cond_1
    iget-object v2, p0, Lcom/arialyy/aria/core/common/RecordHelper;->TAG:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v3, v4

    const-string v0, "\u6587\u4ef6\u3010%s\u3011\u4e0d\u5b58\u5728\uff0c\u4efb\u52a1\u5c06\u91cd\u65b0\u5f00\u59cb"

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 173
    iput-wide v6, v1, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    .line 174
    iput-boolean v4, v1, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    .line 175
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/arialyy/aria/core/ThreadRecord;->endLocation:J

    goto/16 :goto_1

    .line 177
    :cond_2
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v8

    iget-object v5, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v5}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v10

    cmp-long v5, v8, v10

    if-lez v5, :cond_3

    .line 178
    iget-object v2, p0, Lcom/arialyy/aria/core/common/RecordHelper;->TAG:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const-string v5, "\u6587\u4ef6\u3010%s\u3011\u9519\u8bef\uff0c\u4efb\u52a1\u91cd\u65b0\u5f00\u59cb"

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/io/File;)Z

    .line 180
    iput-wide v6, v1, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    .line 181
    iput-boolean v4, v1, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    .line 182
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/arialyy/aria/core/ThreadRecord;->endLocation:J

    goto :goto_1

    .line 183
    :cond_3
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v8

    cmp-long v5, v8, v6

    if-eqz v5, :cond_4

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v5

    iget-object v7, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v7}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v7

    invoke-virtual {v7}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v7

    cmp-long v5, v5, v7

    if-nez v5, :cond_4

    .line 184
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHelper;->TAG:Ljava/lang/String;

    const-string v2, "\u6587\u4ef6\u957f\u5ea6\u4e00\u81f4\uff0c\u7ebf\u7a0b\u5b8c\u6210"

    invoke-static {v0, v2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 185
    iput-boolean v3, v1, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    goto :goto_1

    .line 187
    :cond_4
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v5

    iget-wide v7, v1, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    cmp-long v5, v5, v7

    if-eqz v5, :cond_5

    .line 188
    iget-object v5, p0, Lcom/arialyy/aria/core/common/RecordHelper;->TAG:Ljava/lang/String;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v2, v4

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    aput-object v6, v2, v3

    const-string v3, "\u4fee\u6b63\u3010%s\u3011\u7684\u8fdb\u5ea6\u8bb0\u5f55\u4e3a\uff1a%s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v5, v2}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 189
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v2

    iput-wide v2, v1, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    .line 190
    iput-boolean v4, v1, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    .line 193
    :cond_5
    :goto_1
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHelper;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0, v4}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setNewTask(Z)V

    return-void
.end method
