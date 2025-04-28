.class public Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;
.super Lcom/arialyy/aria/core/common/AbsBuilderTarget;
.source "FtpBuilderTarget.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/arialyy/aria/core/common/AbsBuilderTarget<",
        "Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;",
        ">;"
    }
.end annotation


# instance fields
.field private mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/arialyy/aria/core/download/target/DNormalConfigHandler<",
            "Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;",
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

    iput-object v0, p0, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    .line 33
    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->setUrl(Ljava/lang/String;)V

    .line 34
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setRequestType(I)V

    .line 35
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->setTaskType(I)V

    .line 36
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setNewTask(Z)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getEntity()Lcom/arialyy/aria/core/common/AbsEntity;
    .locals 1

    .line 28
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v0

    return-object v0
.end method

.method public getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;
    .locals 1

    .line 95
    invoke-super {p0}, Lcom/arialyy/aria/core/common/AbsBuilderTarget;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    return-object v0
.end method

.method public option(Lcom/arialyy/aria/core/common/FtpOption;)Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;
    .locals 1

    const-string v0, "ftp \u4efb\u52a1\u914d\u7f6e\u4e3a\u7a7a"

    .line 44
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 46
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getFtpUrlInfo(Ljava/lang/String;)Lcom/arialyy/aria/core/FtpUrlEntity;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/common/FtpOption;->setUrlEntity(Lcom/arialyy/aria/core/FtpUrlEntity;)V

    .line 47
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Lcom/arialyy/aria/core/common/BaseOption;)V

    return-object p0
.end method

.method public setFilePath(Ljava/lang/String;)Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;
    .locals 3

    .line 72
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->getUrl()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 73
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v1

    iget-object v2, p0, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->getUrl()Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->setFileName(Ljava/lang/String;)V

    .line 74
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->setTempFilePath(Ljava/lang/String;)V

    return-object p0
.end method

.method public setFilePath(Ljava/lang/String;Z)Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 89
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->setTempFilePath(Ljava/lang/String;)V

    .line 90
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->setForceDownload(Z)V

    return-object p0
.end method

.method public sftpOption(Lcom/arialyy/aria/core/common/SFtpOption;)Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;
    .locals 1

    const-string v0, "ftp \u4efb\u52a1\u914d\u7f6e\u4e3a\u7a7a"

    .line 56
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 58
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getFtpUrlInfo(Ljava/lang/String;)Lcom/arialyy/aria/core/FtpUrlEntity;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/common/SFtpOption;->setUrlEntity(Lcom/arialyy/aria/core/FtpUrlEntity;)V

    .line 59
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Lcom/arialyy/aria/core/common/BaseOption;)V

    .line 60
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p1

    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->setTaskType(I)V

    .line 61
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setRequestType(I)V

    return-object p0
.end method
