.class public Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;
.super Lcom/arialyy/aria/core/common/AbsNormalTarget;
.source "FtpNormalTarget.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/arialyy/aria/core/common/AbsNormalTarget<",
        "Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;",
        ">;"
    }
.end annotation


# instance fields
.field private mConfigHandler:Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler<",
            "Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;",
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
    new-instance v0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;

    invoke-direct {v0, p0, p1, p2}, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;-><init>(Lcom/arialyy/aria/core/inf/AbsTarget;J)V

    iput-object v0, p0, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;->mConfigHandler:Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;

    .line 34
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 p2, 0x6

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setRequestType(I)V

    .line 35
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setNewTask(Z)V

    return-void
.end method


# virtual methods
.method public bridge synthetic getEntity()Lcom/arialyy/aria/core/common/AbsEntity;
    .locals 1

    .line 29
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;->getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;

    move-result-object v0

    return-object v0
.end method

.method public getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;
    .locals 1

    .line 65
    invoke-super {p0}, Lcom/arialyy/aria/core/common/AbsNormalTarget;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    return-object v0
.end method

.method public isRunning()Z
    .locals 1

    .line 69
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;->mConfigHandler:Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->isRunning()Z

    move-result v0

    return v0
.end method

.method public option(Lcom/arialyy/aria/core/common/FtpOption;)Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;
    .locals 1

    const-string v0, "ftp \u4efb\u52a1\u914d\u7f6e\u4e3a\u7a7a"

    .line 43
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 45
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;->getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/upload/UploadEntity;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getFtpUrlInfo(Ljava/lang/String;)Lcom/arialyy/aria/core/FtpUrlEntity;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/common/FtpOption;->setUrlEntity(Lcom/arialyy/aria/core/FtpUrlEntity;)V

    .line 46
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Lcom/arialyy/aria/core/common/BaseOption;)V

    return-object p0
.end method

.method public sftpOption(Lcom/arialyy/aria/core/common/SFtpOption;)Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;
    .locals 1

    const-string v0, "ftp \u4efb\u52a1\u914d\u7f6e\u4e3a\u7a7a"

    .line 55
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 57
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;->getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/upload/UploadEntity;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getFtpUrlInfo(Ljava/lang/String;)Lcom/arialyy/aria/core/FtpUrlEntity;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/common/SFtpOption;->setUrlEntity(Lcom/arialyy/aria/core/FtpUrlEntity;)V

    .line 58
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Lcom/arialyy/aria/core/common/BaseOption;)V

    .line 59
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;->getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;

    move-result-object p1

    const/16 v0, 0xd

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/upload/UploadEntity;->setTaskType(I)V

    .line 60
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setRequestType(I)V

    return-object p0
.end method

.method public taskExists()Z
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;->mConfigHandler:Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->taskExists()Z

    move-result v0

    return v0
.end method
