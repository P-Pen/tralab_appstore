.class public Lcom/arialyy/aria/core/loader/NormalThreadStateManager;
.super Ljava/lang/Object;
.source "NormalThreadStateManager.java"

# interfaces
.implements Lcom/arialyy/aria/core/inf/IThreadStateManager;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private callback:Landroid/os/Handler$Callback;

.field private mCancelNum:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mCompleteNum:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mFailNum:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mListener:Lcom/arialyy/aria/core/listener/IEventListener;

.field private mLooper:Landroid/os/Looper;

.field private mProgress:J

.field private mStopNum:Ljava/util/concurrent/atomic/AtomicInteger;

.field private mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

.field private mThreadNum:I


# direct methods
.method public constructor <init>(Lcom/arialyy/aria/core/listener/IEventListener;)V
    .locals 2

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->TAG:Ljava/lang/String;

    .line 45
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mCancelNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 46
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mStopNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 47
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mFailNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 48
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mCompleteNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 75
    new-instance v0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager$1;

    invoke-direct {v0, p0}, Lcom/arialyy/aria/core/loader/NormalThreadStateManager$1;-><init>(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;)V

    iput-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->callback:Landroid/os/Handler$Callback;

    .line 57
    iput-object p1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    return-void
.end method

.method static synthetic access$000(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->checkLooper()V

    return-void
.end method

.method static synthetic access$100(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mStopNum:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method

.method static synthetic access$1000(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;)J
    .locals 2

    .line 37
    iget-wide v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mProgress:J

    return-wide v0
.end method

.method static synthetic access$1002(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;J)J
    .locals 0

    .line 37
    iput-wide p1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mProgress:J

    return-wide p1
.end method

.method static synthetic access$1100(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;)J
    .locals 2

    .line 37
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->updateBlockProgress()J

    move-result-wide v0

    return-wide v0
.end method

.method static synthetic access$200(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;)V
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->quitLooper()V

    return-void
.end method

.method static synthetic access$300(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mCancelNum:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method

.method static synthetic access$400(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mFailNum:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method

.method static synthetic access$500(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;)Lcom/arialyy/aria/core/listener/IEventListener;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mListener:Lcom/arialyy/aria/core/listener/IEventListener;

    return-object p0
.end method

.method static synthetic access$600(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mCompleteNum:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method

.method static synthetic access$700(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;)Ljava/lang/String;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->TAG:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$800(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;)Lcom/arialyy/aria/core/TaskRecord;
    .locals 0

    .line 37
    iget-object p0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    return-object p0
.end method

.method static synthetic access$900(Lcom/arialyy/aria/core/loader/NormalThreadStateManager;)Z
    .locals 0

    .line 37
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mergeFile()Z

    move-result p0

    return p0
.end method

.method private checkLooper()V
    .locals 2

    .line 67
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    const-string v1, "\u4efb\u52a1\u8bb0\u5f55\u4e3a\u7a7a"

    .line 68
    invoke-static {v0, v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mLooper:Landroid/os/Looper;

    const-string v1, "Looper\u4e3a\u7a7a"

    .line 71
    invoke-static {v0, v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    return-void
.end method

.method private mergeFile()Z
    .locals 9

    .line 250
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget v0, v0, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    const-string v1, "%s.%s.part"

    const/4 v2, 0x2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-ne v0, v3, :cond_0

    .line 251
    new-instance v0, Ljava/io/File;

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v5, v5, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    aput-object v5, v2, v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 252
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v2, v2, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    return v0

    .line 255
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 256
    iget-object v5, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget v5, v5, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    move v6, v4

    :goto_0
    if-ge v6, v5, :cond_1

    new-array v7, v2, [Ljava/lang/Object;

    .line 257
    iget-object v8, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v8, v8, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    aput-object v8, v7, v4

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v3

    invoke-static {v1, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 259
    :cond_1
    iget-object v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v1, v1, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    invoke-static {v1, v0}, Lcom/arialyy/aria/util/FileUtil;->mergeFile(Ljava/lang/String;Ljava/util/List;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 261
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 262
    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/lang/String;)Z

    goto :goto_1

    .line 264
    :cond_2
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v1, v1, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 265
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v5

    iget-object v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-wide v7, v1, Lcom/arialyy/aria/core/TaskRecord;->fileLength:J

    cmp-long v1, v5, v7

    if-lez v1, :cond_3

    .line 266
    iget-object v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->TAG:Ljava/lang/String;

    const/4 v5, 0x3

    new-array v5, v5, [Ljava/lang/Object;

    .line 267
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v4

    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v5, v3

    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-wide v6, v0, Lcom/arialyy/aria/core/TaskRecord;->fileLength:J

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    aput-object v0, v5, v2

    const-string v0, "\u4efb\u52a1\u3010%s\u3011\u5206\u5757\u6587\u4ef6\u5408\u5e76\u5931\u8d25\uff0c\u4e0b\u8f7d\u957f\u5ea6\u8d85\u51fa\u6587\u4ef6\u771f\u5b9e\u957f\u5ea6\uff0cdownloadLen: %s\uff0cfileSize: %s"

    .line 266
    invoke-static {v0, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v4

    :cond_3
    return v3

    .line 272
    :cond_4
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->TAG:Ljava/lang/String;

    const-string v1, "\u5408\u5e76\u5931\u8d25"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v4
.end method

.method private mergerSFtp()Z
    .locals 9

    .line 228
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget v0, v0, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    const/4 v1, 0x2

    const-string v2, "%s.%s.part"

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-ne v0, v4, :cond_0

    .line 229
    new-instance v0, Ljava/io/File;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v5, v5, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    aput-object v5, v1, v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v1, v4

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 230
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v2, v2, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v0

    return v0

    .line 233
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 234
    iget-object v5, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget v5, v5, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    move v6, v3

    :goto_0
    if-ge v6, v5, :cond_1

    new-array v7, v1, [Ljava/lang/Object;

    .line 235
    iget-object v8, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v8, v8, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    aput-object v8, v7, v3

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    aput-object v8, v7, v4

    invoke-static {v2, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v6, v6, 0x1

    goto :goto_0

    .line 237
    :cond_1
    iget-object v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v1, v1, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    iget-object v2, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-wide v2, v2, Lcom/arialyy/aria/core/TaskRecord;->fileLength:J

    invoke-static {v1, v0, v2, v3}, Lcom/arialyy/aria/util/FileUtil;->mergeSFtpFile(Ljava/lang/String;Ljava/util/List;J)Z

    .line 238
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 239
    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/lang/String;)Z

    goto :goto_1

    :cond_2
    return v4
.end method

.method private quitLooper()V
    .locals 1

    .line 149
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mLooper:Landroid/os/Looper;

    invoke-virtual {v0}, Landroid/os/Looper;->quit()V

    return-void
.end method

.method private updateBlockProgress()J
    .locals 9

    .line 215
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v0, v0, Lcom/arialyy/aria/core/TaskRecord;->threadRecords:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    const-wide/16 v2, 0x0

    move v4, v1

    :goto_0
    if-ge v4, v0, :cond_1

    .line 216
    new-instance v5, Ljava/io/File;

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    iget-object v7, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    iget-object v7, v7, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    aput-object v7, v6, v1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    const/4 v8, 0x1

    aput-object v7, v6, v8

    const-string v7, "%s.%s.part"

    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 217
    invoke-virtual {v5}, Ljava/io/File;->exists()Z

    move-result v6

    if-eqz v6, :cond_0

    .line 218
    invoke-virtual {v5}, Ljava/io/File;->length()J

    move-result-wide v5

    add-long/2addr v2, v5

    :cond_0
    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_1
    return-wide v2
.end method


# virtual methods
.method public accept(Lcom/arialyy/aria/core/loader/ILoaderVisitor;)V
    .locals 0

    .line 278
    invoke-interface {p1, p0}, Lcom/arialyy/aria/core/loader/ILoaderVisitor;->addComponent(Lcom/arialyy/aria/core/inf/IThreadStateManager;)V

    return-void
.end method

.method public getCurrentProgress()J
    .locals 2

    .line 159
    iget-wide v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mProgress:J

    return-wide v0
.end method

.method public getHandlerCallback()Landroid/os/Handler$Callback;
    .locals 1

    .line 163
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->callback:Landroid/os/Handler$Callback;

    return-object v0
.end method

.method public isCancel()Z
    .locals 2

    .line 207
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mCancelNum:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mThreadNum:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isComplete()Z
    .locals 2

    .line 197
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mCompleteNum:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mThreadNum:I

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isFail()Z
    .locals 2

    .line 184
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mCompleteNum:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mThreadNum:I

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mFailNum:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 185
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mThreadNum:I

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mFailNum:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget-object v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mCompleteNum:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mThreadNum:I

    if-ne v0, v1, :cond_1

    :cond_0
    const/4 v0, 0x1

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    return v0
.end method

.method public isStop()Z
    .locals 2

    .line 173
    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mStopNum:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mThreadNum:I

    if-eq v0, v1, :cond_1

    iget-object v0, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mStopNum:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    iget-object v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mCompleteNum:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v1

    add-int/2addr v0, v1

    iget v1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mThreadNum:I

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 v0, 0x1

    :goto_1
    return v0
.end method

.method public setLooper(Lcom/arialyy/aria/core/TaskRecord;Landroid/os/Looper;)V
    .locals 0

    .line 61
    iput-object p1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mTaskRecord:Lcom/arialyy/aria/core/TaskRecord;

    .line 62
    iget p1, p1, Lcom/arialyy/aria/core/TaskRecord;->threadNum:I

    iput p1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mThreadNum:I

    .line 63
    iput-object p2, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mLooper:Landroid/os/Looper;

    return-void
.end method

.method public updateCurrentProgress(J)V
    .locals 0

    .line 142
    iput-wide p1, p0, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;->mProgress:J

    return-void
.end method
