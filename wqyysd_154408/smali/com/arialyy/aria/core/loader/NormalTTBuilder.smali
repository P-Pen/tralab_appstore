.class public final Lcom/arialyy/aria/core/loader/NormalTTBuilder;
.super Ljava/lang/Object;
.source "NormalTTBuilder.java"

# interfaces
.implements Lcom/arialyy/aria/core/loader/IThreadTaskBuilder;


# instance fields
.field protected TAG:Ljava/lang/String;

.field private mAdapter:Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;

.field private mRecord:Lcom/arialyy/aria/core/TaskRecord;

.field private mStartThreadNum:I

.field private mStateHandler:Landroid/os/Handler;

.field private mTotalThreadNum:I

.field private mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;


# direct methods
.method public constructor <init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;)V
    .locals 1

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->TAG:Ljava/lang/String;

    .line 31
    instance-of v0, p1, Lcom/arialyy/aria/core/download/DGTaskWrapper;

    if-nez v0, :cond_0

    .line 34
    iput-object p1, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    .line 35
    iput-object p2, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mAdapter:Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;

    .line 36
    invoke-virtual {p2, p1}, Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;->setWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    return-void

    .line 32
    :cond_0
    new-instance p1, Ljava/lang/AssertionError;

    const-string p2, "NormalTTBuilder \u4e0d\u9002\u7528\u4e8e\u7ec4\u5408\u4efb\u52a1"

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1
.end method

.method private createSingThreadTask(Lcom/arialyy/aria/core/ThreadRecord;I)Lcom/arialyy/aria/core/task/IThreadTask;
    .locals 3

    .line 63
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mAdapter:Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;

    iget-object v1, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mStateHandler:Landroid/os/Handler;

    iget-object v2, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-boolean v2, v2, Lcom/arialyy/aria/core/TaskRecord;->isBlock:Z

    .line 64
    invoke-virtual {v0, v1, p1, v2, p2}, Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;->getSubThreadConfig(Landroid/os/Handler;Lcom/arialyy/aria/core/ThreadRecord;ZI)Lcom/arialyy/aria/core/common/SubThreadConfig;

    move-result-object p1

    .line 63
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->createThreadTask(Lcom/arialyy/aria/core/common/SubThreadConfig;)Lcom/arialyy/aria/core/task/IThreadTask;

    move-result-object p1

    return-object p1
.end method

.method private createThreadTask(Lcom/arialyy/aria/core/common/SubThreadConfig;)Lcom/arialyy/aria/core/task/IThreadTask;
    .locals 2

    .line 51
    new-instance v0, Lcom/arialyy/aria/core/task/ThreadTask;

    invoke-direct {v0, p1}, Lcom/arialyy/aria/core/task/ThreadTask;-><init>(Lcom/arialyy/aria/core/common/SubThreadConfig;)V

    .line 52
    iget-object v1, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mAdapter:Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;

    invoke-virtual {v1, p1}, Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;->getAdapter(Lcom/arialyy/aria/core/common/SubThreadConfig;)Lcom/arialyy/aria/core/task/IThreadTaskAdapter;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/task/ThreadTask;->setAdapter(Lcom/arialyy/aria/core/task/IThreadTaskAdapter;)V

    return-object v0
.end method

.method private handleBreakpoint()Ljava/util/List;
    .locals 20
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/task/IThreadTask;",
            ">;"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 84
    invoke-virtual/range {p0 .. p0}, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFileSize()J

    move-result-wide v1

    .line 85
    iget v3, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mTotalThreadNum:I

    int-to-long v3, v3

    div-long v3, v1, v3

    .line 87
    new-instance v5, Ljava/util/ArrayList;

    iget v6, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mTotalThreadNum:I

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 89
    iget-object v6, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mRecord:Lcom/arialyy/aria/core/TaskRecord;

    iput-wide v1, v6, Lcom/arialyy/aria/core/TaskRecord;->fileLength:J

    .line 90
    iget-object v6, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v6}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->isNewTask()Z

    move-result v6

    const/4 v7, 0x0

    if-eqz v6, :cond_0

    iget-object v6, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mAdapter:Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;

    iget-object v8, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget v9, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mTotalThreadNum:I

    invoke-virtual {v6, v8, v9}, Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;->handleNewTask(Lcom/arialyy/aria/core/TaskRecord;I)Z

    move-result v6

    if-nez v6, :cond_0

    .line 91
    iget-object v1, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->TAG:Ljava/lang/String;

    const-string v2, "\u521d\u59cb\u5316\u7ebf\u7a0b\u4efb\u52a1\u5931\u8d25"

    invoke-static {v1, v2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v7

    .line 95
    :cond_0
    iget-object v6, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v6, v6, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_1
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    const/4 v9, 0x1

    if-eqz v8, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/arialyy/aria/core/ThreadRecord;

    .line 96
    iget-boolean v8, v8, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    if-nez v8, :cond_1

    .line 97
    iget v8, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mStartThreadNum:I

    add-int/2addr v8, v9

    iput v8, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mStartThreadNum:I

    goto :goto_0

    :cond_2
    const-wide/16 v10, 0x0

    const/4 v8, 0x0

    .line 101
    :goto_1
    iget v12, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mTotalThreadNum:I

    if-ge v8, v12, :cond_8

    int-to-long v12, v8

    mul-long/2addr v12, v3

    add-int/lit8 v14, v8, 0x1

    int-to-long v6, v14

    mul-long/2addr v6, v3

    .line 103
    iget-object v15, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v15, v15, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v15, v8}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Lcom/arialyy/aria/core/ThreadRecord;

    .line 105
    iget-boolean v9, v15, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    move-wide/from16 v17, v1

    const/4 v1, 0x2

    if-eqz v9, :cond_4

    sub-long/2addr v6, v12

    add-long/2addr v10, v6

    .line 107
    iget-object v2, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->TAG:Ljava/lang/String;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v6, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v6}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getKey()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v1, v7

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v1, v7

    const-string v6, "\u4efb\u52a1\u3010%s\u3011\u7ebf\u7a0b__%s__\u5df2\u5b8c\u6210"

    invoke-static {v6, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 108
    iget-object v1, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mStateHandler:Landroid/os/Handler;

    invoke-virtual {v1}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    move-result-object v1

    const/4 v2, 0x4

    .line 109
    iput v2, v1, Landroid/os/Message;->what:I

    .line 110
    invoke-virtual {v1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v2

    if-nez v2, :cond_3

    .line 112
    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 115
    :cond_3
    invoke-virtual/range {p0 .. p0}, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getKey()Ljava/lang/String;

    move-result-object v6

    iget v7, v15, Lcom/arialyy/aria/core/ThreadRecord;->threadId:I

    invoke-static {v6, v7}, Lcom/arialyy/aria/util/CommonUtil;->getThreadName(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v6

    const-string v7, "DATA_THREAD_NAME"

    .line 114
    invoke-virtual {v2, v7, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    invoke-virtual {v1, v2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    .line 117
    invoke-virtual {v1}, Landroid/os/Message;->sendToTarget()V

    const/4 v2, 0x0

    goto :goto_2

    .line 122
    :cond_4
    iget-wide v1, v15, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    cmp-long v19, v12, v1

    if-gez v19, :cond_6

    .line 124
    iget v9, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mTotalThreadNum:I

    const/16 v16, 0x1

    add-int/lit8 v9, v9, -0x1

    if-ne v8, v9, :cond_5

    move-wide/from16 v6, v17

    :cond_5
    cmp-long v6, v1, v6

    if-gtz v6, :cond_6

    sub-long/2addr v1, v12

    add-long/2addr v10, v1

    .line 127
    :cond_6
    iget-object v1, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->TAG:Ljava/lang/String;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual/range {p0 .. p0}, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFileName()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v2, v7

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v2, v7

    const-string v6, "\u4efb\u52a1\u3010%s\u3011\u7ebf\u7a0b__%s__\u6062\u590d\u4efb\u52a1"

    invoke-static {v6, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 129
    iget v1, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mStartThreadNum:I

    invoke-direct {v0, v15, v1}, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->createSingThreadTask(Lcom/arialyy/aria/core/ThreadRecord;I)Lcom/arialyy/aria/core/task/IThreadTask;

    move-result-object v1

    if-nez v1, :cond_7

    .line 131
    iget-object v1, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->TAG:Ljava/lang/String;

    const-string v2, "\u521b\u5efa\u7ebf\u7a0b\u4efb\u52a1\u5931\u8d25"

    invoke-static {v1, v2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 v2, 0x0

    return-object v2

    :cond_7
    const/4 v2, 0x0

    .line 134
    invoke-interface {v5, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_2
    move-object v7, v2

    move v8, v14

    move-wide/from16 v1, v17

    const/4 v9, 0x1

    goto/16 :goto_1

    .line 136
    :cond_8
    invoke-virtual/range {p0 .. p0}, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getCurrentProgress()J

    move-result-wide v1

    cmp-long v1, v10, v1

    if-eqz v1, :cond_9

    .line 137
    iget-object v1, v0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->TAG:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-string v3, "\u8fdb\u5ea6\u4fee\u6b63\uff0c\u5f53\u524d\u8fdb\u5ea6\uff1a%s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    invoke-virtual/range {p0 .. p0}, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v1

    invoke-virtual {v1, v10, v11}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->setCurrentProgress(J)V

    :cond_9
    return-object v5
.end method

.method private handleNoSupportBP()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/task/IThreadTask;",
            ">;"
        }
    .end annotation

    .line 71
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x1

    .line 72
    iput v1, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mStartThreadNum:I

    .line 73
    iget-object v2, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mRecord:Lcom/arialyy/aria/core/TaskRecord;

    const/4 v3, 0x0

    iput-boolean v3, v2, Lcom/arialyy/aria/core/TaskRecord;->isBlock:Z

    .line 74
    iget-object v2, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mRecord:Lcom/arialyy/aria/core/TaskRecord;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/TaskRecord;->update()V

    .line 75
    iget-object v2, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v2, v2, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v2, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/ThreadRecord;

    invoke-direct {p0, v2, v1}, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->createSingThreadTask(Lcom/arialyy/aria/core/ThreadRecord;I)Lcom/arialyy/aria/core/task/IThreadTask;

    move-result-object v1

    .line 76
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object v0
.end method

.method private handleTask()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/task/IThreadTask;",
            ">;"
        }
    .end annotation

    .line 145
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->isSupportBP()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 146
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->handleBreakpoint()Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 148
    :cond_0
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->handleNoSupportBP()Ljava/util/List;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public accept(Lcom/arialyy/aria/core/loader/ILoaderVisitor;)V
    .locals 0

    .line 164
    invoke-interface {p1, p0}, Lcom/arialyy/aria/core/loader/ILoaderVisitor;->addComponent(Lcom/arialyy/aria/core/loader/IThreadTaskBuilder;)V

    return-void
.end method

.method public buildThreadTask(Lcom/arialyy/aria/core/TaskRecord;Landroid/os/Handler;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/arialyy/aria/core/TaskRecord;",
            "Landroid/os/Handler;",
            ")",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/task/IThreadTask;",
            ">;"
        }
    .end annotation

    .line 153
    iput-object p1, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mRecord:Lcom/arialyy/aria/core/TaskRecord;

    .line 154
    iput-object p2, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mStateHandler:Landroid/os/Handler;

    .line 155
    iget p1, p1, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    iput p1, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mTotalThreadNum:I

    .line 156
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->handleTask()Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getAdapter()Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;
    .locals 1

    .line 44
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mAdapter:Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;

    return-object v0
.end method

.method public getCreatedThreadNum()I
    .locals 1

    .line 160
    iget v0, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mStartThreadNum:I

    return v0
.end method

.method protected getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalTTBuilder;->mWrapper:Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/common/AbsNormalEntity;

    return-object v0
.end method
