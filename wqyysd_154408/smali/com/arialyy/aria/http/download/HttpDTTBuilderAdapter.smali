.class final Lcom/arialyy/aria/http/download/HttpDTTBuilderAdapter;
.super Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;
.source "HttpDTTBuilderAdapter.java"


# direct methods
.method constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Lcom/arialyy/aria/core/loader/AbsNormalTTBuilderAdapter;-><init>()V

    return-void
.end method


# virtual methods
.method public getAdapter(Lcom/arialyy/aria/core/common/SubThreadConfig;)Lcom/arialyy/aria/core/task/IThreadTaskAdapter;
    .locals 1

    .line 17
    new-instance v0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;

    invoke-direct {v0, p1}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;-><init>(Lcom/arialyy/aria/core/common/SubThreadConfig;)V

    return-object v0
.end method

.method public handleNewTask(Lcom/arialyy/aria/core/TaskRecord;I)Z
    .locals 8

    .line 21
    iget-boolean v0, p1, Lcom/arialyy/aria/core/TaskRecord;->isBlock:Z

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v0, :cond_0

    .line 22
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDTTBuilderAdapter;->getTempFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 23
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDTTBuilderAdapter;->getTempFile()Ljava/io/File;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/io/File;)Z

    goto :goto_1

    :cond_0
    move v0, v2

    :goto_0
    if-ge v0, p2, :cond_2

    .line 27
    new-instance v4, Ljava/io/File;

    new-array v5, v1, [Ljava/lang/Object;

    .line 28
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDTTBuilderAdapter;->getTempFile()Ljava/io/File;

    move-result-object v6

    invoke-virtual {v6}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    const-string v6, "%s.%s.part"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 29
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 30
    iget-object v5, p0, Lcom/arialyy/aria/http/download/HttpDTTBuilderAdapter;->TAG:Ljava/lang/String;

    new-array v6, v3, [Ljava/lang/Object;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v2

    const-string v7, "\u5206\u5757\u3010%s\u3011\u5df2\u7ecf\u5b58\u5728\uff0c\u5c06\u5220\u9664\u8be5\u5206\u5757"

    invoke-static {v7, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v5, v6}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    invoke-static {v4}, Lcom/arialyy/aria/util/FileUtil;->deleteFile(Ljava/io/File;)Z

    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_2
    :goto_1
    const/4 v0, 0x0

    if-le p2, v3, :cond_5

    .line 37
    :try_start_0
    iget-boolean p1, p1, Lcom/arialyy/aria/core/TaskRecord;->isBlock:Z

    if-nez p1, :cond_5

    .line 38
    new-instance p1, Lcom/arialyy/aria/util/BufferedRandomAccessFile;

    new-instance p2, Ljava/io/File;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDTTBuilderAdapter;->getTempFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v4, "rwd"

    const/16 v5, 0x2000

    invoke-direct {p1, p2, v4, v5}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 40
    :try_start_1
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDTTBuilderAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object p2

    invoke-virtual {p2}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFileSize()J

    move-result-wide v4

    invoke-virtual {p1, v4, v5}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->setLength(J)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    move-object v0, p1

    goto :goto_6

    :catchall_0
    move-exception p2

    move-object v0, p1

    goto :goto_4

    :catch_0
    move-exception p2

    move-object v0, p1

    goto :goto_2

    :catchall_1
    move-exception p2

    goto :goto_4

    :catch_1
    move-exception p2

    .line 44
    :goto_2
    :try_start_2
    invoke-virtual {p2}, Ljava/io/IOException;->printStackTrace()V

    .line 45
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDTTBuilderAdapter;->TAG:Ljava/lang/String;

    const-string p2, "\u4e0b\u8f7d\u5931\u8d25\uff0cfilePath: %s, url: %s"

    new-array v1, v1, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDTTBuilderAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFilePath()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    .line 46
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDTTBuilderAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getUrl()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v3

    .line 45
    invoke-static {p2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-eqz v0, :cond_3

    .line 50
    :try_start_3
    invoke-virtual {v0}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_3

    :catch_2
    move-exception p1

    .line 52
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_3
    :goto_3
    return v2

    :goto_4
    if-eqz v0, :cond_4

    .line 50
    :try_start_4
    invoke-virtual {v0}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_5

    :catch_3
    move-exception p1

    .line 52
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 55
    :cond_4
    :goto_5
    throw p2

    :cond_5
    :goto_6
    if-eqz v0, :cond_6

    .line 50
    :try_start_5
    invoke-virtual {v0}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4

    goto :goto_7

    :catch_4
    move-exception p1

    .line 52
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_6
    :goto_7
    return v3
.end method
