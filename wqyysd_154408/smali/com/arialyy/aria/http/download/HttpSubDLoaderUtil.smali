.class final Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;
.super Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;
.source "HttpSubDLoaderUtil.java"


# direct methods
.method constructor <init>(Landroid/os/Handler;ZLjava/lang/String;)V
    .locals 0

    .line 37
    invoke-direct {p0, p1, p2, p3}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;-><init>(Landroid/os/Handler;ZLjava/lang/String;)V

    return-void
.end method


# virtual methods
.method protected buildLoaderStructure()Lcom/arialyy/aria/core/loader/LoaderStructure;
    .locals 5

    .line 50
    new-instance v0, Lcom/arialyy/aria/core/loader/LoaderStructure;

    invoke-direct {v0}, Lcom/arialyy/aria/core/loader/LoaderStructure;-><init>()V

    .line 51
    new-instance v1, Lcom/arialyy/aria/core/group/SubRecordHandler;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->getWrapper()Lcom/arialyy/aria/core/download/DTaskWrapper;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/arialyy/aria/core/group/SubRecordHandler;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/loader/LoaderStructure;->addComponent(Lcom/arialyy/aria/core/loader/ILoaderComponent;)Lcom/arialyy/aria/core/loader/LoaderStructure;

    move-result-object v1

    new-instance v2, Lcom/arialyy/aria/core/loader/GroupSubThreadStateManager;

    .line 52
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->getSchedulers()Landroid/os/Handler;

    move-result-object v3

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->getKey()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lcom/arialyy/aria/core/loader/GroupSubThreadStateManager;-><init>(Landroid/os/Handler;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/loader/LoaderStructure;->addComponent(Lcom/arialyy/aria/core/loader/ILoaderComponent;)Lcom/arialyy/aria/core/loader/LoaderStructure;

    move-result-object v1

    new-instance v2, Lcom/arialyy/aria/core/loader/NormalTTBuilder;

    .line 53
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->getWrapper()Lcom/arialyy/aria/core/download/DTaskWrapper;

    move-result-object v3

    new-instance v4, Lcom/arialyy/aria/http/download/HttpDTTBuilderAdapter;

    invoke-direct {v4}, Lcom/arialyy/aria/http/download/HttpDTTBuilderAdapter;-><init>()V

    invoke-direct {v2, v3, v4}, Lcom/arialyy/aria/core/loader/NormalTTBuilder;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;)V

    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/loader/LoaderStructure;->addComponent(Lcom/arialyy/aria/core/loader/ILoaderComponent;)Lcom/arialyy/aria/core/loader/LoaderStructure;

    move-result-object v1

    new-instance v2, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;

    .line 54
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->getWrapper()Lcom/arialyy/aria/core/download/DTaskWrapper;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;-><init>(Lcom/arialyy/aria/core/download/DTaskWrapper;)V

    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/loader/LoaderStructure;->addComponent(Lcom/arialyy/aria/core/loader/ILoaderComponent;)Lcom/arialyy/aria/core/loader/LoaderStructure;

    .line 55
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->getLoader()Lcom/arialyy/aria/core/loader/SubLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/loader/LoaderStructure;->accept(Lcom/arialyy/aria/core/loader/ILoaderVisitor;)V

    return-object v0
.end method

.method protected getLoader()Lcom/arialyy/aria/core/loader/SubLoader;
    .locals 3

    .line 41
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    if-nez v0, :cond_0

    .line 42
    new-instance v0, Lcom/arialyy/aria/core/loader/SubLoader;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->getWrapper()Lcom/arialyy/aria/core/download/DTaskWrapper;

    move-result-object v1

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->getSchedulers()Landroid/os/Handler;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/arialyy/aria/core/loader/SubLoader;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Landroid/os/Handler;)V

    iput-object v0, p0, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    .line 43
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->isNeedGetInfo()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/loader/SubLoader;->setNeedGetInfo(Z)V

    .line 44
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->getParentKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/loader/SubLoader;->setParentKey(Ljava/lang/String;)V

    .line 46
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpSubDLoaderUtil;->mDLoader:Lcom/arialyy/aria/core/loader/SubLoader;

    return-object v0
.end method
