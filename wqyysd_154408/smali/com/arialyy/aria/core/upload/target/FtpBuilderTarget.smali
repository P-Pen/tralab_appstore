.class public Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;
.super Lcom/arialyy/aria/core/common/AbsBuilderTarget;
.source "FtpBuilderTarget.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/arialyy/aria/core/common/AbsBuilderTarget<",
        "Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;",
        ">;"
    }
.end annotation


# instance fields
.field private mConfigHandler:Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler<",
            "Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;",
            ">;"
        }
    .end annotation
.end field

.field private url:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .locals 3

    .line 33
    invoke-direct {p0}, Lcom/arialyy/aria/core/common/AbsBuilderTarget;-><init>()V

    .line 34
    new-instance v0, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;

    const-wide/16 v1, -0x1

    invoke-direct {v0, p0, v1, v2}, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;-><init>(Lcom/arialyy/aria/core/inf/AbsTarget;J)V

    iput-object v0, p0, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;

    .line 35
    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->setFilePath(Ljava/lang/String;)V

    .line 36
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 v0, 0x6

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setRequestType(I)V

    .line 37
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/upload/UploadEntity;

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/upload/UploadEntity;->setTaskType(I)V

    .line 38
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setNewTask(Z)V

    return-void
.end method


# virtual methods
.method public forceUpload()Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;
    .locals 2
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 59
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setIgnoreFilePathOccupy(Z)V

    return-object p0
.end method

.method public option(Lcom/arialyy/aria/core/common/FtpOption;)Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;
    .locals 1

    const-string v0, "ftp \u4efb\u52a1\u914d\u7f6e\u4e3a\u7a7a"

    .line 68
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 70
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;->url:Ljava/lang/String;

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getFtpUrlInfo(Ljava/lang/String;)Lcom/arialyy/aria/core/FtpUrlEntity;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/common/FtpOption;->setUrlEntity(Lcom/arialyy/aria/core/FtpUrlEntity;)V

    .line 71
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Lcom/arialyy/aria/core/common/BaseOption;)V

    return-object p0
.end method

.method public setUploadUrl(Ljava/lang/String;)Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;
    .locals 1

    .line 47
    iput-object p1, p0, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;->url:Ljava/lang/String;

    .line 48
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/upload/target/UNormalConfigHandler;->setTempUrl(Ljava/lang/String;)V

    return-object p0
.end method

.method public sftpOption(Lcom/arialyy/aria/core/common/SFtpOption;)Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;
    .locals 1

    const-string v0, "ftp \u4efb\u52a1\u914d\u7f6e\u4e3a\u7a7a"

    .line 80
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 82
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;->url:Ljava/lang/String;

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getFtpUrlInfo(Ljava/lang/String;)Lcom/arialyy/aria/core/FtpUrlEntity;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/common/SFtpOption;->setUrlEntity(Lcom/arialyy/aria/core/FtpUrlEntity;)V

    .line 83
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Lcom/arialyy/aria/core/common/BaseOption;)V

    .line 84
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/upload/UploadEntity;

    const/16 v0, 0xd

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/upload/UploadEntity;->setTaskType(I)V

    .line 85
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setRequestType(I)V

    return-object p0
.end method
