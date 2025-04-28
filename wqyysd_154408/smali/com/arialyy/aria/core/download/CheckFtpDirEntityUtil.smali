.class public Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;
.super Ljava/lang/Object;
.source "CheckFtpDirEntityUtil.java"

# interfaces
.implements Lcom/arialyy/aria/core/inf/ICheckEntityUtil;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field private final TAG:Ljava/lang/String;

.field private action:I

.field private mEntity:Lcom/arialyy/aria/core/download/DownloadGroupEntity;

.field private mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Lcom/arialyy/aria/core/download/DGTaskWrapper;I)V
    .locals 1

    .line 36
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-string v0, "CheckFtpDirEntityUtil"

    .line 27
    iput-object v0, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->TAG:Ljava/lang/String;

    .line 37
    iput p2, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->action:I

    .line 38
    iput-object p1, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;

    .line 39
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    iput-object p1, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    return-void
.end method

.method private checkDirPath()Z
    .locals 6

    .line 48
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->getDirPathTemp()Ljava/lang/String;

    move-result-object v0

    .line 49
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v2, "CheckFtpDirEntityUtil"

    const/4 v3, 0x0

    if-eqz v1, :cond_0

    const-string v0, "\u6587\u4ef6\u5939\u8def\u5f84\u4e0d\u80fd\u4e3anull"

    .line 50
    invoke-static {v2, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :cond_0
    const-string v1, "/"

    .line 53
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const/4 v4, 0x1

    if-nez v1, :cond_1

    new-array v1, v4, [Ljava/lang/Object;

    aput-object v0, v1, v3

    const-string v0, "\u6587\u4ef6\u5939\u8def\u5f84\u3010%s\u3011\u9519\u8bef"

    .line 54
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    .line 57
    :cond_1
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 58
    invoke-virtual {v1}, Ljava/io/File;->isFile()Z

    move-result v5

    if-eqz v5, :cond_2

    new-array v1, v4, [Ljava/lang/Object;

    aput-object v0, v1, v3

    const-string v0, "\u8def\u5f84\u3010%s\u3011\u662f\u6587\u4ef6\uff0c\u8bf7\u8bbe\u7f6e\u6587\u4ef6\u5939\u8def\u5f84"

    .line 59
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    .line 64
    :cond_2
    iget-object v5, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;

    invoke-virtual {v5}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->isNewTask()Z

    move-result v5

    if-eqz v5, :cond_3

    iget-object v5, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;

    invoke-virtual {v5}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->isIgnoreFilePathOccupy()Z

    move-result v5

    invoke-static {v5, v0}, Lcom/arialyy/aria/util/CheckUtil;->checkDGPathConflicts(ZLjava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_3

    return v3

    .line 69
    :cond_3
    iget-object v5, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    invoke-virtual {v5}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getDirPath()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-nez v5, :cond_4

    iget-object v5, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    invoke-virtual {v5}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getDirPath()Ljava/lang/String;

    move-result-object v5

    .line 70
    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_6

    .line 71
    :cond_4
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v5

    if-nez v5, :cond_5

    .line 72
    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    .line 74
    :cond_5
    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    invoke-virtual {v1, v0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->setDirPath(Ljava/lang/String;)V

    new-array v1, v4, [Ljava/lang/Object;

    aput-object v0, v1, v3

    const-string v0, "\u6587\u4ef6\u5939\u8def\u5f84\u6539\u53d8\uff0c\u5c06\u66f4\u65b0\u6587\u4ef6\u5939\u8def\u5f84\u4e3a\uff1a%s"

    .line 75
    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    return v4
.end method

.method private checkUrl()Z
    .locals 6

    .line 113
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->getKey()Ljava/lang/String;

    move-result-object v0

    .line 114
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    const-string v3, "CheckFtpDirEntityUtil"

    if-eqz v1, :cond_0

    const-string v0, "\u4e0b\u8f7d\u5931\u8d25\uff0curl\u4e3anull"

    .line 115
    invoke-static {v3, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_0
    const-string v1, "ftp"

    .line 117
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const-string v4, "\u4e0b\u8f7d\u5931\u8d25\uff0curl\u3010"

    if-nez v1, :cond_1

    .line 118
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u3011\u9519\u8bef"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_1
    const-string v1, "://"

    .line 121
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v5, -0x1

    if-ne v1, v5, :cond_2

    .line 123
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u3011\u4e0d\u5408\u6cd5"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v3, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_2
    const/4 v0, 0x1

    return v0
.end method

.method public static newInstance(Lcom/arialyy/aria/core/download/DGTaskWrapper;I)Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;
    .locals 1

    .line 33
    new-instance v0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;

    invoke-direct {v0, p0, p1}, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;-><init>(Lcom/arialyy/aria/core/download/DGTaskWrapper;I)V

    return-object v0
.end method


# virtual methods
.method public checkEntity()Z
    .locals 5

    .line 82
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->getErrorEvent()Lcom/arialyy/aria/core/event/ErrorEvent;

    move-result-object v0

    const/4 v1, 0x1

    const-string v2, "CheckFtpDirEntityUtil"

    const/4 v3, 0x0

    if-eqz v0, :cond_0

    new-array v0, v1, [Ljava/lang/Object;

    .line 83
    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->getErrorEvent()Lcom/arialyy/aria/core/event/ErrorEvent;

    move-result-object v1

    iget-object v1, v1, Lcom/arialyy/aria/core/event/ErrorEvent;->errorMsg:Ljava/lang/String;

    aput-object v1, v0, v3

    const-string v1, "\u4efb\u52a1\u64cd\u4f5c\u5931\u8d25\uff0c%s"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    .line 87
    :cond_0
    invoke-direct {p0}, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->checkDirPath()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->checkUrl()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    move v1, v3

    :goto_0
    if-eqz v1, :cond_2

    .line 89
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadGroupEntity;->save()V

    .line 91
    :cond_2
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckFtpDirEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DGTaskWrapper;

    .line 92
    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    const-string v4, "urlEntity"

    invoke-virtual {v0, v4}, Lcom/arialyy/aria/core/TaskOptionParams;->getParam(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/FtpUrlEntity;

    .line 94
    iget-boolean v4, v0, Lcom/arialyy/aria/core/FtpUrlEntity;->isFtps:Z

    if-eqz v4, :cond_4

    .line 95
    iget-object v4, v0, Lcom/arialyy/aria/core/FtpUrlEntity;->idEntity:Lcom/arialyy/aria/core/IdEntity;

    iget-object v4, v4, Lcom/arialyy/aria/core/IdEntity;->storePath:Ljava/lang/String;

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_3

    const-string v0, "\u8bc1\u4e66\u8def\u5f84\u4e3a\u7a7a"

    .line 96
    invoke-static {v2, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    .line 99
    :cond_3
    iget-object v0, v0, Lcom/arialyy/aria/core/FtpUrlEntity;->idEntity:Lcom/arialyy/aria/core/IdEntity;

    iget-object v0, v0, Lcom/arialyy/aria/core/IdEntity;->keyAlias:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "\u8bc1\u4e66\u522b\u540d\u4e3a\u7a7a"

    .line 100
    invoke-static {v2, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :cond_4
    return v1
.end method
