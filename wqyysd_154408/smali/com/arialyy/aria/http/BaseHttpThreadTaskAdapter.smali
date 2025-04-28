.class public abstract Lcom/arialyy/aria/http/BaseHttpThreadTaskAdapter;
.super Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;
.source "BaseHttpThreadTaskAdapter.java"


# instance fields
.field protected mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;


# direct methods
.method protected constructor <init>(Lcom/arialyy/aria/core/common/SubThreadConfig;)V
    .locals 0

    .line 30
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/task/AbsThreadTaskAdapter;-><init>(Lcom/arialyy/aria/core/common/SubThreadConfig;)V

    .line 31
    invoke-virtual {p0}, Lcom/arialyy/aria/http/BaseHttpThreadTaskAdapter;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getTaskOption()Lcom/arialyy/aria/core/inf/ITaskOption;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/http/HttpTaskOption;

    iput-object p1, p0, Lcom/arialyy/aria/http/BaseHttpThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    return-void
.end method


# virtual methods
.method protected getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;
    .locals 1

    .line 39
    invoke-virtual {p0}, Lcom/arialyy/aria/http/BaseHttpThreadTaskAdapter;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/common/AbsNormalEntity;

    return-object v0
.end method

.method protected getFileName()Ljava/lang/String;
    .locals 1

    .line 35
    invoke-virtual {p0}, Lcom/arialyy/aria/http/BaseHttpThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFileName()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
