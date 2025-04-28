.class abstract Lcom/arialyy/aria/core/config/BaseConfig;
.super Ljava/lang/Object;
.source "BaseConfig.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field private static final TAG:Ljava/lang/String; = "BaseConfig"

.field static final TYPE_APP:I = 0x3

.field static final TYPE_DGROUP:I = 0x4

.field static final TYPE_DOWNLOAD:I = 0x1

.field static final TYPE_UPLOAD:I = 0x2


# direct methods
.method constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract getType()I
.end method

.method save()V
    .locals 6

    .line 27
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 29
    invoke-virtual {p0}, Lcom/arialyy/aria/core/config/BaseConfig;->getType()I

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v1, v3, :cond_3

    if-eq v1, v2, :cond_2

    const/4 v4, 0x3

    if-eq v1, v4, :cond_1

    const/4 v4, 0x4

    if-eq v1, v4, :cond_0

    const/4 v1, 0x0

    goto :goto_0

    :cond_0
    const-string v1, "/Aria/AriaDGroup.cfg"

    goto :goto_0

    :cond_1
    const-string v1, "/Aria/AriaApp.cfg"

    goto :goto_0

    :cond_2
    const-string v1, "/Aria/AriaUpload.cfg"

    goto :goto_0

    :cond_3
    const-string v1, "/Aria/AriaDownload.cfg"

    .line 43
    :goto_0
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v5, 0x0

    if-nez v4, :cond_4

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v5

    aput-object v1, v2, v3

    const-string v0, "%s%s"

    .line 44
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 45
    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/lang/String;)Z

    .line 46
    invoke-static {v0, p0}, Lcom/arialyy/aria/util/FileUtil;->writeObjToFile(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_1

    :cond_4
    new-array v0, v3, [Ljava/lang/Object;

    .line 48
    invoke-virtual {p0}, Lcom/arialyy/aria/core/config/BaseConfig;->getType()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, v0, v5

    const-string v1, "\u4fdd\u5b58\u914d\u7f6e\u5931\u8d25\uff0c\u914d\u7f6e\u7c7b\u578b\uff1a%s\uff0c\u539f\u56e0\uff1a\u8def\u5f84\u9519\u8bef"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "BaseConfig"

    invoke-static {v1, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    return-void
.end method
