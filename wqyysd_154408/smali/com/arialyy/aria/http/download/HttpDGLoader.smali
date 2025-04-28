.class final Lcom/arialyy/aria/http/download/HttpDGLoader;
.super Lcom/arialyy/aria/core/group/AbsGroupLoader;
.source "HttpDGLoader.java"


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/listener/DownloadGroupListener;)V
    .locals 0

    .line 36
    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/core/group/AbsGroupLoader;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/listener/IEventListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/arialyy/aria/http/download/HttpDGLoader;)V
    .locals 0

    .line 34
    invoke-direct {p0}, Lcom/arialyy/aria/http/download/HttpDGLoader;->startSub()V

    return-void
.end method

.method static synthetic access$100(Lcom/arialyy/aria/http/download/HttpDGLoader;Lcom/arialyy/aria/exception/AriaException;Z)V
    .locals 0

    .line 34
    invoke-virtual {p0, p1, p2}, Lcom/arialyy/aria/http/download/HttpDGLoader;->fail(Lcom/arialyy/aria/exception/AriaException;Z)V

    return-void
.end method

.method private startSub()V
    .locals 6

    .line 54
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDGLoader;->isBreak()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 57
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDGLoader;->onPostStart()V

    .line 58
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDGLoader;->getWrapper()Lcom/arialyy/aria/core/download/DGTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->getSubTaskWrapper()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    .line 59
    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 61
    invoke-virtual {v2}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFileSize()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-gez v2, :cond_1

    const/4 v2, 0x1

    goto :goto_1

    :cond_1
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {p0, v1, v2}, Lcom/arialyy/aria/http/download/HttpDGLoader;->createSubLoader(Lcom/arialyy/aria/core/download/DTaskWrapper;Z)Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/arialyy/aria/http/download/HttpDGLoader;->startSubLoader(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    goto :goto_0

    :cond_2
    return-void
.end method


# virtual methods
.method public addComponent(Lcom/arialyy/aria/core/loader/IInfoTask;)V
    .locals 1

    .line 66
    iput-object p1, p0, Lcom/arialyy/aria/http/download/HttpDGLoader;->mInfoTask:Lcom/arialyy/aria/core/loader/IInfoTask;

    .line 67
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDGLoader;->mInfoTask:Lcom/arialyy/aria/core/loader/IInfoTask;

    new-instance v0, Lcom/arialyy/aria/http/download/HttpDGLoader$1;

    invoke-direct {v0, p0}, Lcom/arialyy/aria/http/download/HttpDGLoader$1;-><init>(Lcom/arialyy/aria/http/download/HttpDGLoader;)V

    invoke-interface {p1, v0}, Lcom/arialyy/aria/core/loader/IInfoTask;->setCallback(Lcom/arialyy/aria/core/loader/IInfoTask$Callback;)V

    return-void
.end method

.method protected createSubLoader(Lcom/arialyy/aria/core/download/DTaskWrapper;Z)Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;
    .locals 3

    .line 48
    new-instance v0, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDGLoader;->getScheduler()Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDGLoader;->getKey()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, p2, v2}, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;-><init>(Landroid/os/Handler;ZLjava/lang/String;)V

    const/4 p2, 0x0

    .line 49
    invoke-virtual {v0, p1, p2}, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->setParams(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/listener/IEventListener;)Lcom/arialyy/aria/core/inf/IUtil;

    return-object v0
.end method

.method protected handlerTask(Landroid/os/Looper;)V
    .locals 0

    .line 40
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDGLoader;->isBreak()Z

    move-result p1

    if-eqz p1, :cond_0

    return-void

    .line 43
    :cond_0
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDGLoader;->mInfoTask:Lcom/arialyy/aria/core/loader/IInfoTask;

    invoke-interface {p1}, Lcom/arialyy/aria/core/loader/IInfoTask;->run()V

    return-void
.end method
