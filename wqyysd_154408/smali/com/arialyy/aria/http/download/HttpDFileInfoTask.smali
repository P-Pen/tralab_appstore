.class final Lcom/arialyy/aria/http/download/HttpDFileInfoTask;
.super Ljava/lang/Object;
.source "HttpDFileInfoTask.java"

# interfaces
.implements Lcom/arialyy/aria/core/loader/IInfoTask;
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arialyy/aria/http/download/HttpDFileInfoTask$FileLenAdapter;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "HttpDFileInfoTask"


# instance fields
.field private callback:Lcom/arialyy/aria/core/loader/IInfoTask$Callback;

.field private mConnectTimeOut:I

.field private mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

.field private mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

.field private taskOption:Lcom/arialyy/aria/http/HttpTaskOption;


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/download/DTaskWrapper;)V
    .locals 1

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    .line 70
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DownloadEntity;

    iput-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 71
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getDConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/DownloadConfig;->getConnectTimeOut()I

    move-result v0

    iput v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mConnectTimeOut:I

    .line 72
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getTaskOption()Lcom/arialyy/aria/core/inf/ITaskOption;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/http/HttpTaskOption;

    iput-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    return-void
.end method

.method private checkLen(J)Z
    .locals 2

    .line 362
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFileSize()J

    move-result-wide v0

    cmp-long p1, p1, v0

    const/4 p2, 0x1

    if-eqz p1, :cond_0

    const-string p1, "HttpDFileInfoTask"

    const-string v0, "\u957f\u5ea6\u4e0d\u4e00\u81f4\uff0c\u4efb\u52a1\u4e3a\u65b0\u4efb\u52a1"

    .line 363
    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 364
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setNewTask(Z)V

    :cond_0
    return p2
.end method

.method private failDownload(Lcom/arialyy/aria/exception/AriaHTTPException;Z)V
    .locals 2

    .line 370
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->callback:Lcom/arialyy/aria/core/loader/IInfoTask$Callback;

    if-eqz v0, :cond_0

    .line 371
    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-interface {v0, v1, p1, p2}, Lcom/arialyy/aria/core/loader/IInfoTask$Callback;->onFail(Lcom/arialyy/aria/core/common/AbsEntity;Lcom/arialyy/aria/exception/AriaException;Z)V

    :cond_0
    return-void
.end method

.method private handleConnect(Ljava/net/HttpURLConnection;)V
    .locals 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 115
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v0}, Lcom/arialyy/aria/http/HttpTaskOption;->getRequestEnum()Lcom/arialyy/aria/core/common/RequestEnum;

    move-result-object v0

    sget-object v1, Lcom/arialyy/aria/core/common/RequestEnum;->POST:Lcom/arialyy/aria/core/common/RequestEnum;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_1

    .line 116
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v0}, Lcom/arialyy/aria/http/HttpTaskOption;->getParams()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 118
    new-instance v1, Ljava/io/OutputStreamWriter;

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 119
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v4

    .line 120
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 121
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 122
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "="

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-static {v6}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "&"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 124
    :cond_0
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 125
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v4

    sub-int/2addr v4, v2

    invoke-virtual {v0, v3, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    .line 126
    invoke-virtual {v1, v0}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 127
    invoke-virtual {v1}, Ljava/io/OutputStreamWriter;->flush()V

    .line 128
    invoke-virtual {v1}, Ljava/io/OutputStreamWriter;->close()V

    .line 132
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v0}, Lcom/arialyy/aria/http/HttpTaskOption;->getFileLenAdapter()Lcom/arialyy/aria/core/processor/IHttpFileLenAdapter;

    move-result-object v0

    const/4 v1, 0x0

    const-string v4, "HttpDFileInfoTask"

    if-nez v0, :cond_2

    .line 134
    new-instance v0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask$FileLenAdapter;

    invoke-direct {v0, v1}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask$FileLenAdapter;-><init>(Lcom/arialyy/aria/http/download/HttpDFileInfoTask$1;)V

    goto :goto_1

    :cond_2
    const-string v5, "\u4f7f\u7528\u81ea\u5b9a\u4e49adapter"

    .line 136
    invoke-static {v4, v5}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 138
    :goto_1
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v0, v5}, Lcom/arialyy/aria/core/processor/IHttpFileLenAdapter;->handleFileLen(Ljava/util/Map;)J

    move-result-wide v5

    .line 140
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0, v5, v6}, Lcom/arialyy/aria/util/FileUtil;->checkMemorySpace(Ljava/lang/String;J)Z

    move-result v0

    const/4 v7, 0x2

    if-nez v0, :cond_3

    .line 141
    new-instance p1, Lcom/arialyy/aria/exception/AriaHTTPException;

    new-array v0, v7, [Ljava/lang/Object;

    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 142
    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 143
    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v2

    const-string v1, "\u4e0b\u8f7d\u5931\u8d25\uff0c\u5185\u5b58\u7a7a\u95f4\u4e0d\u8db3\uff1bfilePath: %s, url: %s"

    .line 142
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;)V

    .line 141
    invoke-direct {p0, p1, v3}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->failDownload(Lcom/arialyy/aria/exception/AriaHTTPException;Z)V

    return-void

    .line 147
    :cond_3
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v0

    .line 149
    iget-object v8, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v8}, Lcom/arialyy/aria/core/download/DownloadEntity;->getMd5Code()Ljava/lang/String;

    move-result-object v8

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_4

    const-string v8, "Content-MD5"

    .line 150
    invoke-virtual {p1, v8}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 151
    iget-object v9, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v9, v8}, Lcom/arialyy/aria/core/download/DownloadEntity;->setMd5Code(Ljava/lang/String;)V

    :cond_4
    const-string v8, "Transfer-Encoding"

    .line 155
    invoke-virtual {p1, v8}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    .line 156
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v9

    if-nez v9, :cond_5

    const-string v9, "chunked"

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_5

    move v8, v2

    goto :goto_2

    :cond_5
    move v8, v3

    .line 159
    :goto_2
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v9

    const-string v10, "Content-Disposition"

    .line 160
    invoke-virtual {p1, v10}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 162
    iget-object v11, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v11}, Lcom/arialyy/aria/http/HttpTaskOption;->isUseServerFileName()Z

    move-result v11

    if-eqz v11, :cond_7

    .line 163
    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v11

    if-nez v11, :cond_6

    .line 164
    iget-object v11, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-static {v10}, Lcom/arialyy/aria/util/CommonUtil;->encryptBASE64(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Lcom/arialyy/aria/core/download/DownloadEntity;->setDisposition(Ljava/lang/String;)V

    .line 165
    invoke-direct {p0, v10}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->handleContentDisposition(Ljava/lang/String;)V

    goto :goto_3

    .line 167
    :cond_6
    iget-object v10, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v10}, Lcom/arialyy/aria/http/HttpTaskOption;->getFileNameAdapter()Lcom/arialyy/aria/core/processor/IHttpFileNameAdapter;

    move-result-object v10

    if-eqz v10, :cond_7

    .line 168
    iget-object v10, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    .line 169
    invoke-virtual {v10}, Lcom/arialyy/aria/http/HttpTaskOption;->getFileNameAdapter()Lcom/arialyy/aria/core/processor/IHttpFileNameAdapter;

    move-result-object v10

    iget-object v11, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v11}, Lcom/arialyy/aria/core/download/DownloadEntity;->getKey()Ljava/lang/String;

    move-result-object v11

    invoke-interface {v10, v9, v11}, Lcom/arialyy/aria/core/processor/IHttpFileNameAdapter;->handleFileName(Ljava/util/Map;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    .line 170
    iget-object v11, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v11, v10}, Lcom/arialyy/aria/core/download/DownloadEntity;->setServerFileName(Ljava/lang/String;)V

    .line 171
    invoke-direct {p0, v10}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->renameFile(Ljava/lang/String;)V

    .line 176
    :cond_7
    :goto_3
    new-instance v10, Ljava/net/CookieManager;

    invoke-direct {v10}, Ljava/net/CookieManager;-><init>()V

    const-string v11, "Set-Cookie"

    .line 177
    invoke-interface {v9, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/List;

    if-eqz v9, :cond_9

    .line 180
    invoke-interface {v9}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_4
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_8

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 181
    invoke-virtual {v10}, Ljava/net/CookieManager;->getCookieStore()Ljava/net/CookieStore;

    move-result-object v12

    invoke-static {v11}, Ljava/net/HttpCookie;->parse(Ljava/lang/String;)Ljava/util/List;

    move-result-object v11

    invoke-interface {v11, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/net/HttpCookie;

    invoke-interface {v12, v1, v11}, Ljava/net/CookieStore;->add(Ljava/net/URI;Ljava/net/HttpCookie;)V

    goto :goto_4

    .line 183
    :cond_8
    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v1, v10}, Lcom/arialyy/aria/http/HttpTaskOption;->setCookieManager(Ljava/net/CookieManager;)V

    .line 186
    :cond_9
    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v1, v0}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setCode(I)V

    const/16 v1, 0xce

    const-string v9, "\u4efb\u52a1\u4e0b\u8f7d\u5931\u8d25\uff0c\u6587\u4ef6\u957f\u5ea6\u5c0f\u4e8e0\uff0c url: %s"

    const-wide/16 v10, 0x0

    if-ne v0, v1, :cond_c

    .line 188
    invoke-direct {p0, v5, v6}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->checkLen(J)Z

    move-result p1

    if-nez p1, :cond_b

    if-nez v8, :cond_b

    cmp-long p1, v5, v10

    if-gez p1, :cond_a

    .line 190
    new-instance p1, Lcom/arialyy/aria/exception/AriaHTTPException;

    new-array v0, v2, [Ljava/lang/Object;

    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 191
    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v9, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;)V

    .line 190
    invoke-direct {p0, p1, v3}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->failDownload(Lcom/arialyy/aria/exception/AriaHTTPException;Z)V

    :cond_a
    return-void

    .line 196
    :cond_b
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {p1, v5, v6}, Lcom/arialyy/aria/core/download/DownloadEntity;->setFileSize(J)V

    .line 197
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {p1, v2}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setSupportBP(Z)V

    goto/16 :goto_8

    :cond_c
    const/16 v1, 0xc8

    if-ne v0, v1, :cond_12

    const-string v1, "Content-Type"

    .line 200
    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 201
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_d

    return-void

    :cond_d
    const-string v7, "text/html"

    .line 204
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    .line 205
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    .line 206
    invoke-static {p1}, Lcom/arialyy/aria/http/ConnectionHelp;->convertInputStream(Ljava/net/HttpURLConnection;)Ljava/io/InputStream;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 207
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 209
    :goto_5
    invoke-virtual {v0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_e

    .line 210
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_5

    .line 212
    :cond_e
    invoke-virtual {v0}, Ljava/io/BufferedReader;->close()V

    .line 213
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getWindowReplaceUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, p1, v0}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->handleUrlReTurn(Ljava/net/HttpURLConnection;Ljava/lang/String;)V

    return-void

    .line 215
    :cond_f
    invoke-direct {p0, v5, v6}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->checkLen(J)Z

    move-result p1

    if-nez p1, :cond_11

    if-nez v8, :cond_11

    cmp-long p1, v5, v10

    if-gez p1, :cond_10

    .line 217
    new-instance p1, Lcom/arialyy/aria/exception/AriaHTTPException;

    new-array v0, v2, [Ljava/lang/Object;

    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 219
    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v3

    invoke-static {v9, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;)V

    .line 217
    invoke-direct {p0, p1, v3}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->failDownload(Lcom/arialyy/aria/exception/AriaHTTPException;Z)V

    :cond_10
    const-string p1, "len < 0"

    .line 222
    invoke-static {v4, p1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 225
    :cond_11
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {p1, v5, v6}, Lcom/arialyy/aria/core/download/DownloadEntity;->setFileSize(J)V

    .line 226
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {p1, v2}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setNewTask(Z)V

    .line 227
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {p1, v3}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setSupportBP(Z)V

    goto/16 :goto_8

    :cond_12
    const/16 v1, 0x12e

    if-eq v0, v1, :cond_16

    const/16 v1, 0x12d

    if-eq v0, v1, :cond_16

    const/16 v1, 0x12f

    if-eq v0, v1, :cond_16

    const/16 v1, 0xc9

    if-eq v0, v1, :cond_16

    const/16 v1, 0x133

    if-ne v0, v1, :cond_13

    goto :goto_6

    :cond_13
    const/16 v1, 0x1a0

    if-ne v0, v1, :cond_14

    const-string p1, "\u6587\u4ef6\u957f\u5ea6\u4e3a0\uff0c\u4e0d\u652f\u6301\u65ad\u70b9"

    .line 236
    invoke-static {v4, p1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 237
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {p1, v3}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setSupportBP(Z)V

    .line 238
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {p1, v2}, Lcom/arialyy/aria/core/download/DTaskWrapper;->setNewTask(Z)V

    goto :goto_8

    :cond_14
    const/16 v1, 0x190

    if-lt v0, v1, :cond_15

    .line 241
    new-instance p1, Lcom/arialyy/aria/exception/AriaHTTPException;

    new-array v1, v7, [Ljava/lang/Object;

    .line 242
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v1, v3

    iget-object v4, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v4}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    const-string v2, "\u4efb\u52a1\u4e0b\u8f7d\u5931\u8d25\uff0cerrorCode\uff1a%s, url: %s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, v1}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;)V

    .line 241
    invoke-direct {p0, p1, v3}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->failDownload(Lcom/arialyy/aria/exception/AriaHTTPException;Z)V

    goto :goto_7

    .line 244
    :cond_15
    new-instance v1, Lcom/arialyy/aria/exception/AriaHTTPException;

    const/4 v4, 0x3

    new-array v4, v4, [Ljava/lang/Object;

    .line 245
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v3

    .line 246
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v2

    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object p1

    aput-object p1, v4, v7

    const-string p1, "\u4efb\u52a1\u4e0b\u8f7d\u5931\u8d25\uff0cerrorCode\uff1a%s, errorMsg: %s, url: %s"

    .line 245
    invoke-static {p1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;)V

    .line 246
    invoke-static {v0}, Lcom/arialyy/aria/util/CheckUtil;->httpIsBadRequest(I)Z

    move-result p1

    xor-int/2addr p1, v2

    .line 244
    invoke-direct {p0, v1, p1}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->failDownload(Lcom/arialyy/aria/exception/AriaHTTPException;Z)V

    goto :goto_7

    :cond_16
    :goto_6
    const-string v1, "Location"

    .line 234
    invoke-virtual {p1, v1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, p1, v1}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->handleUrlReTurn(Ljava/net/HttpURLConnection;Ljava/lang/String;)V

    :goto_7
    move v2, v3

    :goto_8
    if-eqz v2, :cond_18

    .line 249
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {p1, v8}, Lcom/arialyy/aria/http/HttpTaskOption;->setChunked(Z)V

    .line 250
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->callback:Lcom/arialyy/aria/core/loader/IInfoTask$Callback;

    if-eqz p1, :cond_17

    .line 251
    new-instance p1, Lcom/arialyy/aria/core/common/CompleteInfo;

    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-direct {p1, v0, v1}, Lcom/arialyy/aria/core/common/CompleteInfo;-><init>(ILcom/arialyy/aria/core/wrapper/ITaskWrapper;)V

    .line 252
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->callback:Lcom/arialyy/aria/core/loader/IInfoTask$Callback;

    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Lcom/arialyy/aria/core/loader/IInfoTask$Callback;->onSucceed(Ljava/lang/String;Lcom/arialyy/aria/core/common/CompleteInfo;)V

    .line 254
    :cond_17
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->update()V

    :cond_18
    return-void
.end method

.method private handleContentDisposition(Ljava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;
        }
    .end annotation

    const-string v0, ";"

    .line 265
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 266
    invoke-virtual {p1, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    .line 267
    aget-object v1, p1, v0

    const-string v2, "attachment"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const-string v2, ""

    const-string v3, "\""

    const-string v4, "utf-8"

    const-string v5, "="

    const/4 v6, 0x1

    if-eqz v1, :cond_1

    .line 268
    array-length v1, p1

    :goto_0
    if-ge v0, v1, :cond_3

    aget-object v7, p1, v0

    const-string v8, "filename"

    .line 269
    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_0

    invoke-virtual {v7, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_0

    .line 270
    invoke-virtual {v7, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 271
    array-length v8, v7

    if-le v8, v6, :cond_0

    .line 272
    aget-object p1, v7, v6

    invoke-static {p1, v4}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 273
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->setServerFileName(Ljava/lang/String;)V

    .line 274
    invoke-direct {p0, p1}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->renameFile(Ljava/lang/String;)V

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 279
    :cond_1
    aget-object v0, p1, v0

    const-string v1, "form-data"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    array-length v0, p1

    const/4 v1, 0x2

    if-le v0, v1, :cond_2

    .line 280
    aget-object p1, p1, v1

    invoke-virtual {p1, v5}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    .line 281
    array-length v0, p1

    if-le v0, v6, :cond_3

    .line 282
    aget-object p1, p1, v6

    invoke-static {p1, v4}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1, v3, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 283
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->setServerFileName(Ljava/lang/String;)V

    .line 284
    invoke-direct {p0, p1}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->renameFile(Ljava/lang/String;)V

    goto :goto_1

    :cond_2
    const-string p1, "HttpDFileInfoTask"

    const-string v0, "\u4e0d\u8bc6\u522b\u7684Content-Disposition\u53c2\u6570"

    .line 287
    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    :cond_3
    :goto_1
    return-void
.end method

.method private handleUrlReTurn(Ljava/net/HttpURLConnection;Ljava/lang/String;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 320
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "30x\u8df3\u8f6c\uff0c\u65b0url\u4e3a\u3010"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\u3011"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HttpDFileInfoTask"

    invoke-static {v1, v0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 321
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    const-string v0, "null"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto/16 :goto_0

    :cond_0
    const-string v0, "/"

    .line 327
    invoke-virtual {p2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 328
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    .line 329
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    .line 332
    :cond_1
    invoke-static {p2}, Lcom/arialyy/aria/util/CheckUtil;->checkUrl(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 333
    new-instance p1, Lcom/arialyy/aria/exception/AriaHTTPException;

    const-string p2, "\u4e0b\u8f7d\u5931\u8d25\uff0c\u91cd\u5b9a\u5411url\u9519\u8bef"

    invoke-direct {p1, p2}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;)V

    invoke-direct {p0, p1, v1}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->failDownload(Lcom/arialyy/aria/exception/AriaHTTPException;Z)V

    return-void

    .line 336
    :cond_2
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v0, p2}, Lcom/arialyy/aria/http/HttpTaskOption;->setRedirectUrl(Ljava/lang/String;)V

    .line 337
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/download/DownloadEntity;->setRedirect(Z)V

    .line 338
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0, p2}, Lcom/arialyy/aria/core/download/DownloadEntity;->setRedirectUrl(Ljava/lang/String;)V

    const-string v0, "Set-Cookie"

    .line 339
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 340
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 341
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-static {p2, p1}, Lcom/arialyy/aria/http/ConnectionHelp;->handleUrl(Ljava/lang/String;Lcom/arialyy/aria/http/HttpTaskOption;)Ljava/net/URL;

    move-result-object p1

    .line 342
    iget-object p2, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-static {p1, p2}, Lcom/arialyy/aria/http/ConnectionHelp;->handleConnection(Ljava/net/URL;Lcom/arialyy/aria/http/HttpTaskOption;)Ljava/net/HttpURLConnection;

    move-result-object p1

    .line 343
    iget-object p2, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-static {p2, p1}, Lcom/arialyy/aria/http/ConnectionHelp;->setConnectParam(Lcom/arialyy/aria/http/HttpTaskOption;Ljava/net/HttpURLConnection;)Ljava/net/HttpURLConnection;

    const-string p2, "Cookie"

    .line 344
    invoke-virtual {p1, p2, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p2, "Range"

    const-string v0, "bytes=0-"

    .line 345
    invoke-virtual {p1, p2, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object p2

    invoke-virtual {p2}, Lcom/arialyy/aria/core/AriaConfig;->getDConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object p2

    invoke-virtual {p2}, Lcom/arialyy/aria/core/config/DownloadConfig;->isUseHeadRequest()Z

    move-result p2

    if-eqz p2, :cond_3

    const-string p2, "HEAD"

    .line 347
    invoke-virtual {p1, p2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 349
    :cond_3
    iget p2, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mConnectTimeOut:I

    invoke-virtual {p1, p2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 350
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->connect()V

    .line 351
    invoke-direct {p0, p1}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->handleConnect(Ljava/net/HttpURLConnection;)V

    .line 352
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void

    .line 322
    :cond_4
    :goto_0
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->callback:Lcom/arialyy/aria/core/loader/IInfoTask$Callback;

    if-eqz p1, :cond_5

    .line 323
    iget-object p2, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    new-instance v0, Lcom/arialyy/aria/exception/AriaHTTPException;

    const-string v2, "\u83b7\u53d6\u91cd\u5b9a\u5411\u94fe\u63a5\u5931\u8d25"

    invoke-direct {v0, v2}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, p2, v0, v1}, Lcom/arialyy/aria/core/loader/IInfoTask$Callback;->onFail(Lcom/arialyy/aria/core/common/AbsEntity;Lcom/arialyy/aria/exception/AriaException;Z)V

    :cond_5
    return-void
.end method

.method private renameFile(Ljava/lang/String;)V
    .locals 6

    .line 296
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const-string v1, "HttpDFileInfoTask"

    if-eqz v0, :cond_0

    const-string p1, "\u91cd\u547d\u540d\u5931\u8d25\u3010\u670d\u52a1\u5668\u8fd4\u56de\u7684\u6587\u4ef6\u540d\u4e3a\u7a7a\u3011"

    .line 297
    invoke-static {v1, p1}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x1

    new-array v2, v0, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "\u6587\u4ef6\u91cd\u547d\u540d\u4e3a\uff1a%s"

    .line 300
    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 301
    new-instance v2, Ljava/io/File;

    iget-object v4, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v4}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 302
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v5, "/"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 303
    iget-object v5, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v5}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getRequestType()I

    move-result v5

    invoke-static {v3, v4, v5}, Lcom/arialyy/aria/util/CheckUtil;->checkDPathConflicts(ZLjava/lang/String;I)Z

    move-result v5

    if-nez v5, :cond_1

    const-string p1, "\u6587\u4ef6\u91cd\u547d\u540d\u5931\u8d25"

    .line 304
    invoke-static {v1, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 307
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v5

    if-eqz v5, :cond_3

    .line 308
    new-instance v5, Ljava/io/File;

    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v5

    new-array v0, v0, [Ljava/lang/Object;

    if-eqz v5, :cond_2

    const-string v5, "\u6210\u529f"

    goto :goto_0

    :cond_2
    const-string v5, "\u5931\u8d25"

    :goto_0
    aput-object v5, v0, v3

    const-string v3, "\u6587\u4ef6\u91cd\u547d\u540d%s"

    .line 309
    invoke-static {v3, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 311
    :cond_3
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->setFileName(Ljava/lang/String;)V

    .line 312
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {p1, v4}, Lcom/arialyy/aria/core/download/DownloadEntity;->setFilePath(Ljava/lang/String;)Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 313
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadEntity;->getTaskType()I

    move-result v0

    invoke-static {p1, v4, v0}, Lcom/arialyy/aria/util/RecordUtil;->modifyTaskRecord(Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public accept(Lcom/arialyy/aria/core/loader/ILoaderVisitor;)V
    .locals 0

    .line 376
    invoke-interface {p1, p0}, Lcom/arialyy/aria/core/loader/ILoaderVisitor;->addComponent(Lcom/arialyy/aria/core/loader/IInfoTask;)V

    return-void
.end method

.method public run()V
    .locals 7

    const/16 v0, 0xa

    .line 76
    invoke-static {v0}, Landroid/os/Process;->setThreadPriority(I)V

    .line 77
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v0

    invoke-static {v0}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    const/4 v0, 0x0

    .line 80
    :try_start_0
    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-static {v1, v2}, Lcom/arialyy/aria/http/ConnectionHelp;->handleUrl(Ljava/lang/String;Lcom/arialyy/aria/http/HttpTaskOption;)Ljava/net/URL;

    move-result-object v1

    .line 81
    iget-object v2, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-static {v1, v2}, Lcom/arialyy/aria/http/ConnectionHelp;->handleConnection(Ljava/net/URL;Lcom/arialyy/aria/http/HttpTaskOption;)Ljava/net/HttpURLConnection;

    move-result-object v0

    .line 82
    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->taskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-static {v1, v0}, Lcom/arialyy/aria/http/ConnectionHelp;->setConnectParam(Lcom/arialyy/aria/http/HttpTaskOption;Ljava/net/HttpURLConnection;)Ljava/net/HttpURLConnection;

    const-string v1, "Range"

    const-string v2, "bytes=0-"

    .line 83
    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/AriaConfig;->getDConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/config/DownloadConfig;->isUseHeadRequest()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "HttpDFileInfoTask"

    const-string v2, "head\u8bf7\u6c42"

    .line 85
    invoke-static {v1, v2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v1, "HEAD"

    .line 86
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 88
    :cond_0
    iget v1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mConnectTimeOut:I

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 89
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->connect()V

    .line 90
    invoke-direct {p0, v0}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->handleConnect(Ljava/net/HttpURLConnection;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_2

    .line 98
    :try_start_1
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 100
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_2

    :catch_1
    move-exception v1

    .line 92
    :try_start_2
    new-instance v2, Lcom/arialyy/aria/exception/AriaHTTPException;

    const-string v3, "\u4e0b\u8f7d\u5931\u8d25\uff0cfilePath: %s, url: %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 93
    invoke-virtual {v6}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    iget-object v5, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->mEntity:Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {v5}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v4, v6

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3, v1}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 92
    invoke-direct {p0, v2, v6}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->failDownload(Lcom/arialyy/aria/exception/AriaHTTPException;Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v0, :cond_2

    .line 98
    :try_start_3
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    if-eqz v1, :cond_1

    .line 100
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    goto :goto_1

    :catch_2
    move-exception v1

    .line 103
    :goto_0
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 105
    :cond_1
    :goto_1
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_2
    return-void

    :goto_2
    if-eqz v0, :cond_4

    .line 98
    :try_start_4
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 100
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_3

    :catch_3
    move-exception v2

    .line 103
    invoke-virtual {v2}, Ljava/io/IOException;->printStackTrace()V

    .line 105
    :cond_3
    :goto_3
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 107
    :cond_4
    throw v1
.end method

.method public setCallback(Lcom/arialyy/aria/core/loader/IInfoTask$Callback;)V
    .locals 0

    .line 111
    iput-object p1, p0, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->callback:Lcom/arialyy/aria/core/loader/IInfoTask$Callback;

    return-void
.end method
