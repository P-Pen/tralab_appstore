.class public Lcom/arialyy/aria/core/download/target/FtpNormalTarget;
.super Lcom/arialyy/aria/core/common/AbsNormalTarget;
.source "FtpNormalTarget.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/arialyy/aria/core/common/AbsNormalTarget<",
        "Lcom/arialyy/aria/core/download/target/FtpNormalTarget;",
        ">;"
    }
.end annotation


# instance fields
.field private mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/arialyy/aria/core/download/target/DNormalConfigHandler<",
            "Lcom/arialyy/aria/core/download/target/FtpNormalTarget;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(J)V
    .locals 1

    .line 32
    invoke-direct {p0}, Lcom/arialyy/aria/core/common/AbsNormalTarget;-><init>()V

    .line 33
    new-instance v0, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-direct {v0, p0, p1, p2}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;-><init>(Lcom/arialyy/aria/core/inf/AbsTarget;J)V

    iput-object v0, p0, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    .line 34
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 p2, 0x3

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setRequestType(I)V

    .line 35
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setNewTask(Z)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getEntity()Lcom/arialyy/aria/core/common/AbsEntity;
    .locals 1

    .line 29
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v0

    return-object v0
.end method

.method public getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;
    .locals 1

    .line 93
    invoke-super {p0}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    return-object v0
.end method

.method public isRunning()Z
    .locals 1

    .line 85
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->isRunning()Z

    move-result v0

    return v0
.end method

.method public modifyFilePath(Ljava/lang/String;)Lcom/arialyy/aria/core/download/target/FtpNormalTarget;
    .locals 3

    .line 71
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->getUrl()Ljava/lang/String;

    move-result-object v0

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    .line 72
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v1

    iget-object v2, p0, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->getUrl()Ljava/lang/String;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {v2, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->setFileName(Ljava/lang/String;)V

    .line 73
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->setTempFilePath(Ljava/lang/String;)V

    return-object p0
.end method

.method public option(Lcom/arialyy/aria/core/common/FtpOption;)Lcom/arialyy/aria/core/download/target/FtpNormalTarget;
    .locals 1

    const-string v0, "ftp \u4efb\u52a1\u914d\u7f6e\u4e3a\u7a7a"

    .line 43
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 45
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getFtpUrlInfo(Ljava/lang/String;)Lcom/arialyy/aria/core/FtpUrlEntity;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/common/FtpOption;->setUrlEntity(Lcom/arialyy/aria/core/FtpUrlEntity;)V

    .line 46
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Lcom/arialyy/aria/core/common/BaseOption;)V

    return-object p0
.end method

.method public sftpOption(Lcom/arialyy/aria/core/common/SFtpOption;)Lcom/arialyy/aria/core/download/target/FtpNormalTarget;
    .locals 1

    const-string v0, "ftp \u4efb\u52a1\u914d\u7f6e\u4e3a\u7a7a"

    .line 55
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 57
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getFtpUrlInfo(Ljava/lang/String;)Lcom/arialyy/aria/core/FtpUrlEntity;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/common/SFtpOption;->setUrlEntity(Lcom/arialyy/aria/core/FtpUrlEntity;)V

    .line 58
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Lcom/arialyy/aria/core/common/BaseOption;)V

    .line 59
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p1

    const/16 v0, 0xc

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->setTaskType(I)V

    .line 60
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setRequestType(I)V

    return-object p0
.end method

.method public taskExists()Z
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->taskExists()Z

    move-result v0

    return v0
.end method

.method public updateUrl(Ljava/lang/String;)Lcom/arialyy/aria/core/download/target/FtpNormalTarget;
    .locals 1

    .line 81
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/target/DNormalConfigHandler;->updateUrl(Ljava/lang/String;)Lcom/arialyy/aria/core/inf/AbsTarget;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/download/target/FtpNormalTarget;

    return-object p1
.end method
