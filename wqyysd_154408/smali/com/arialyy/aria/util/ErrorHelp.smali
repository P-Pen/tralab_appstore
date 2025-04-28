.class public Lcom/arialyy/aria/util/ErrorHelp;
.super Ljava/lang/Object;
.source "ErrorHelp.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static getData(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    .line 86
    new-instance v0, Ljava/util/Date;

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 87
    new-instance v1, Ljava/text/SimpleDateFormat;

    invoke-direct {v1, p0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 88
    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static getLogPath()Ljava/lang/String;
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    .line 49
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/arialyy/aria/util/CommonUtil;->getAppPath(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "yyyy-MM-dd_HH_mm_ss"

    .line 50
    invoke-static {v1}, Lcom/arialyy/aria/util/ErrorHelp;->getData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    const-string v1, "%slog/AriaCrash_%s.log"

    .line 48
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    .line 52
    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->createFile(Ljava/lang/String;)Z

    return-object v0
.end method

.method public static saveError(Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 p0, 0x1

    aput-object p1, v0, p0

    const-string p0, "\nmsg\u3010%s\u3011\nException\uff1a%s"

    .line 39
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/arialyy/aria/util/ErrorHelp;->writeLogToFile(Ljava/lang/String;)I

    return-void
.end method

.method private static writeLogToFile(Ljava/lang/String;)I
    .locals 5

    .line 60
    new-instance v0, Ljava/lang/StringBuffer;

    invoke-direct {v0}, Ljava/lang/StringBuffer;-><init>()V

    const-string v1, "yyyy-MM-dd HH:mm:ss"

    .line 61
    invoke-static {v1}, Lcom/arialyy/aria/util/ErrorHelp;->getData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string v1, "    "

    .line 62
    invoke-virtual {v0, v1}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    .line 63
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const-string p0, "\n\n"

    .line 64
    invoke-virtual {v0, p0}, Ljava/lang/StringBuffer;->append(Ljava/lang/String;)Ljava/lang/StringBuffer;

    const/4 p0, 0x0

    .line 67
    :try_start_0
    new-instance v1, Ljava/io/File;

    invoke-static {}, Lcom/arialyy/aria/util/ErrorHelp;->getLogPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 68
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 69
    invoke-static {v1}, Lcom/arialyy/aria/util/FileUtil;->createFile(Ljava/io/File;)Z

    .line 71
    :cond_0
    new-instance v2, Ljava/io/PrintWriter;

    new-instance v3, Ljava/io/FileWriter;

    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x1

    invoke-direct {v3, v1, v4}, Ljava/io/FileWriter;-><init>(Ljava/lang/String;Z)V

    invoke-direct {v2, v3}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 72
    :try_start_1
    invoke-virtual {v2, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 73
    invoke-virtual {v2}, Ljava/io/PrintWriter;->flush()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    invoke-virtual {v2}, Ljava/io/PrintWriter;->close()V

    goto :goto_1

    :catchall_0
    move-exception v0

    move-object p0, v2

    goto :goto_2

    :catch_0
    move-exception v0

    move-object p0, v2

    goto :goto_0

    :catchall_1
    move-exception v0

    goto :goto_2

    :catch_1
    move-exception v0

    .line 75
    :goto_0
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz p0, :cond_1

    .line 78
    invoke-virtual {p0}, Ljava/io/PrintWriter;->close()V

    :cond_1
    :goto_1
    const/4 p0, 0x0

    return p0

    :goto_2
    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/io/PrintWriter;->close()V

    .line 80
    :cond_2
    throw v0
.end method
