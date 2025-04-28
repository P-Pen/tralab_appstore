.class public Lcom/arialyy/aria/core/download/CheckDEntityUtil;
.super Ljava/lang/Object;
.source "CheckDEntityUtil.java"

# interfaces
.implements Lcom/arialyy/aria/core/inf/ICheckEntityUtil;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private action:I

.field private mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

.field private mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;


# direct methods
.method private constructor <init>(Lcom/arialyy/aria/core/download/DTaskWrapper;I)V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 36
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    .line 46
    iput p2, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->action:I

    .line 47
    iput-object p1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    .line 48
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    iput-object p1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    return-void
.end method

.method private checkFilePath()Z
    .locals 5

    .line 109
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getTempFilePath()Ljava/lang/String;

    move-result-object v0

    .line 110
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 111
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    const-string v1, "\u4e0b\u8f7d\u5931\u8d25\uff0c\u6587\u4ef6\u4fdd\u5b58\u8def\u5f84\u4e3anull"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    .line 114
    :cond_0
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->canWrite(Ljava/lang/String;)Z

    move-result v1

    const/4 v3, 0x1

    if-nez v1, :cond_1

    .line 115
    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    const-string v0, "\u8def\u5f84\u3010%s\u3011\u4e0d\u53ef\u5199"

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_1
    const-string v1, "/"

    .line 118
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 119
    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    const-string v0, "\u4e0b\u8f7d\u5931\u8d25\uff0c\u6587\u4ef6\u4fdd\u5b58\u8def\u5f84\u3010%s\u3011\u9519\u8bef"

    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    .line 122
    :cond_2
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 123
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_5

    .line 124
    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getRequestType()I

    move-result v1

    if-eq v1, v3, :cond_4

    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    .line 125
    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getRequestType()I

    move-result v1

    const/4 v4, 0x7

    if-ne v1, v4, :cond_3

    goto :goto_0

    .line 129
    :cond_3
    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getRequestType()I

    move-result v1

    const/4 v2, 0x4

    if-ne v1, v2, :cond_6

    .line 130
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFileName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    .line 126
    :cond_4
    :goto_0
    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    new-array v3, v3, [Ljava/lang/Object;

    aput-object v0, v3, v2

    const-string v0, "\u4e0b\u8f7d\u5931\u8d25\uff0c\u4fdd\u5b58\u8def\u5f84\u3010%s\u3011\u4e0d\u80fd\u4e3a\u6587\u4ef6\u5939\uff0c\u8def\u5f84\u9700\u8981\u662f\u5b8c\u6574\u7684\u6587\u4ef6\u8def\u5f84\uff0c\u5982\uff1a/mnt/sdcard/game.zip"

    .line 127
    invoke-static {v0, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 126
    invoke-static {v1, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    .line 134
    :cond_5
    iget-object v2, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFileName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_6

    .line 135
    iget-object v2, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/arialyy/aria/core/download/DownloadEntity;->setFileName(Ljava/lang/String;)V

    .line 139
    :cond_6
    :goto_1
    invoke-direct {p0, v0}, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->checkPathConflicts(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method private checkPathConflicts(Ljava/lang/String;)Z
    .locals 5

    .line 147
    const-class v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "downloadPath=?"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->findFirst(Ljava/lang/Class;[Ljava/lang/String;)Lcom/arialyy/aria/orm/DbEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    if-eqz v0, :cond_0

    .line 148
    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v1

    iget-object v4, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v4}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 149
    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    iget-wide v3, v0, Lcom/arialyy/aria/core/download/DownloadEntity;->rowID:J

    iput-wide v3, v1, Lcom/arialyy/aria/core/download/DownloadEntity;->rowID:J

    .line 150
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->setFilePath(Ljava/lang/String;)Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 151
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    new-instance v1, Ljava/io/File;

    invoke-direct {v1, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->setFileName(Ljava/lang/String;)V

    return v2

    .line 155
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_6

    .line 157
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DTaskWrapper;->isIgnoreFilePathOccupy()Z

    move-result v0

    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    .line 158
    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getRequestType()I

    move-result v1

    .line 157
    invoke-static {v0, p1, v1}, Lcom/arialyy/aria/util/CheckUtil;->checkDPathConflicts(ZLjava/lang/String;I)Z

    move-result v0

    if-nez v0, :cond_1

    return v3

    .line 162
    :cond_1
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 163
    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v1, p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->setFilePath(Ljava/lang/String;)Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 164
    iget-object p1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v1}, Lcom/arialyy/aria/core/download/DownloadEntity;->setFileName(Ljava/lang/String;)V

    .line 167
    iget-object p1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object p1

    const-string v1, "useServerFileName"

    invoke-virtual {p1, v1}, Lcom/arialyy/aria/core/TaskOptionParams;->getParam(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 168
    check-cast p1, Ljava/lang/Boolean;

    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p1

    if-nez p1, :cond_3

    :cond_2
    iget-object p1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getRequestType()I

    move-result p1

    const/16 v1, 0x8

    if-ne p1, v1, :cond_4

    :cond_3
    return v2

    .line 171
    :cond_4
    iget-object p1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p1

    if-nez p1, :cond_6

    .line 172
    new-instance p1, Ljava/io/File;

    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 173
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_5

    .line 175
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    iget-object v4, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v4}, Lcom/arialyy/aria/core/download/DownloadEntity;->getTaskType()I

    move-result v4

    invoke-static {p1, v1, v4}, Lcom/arialyy/aria/util/RecordUtil;->modifyTaskRecord(Ljava/lang/String;Ljava/lang/String;I)V

    .line 176
    iget-object p1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v3

    const-string v0, "\u5c06\u4efb\u52a1\u91cd\u547d\u540d\u4e3a\uff1a%s"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 177
    :cond_5
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/arialyy/aria/util/RecordUtil;->blockTaskExists(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_6

    .line 179
    invoke-virtual {p1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    iget-object v4, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v4}, Lcom/arialyy/aria/core/download/DownloadEntity;->getTaskType()I

    move-result v4

    invoke-static {p1, v1, v4}, Lcom/arialyy/aria/util/RecordUtil;->modifyTaskRecord(Ljava/lang/String;Ljava/lang/String;I)V

    .line 180
    iget-object p1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    new-array v1, v2, [Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    aput-object v0, v1, v3

    const-string v0, "\u5c06\u5206\u5757\u4efb\u52a1\u91cd\u547d\u540d\u4e3a\uff1a%s"

    invoke-static {v0, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :cond_6
    :goto_0
    return v2
.end method

.method private checkUrl()Z
    .locals 5

    .line 188
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v0

    .line 189
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 190
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    const-string v1, "\u4e0b\u8f7d\u5931\u8d25\uff0curl\u4e3anull"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    .line 192
    :cond_0
    invoke-static {v0}, Lcom/arialyy/aria/util/CheckUtil;->checkUrl(Ljava/lang/String;)Z

    move-result v1

    const-string v3, "\u4e0b\u8f7d\u5931\u8d25\uff0curl\u3010"

    if-nez v1, :cond_1

    .line 193
    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u3011\u9519\u8bef"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    :cond_1
    const-string v1, "://"

    .line 196
    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    const/4 v4, -0x1

    if-ne v1, v4, :cond_2

    .line 198
    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\u3011\u4e0d\u5408\u6cd5"

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    .line 201
    :cond_2
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getTempUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 202
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getTempUrl()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/download/DownloadEntity;->setUrl(Ljava/lang/String;)V

    :cond_3
    const/4 v0, 0x1

    return v0
.end method

.method private handleM3U8()V
    .locals 7

    .line 70
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getTempFilePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 71
    iget-object v1, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getM3U8Params()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v1

    const-string v2, "bandWidth"

    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/TaskOptionParams;->getParam(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_0

    move v1, v2

    goto :goto_0

    .line 72
    :cond_0
    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    .line 73
    :goto_0
    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3, v1}, Lcom/arialyy/aria/util/FileUtil;->getTsCacheDir(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v3

    .line 75
    iget-object v4, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v4}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getM3U8Params()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v4

    const-string v5, "cacheDir"

    invoke-virtual {v4, v5, v3}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Ljava/lang/String;Ljava/lang/Object;)Lcom/arialyy/aria/core/TaskOptionParams;

    .line 76
    iget-object v4, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v4}, Lcom/arialyy/aria/core/download/DownloadEntity;->getM3U8Entity()Lcom/arialyy/aria/core/download/M3U8Entity;

    move-result-object v4

    if-nez v4, :cond_1

    .line 79
    new-instance v4, Lcom/arialyy/aria/core/download/M3U8Entity;

    invoke-direct {v4}, Lcom/arialyy/aria/core/download/M3U8Entity;-><init>()V

    .line 80
    iget-object v5, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v5}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Lcom/arialyy/aria/core/download/M3U8Entity;->setFilePath(Ljava/lang/String;)V

    .line 81
    invoke-virtual {v4, v2}, Lcom/arialyy/aria/core/download/M3U8Entity;->setPeerIndex(I)V

    .line 82
    invoke-virtual {v4, v3}, Lcom/arialyy/aria/core/download/M3U8Entity;->setCacheDir(Ljava/lang/String;)V

    .line 83
    invoke-virtual {v4}, Lcom/arialyy/aria/core/download/M3U8Entity;->insert()V

    goto :goto_1

    .line 85
    :cond_1
    invoke-virtual {v4}, Lcom/arialyy/aria/core/download/M3U8Entity;->update()V

    .line 87
    :goto_1
    iget-object v2, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getRequestType()I

    move-result v2

    const/4 v3, 0x7

    const/4 v4, 0x4

    if-ne v2, v3, :cond_2

    iget v2, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->action:I

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2

    .line 89
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFileSize()J

    move-result-wide v2

    const-wide/16 v5, 0x0

    cmp-long v0, v2, v5

    if-nez v0, :cond_3

    .line 90
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    const-string v2, "\u7531\u4e8em3u8\u534f\u8bae\u7684\u7279\u6b8a\u6027\u8d28\uff0c\u65e0\u6cd5\u6709\u6548\u5feb\u901f\u83b7\u53d6\u5230\u6b63\u786e\u5230\u6587\u4ef6\u957f\u5ea6\uff0c\u5982\u679c\u4f60\u9700\u8981\u663e\u793a\u6587\u4ef6\u4e2d\u957f\u5ea6\uff0c\u4f60\u9700\u8981\u81ea\u884c\u8bbe\u7f6e\u6587\u4ef6\u957f\u5ea6\uff1a.asM3U8().asVod().setFileSize(xxx)"

    invoke-static {v0, v2}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    .line 93
    :cond_2
    iget-object v2, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v2}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getRequestType()I

    move-result v2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_3

    iget v2, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->action:I

    if-eq v2, v4, :cond_3

    .line 95
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_3

    .line 96
    iget-object v2, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    const-string v3, "\u5bf9\u4e8e\u76f4\u64ad\u6765\u8bf4\uff0c\u6bcf\u6b21\u4e0b\u8f7d\u90fd\u662f\u4e00\u4e2a\u65b0\u6587\u4ef6\uff0c\u6240\u4ee5\u4f60\u9700\u8981\u8bbe\u7f6e\u65b0\u90fd\u6587\u4ef6\u8def\u5f84\uff0c\u5426\u5219Aria\u6846\u67b6\u5c06\u4f1a\u8986\u76d6\u5df2\u4e0b\u8f7d\u7684\u6587\u4ef6"

    invoke-static {v2, v3}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 101
    :cond_3
    :goto_2
    iget v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->action:I

    if-eq v0, v4, :cond_4

    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    .line 102
    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getM3U8Params()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    const-string v2, "bandWidthUrlConverter"

    invoke-virtual {v0, v2}, Lcom/arialyy/aria/core/TaskOptionParams;->getHandler(Ljava/lang/String;)Lcom/arialyy/aria/core/inf/IEventHandler;

    move-result-object v0

    if-eqz v0, :cond_4

    if-nez v1, :cond_4

    .line 104
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    const-string v1, "\u4f60\u5df2\u7ecf\u8bbe\u7f6e\u4e86\u7801\u7387url\u8f6c\u6362\u5668\uff0c\u4f46\u662f\u6ca1\u6709\u8bbe\u7f6e\u7801\u7387\uff0cAria\u6846\u67b6\u5c06\u91c7\u7528\u7b2c\u4e00\u4e2a\u83b7\u53d6\u5230\u7684\u7801\u7387"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    return-void
.end method

.method public static newInstance(Lcom/arialyy/aria/core/download/DTaskWrapper;I)Lcom/arialyy/aria/core/download/CheckDEntityUtil;
    .locals 1

    .line 42
    new-instance v0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;

    invoke-direct {v0, p0, p1}, Lcom/arialyy/aria/core/download/CheckDEntityUtil;-><init>(Lcom/arialyy/aria/core/download/DTaskWrapper;I)V

    return-object v0
.end method


# virtual methods
.method public checkEntity()Z
    .locals 4

    .line 53
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getErrorEvent()Lcom/arialyy/aria/core/event/ErrorEvent;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    .line 54
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->TAG:Ljava/lang/String;

    new-array v1, v1, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getErrorEvent()Lcom/arialyy/aria/core/event/ErrorEvent;

    move-result-object v3

    iget-object v3, v3, Lcom/arialyy/aria/core/event/ErrorEvent;->errorMsg:Ljava/lang/String;

    aput-object v3, v1, v2

    const-string v3, "\u4efb\u52a1\u64cd\u4f5c\u5931\u8d25\uff0c%s"

    invoke-static {v3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v2

    .line 58
    :cond_0
    invoke-direct {p0}, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->checkUrl()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-direct {p0}, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->checkFilePath()Z

    move-result v0

    if-eqz v0, :cond_1

    goto :goto_0

    :cond_1
    move v1, v2

    :goto_0
    if-eqz v1, :cond_2

    .line 60
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->save()V

    .line 62
    :cond_2
    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getRequestType()I

    move-result v0

    const/4 v2, 0x7

    if-eq v0, v2, :cond_3

    iget-object v0, p0, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->mWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    .line 63
    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getRequestType()I

    move-result v0

    const/16 v2, 0x8

    if-ne v0, v2, :cond_4

    .line 64
    :cond_3
    invoke-direct {p0}, Lcom/arialyy/aria/core/download/CheckDEntityUtil;->handleM3U8()V

    :cond_4
    return v1
.end method
