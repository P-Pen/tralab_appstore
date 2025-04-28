.class public Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;
.super Lcom/arialyy/aria/core/common/AbsBuilderTarget;
.source "HttpBuilderTarget.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/arialyy/aria/core/common/AbsBuilderTarget<",
        "Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;",
        ">;"
    }
.end annotation


# instance fields
.field private mConfigHandler:Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler<",
            "Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 30
    invoke-direct {p0}, Lcom/arialyy/aria/core/common/AbsBuilderTarget;-><init>()V

    .line 31
    new-instance v0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;

    const-wide/16 v1, -0x1

    invoke-direct {v0, p0, v1, v2}, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;-><init>(Lcom/arialyy/aria/core/inf/AbsTarget;J)V

    iput-object v0, p0, Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;

    .line 32
    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->setFilePath(Ljava/lang/String;)V

    .line 34
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setSupportBP(Z)V

    .line 35
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 v0, 0x5

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setRequestType(I)V

    .line 36
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/upload/UploadEntity;

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/upload/UploadEntity;->setTaskType(I)V

    .line 37
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setNewTask(Z)V

    return-void
.end method


# virtual methods
.method public forceUpload()Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 69
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setIgnoreFilePathOccupy(Z)V

    return-object p0
.end method

.method public option(Lcom/arialyy/aria/core/common/HttpOption;)Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;
    .locals 1

    const-string v0, "\u4efb\u52a1\u914d\u7f6e\u4e3a\u7a7a"

    .line 56
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 58
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Lcom/arialyy/aria/core/common/BaseOption;)V

    return-object p0
.end method

.method public setUploadUrl(Ljava/lang/String;)Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;
    .locals 1

    .line 46
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->setTempUrl(Ljava/lang/String;)V

    return-object p0
.end method
