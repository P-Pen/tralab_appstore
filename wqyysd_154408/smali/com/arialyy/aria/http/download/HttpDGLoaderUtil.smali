.class public final Lcom/arialyy/aria/http/download/HttpDGLoaderUtil;
.super Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;
.source "HttpDGLoaderUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 29
    invoke-direct {p0}, Lcom/arialyy/aria/core/group/AbsGroupLoaderUtil;-><init>()V

    return-void
.end method


# virtual methods
.method protected buildLoaderStructure()Lcom/arialyy/aria/core/loader/LoaderStructure;
    .locals 4

    .line 40
    new-instance v0, Lcom/arialyy/aria/core/loader/LoaderStructure;

    invoke-direct {v0}, Lcom/arialyy/aria/core/loader/LoaderStructure;-><init>()V

    .line 41
    new-instance v1, Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDGLoaderUtil;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/download/DGTaskWrapper;

    .line 42
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDGLoaderUtil;->getListener()Lcom/arialyy/aria/core/listener/IEventListener;

    move-result-object v3

    check-cast v3, Lcom/arialyy/aria/core/listener/DownloadGroupListener;

    invoke-direct {v1, v2, v3}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;-><init>(Lcom/arialyy/aria/core/download/DGTaskWrapper;Lcom/arialyy/aria/core/listener/DownloadGroupListener;)V

    .line 41
    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/loader/LoaderStructure;->addComponent(Lcom/arialyy/aria/core/loader/ILoaderComponent;)Lcom/arialyy/aria/core/loader/LoaderStructure;

    .line 43
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDGLoaderUtil;->getLoader()Lcom/arialyy/aria/core/group/AbsGroupLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/loader/LoaderStructure;->accept(Lcom/arialyy/aria/core/loader/ILoaderVisitor;)V

    return-object v0
.end method

.method protected getLoader()Lcom/arialyy/aria/core/group/AbsGroupLoader;
    .locals 3

    .line 32
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDGLoaderUtil;->mLoader:Lcom/arialyy/aria/core/group/AbsGroupLoader;

    if-nez v0, :cond_0

    .line 33
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDGLoaderUtil;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    const-class v1, Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->generateTaskOption(Ljava/lang/Class;)V

    .line 34
    new-instance v0, Lcom/arialyy/aria/http/download/HttpDGLoader;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDGLoaderUtil;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDGLoaderUtil;->getListener()Lcom/arialyy/aria/core/listener/IEventListener;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/listener/DownloadGroupListener;

    invoke-direct {v0, v1, v2}, Lcom/arialyy/aria/http/download/HttpDGLoader;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/listener/DownloadGroupListener;)V

    iput-object v0, p0, Lcom/arialyy/aria/http/download/HttpDGLoaderUtil;->mLoader:Lcom/arialyy/aria/core/group/AbsGroupLoader;

    .line 36
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDGLoaderUtil;->mLoader:Lcom/arialyy/aria/core/group/AbsGroupLoader;

    return-object v0
.end method
