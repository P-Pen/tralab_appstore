.class public Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;
.super Lcom/arialyy/aria/core/common/AbsBuilderTarget;
.source "HttpBuilderTarget.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/arialyy/aria/core/common/AbsBuilderTarget<",
        "Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;",
        ">;"
    }
.end annotation


# instance fields
.field private mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/arialyy/aria/core/download/target/DNormalConfigHandler<",
            "Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 31
    invoke-direct {p0}, Lcom/arialyy/aria/core/common/AbsBuilderTarget;-><init>()V

    .line 32
    new-instance v0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    const-wide/16 v1, -0x1

    invoke-direct {v0, p0, v1, v2}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;-><init>(Lcom/arialyy/aria/core/inf/AbsTarget;J)V

    iput-object v0, p0, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    .line 33
    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->setUrl(Ljava/lang/String;)V

    .line 34
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setRequestType(I)V

    .line 35
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setNewTask(Z)V

    .line 36
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->setTaskType(I)V

    return-void
.end method


# virtual methods
.method public m3u8LiveOption(Lcom/arialyy/aria/core/download/m3u8/M3U8LiveOption;)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;
    .locals 2

    const-string v0, "m3u8\u4efb\u52a1\u8bbe\u7f6e\u4e3a\u7a7a"

    .line 51
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 53
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setRequestType(I)V

    .line 54
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getM3U8Params()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Lcom/arialyy/aria/core/common/BaseOption;)V

    return-object p0
.end method

.method public m3u8VodOption(Lcom/arialyy/aria/core/download/m3u8/M3U8VodOption;)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;
    .locals 3

    const-string v0, "m3u8\u4efb\u52a1\u8bbe\u7f6e\u4e3a\u7a7a"

    .line 41
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 43
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    const/4 v1, 0x7

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setRequestType(I)V

    .line 44
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/m3u8/M3U8VodOption;->getFileSize()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/arialyy/aria/core/common/AbsEntity;->setFileSize(J)V

    .line 45
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getM3U8Params()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Lcom/arialyy/aria/core/common/BaseOption;)V

    return-object p0
.end method

.method public option(Lcom/arialyy/aria/core/common/HttpOption;)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;
    .locals 1

    const-string v0, "\u4efb\u52a1\u914d\u7f6e\u4e3a\u7a7a"

    .line 63
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 65
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Lcom/arialyy/aria/core/common/BaseOption;)V

    return-object p0
.end method

.method public setFilePath(Ljava/lang/String;)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;
    .locals 1

    .line 77
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->setTempFilePath(Ljava/lang/String;)V

    return-object p0
.end method

.method public setFilePath(Ljava/lang/String;Z)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->setTempFilePath(Ljava/lang/String;)V

    .line 93
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->setForceDownload(Z)V

    return-object p0
.end method
