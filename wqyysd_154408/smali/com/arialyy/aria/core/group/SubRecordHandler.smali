.class public Lcom/arialyy/aria/core/group/SubRecordHandler;
.super Lcom/arialyy/aria/core/common/RecordHandler;
.source "SubRecordHandler.java"


# direct methods
.method public constructor <init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V
    .locals 0

    .line 35
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/common/RecordHandler;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    return-void
.end method


# virtual methods
.method public createTaskRecord(I)Lcom/arialyy/aria/core/TaskRecord;
    .locals 2

    .line 73
    new-instance v0, Lcom/arialyy/aria/core/TaskRecord;

    invoke-direct {v0}, Lcom/arialyy/aria/core/TaskRecord;-><init>()V

    .line 74
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFileName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/arialyy/aria/core/TaskRecord;->fileName:Ljava/lang/String;

    .line 75
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFilePath()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    .line 76
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, v0, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    .line 77
    iput p1, v0, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    .line 79
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getRequestType()I

    move-result p1

    const/4 v1, 0x1

    if-eq p1, v1, :cond_1

    const/4 v1, 0x2

    if-ne p1, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 83
    iput-boolean v1, v0, Lcom/arialyy/aria/core/TaskRecord;->isBlock:Z

    goto :goto_1

    .line 81
    :cond_1
    :goto_0
    invoke-static {}, Lcom/arialyy/aria/core/config/Configuration;->getInstance()Lcom/arialyy/aria/core/config/Configuration;

    move-result-object v1

    iget-object v1, v1, Lcom/arialyy/aria/core/config/Configuration;->downloadCfg:Lcom/arialyy/aria/core/config/DownloadConfig;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/config/DownloadConfig;->isUseBlock()Z

    move-result v1

    iput-boolean v1, v0, Lcom/arialyy/aria/core/TaskRecord;->isBlock:Z

    .line 85
    :goto_1
    iput p1, v0, Lcom/arialyy/aria/core/TaskRecord;->taskType:I

    .line 86
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->isGroupChild()Z

    move-result p1

    iput-boolean p1, v0, Lcom/arialyy/aria/core/TaskRecord;->isGroupRecord:Z

    .line 87
    iget-boolean p1, v0, Lcom/arialyy/aria/core/TaskRecord;->isGroupRecord:Z

    if-eqz p1, :cond_2

    .line 88
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object p1

    instance-of p1, p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    if-eqz p1, :cond_2

    .line 89
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getGroupHash()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Lcom/arialyy/aria/core/TaskRecord;->dGroupHash:Ljava/lang/String;

    :cond_2
    return-object v0
.end method

.method public createThreadRecord(Lcom/arialyy/aria/core/TaskRecord;IJJ)Lcom/arialyy/aria/core/ThreadRecord;
    .locals 2

    .line 56
    new-instance v0, Lcom/arialyy/aria/core/ThreadRecord;

    invoke-direct {v0}, Lcom/arialyy/aria/core/ThreadRecord;-><init>()V

    .line 57
    iget-object v1, p1, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    iput-object v1, v0, Lcom/arialyy/aria/core/ThreadRecord;->taskKey:Ljava/lang/String;

    .line 58
    iput p2, v0, Lcom/arialyy/aria/core/ThreadRecord;->threadId:I

    .line 59
    iput-wide p3, v0, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    const/4 p3, 0x0

    .line 60
    iput-boolean p3, v0, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    .line 62
    iget p3, p1, Lcom/arialyy/aria/core/TaskRecord;->taskType:I

    iput p3, v0, Lcom/arialyy/aria/core/ThreadRecord;->threadType:I

    .line 64
    iget p3, p1, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    add-int/lit8 p3, p3, -0x1

    if-ne p2, p3, :cond_0

    .line 65
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getFileSize()J

    move-result-wide p5

    .line 67
    :cond_0
    iput-wide p5, v0, Lcom/arialyy/aria/core/ThreadRecord;->endLocation:J

    .line 68
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getFileSize()J

    move-result-wide p3

    iget p1, p1, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    invoke-static {p3, p4, p2, p1}, Lcom/arialyy/aria/util/RecordUtil;->getBlockLen(JII)J

    move-result-wide p1

    iput-wide p1, v0, Lcom/arialyy/aria/core/ThreadRecord;->blockLen:J

    return-object v0
.end method

.method public handlerTaskRecord(Lcom/arialyy/aria/core/TaskRecord;)V
    .locals 3

    .line 39
    new-instance v0, Lcom/arialyy/aria/core/common/RecordHelper;

    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/arialyy/aria/core/common/RecordHelper;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/TaskRecord;)V

    .line 40
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->isSupportBP()Z

    move-result v1

    if-eqz v1, :cond_1

    iget v1, p1, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    const/4 v2, 0x1

    if-le v1, v2, :cond_1

    .line 41
    iget-boolean p1, p1, Lcom/arialyy/aria/core/TaskRecord;->isBlock:Z

    if-eqz p1, :cond_0

    .line 42
    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/RecordHelper;->handleBlockRecord()V

    goto :goto_0

    .line 44
    :cond_0
    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/RecordHelper;->handleMultiRecord()V

    goto :goto_0

    .line 46
    :cond_1
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->isSupportBP()Z

    move-result p1

    if-nez p1, :cond_2

    .line 47
    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/RecordHelper;->handleNoSupportBPRecord()V

    goto :goto_0

    .line 49
    :cond_2
    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/RecordHelper;->handleSingleThreadRecord()V

    :goto_0
    return-void
.end method

.method public initTaskThreadNum()I
    .locals 6

    .line 97
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getRequestType()I

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x5

    if-eq v0, v2, :cond_2

    if-ne v0, v1, :cond_0

    .line 99
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->isSupportBP()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 103
    :cond_0
    invoke-static {}, Lcom/arialyy/aria/core/config/Configuration;->getInstance()Lcom/arialyy/aria/core/config/Configuration;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/config/Configuration;->downloadCfg:Lcom/arialyy/aria/core/config/DownloadConfig;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/DownloadConfig;->getThreadNum()I

    move-result v0

    .line 104
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SubRecordHandler;->getFileSize()J

    move-result-wide v2

    const-wide/32 v4, 0x100000

    cmp-long v2, v2, v4

    if-gtz v2, :cond_1

    goto :goto_0

    :cond_1
    move v1, v0

    :cond_2
    :goto_0
    return v1
.end method
