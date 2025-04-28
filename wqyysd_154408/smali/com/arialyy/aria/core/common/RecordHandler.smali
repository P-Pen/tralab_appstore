.class public abstract Lcom/arialyy/aria/core/common/RecordHandler;
.super Ljava/lang/Object;
.source "RecordHandler.java"

# interfaces
.implements Lcom/arialyy/aria/core/loader/IRecordHandler;


# instance fields
.field protected final TAG:Ljava/lang/String;

.field private mConfigFile:Ljava/io/File;
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field private mEntity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

.field protected mFilePath:Ljava/lang/String;

.field protected mFileSize:J

.field private mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

.field private mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;


# direct methods
.method public constructor <init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V
    .locals 1

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 43
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->TAG:Ljava/lang/String;

    .line 53
    iput-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    .line 54
    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/common/AbsNormalEntity;

    iput-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mEntity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

    return-void
.end method

.method private convertDb()V
    .locals 11

    .line 104
    const-class v0, Lcom/arialyy/aria/core/wrapper/RecordWrapper;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "TaskRecord.filePath=?"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    .line 106
    invoke-direct {p0}, Lcom/arialyy/aria/core/common/RecordHandler;->getFilePath()Ljava/lang/String;

    move-result-object v2

    const/4 v4, 0x1

    aput-object v2, v1, v4

    .line 105
    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->findRelationData(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 107
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-nez v0, :cond_8

    .line 108
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mConfigFile:Ljava/io/File;

    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->loadConfig(Ljava/io/File;)Ljava/util/Properties;

    move-result-object v0

    .line 109
    invoke-virtual {v0}, Ljava/util/Properties;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 110
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->TAG:Ljava/lang/String;

    const-string v1, "\u8001\u7248\u672c\u7684\u7ebf\u7a0b\u8bb0\u5f55\u4e3a\u7a7a\uff0c\u4efb\u52a1\u4e3a\u65b0\u4efb\u52a1"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 111
    invoke-direct {p0, v4}, Lcom/arialyy/aria/core/common/RecordHandler;->initRecord(Z)V

    return-void

    .line 115
    :cond_1
    invoke-virtual {v0}, Ljava/util/Properties;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 118
    new-instance v2, Ljava/util/HashSet;

    invoke-direct {v2}, Ljava/util/HashSet;-><init>()V

    .line 119
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 120
    invoke-static {v5}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    .line 121
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v6, v4

    invoke-virtual {v5, v6}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5

    .line 122
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-interface {v2, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 124
    :cond_2
    invoke-interface {v2}, Ljava/util/Set;->size()I

    move-result v1

    if-nez v1, :cond_3

    .line 126
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->TAG:Ljava/lang/String;

    const-string v1, "\u7ebf\u7a0b\u6570\u4e3a\u7a7a\uff0c\u4efb\u52a1\u4e3a\u65b0\u4efb\u52a1"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 127
    invoke-direct {p0, v4}, Lcom/arialyy/aria/core/common/RecordHandler;->initRecord(Z)V

    return-void

    .line 130
    :cond_3
    iget-object v2, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v2, v3}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setNewTask(Z)V

    .line 131
    invoke-virtual {p0, v1}, Lcom/arialyy/aria/core/common/RecordHandler;->createTaskRecord(I)Lcom/arialyy/aria/core/TaskRecord;

    move-result-object v2

    iput-object v2, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    .line 132
    iput-boolean v3, v2, Lcom/arialyy/aria/core/TaskRecord;->isBlock:Z

    .line 133
    new-instance v2, Ljava/io/File;

    invoke-direct {p0}, Lcom/arialyy/aria/core/common/RecordHandler;->getFilePath()Ljava/lang/String;

    move-result-object v5

    invoke-direct {v2, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    :goto_1
    if-ge v3, v1, :cond_7

    .line 135
    new-instance v5, Lcom/arialyy/aria/core/ThreadRecord;

    invoke-direct {v5}, Lcom/arialyy/aria/core/ThreadRecord;-><init>()V

    .line 136
    iget-object v6, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v6, v6, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    iput-object v6, v5, Lcom/arialyy/aria/core/ThreadRecord;->taskKey:Ljava/lang/String;

    .line 137
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "_state_"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 138
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, "_record_"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v0, v7}, Ljava/util/Properties;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-eqz v6, :cond_4

    .line 139
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    if-ne v6, v4, :cond_4

    .line 140
    iput-boolean v4, v5, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    goto :goto_3

    :cond_4
    const-wide/16 v8, 0x0

    if-eqz v7, :cond_6

    .line 144
    invoke-static {v7}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6

    cmp-long v10, v6, v8

    if-lez v10, :cond_5

    move-wide v8, v6

    .line 145
    :cond_5
    iput-wide v8, v5, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    goto :goto_2

    .line 147
    :cond_6
    iput-wide v8, v5, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    .line 149
    :goto_2
    iget-object v6, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v6, v6, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_3
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 151
    :cond_7
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mConfigFile:Ljava/io/File;

    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/io/File;)Z

    :cond_8
    return-void
.end method

.method private getFilePath()Ljava/lang/String;
    .locals 1

    .line 200
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mEntity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

    instance-of v0, v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    if-eqz v0, :cond_0

    .line 201
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 203
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/upload/UploadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private initRecord(Z)V
    .locals 9

    if-eqz p1, :cond_0

    .line 162
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/RecordHandler;->initTaskThreadNum()I

    move-result p1

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/common/RecordHandler;->createTaskRecord(I)Lcom/arialyy/aria/core/TaskRecord;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    .line 164
    :cond_0
    iget-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setNewTask(Z)V

    .line 165
    iget-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getRequestType()I

    move-result p1

    const/16 v0, 0x8

    if-ne p1, v0, :cond_1

    return-void

    .line 169
    :cond_1
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/RecordHandler;->getFileSize()J

    move-result-wide v0

    iget-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget p1, p1, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    int-to-long v2, p1

    div-long/2addr v0, v2

    const/4 p1, 0x0

    :goto_0
    move v4, p1

    .line 171
    iget-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget p1, p1, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    if-ge v4, p1, :cond_2

    int-to-long v2, v4

    mul-long v5, v2, v0

    add-int/lit8 p1, v4, 0x1

    int-to-long v2, p1

    mul-long v7, v2, v0

    .line 173
    iget-object v3, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    move-object v2, p0

    invoke-virtual/range {v2 .. v8}, Lcom/arialyy/aria/core/common/RecordHandler;->createThreadRecord(Lcom/arialyy/aria/core/TaskRecord;IJJ)Lcom/arialyy/aria/core/ThreadRecord;

    move-result-object v2

    .line 174
    iget-object v3, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v3, v3, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-void
.end method

.method private saveRecord()V
    .locals 4

    .line 182
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v1, v0, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iput v1, v0, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    .line 183
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/TaskRecord;->save()V

    .line 184
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v0, v0, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v0, v0, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 185
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v0, v0, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-static {v0}, Lcom/arialyy/aria/orm/DbEntity;->saveAll(Ljava/util/List;)V

    .line 187
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->TAG:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v3, v3, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "\u4fdd\u5b58\u8bb0\u5f55\uff0c\u7ebf\u7a0b\u8bb0\u5f55\u6570\uff1a%s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public accept(Lcom/arialyy/aria/core/loader/ILoaderVisitor;)V
    .locals 0

    .line 208
    invoke-interface {p1, p0}, Lcom/arialyy/aria/core/loader/ILoaderVisitor;->addComponent(Lcom/arialyy/aria/core/loader/IRecordHandler;)V

    return-void
.end method

.method public checkTaskCompleted()Z
    .locals 4

    .line 212
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    iget-object v0, v0, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    if-eqz v0, :cond_3

    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v0, v0, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    .line 214
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 218
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v0, v0, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    move v2, v1

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/arialyy/aria/core/ThreadRecord;

    .line 219
    iget-boolean v3, v3, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    if-eqz v3, :cond_1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    if-eqz v2, :cond_3

    .line 223
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget v0, v0, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    if-ne v2, v0, :cond_3

    const/4 v1, 0x1

    :cond_3
    :goto_1
    return v1
.end method

.method public getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;
    .locals 1

    .line 62
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mEntity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

    return-object v0
.end method

.method protected getFileSize()J
    .locals 2

    .line 191
    iget-wide v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mFileSize:J

    return-wide v0
.end method

.method public getRecord(J)Lcom/arialyy/aria/core/TaskRecord;
    .locals 1

    .line 79
    iput-wide p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mFileSize:J

    .line 80
    new-instance p1, Ljava/io/File;

    iget-object p2, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mEntity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

    invoke-virtual {p2}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFileName()Ljava/lang/String;

    move-result-object p2

    const/4 v0, 0x0

    invoke-static {v0, p2}, Lcom/arialyy/aria/util/CommonUtil;->getFileConfigPath(ZLjava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mConfigFile:Ljava/io/File;

    .line 81
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 82
    invoke-direct {p0}, Lcom/arialyy/aria/core/common/RecordHandler;->convertDb()V

    goto :goto_1

    .line 84
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/RecordHandler;->onPre()V

    .line 85
    invoke-direct {p0}, Lcom/arialyy/aria/core/common/RecordHandler;->getFilePath()Ljava/lang/String;

    move-result-object p1

    iget-object p2, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mEntity:Lcom/arialyy/aria/core/common/AbsNormalEntity;

    invoke-virtual {p2}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getTaskType()I

    move-result p2

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/DbDataHelper;->getTaskRecord(Ljava/lang/String;I)Lcom/arialyy/aria/core/TaskRecord;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    if-nez p1, :cond_1

    const/4 p1, 0x1

    .line 87
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/common/RecordHandler;->initRecord(Z)V

    goto :goto_0

    .line 88
    :cond_1
    iget-object p1, p1, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    if-eqz p1, :cond_2

    iget-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object p1, p1, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    if-nez p1, :cond_4

    .line 89
    :cond_2
    iget-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object p1, p1, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    if-nez p1, :cond_3

    .line 90
    iget-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p1, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    .line 92
    :cond_3
    invoke-direct {p0, v0}, Lcom/arialyy/aria/core/common/RecordHandler;->initRecord(Z)V

    .line 94
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/common/RecordHandler;->handlerTaskRecord(Lcom/arialyy/aria/core/TaskRecord;)V

    .line 96
    :goto_1
    invoke-direct {p0}, Lcom/arialyy/aria/core/common/RecordHandler;->saveRecord()V

    .line 97
    iget-object p1, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    return-object p1
.end method

.method public getWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/arialyy/aria/core/common/RecordHandler;->mTaskWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    return-object v0
.end method

.method public onPre()V
    .locals 0

    return-void
.end method
