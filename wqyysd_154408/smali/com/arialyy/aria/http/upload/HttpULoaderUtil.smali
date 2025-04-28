.class public final Lcom/arialyy/aria/http/upload/HttpULoaderUtil;
.super Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;
.source "HttpULoaderUtil.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/AbsNormalLoaderUtil;-><init>()V

    return-void
.end method


# virtual methods
.method public BuildLoaderStructure()Lcom/arialyy/aria/core/loader/LoaderStructure;
    .locals 5

    .line 46
    new-instance v0, Lcom/arialyy/aria/core/loader/LoaderStructure;

    invoke-direct {v0}, Lcom/arialyy/aria/core/loader/LoaderStructure;-><init>()V

    .line 47
    new-instance v1, Lcom/arialyy/aria/http/HttpRecordHandler;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpULoaderUtil;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/arialyy/aria/http/HttpRecordHandler;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/loader/LoaderStructure;->addComponent(Lcom/arialyy/aria/core/loader/ILoaderComponent;)Lcom/arialyy/aria/core/loader/LoaderStructure;

    move-result-object v1

    new-instance v2, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;

    .line 48
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpULoaderUtil;->getListener()Lcom/arialyy/aria/core/listener/IEventListener;

    move-result-object v3

    invoke-direct {v2, v3}, Lcom/arialyy/aria/core/loader/NormalThreadStateManager;-><init>(Lcom/arialyy/aria/core/listener/IEventListener;)V

    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/loader/LoaderStructure;->addComponent(Lcom/arialyy/aria/core/loader/ILoaderComponent;)Lcom/arialyy/aria/core/loader/LoaderStructure;

    move-result-object v1

    new-instance v2, Lcom/arialyy/aria/core/loader/NormalTTBuilder;

    .line 49
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpULoaderUtil;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v3

    new-instance v4, Lcom/arialyy/aria/http/upload/HttpULoaderUtil$1;

    invoke-direct {v4, p0}, Lcom/arialyy/aria/http/upload/HttpULoaderUtil$1;-><init>(Lcom/arialyy/aria/http/upload/HttpULoaderUtil;)V

    invoke-direct {v2, v3, v4}, Lcom/arialyy/aria/core/loader/NormalTTBuilder;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;)V

    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/loader/LoaderStructure;->addComponent(Lcom/arialyy/aria/core/loader/ILoaderComponent;)Lcom/arialyy/aria/core/loader/LoaderStructure;

    .line 58
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpULoaderUtil;->getLoader()Lcom/arialyy/aria/core/loader/AbsNormalLoader;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/loader/LoaderStructure;->accept(Lcom/arialyy/aria/core/loader/ILoaderVisitor;)V

    return-object v0
.end method

.method public getLoader()Lcom/arialyy/aria/core/loader/AbsNormalLoader;
    .locals 3

    .line 38
    iget-object v0, p0, Lcom/arialyy/aria/http/upload/HttpULoaderUtil;->mLoader:Lcom/arialyy/aria/core/loader/AbsNormalLoader;

    if-nez v0, :cond_0

    .line 39
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpULoaderUtil;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    const-class v1, Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->generateTaskOption(Ljava/lang/Class;)V

    .line 40
    new-instance v0, Lcom/arialyy/aria/http/upload/HttpULoader;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpULoaderUtil;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpULoaderUtil;->getListener()Lcom/arialyy/aria/core/listener/IEventListener;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/arialyy/aria/http/upload/HttpULoader;-><init>(Lcom/arialyy/aria/core/upload/UTaskWrapper;Lcom/arialyy/aria/core/listener/IEventListener;)V

    iput-object v0, p0, Lcom/arialyy/aria/http/upload/HttpULoaderUtil;->mLoader:Lcom/arialyy/aria/core/loader/AbsNormalLoader;

    .line 42
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/http/upload/HttpULoaderUtil;->mLoader:Lcom/arialyy/aria/core/loader/AbsNormalLoader;

    return-object v0
.end method
