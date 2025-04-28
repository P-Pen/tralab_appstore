.class public Lcom/arialyy/aria/util/CheckUtil;
.super Ljava/lang/Object;
.source "CheckUtil.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "CheckUtil"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkDGPathConflicts(ZLjava/lang/String;)Z
    .locals 4

    .line 128
    const-class v0, Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "dirPath=?"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->checkDataExist(Ljava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "CheckUtil"

    if-nez p0, :cond_0

    new-array p0, v2, [Ljava/lang/Object;

    aput-object p1, p0, v3

    const-string p1, "\u4e0b\u8f7d\u5931\u8d25\uff0c\u6587\u4ef6\u5939\u8def\u5f84\u3010%s\u3011\u5df2\u7ecf\u88ab\u5176\u5b83\u4efb\u52a1\u5360\u7528\uff0c\u8bf7\u8bbe\u7f6e\u5176\u5b83\u6587\u4ef6\u8def\u5f84"

    .line 130
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :cond_0
    new-array p0, v2, [Ljava/lang/Object;

    aput-object p1, p0, v3

    const-string v1, "\u6587\u4ef6\u5939\u8def\u5f84\u3010%s\u3011\u5df2\u7ecf\u88ab\u5176\u5b83\u4efb\u52a1\u5360\u7528\uff0c\u5f53\u524d\u4efb\u52a1\u5c06\u8986\u76d6\u8be5\u8def\u5f84"

    .line 133
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 134
    invoke-static {}, Lcom/arialyy/aria/util/DeleteDGRecord;->getInstance()Lcom/arialyy/aria/util/DeleteDGRecord;

    move-result-object p0

    invoke-virtual {p0, p1, v3, v2}, Lcom/arialyy/aria/util/DeleteDGRecord;->deleteRecord(Ljava/lang/String;ZZ)V

    :cond_1
    return v2
.end method

.method public static checkDPathConflicts(ZLjava/lang/String;I)Z
    .locals 4

    .line 85
    const-class v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "downloadPath=?"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->checkDataExist(Ljava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "CheckUtil"

    if-nez p0, :cond_0

    new-array p0, v2, [Ljava/lang/Object;

    aput-object p1, p0, v3

    const-string p1, "\u4e0b\u8f7d\u5931\u8d25\uff0c\u4fdd\u5b58\u8def\u5f84\u3010%s\u3011\u5df2\u7ecf\u88ab\u5176\u5b83\u4efb\u52a1\u5360\u7528\uff0c\u8bf7\u8bbe\u7f6e\u5176\u5b83\u4fdd\u5b58\u8def\u5f84"

    .line 87
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :cond_0
    new-array p0, v2, [Ljava/lang/Object;

    aput-object p1, p0, v3

    const-string v1, "\u4fdd\u5b58\u8def\u5f84\u3010%s\u3011\u5df2\u7ecf\u88ab\u5176\u5b83\u4efb\u52a1\u5360\u7528\uff0c\u5f53\u524d\u4efb\u52a1\u5c06\u8986\u76d6\u8be5\u8def\u5f84\u7684\u6587\u4ef6"

    .line 90
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    invoke-static {p1, p2, v3, v2}, Lcom/arialyy/aria/util/RecordUtil;->delTaskRecord(Ljava/lang/String;IZZ)V

    :cond_1
    return v2
.end method

.method public static checkDownloadUrlsIsEmpty(Ljava/util/List;)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    if-eqz p0, :cond_1

    .line 194
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const-string p0, "CheckUtil"

    const-string v0, "\u94fe\u63a5\u7ec4\u4e0d\u80fd\u4e3anull"

    .line 195
    invoke-static {p0, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x1

    return p0
.end method

.method public static checkIp(Ljava/lang/String;)Z
    .locals 3

    .line 45
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v2, 0x7

    if-lt v0, v2, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v2, 0xf

    if-le v0, v2, :cond_0

    goto :goto_0

    :cond_0
    const-string v0, "(([01]?\\d\\d?|2[0-4]\\d|25[0-5])\\.){3}([01]?\\d\\d?|2[0-4]\\d|25[0-5])"

    .line 48
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    .line 49
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    .line 50
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->groupCount()I

    move-result p0

    if-lez p0, :cond_1

    const/4 v1, 0x1

    :cond_1
    :goto_0
    return v1
.end method

.method public static checkMemberClass(Ljava/lang/Class;)V
    .locals 3

    .line 145
    invoke-virtual {p0}, Ljava/lang/Class;->getModifiers()I

    move-result v0

    .line 152
    invoke-virtual {p0}, Ljava/lang/Class;->isMemberClass()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-static {v0}, Ljava/lang/reflect/Modifier;->isStatic(I)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 154
    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v0, v1

    const/4 v1, 0x1

    invoke-virtual {p0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v0, v1

    const-string p0, "\u4e3a\u4e86\u9632\u6b62\u5185\u5b58\u6cc4\u6f0f\uff0c\u8bf7\u4f7f\u7528\u9759\u6001\u7684\u6210\u5458\u7c7b(public static class %s)\u6216\u6587\u4ef6\u7c7b(%s.java)"

    .line 153
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "CheckUtil"

    invoke-static {v0, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    return-void
.end method

.method public static checkPageParams(II)V
    .locals 1

    const/4 v0, 0x1

    if-lt p0, v0, :cond_0

    if-lt p1, v0, :cond_0

    return-void

    .line 165
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "page\u548cnum\u4e0d\u80fd\u5c0f\u4e8e1"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static checkUPathConflicts(ZLjava/lang/String;I)Z
    .locals 4

    .line 107
    const-class v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const-string v2, "filePath=?"

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->checkDataExist(Ljava/lang/Class;[Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const-string v0, "CheckUtil"

    if-nez p0, :cond_0

    new-array p0, v2, [Ljava/lang/Object;

    aput-object p1, p0, v3

    const-string p1, "\u4e0a\u4f20\u5931\u8d25\uff0c\u6587\u4ef6\u8def\u5f84\u3010%s\u3011\u5df2\u7ecf\u88ab\u5176\u5b83\u4efb\u52a1\u5360\u7528\uff0c\u8bf7\u8bbe\u7f6e\u5176\u5b83\u6587\u4ef6\u8def\u5f84"

    .line 109
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v3

    :cond_0
    new-array p0, v2, [Ljava/lang/Object;

    aput-object p1, p0, v3

    const-string v1, "\u6587\u4ef6\u8def\u5f84\u3010%s\u3011\u5df2\u7ecf\u88ab\u5176\u5b83\u4efb\u52a1\u5360\u7528\uff0c\u5f53\u524d\u4efb\u52a1\u5c06\u8986\u76d6\u8be5\u8def\u5f84\u7684\u6587\u4ef6"

    .line 112
    invoke-static {v1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 113
    invoke-static {p1, p2, v3, v2}, Lcom/arialyy/aria/util/RecordUtil;->delTaskRecord(Ljava/lang/String;IZZ)V

    :cond_1
    return v2
.end method

.method public static checkUploadPathIsEmpty(Ljava/lang/String;)V
    .locals 1

    .line 205
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_0

    return-void

    .line 206
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "\u4e0a\u4f20\u5730\u5740\u4e0d\u80fd\u4e3anull"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static checkUrl(Ljava/lang/String;)Z
    .locals 4

    .line 174
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    const-string v2, "CheckUtil"

    if-eqz v0, :cond_0

    const-string p0, "url\u4e0d\u80fd\u4e3anull"

    .line 175
    invoke-static {v2, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    const-string v0, "http"

    .line 177
    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const-string v3, "url\u3010"

    if-nez v0, :cond_1

    const-string v0, "ftp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "sftp"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 178
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\u3011\u9519\u8bef"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_1
    const-string v0, "://"

    .line 181
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_2

    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "\u3011\u4e0d\u5408\u6cd5"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_2
    const/4 p0, 0x1

    return p0
.end method

.method public static ftpIsBadRequest(I)Z
    .locals 1

    const/16 v0, 0x190

    if-lt p0, v0, :cond_0

    const/16 v0, 0x258

    if-ge p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method public static httpIsBadRequest(I)Z
    .locals 1

    const/16 v0, 0x1f6

    if-eq p0, v0, :cond_1

    const/16 v0, 0x195

    if-eq p0, v0, :cond_1

    const/16 v0, 0x190

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p0, 0x1

    :goto_1
    return p0
.end method
