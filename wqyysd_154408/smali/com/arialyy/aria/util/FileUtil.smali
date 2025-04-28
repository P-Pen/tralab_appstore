.class public Lcom/arialyy/aria/util/FileUtil;
.super Ljava/lang/Object;
.source "FileUtil.java"


# static fields
.field private static final DIR_SEPORATOR:Ljava/util/regex/Pattern;

.field private static final EXTERNAL_STORAGE_PATH:Ljava/lang/String;

.field private static final TAG:Ljava/lang/String; = "FileUtil"


# direct methods
.method static constructor <clinit>()V
    .locals 1

    const-string v0, "/"

    .line 59
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/arialyy/aria/util/FileUtil;->DIR_SEPORATOR:Ljava/util/regex/Pattern;

    .line 61
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Lcom/arialyy/aria/util/FileUtil;->EXTERNAL_STORAGE_PATH:Ljava/lang/String;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 57
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static canWrite(Ljava/lang/String;)Z
    .locals 4

    .line 695
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 696
    invoke-virtual {v0}, Ljava/io/File;->canWrite()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    return v1

    :cond_0
    const/4 v0, 0x0

    .line 702
    :try_start_0
    new-instance v2, Ljava/io/File;

    const-string v3, "tw.txt"

    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 703
    :try_start_1
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_1

    .line 704
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 706
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    .line 707
    new-instance p0, Ljava/io/FileWriter;

    invoke-direct {p0, v2}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 708
    invoke-virtual {p0, v1}, Ljava/io/FileWriter;->write(I)V

    .line 709
    invoke-virtual {p0}, Ljava/io/FileWriter;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 716
    :try_start_2
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_2

    .line 717
    invoke-virtual {v2}, Ljava/io/File;->delete()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 720
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1

    :catchall_0
    move-exception p0

    move-object v0, v2

    goto :goto_2

    :catch_1
    move-exception p0

    move-object v0, v2

    goto :goto_0

    :catchall_1
    move-exception p0

    goto :goto_2

    :catch_2
    move-exception p0

    .line 712
    :goto_0
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    const/4 v1, 0x0

    if-eqz v0, :cond_2

    .line 716
    :try_start_4
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    if-eqz p0, :cond_2

    .line 717
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    :cond_2
    :goto_1
    return v1

    :goto_2
    if-eqz v0, :cond_3

    .line 716
    :try_start_5
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 717
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_3

    :catch_3
    move-exception v0

    .line 720
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 722
    :cond_3
    :goto_3
    throw p0
.end method

.method public static checkMemorySpace(Ljava/lang/String;J)Z
    .locals 5

    .line 506
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 507
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_1

    .line 508
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_0

    .line 509
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/arialyy/aria/util/FileUtil;->createDir(Ljava/lang/String;)Z

    .line 511
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    .line 514
    :cond_1
    new-instance v0, Landroid/os/StatFs;

    invoke-direct {v0, p0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 515
    invoke-virtual {v0}, Landroid/os/StatFs;->getBlockSize()I

    move-result p0

    int-to-long v1, p0

    .line 516
    invoke-virtual {v0}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result p0

    int-to-long v3, p0

    mul-long/2addr v3, v1

    cmp-long p0, p1, v3

    if-gtz p0, :cond_2

    const/4 p0, 0x1

    goto :goto_0

    :cond_2
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method private static checkSDMemorySpace(Ljava/lang/String;J)Z
    .locals 5
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 577
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->getSDPathList(Landroid/content/Context;)Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_2

    .line 578
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    .line 581
    :cond_0
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 582
    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_1

    const-wide/16 v3, 0x0

    cmp-long v3, p1, v3

    if-lez v3, :cond_1

    .line 583
    invoke-static {v2}, Lcom/arialyy/aria/util/FileUtil;->getAvailableExternalMemorySize(Ljava/lang/String;)J

    move-result-wide v2

    cmp-long v2, p1, v2

    if-lez v2, :cond_1

    const/4 p0, 0x0

    return p0

    :cond_2
    :goto_0
    return v1
.end method

.method private static compareMountsWithVold(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 878
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_3

    .line 879
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 880
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 882
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v2}, Ljava/io/File;->canWrite()Z

    move-result v2

    if-nez v2, :cond_0

    goto :goto_1

    :cond_0
    if-eqz p1, :cond_2

    .line 886
    invoke-interface {p1, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 887
    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    goto :goto_2

    .line 883
    :cond_1
    :goto_1
    invoke-interface {p0, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_2
    :goto_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_3
    if-eqz p1, :cond_4

    .line 892
    invoke-interface {p1}, Ljava/util/List;->clear()V

    :cond_4
    return-object p0
.end method

.method public static createDir(Ljava/lang/String;)Z
    .locals 2

    .line 115
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 116
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p0

    const/4 v1, 0x0

    if-nez p0, :cond_1

    .line 117
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, "FileUtil"

    const-string v0, "\u521b\u5efa\u5931\u8d25\uff0c\u8bf7\u68c0\u67e5\u8def\u5f84\u548c\u662f\u5426\u914d\u7f6e\u6587\u4ef6\u6743\u9650\uff01"

    .line 118
    invoke-static {p0, v0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    return v1
.end method

.method public static createFile(Ljava/io/File;)Z
    .locals 3

    .line 145
    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    const-string v0, "FileUtil"

    const-string v1, "\u76ee\u6807\u6587\u4ef6\u6240\u5728\u8def\u5f84\u4e0d\u5b58\u5728\uff0c\u51c6\u5907\u521b\u5efa\u2026\u2026"

    .line 146
    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 147
    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->createDir(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 148
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u521b\u5efa\u76ee\u5f55\u6587\u4ef6\u6240\u5728\u7684\u76ee\u5f55\u5931\u8d25\uff01\u6587\u4ef6\u8def\u5f84\u3010"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\u3011"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 152
    :cond_1
    invoke-static {p0}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/io/File;)Z

    const/4 v0, 0x0

    .line 154
    :try_start_0
    invoke-virtual {p0}, Ljava/io/File;->createNewFile()Z

    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    return v0

    :catch_0
    move-exception p0

    .line 159
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    return v0
.end method

.method public static createFile(Ljava/lang/String;)Z
    .locals 1

    .line 132
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "FileUtil"

    const-string v0, "\u6587\u4ef6\u8def\u5f84\u4e0d\u80fd\u4e3anull"

    .line 133
    invoke-static {p0, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return p0

    .line 136
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->createFile(Ljava/io/File;)Z

    move-result p0

    return p0
.end method

.method public static createFileFormInputStream(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 3

    .line 82
    :try_start_0
    new-instance v0, Ljava/io/FileOutputStream;

    invoke-direct {v0, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V

    const/16 p1, 0x400

    new-array p1, p1, [B

    .line 85
    :goto_0
    invoke-virtual {p0, p1}, Ljava/io/InputStream;->read([B)I

    move-result v1

    if-lez v1, :cond_0

    const/4 v2, 0x0

    .line 86
    invoke-virtual {v0, p1, v2, v1}, Ljava/io/FileOutputStream;->write([BII)V

    goto :goto_0

    .line 88
    :cond_0
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    .line 89
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 90
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 92
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    :goto_1
    return-void
.end method

.method public static createFileName(Ljava/lang/String;)Ljava/lang/String;
    .locals 4

    const-string v0, "?"

    .line 171
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    const-string v1, "/"

    const-string v2, ""

    if-lez v0, :cond_0

    const/4 v3, 0x0

    .line 174
    invoke-virtual {p0, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 175
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v1

    if-lez v1, :cond_1

    add-int/lit8 v1, v1, 0x1

    .line 177
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    move-object v2, v0

    goto :goto_0

    .line 180
    :cond_0
    invoke-virtual {p0, v1}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_1

    add-int/lit8 v0, v0, 0x1

    .line 182
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    .line 185
    :cond_1
    :goto_0
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 186
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->keyToHashKey(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_2
    return-object v2
.end method

.method public static deleteDir(Ljava/io/File;)Z
    .locals 4

    .line 228
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 232
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 233
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p0

    return p0

    .line 236
    :cond_1
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    array-length v2, v0

    :goto_0
    if-ge v1, v2, :cond_2

    aget-object v3, v0, v1

    .line 237
    invoke-static {v3}, Lcom/arialyy/aria/util/FileUtil;->deleteDir(Ljava/io/File;)Z

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 241
    :cond_2
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p0

    return p0
.end method

.method public static deleteFile(Ljava/io/File;)Z
    .locals 4

    .line 212
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 213
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 214
    invoke-virtual {p0, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 215
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result p0

    return p0

    .line 217
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public static deleteFile(Ljava/lang/String;)Z
    .locals 1

    .line 198
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p0, "FileUtil"

    const-string v0, "\u5220\u9664\u6587\u4ef6\u5931\u8d25\uff0c\u8def\u5f84\u4e3a\u7a7a"

    .line 199
    invoke-static {p0, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p0, 0x0

    return p0

    .line 202
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/io/File;)Z

    move-result p0

    return p0
.end method

.method public static getAvailMemory(Landroid/content/Context;)J
    .locals 2

    const-string v0, "activity"

    .line 919
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/ActivityManager;

    .line 920
    new-instance v0, Landroid/app/ActivityManager$MemoryInfo;

    invoke-direct {v0}, Landroid/app/ActivityManager$MemoryInfo;-><init>()V

    .line 921
    invoke-virtual {p0, v0}, Landroid/app/ActivityManager;->getMemoryInfo(Landroid/app/ActivityManager$MemoryInfo;)V

    .line 922
    iget-wide v0, v0, Landroid/app/ActivityManager$MemoryInfo;->availMem:J

    return-wide v0
.end method

.method private static getAvailableExternalMemorySize(Ljava/lang/String;)J
    .locals 5

    .line 598
    new-instance v0, Landroid/os/StatFs;

    invoke-direct {v0, p0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 599
    invoke-virtual {v0}, Landroid/os/StatFs;->getBlockSize()I

    move-result p0

    int-to-long v1, p0

    .line 600
    invoke-virtual {v0}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result p0

    int-to-long v3, p0

    mul-long/2addr v3, v1

    return-wide v3
.end method

.method public static getFileExtensionName(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 68
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return-object v1

    :cond_0
    const-string v0, "."

    .line 71
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(Ljava/lang/String;)I

    move-result v0

    const/4 v2, -0x1

    if-le v0, v2, :cond_1

    add-int/lit8 v0, v0, 0x1

    .line 72
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    :cond_1
    return-object v1
.end method

.method private static getSDPathList(Landroid/content/Context;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 622
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x11

    if-lt v0, v1, :cond_0

    .line 624
    :try_start_0
    invoke-static {p0}, Lcom/arialyy/aria/util/FileUtil;->getVolumeList(Landroid/content/Context;)Ljava/util/List;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 630
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_0

    :catch_1
    move-exception p0

    .line 628
    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_0

    :catch_2
    move-exception p0

    .line 626
    invoke-virtual {p0}, Ljava/lang/NoSuchMethodException;->printStackTrace()V

    :goto_0
    const/4 p0, 0x0

    goto :goto_1

    .line 633
    :cond_0
    invoke-static {}, Lcom/arialyy/aria/util/FileUtil;->readMountsFile()Ljava/util/List;

    move-result-object p0

    .line 634
    invoke-static {}, Lcom/arialyy/aria/util/FileUtil;->readVoldFile()Ljava/util/List;

    move-result-object v0

    .line 635
    invoke-static {p0, v0}, Lcom/arialyy/aria/util/FileUtil;->compareMountsWithVold(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    :goto_1
    return-object p0
.end method

.method private static getStorageDirectories()Ljava/util/List;
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 736
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v1, "EXTERNAL_STORAGE"

    .line 738
    invoke-static {v1}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "SECONDARY_STORAGE"

    .line 740
    invoke-static {v2}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "EMULATED_STORAGE_TARGET"

    .line 742
    invoke-static {v3}, Ljava/lang/System;->getenv(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 743
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    const/4 v5, 0x1

    if-eqz v4, :cond_1

    .line 745
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string v1, "/storage/sdcard0"

    .line 747
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 749
    :cond_0
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 757
    :cond_1
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v4

    .line 758
    sget-object v6, Lcom/arialyy/aria/util/FileUtil;->DIR_SEPORATOR:Ljava/util/regex/Pattern;

    invoke-virtual {v6, v4}, Ljava/util/regex/Pattern;->split(Ljava/lang/CharSequence;)[Ljava/lang/String;

    move-result-object v4

    .line 759
    array-length v6, v4

    sub-int/2addr v6, v5

    aget-object v4, v4, v6

    const/4 v6, 0x0

    .line 761
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-nez v7, :cond_2

    invoke-static {v4}, Landroid/text/TextUtils;->isDigitsOnly(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_2

    move v6, v5

    :cond_2
    if-eqz v6, :cond_3

    goto :goto_0

    :cond_3
    const-string v4, ""

    .line 769
    :goto_0
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 770
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 772
    :cond_4
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 776
    :goto_1
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 778
    sget-object v1, Ljava/io/File;->pathSeparator:Ljava/lang/String;

    invoke-virtual {v2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    .line 779
    invoke-static {v0, v1}, Ljava/util/Collections;->addAll(Ljava/util/Collection;[Ljava/lang/Object;)Z

    .line 782
    :cond_5
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, v5

    :goto_2
    if-ltz v1, :cond_8

    .line 783
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 784
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 785
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_6

    invoke-static {v2}, Lcom/arialyy/aria/util/FileUtil;->canWrite(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 786
    :cond_6
    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_7
    add-int/lit8 v1, v1, -0x1

    goto :goto_2

    :cond_8
    return-object v0
.end method

.method private static getTotalExternalMemorySize(Ljava/lang/String;)J
    .locals 5

    .line 611
    new-instance v0, Landroid/os/StatFs;

    invoke-direct {v0, p0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 612
    invoke-virtual {v0}, Landroid/os/StatFs;->getBlockSize()I

    move-result p0

    int-to-long v1, p0

    .line 613
    invoke-virtual {v0}, Landroid/os/StatFs;->getBlockCount()I

    move-result p0

    int-to-long v3, p0

    mul-long/2addr v3, v1

    return-wide v3
.end method

.method public static getTotalMemory()J
    .locals 5

    const-string v0, "/proc/meminfo"

    const-wide/16 v1, 0x0

    .line 903
    :try_start_0
    new-instance v3, Ljava/io/FileReader;

    invoke-direct {v3, v0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 904
    new-instance v0, Ljava/io/BufferedReader;

    const/16 v4, 0x2000

    invoke-direct {v0, v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 906
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v3

    const-string v4, "\\s+"

    .line 907
    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    .line 908
    aget-object v3, v3, v4

    .line 909
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    mul-int/lit16 v1, v1, 0x400

    int-to-long v1, v1

    .line 910
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 912
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-wide v1
.end method

.method public static getTsCacheDir(Ljava/lang/String;I)Ljava/lang/String;
    .locals 3

    .line 104
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 107
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x3

    new-array p0, p0, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 108
    invoke-virtual {v0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v2

    aput-object v2, p0, v1

    const/4 v1, 0x1

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v0

    aput-object v0, p0, v1

    const/4 v0, 0x2

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, p0, v0

    const-string p1, "%s/.%s_%s"

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 105
    :cond_0
    new-instance p0, Ljava/lang/NullPointerException;

    const-string p1, "m3u8\u6587\u4fdd\u5b58\u8def\u5f84\u4e3a\u7a7a"

    invoke-direct {p0, p1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static getVolumeList(Landroid/content/Context;)Ljava/util/List;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/NoSuchMethodException;,
            Ljava/lang/reflect/InvocationTargetException;,
            Ljava/lang/IllegalAccessException;
        }
    .end annotation

    .line 646
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 648
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    if-lt v1, v2, :cond_1

    const-string v1, "storage"

    .line 649
    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/storage/StorageManager;

    .line 650
    invoke-virtual {p0}, Landroid/os/storage/StorageManager;->getStorageVolumes()Ljava/util/List;

    move-result-object p0

    .line 652
    const-class v1, Landroid/os/storage/StorageVolume;

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    const-string v4, "getPath"

    .line 653
    invoke-virtual {v1, v4, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    const/4 v3, 0x1

    .line 655
    invoke-virtual {v1, v3}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 658
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/os/storage/StorageVolume;

    .line 659
    invoke-virtual {v3}, Landroid/os/storage/StorageVolume;->getState()Ljava/lang/String;

    move-result-object v4

    const-string v5, "mounted"

    .line 661
    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    new-array v4, v2, [Ljava/lang/Object;

    .line 662
    invoke-virtual {v1, v3, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 666
    :cond_1
    invoke-static {}, Lcom/arialyy/aria/util/FileUtil;->getStorageDirectories()Ljava/util/List;

    move-result-object p0

    invoke-interface {v0, p0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 669
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_3

    .line 670
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 671
    sget-object p0, Lcom/arialyy/aria/util/FileUtil;->EXTERNAL_STORAGE_PATH:Ljava/lang/String;

    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 673
    :cond_3
    new-instance p0, Ljava/util/LinkedHashMap;

    invoke-direct {p0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 674
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_4
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 675
    new-instance v2, Ljava/io/File;

    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 676
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_4

    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->canWrite(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_5

    goto :goto_1

    .line 680
    :cond_5
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getTotalSpace()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/io/File;->getUsableSpace()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v2

    .line 681
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 682
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_6

    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v4

    if-ge v3, v4, :cond_6

    goto :goto_1

    .line 685
    :cond_6
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {p0, v2, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 687
    :cond_7
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 688
    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    .line 689
    invoke-virtual {p0, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_2

    :cond_8
    return-object v0
.end method

.method public static loadConfig(Ljava/io/File;)Ljava/util/Properties;
    .locals 3

    .line 524
    new-instance v0, Ljava/util/Properties;

    invoke-direct {v0}, Ljava/util/Properties;-><init>()V

    .line 526
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 527
    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->createFile(Ljava/lang/String;)Z

    :cond_0
    const/4 v1, 0x0

    .line 530
    :try_start_0
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p0}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 531
    :try_start_1
    invoke-virtual {v0, v2}, Ljava/util/Properties;->load(Ljava/io/InputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 537
    :try_start_2
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    :catchall_0
    move-exception p0

    move-object v1, v2

    goto :goto_2

    :catch_0
    move-exception p0

    move-object v1, v2

    goto :goto_0

    :catchall_1
    move-exception p0

    goto :goto_2

    :catch_1
    move-exception p0

    .line 533
    :goto_0
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v1, :cond_1

    .line 537
    :try_start_4
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    :catch_2
    move-exception p0

    .line 540
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    :cond_1
    :goto_1
    return-object v0

    :goto_2
    if-eqz v1, :cond_2

    .line 537
    :try_start_5
    invoke-virtual {v1}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_3

    :catch_3
    move-exception v0

    .line 540
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 542
    :cond_2
    :goto_3
    throw p0
.end method

.method public static mergeFile(Ljava/lang/String;Ljava/util/List;)Z
    .locals 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 325
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 328
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 330
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v7, "FileUtil"

    const/4 v8, 0x1

    if-eqz v6, :cond_0

    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, "\u8def\u5f84\u3010%s\u3011\u662f\u6587\u4ef6\u5939\uff0c\u5c06\u5220\u9664\u8be5\u6587\u4ef6\u5939"

    new-array v9, v8, [Ljava/lang/Object;

    aput-object v0, v9, v5

    .line 331
    invoke-static {v6, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 332
    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->deleteDir(Ljava/io/File;)Z

    .line 334
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_1

    .line 335
    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->createFile(Ljava/io/File;)Z

    .line 338
    :cond_1
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 339
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    .line 340
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    const-wide/16 v9, 0x0

    .line 342
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move-wide v15, v9

    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_5

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 343
    new-instance v13, Ljava/io/File;

    invoke-direct {v13, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 344
    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_4

    const-string v2, "\u5408\u5e76\u6587\u4ef6\u5931\u8d25\uff0c\u6587\u4ef6\u3010%s\u3011\u4e0d\u5b58\u5728"

    new-array v3, v8, [Ljava/lang/Object;

    aput-object v9, v3, v5

    .line 345
    invoke-static {v2, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 346
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/io/FileInputStream;

    .line 347
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V

    goto :goto_1

    .line 349
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v4, :cond_3

    .line 366
    :try_start_3
    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->close()V

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_3

    .line 369
    :cond_3
    :goto_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_4

    .line 372
    :goto_3
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_4
    return v5

    .line 353
    :cond_4
    :try_start_4
    new-instance v14, Ljava/io/FileInputStream;

    invoke-direct {v14, v9}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 354
    invoke-virtual {v14}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v10

    .line 355
    invoke-virtual {v13}, Ljava/io/File;->length()J

    move-result-wide v17

    move-object v9, v4

    move-wide v11, v15

    move-object/from16 v19, v13

    move-object/from16 v20, v14

    move-wide/from16 v13, v17

    invoke-virtual/range {v9 .. v14}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J

    .line 356
    invoke-virtual/range {v19 .. v19}, Ljava/io/File;->length()J

    move-result-wide v9

    add-long/2addr v15, v9

    .line 357
    invoke-virtual/range {v20 .. v20}, Ljava/io/FileInputStream;->close()V

    goto :goto_0

    :cond_5
    const-string v0, "\u5408\u5e76\u6587\u4ef6\u8017\u65f6\uff1a%sms"

    new-array v6, v8, [Ljava/lang/Object;

    .line 359
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v9

    sub-long/2addr v9, v2

    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v6, v5

    invoke-static {v0, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v4, :cond_6

    .line 366
    :try_start_5
    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->close()V

    goto :goto_5

    :catch_1
    move-exception v0

    goto :goto_6

    .line 369
    :cond_6
    :goto_5
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_7

    .line 372
    :goto_6
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_7
    return v8

    :catch_2
    move-exception v0

    goto :goto_8

    :catchall_0
    move-exception v0

    move-object v2, v0

    move-object v1, v4

    goto :goto_c

    :catch_3
    move-exception v0

    move-object v1, v4

    .line 362
    :goto_8
    :try_start_6
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-eqz v4, :cond_7

    .line 366
    :try_start_7
    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->close()V

    goto :goto_9

    :catch_4
    move-exception v0

    goto :goto_a

    :cond_7
    :goto_9
    if-eqz v1, :cond_8

    .line 369
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    goto :goto_b

    .line 372
    :goto_a
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_8
    :goto_b
    return v5

    :catchall_1
    move-exception v0

    move-object v2, v0

    :goto_c
    if-eqz v4, :cond_9

    .line 366
    :try_start_8
    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->close()V

    goto :goto_d

    :catch_5
    move-exception v0

    goto :goto_e

    :cond_9
    :goto_d
    if-eqz v1, :cond_a

    .line 369
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    goto :goto_f

    .line 372
    :goto_e
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 374
    :cond_a
    :goto_f
    throw v2
.end method

.method public static mergeSFtpFile(Ljava/lang/String;Ljava/util/List;J)Z
    .locals 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;J)Z"
        }
    .end annotation

    move-object/from16 v0, p0

    .line 388
    new-instance v1, Ljava/io/File;

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 391
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v2

    const/4 v4, 0x0

    const/4 v5, 0x0

    .line 393
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v7, "FileUtil"

    const/4 v8, 0x1

    if-eqz v6, :cond_0

    :try_start_1
    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v6

    if-eqz v6, :cond_0

    const-string v6, "\u8def\u5f84\u3010%s\u3011\u662f\u6587\u4ef6\u5939\uff0c\u5c06\u5220\u9664\u8be5\u6587\u4ef6\u5939"

    new-array v9, v8, [Ljava/lang/Object;

    aput-object v0, v9, v5

    .line 394
    invoke-static {v6, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v7, v6}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 395
    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->deleteDir(Ljava/io/File;)Z

    .line 397
    :cond_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v6

    if-nez v6, :cond_1

    .line 398
    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->createFile(Ljava/io/File;)Z

    .line 401
    :cond_1
    new-instance v6, Ljava/io/FileOutputStream;

    invoke-direct {v6, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 402
    :try_start_2
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4

    .line 403
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    .line 405
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->size()I

    move-result v15

    int-to-long v9, v15

    .line 406
    div-long v16, p2, v9

    .line 407
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v18

    move v13, v5

    :goto_0
    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-interface/range {v18 .. v18}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    .line 408
    new-instance v10, Ljava/io/File;

    invoke-direct {v10, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 409
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    move-result v10

    if-nez v10, :cond_4

    const-string v1, "\u5408\u5e76\u6587\u4ef6\u5931\u8d25\uff0c\u6587\u4ef6\u3010%s\u3011\u4e0d\u5b58\u5728"

    new-array v2, v8, [Ljava/lang/Object;

    aput-object v9, v2, v5

    .line 410
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v7, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 411
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/io/FileInputStream;

    .line 412
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V

    goto :goto_1

    .line 414
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v4, :cond_3

    .line 435
    :try_start_3
    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->close()V

    goto :goto_2

    :catch_0
    move-exception v0

    goto :goto_3

    .line 438
    :cond_3
    :goto_2
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_4

    .line 441
    :goto_3
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_4
    return v5

    :cond_4
    add-int/lit8 v10, v15, -0x1

    if-ne v13, v10, :cond_5

    int-to-long v10, v13

    mul-long v10, v10, v16

    sub-long v10, p2, v10

    move-wide/from16 v19, v10

    goto :goto_5

    :cond_5
    move-wide/from16 v19, v16

    .line 420
    :goto_5
    :try_start_4
    new-instance v14, Ljava/io/FileInputStream;

    invoke-direct {v14, v9}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    .line 421
    invoke-virtual {v14}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v10

    int-to-long v11, v13

    mul-long v11, v11, v19

    move-object v9, v4

    move/from16 v21, v13

    move-object/from16 v22, v14

    move-wide/from16 v13, v19

    .line 422
    invoke-virtual/range {v9 .. v14}, Ljava/nio/channels/FileChannel;->transferFrom(Ljava/nio/channels/ReadableByteChannel;JJ)J

    .line 423
    invoke-virtual/range {v22 .. v22}, Ljava/io/FileInputStream;->close()V

    add-int/lit8 v13, v21, 0x1

    goto :goto_0

    :cond_6
    const-string v0, "\u5408\u5e76\u6587\u4ef6\u8017\u65f6\uff1a%sms\uff0c\u5408\u5e76\u540e\u7684\u6587\u4ef6\u957f\u5ea6\uff1a%s"

    const/4 v9, 0x2

    new-array v9, v9, [Ljava/lang/Object;

    .line 427
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v10

    sub-long/2addr v10, v2

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    aput-object v2, v9, v5

    .line 428
    invoke-virtual {v1}, Ljava/io/File;->length()J

    move-result-wide v1

    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    aput-object v1, v9, v8

    .line 427
    invoke-static {v0, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v7, v0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v4, :cond_7

    .line 435
    :try_start_5
    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->close()V

    goto :goto_6

    :catch_1
    move-exception v0

    goto :goto_7

    .line 438
    :cond_7
    :goto_6
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_8

    .line 441
    :goto_7
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_8
    return v8

    :catch_2
    move-exception v0

    goto :goto_9

    :catchall_0
    move-exception v0

    move-object v1, v0

    move-object v6, v4

    goto :goto_d

    :catch_3
    move-exception v0

    move-object v6, v4

    .line 431
    :goto_9
    :try_start_6
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    if-eqz v4, :cond_8

    .line 435
    :try_start_7
    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->close()V

    goto :goto_a

    :catch_4
    move-exception v0

    goto :goto_b

    :cond_8
    :goto_a
    if-eqz v6, :cond_9

    .line 438
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_4

    goto :goto_c

    .line 441
    :goto_b
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_9
    :goto_c
    return v5

    :catchall_1
    move-exception v0

    move-object v1, v0

    :goto_d
    if-eqz v4, :cond_a

    .line 435
    :try_start_8
    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->close()V

    goto :goto_e

    :catch_5
    move-exception v0

    goto :goto_f

    :cond_a
    :goto_e
    if-eqz v6, :cond_b

    .line 438
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_5

    goto :goto_10

    .line 441
    :goto_f
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 443
    :cond_b
    :goto_10
    throw v1
.end method

.method private static readMountsFile()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 804
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 805
    sget-object v1, Lcom/arialyy/aria/util/FileUtil;->EXTERNAL_STORAGE_PATH:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 807
    :try_start_0
    new-instance v1, Ljava/util/Scanner;

    new-instance v2, Ljava/io/File;

    const-string v3, "/proc/mounts"

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v1, v2}, Ljava/util/Scanner;-><init>(Ljava/io/File;)V

    .line 808
    :cond_0
    :goto_0
    invoke-virtual {v1}, Ljava/util/Scanner;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 809
    invoke-virtual {v1}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v2

    const-string v3, "/dev/block/vold/"

    .line 810
    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_1

    const-string v3, "/dev/block//vold/"

    invoke-virtual {v2, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    :cond_1
    const-string v3, " "

    .line 811
    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    .line 813
    aget-object v2, v2, v3

    .line 816
    sget-object v3, Lcom/arialyy/aria/util/FileUtil;->EXTERNAL_STORAGE_PATH:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 817
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 821
    :cond_2
    invoke-virtual {v1}, Ljava/util/Scanner;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-object v0
.end method

.method public static readObjFromFile(Ljava/lang/String;)Ljava/lang/Object;
    .locals 4

    .line 285
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "FileUtil"

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    const-string p0, "\u6587\u4ef6\u8def\u5f84\u4e3a\u7a7a"

    .line 286
    invoke-static {v1, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2

    .line 289
    :cond_0
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 290
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_1

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p0, v0, v3

    const-string p0, "\u6587\u4ef6\u3010%s\u3011\u4e0d\u5b58\u5728"

    .line 291
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object v2

    .line 296
    :cond_1
    :try_start_0
    new-instance v0, Ljava/io/FileInputStream;

    invoke-direct {v0, p0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_6
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 297
    :try_start_1
    new-instance p0, Ljava/io/ObjectInputStream;

    invoke-direct {p0, v0}, Ljava/io/ObjectInputStream;-><init>(Ljava/io/InputStream;)V

    .line 298
    invoke-virtual {p0}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 308
    :try_start_2
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 310
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-object p0

    :catch_1
    move-exception p0

    goto :goto_1

    :catch_2
    move-exception p0

    goto :goto_2

    :catch_3
    move-exception p0

    goto :goto_3

    :catchall_0
    move-exception p0

    goto :goto_5

    :catch_4
    move-exception p0

    move-object v0, v2

    .line 304
    :goto_1
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/ClassNotFoundException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v0, :cond_2

    .line 308
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_7

    goto :goto_4

    :catch_5
    move-exception p0

    move-object v0, v2

    .line 302
    :goto_2
    :try_start_5
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v0, :cond_2

    .line 308
    :try_start_6
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_7

    goto :goto_4

    :catch_6
    move-exception p0

    move-object v0, v2

    .line 300
    :goto_3
    :try_start_7
    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    if-eqz v0, :cond_2

    .line 308
    :try_start_8
    invoke-virtual {v0}, Ljava/io/FileInputStream;->close()V
    :try_end_8
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_7

    goto :goto_4

    :catch_7
    move-exception p0

    .line 310
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    :cond_2
    :goto_4
    return-object v2

    :catchall_1
    move-exception p0

    move-object v2, v0

    :goto_5
    if-eqz v2, :cond_3

    .line 308
    :try_start_9
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_8

    goto :goto_6

    :catch_8
    move-exception v0

    .line 310
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 313
    :cond_3
    :goto_6
    throw p0
.end method

.method private static readVoldFile()Ljava/util/List;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    const-string v0, ":"

    const-string v1, "mount_point"

    const/4 v2, 0x0

    .line 835
    :try_start_0
    new-instance v3, Ljava/util/Scanner;

    new-instance v4, Ljava/io/File;

    const-string v5, "/system/etc/vold.fstab"

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/util/Scanner;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2

    goto :goto_0

    .line 838
    :catch_0
    :try_start_1
    new-instance v3, Ljava/util/Scanner;

    new-instance v4, Ljava/io/File;

    const-string v5, "/system/etc/vold.conf"

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/util/Scanner;-><init>(Ljava/io/File;)V

    .line 840
    :goto_0
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 841
    :try_start_2
    sget-object v2, Lcom/arialyy/aria/util/FileUtil;->EXTERNAL_STORAGE_PATH:Ljava/lang/String;

    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 842
    :cond_0
    :goto_1
    invoke-virtual {v3}, Ljava/util/Scanner;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    .line 843
    invoke-virtual {v3}, Ljava/util/Scanner;->nextLine()Ljava/lang/String;

    move-result-object v2

    .line 844
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    goto :goto_1

    .line 847
    :cond_1
    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    const-string v5, "dev_mount"

    .line 848
    invoke-virtual {v2, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_4

    const-string v5, " "

    .line 849
    invoke-virtual {v2, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 850
    array-length v5, v2

    const/4 v6, 0x3

    if-ge v5, v6, :cond_2

    goto :goto_1

    :cond_2
    const/4 v5, 0x2

    .line 853
    aget-object v2, v2, v5

    .line 854
    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_3

    const/4 v5, 0x0

    .line 855
    invoke-virtual {v2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 858
    :cond_3
    sget-object v5, Lcom/arialyy/aria/util/FileUtil;->EXTERNAL_STORAGE_PATH:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 859
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 861
    :cond_4
    invoke-virtual {v2, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_0

    const-string v5, ""

    .line 862
    invoke-virtual {v2, v1, v5}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    .line 863
    sget-object v5, Lcom/arialyy/aria/util/FileUtil;->EXTERNAL_STORAGE_PATH:Ljava/lang/String;

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    .line 864
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_1

    :catch_1
    move-object v2, v4

    :catch_2
    move-object v4, v2

    :cond_5
    return-object v4
.end method

.method public static saveConfig(Ljava/io/File;Ljava/util/Properties;)V
    .locals 3

    const/4 v0, 0x0

    .line 552
    :try_start_0
    new-instance v1, Ljava/io/FileOutputStream;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 553
    :try_start_1
    invoke-virtual {p1, v1, v0}, Ljava/util/Properties;->store(Ljava/io/OutputStream;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 559
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->flush()V

    .line 560
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    goto :goto_1

    :catchall_0
    move-exception p0

    move-object v0, v1

    goto :goto_2

    :catch_0
    move-exception p0

    move-object v0, v1

    goto :goto_0

    :catchall_1
    move-exception p0

    goto :goto_2

    :catch_1
    move-exception p0

    .line 555
    :goto_0
    :try_start_3
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v0, :cond_0

    .line 559
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 560
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    goto :goto_1

    :catch_2
    move-exception p0

    .line 563
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    :cond_0
    :goto_1
    return-void

    :goto_2
    if-eqz v0, :cond_1

    .line 559
    :try_start_5
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->flush()V

    .line 560
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_3

    :catch_3
    move-exception p1

    .line 563
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 565
    :cond_1
    :goto_3
    throw p0
.end method

.method public static splitFile(Ljava/lang/String;I)V
    .locals 20

    move/from16 v0, p1

    const-string v1, "FileUtil"

    .line 455
    :try_start_0
    new-instance v2, Ljava/io/File;

    move-object/from16 v3, p0

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 456
    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v3

    .line 457
    new-instance v5, Ljava/io/FileInputStream;

    invoke-direct {v5, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    .line 458
    invoke-virtual {v5}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v6

    const-wide/16 v7, 0x0

    int-to-long v9, v0

    .line 460
    div-long v9, v3, v9

    const/4 v12, 0x0

    :goto_0
    if-ge v12, v0, :cond_4

    add-int/lit8 v13, v0, -0x1

    if-ne v12, v13, :cond_0

    int-to-long v13, v13

    mul-long/2addr v9, v13

    sub-long v9, v3, v9

    .line 465
    :cond_0
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v14, ".part"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    const-string v14, "block = %s"

    const/4 v15, 0x1

    new-array v11, v15, [Ljava/lang/Object;

    .line 466
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v16

    const/16 v17, 0x0

    aput-object v16, v11, v17

    invoke-static {v14, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v1, v11}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 467
    new-instance v11, Ljava/io/File;

    invoke-direct {v11, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 468
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    move-result v13

    if-nez v13, :cond_1

    .line 469
    invoke-static {v11}, Lcom/arialyy/aria/util/FileUtil;->createFile(Ljava/io/File;)Z

    .line 471
    :cond_1
    new-instance v13, Ljava/io/FileOutputStream;

    invoke-direct {v13, v11}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 472
    invoke-virtual {v13}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v14

    const/16 v16, 0x2004

    .line 473
    invoke-static/range {v16 .. v16}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v15

    .line 476
    :goto_1
    invoke-virtual {v6, v15}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v0

    move-object/from16 v16, v2

    const/4 v2, -0x1

    if-eq v0, v2, :cond_3

    .line 477
    invoke-virtual {v15}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 478
    invoke-virtual {v14, v15}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 479
    invoke-virtual {v15}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;

    move-wide/from16 v18, v3

    int-to-long v2, v0

    add-long/2addr v7, v2

    add-int/lit8 v0, v12, 0x1

    int-to-long v2, v0

    mul-long/2addr v2, v9

    cmp-long v0, v7, v2

    if-ltz v0, :cond_2

    goto :goto_2

    :cond_2
    move-object/from16 v2, v16

    move-wide/from16 v3, v18

    goto :goto_1

    :cond_3
    move-wide/from16 v18, v3

    :goto_2
    const-string v0, "len = %s"

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    .line 485
    invoke-virtual {v11}, Ljava/io/File;->length()J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 486
    invoke-virtual {v13}, Ljava/io/FileOutputStream;->close()V

    .line 487
    invoke-virtual {v14}, Ljava/nio/channels/FileChannel;->close()V

    add-int/lit8 v12, v12, 0x1

    move/from16 v0, p1

    move-object/from16 v2, v16

    move-wide/from16 v3, v18

    goto/16 :goto_0

    .line 489
    :cond_4
    invoke-virtual {v5}, Ljava/io/FileInputStream;->close()V

    .line 490
    invoke-virtual {v6}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    .line 494
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    :catch_1
    move-exception v0

    .line 492
    invoke-virtual {v0}, Ljava/io/FileNotFoundException;->printStackTrace()V

    :goto_3
    return-void
.end method

.method public static writeObjToFile(Ljava/lang/String;Ljava/lang/Object;)V
    .locals 2

    .line 251
    instance-of v0, p1, Ljava/io/Serializable;

    if-nez v0, :cond_0

    const-string p0, "FileUtil"

    const-string p1, "\u5bf9\u8c61\u5199\u5165\u6587\u4ef6\u5931\u8d25\uff0cdata\u6570\u636e\u5fc5\u987b\u5b9e\u73b0Serializable\u63a5\u53e3"

    .line 252
    invoke-static {p0, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 257
    :try_start_0
    invoke-static {p0}, Lcom/arialyy/aria/util/FileUtil;->createFile(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1

    return-void

    .line 260
    :cond_1
    new-instance v1, Ljava/io/FileOutputStream;

    invoke-direct {v1, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/FileNotFoundException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 261
    :try_start_1
    new-instance p0, Ljava/io/ObjectOutputStream;

    invoke-direct {p0, v1}, Ljava/io/ObjectOutputStream;-><init>(Ljava/io/OutputStream;)V

    .line 262
    invoke-virtual {p0, p1}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 270
    :try_start_2
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_4

    goto :goto_2

    :catchall_0
    move-exception p0

    move-object v0, v1

    goto :goto_3

    :catch_0
    move-exception p0

    move-object v0, v1

    goto :goto_0

    :catch_1
    move-exception p0

    move-object v0, v1

    goto :goto_1

    :catchall_1
    move-exception p0

    goto :goto_3

    :catch_2
    move-exception p0

    .line 266
    :goto_0
    :try_start_3
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v0, :cond_2

    .line 270
    :try_start_4
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    goto :goto_2

    :catch_3
    move-exception p0

    .line 264
    :goto_1
    :try_start_5
    invoke-virtual {p0}, Ljava/io/FileNotFoundException;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    if-eqz v0, :cond_2

    .line 270
    :try_start_6
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_2

    :catch_4
    move-exception p0

    .line 272
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    :cond_2
    :goto_2
    return-void

    :goto_3
    if-eqz v0, :cond_3

    .line 270
    :try_start_7
    invoke-virtual {v0}, Ljava/io/FileOutputStream;->close()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_5

    goto :goto_4

    :catch_5
    move-exception p1

    .line 272
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 275
    :cond_3
    :goto_4
    throw p0
.end method
