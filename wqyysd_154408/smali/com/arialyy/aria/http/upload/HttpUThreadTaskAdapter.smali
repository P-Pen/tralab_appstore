.class final Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;
.super Lcom/arialyy/aria/http/BaseHttpThreadTaskAdapter;
.source "HttpUThreadTaskAdapter.java"


# instance fields
.field private final BOUNDARY:Ljava/lang/String;

.field private final LINE_END:Ljava/lang/String;

.field private final PREFIX:Ljava/lang/String;

.field private mHttpConn:Ljava/net/HttpURLConnection;

.field private mOutputStream:Ljava/io/OutputStream;


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/common/SubThreadConfig;)V
    .locals 0

    .line 53
    invoke-direct {p0, p1}, Lcom/arialyy/aria/http/BaseHttpThreadTaskAdapter;-><init>(Lcom/arialyy/aria/core/common/SubThreadConfig;)V

    .line 47
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->BOUNDARY:Ljava/lang/String;

    const-string p1, "--"

    .line 48
    iput-object p1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->PREFIX:Ljava/lang/String;

    const-string p1, "\r\n"

    iput-object p1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->LINE_END:Ljava/lang/String;

    return-void
.end method

.method private addFormField(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    const-string v0, "--"

    .line 143
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->BOUNDARY:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    const-string v1, "\r\n"

    invoke-virtual {v0, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    const-string v0, "Content-Disposition: form-data; name=\""

    .line 144
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v0

    .line 145
    invoke-virtual {v0, p2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    const-string v0, "\""

    .line 146
    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    .line 147
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    const-string p2, "Content-Type: text/plain; charset="

    .line 148
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    iget-object v0, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    .line 149
    invoke-virtual {v0}, Lcom/arialyy/aria/http/HttpTaskOption;->getCharSet()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    .line 150
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 151
    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 152
    invoke-virtual {p1, p3}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 153
    invoke-virtual {p1}, Ljava/io/PrintWriter;->flush()V

    return-void
.end method

.method private fail(Lcom/arialyy/aria/exception/AriaHTTPException;)V
    .locals 1

    const/4 v0, 0x0

    .line 116
    :try_start_0
    invoke-virtual {p0, p1, v0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->fail(Lcom/arialyy/aria/exception/AriaException;Z)V

    .line 117
    iget-object p1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mOutputStream:Ljava/io/OutputStream;

    if-eqz p1, :cond_0

    .line 118
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 121
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method private finish(Ljava/io/PrintWriter;)Ljava/lang/String;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 206
    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    .line 209
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v2, Ljava/io/InputStreamReader;

    iget-object v3, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    .line 210
    invoke-static {v3}, Lcom/arialyy/aria/http/ConnectionHelp;->convertInputStream(Ljava/net/HttpURLConnection;)Ljava/io/InputStream;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v2}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 212
    :goto_0
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getThreadTask()Lcom/arialyy/aria/core/task/IThreadTask;

    move-result-object v2

    invoke-interface {v2}, Lcom/arialyy/aria/core/task/IThreadTask;->isLive()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 213
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 215
    :cond_0
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V

    .line 216
    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 217
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->complete()V

    goto :goto_1

    .line 219
    :cond_1
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "response msg: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "\uff0ccode: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 220
    iget-object v3, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->TAG:Ljava/lang/String;

    invoke-static {v3, v2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 221
    new-instance v3, Lcom/arialyy/aria/exception/AriaHTTPException;

    invoke-direct {v3, v2}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;)V

    const/4 v2, 0x0

    invoke-virtual {p0, v3, v2}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->fail(Lcom/arialyy/aria/exception/AriaException;Z)V

    .line 222
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 224
    :goto_1
    invoke-virtual {p1}, Ljava/io/PrintWriter;->flush()V

    .line 225
    invoke-virtual {p1}, Ljava/io/PrintWriter;->close()V

    .line 226
    iget-object p1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mOutputStream:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V

    .line 227
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private getContentType()Ljava/lang/String;
    .locals 1

    const-string v0, "multipart/form-data"

    return-object v0
.end method

.method private getUserAgent()Ljava/lang/String;
    .locals 2

    .line 133
    iget-object v0, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v0}, Lcom/arialyy/aria/http/HttpTaskOption;->getHeaders()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    .line 134
    invoke-virtual {v0}, Lcom/arialyy/aria/http/HttpTaskOption;->getHeaders()Ljava/util/Map;

    move-result-object v0

    const-string v1, "User-Agent"

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/CharSequence;

    .line 133
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    .line 136
    invoke-virtual {v0}, Lcom/arialyy/aria/http/HttpTaskOption;->getHeaders()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    goto :goto_1

    :cond_1
    :goto_0
    const-string v0, "Mozilla/5.0 (Windows; U; Windows NT 6.1; zh-CN; rv:1.9.2.6)"

    :goto_1
    return-object v0
.end method

.method private uploadFile(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/io/File;)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "--"

    .line 164
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v1

    iget-object v2, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->BOUNDARY:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v1

    const-string v2, "\r\n"

    invoke-virtual {v1, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    const-string v1, "Content-Disposition: form-data; name=\""

    .line 165
    invoke-virtual {p1, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object v1

    .line 166
    invoke-virtual {v1, p2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    const-string v1, "\"; filename=\""

    .line 167
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    .line 168
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/upload/UploadEntity;->getFileName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    const-string v1, "\""

    .line 169
    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    .line 170
    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    const-string p2, "Content-Type: "

    .line 171
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    .line 172
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/upload/UploadEntity;->getFileName()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/net/URLConnection;->guessContentTypeFromName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    .line 173
    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    const-string p2, "Content-Transfer-Encoding: binary"

    .line 174
    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    invoke-virtual {p2, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 175
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    .line 176
    invoke-virtual {p1}, Ljava/io/PrintWriter;->flush()V

    .line 178
    new-instance p2, Ljava/io/FileInputStream;

    invoke-direct {p2, p3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    const/16 p3, 0x1000

    new-array p3, p3, [B

    .line 181
    :cond_0
    :goto_0
    invoke-virtual {p2, p3}, Ljava/io/FileInputStream;->read([B)I

    move-result v1

    const/4 v3, -0x1

    if-eq v1, v3, :cond_2

    .line 182
    iget-object v3, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mOutputStream:Ljava/io/OutputStream;

    const/4 v4, 0x0

    invoke-virtual {v3, p3, v4, v1}, Ljava/io/OutputStream;->write([BII)V

    int-to-long v3, v1

    .line 183
    invoke-virtual {p0, v3, v4}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->progress(J)V

    .line 184
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getThreadTask()Lcom/arialyy/aria/core/task/IThreadTask;

    move-result-object v3

    invoke-interface {v3}, Lcom/arialyy/aria/core/task/IThreadTask;->isBreak()Z

    move-result v3

    if-eqz v3, :cond_1

    goto :goto_1

    .line 187
    :cond_1
    iget-object v3, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mSpeedBandUtil:Lcom/arialyy/aria/util/BandwidthLimiter;

    if-eqz v3, :cond_0

    .line 188
    iget-object v3, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mSpeedBandUtil:Lcom/arialyy/aria/util/BandwidthLimiter;

    invoke-virtual {v3, v1}, Lcom/arialyy/aria/util/BandwidthLimiter;->limitNextBytes(I)V

    goto :goto_0

    .line 192
    :cond_2
    :goto_1
    iget-object p3, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mOutputStream:Ljava/io/OutputStream;

    invoke-virtual {p3}, Ljava/io/OutputStream;->flush()V

    .line 193
    invoke-virtual {p2}, Ljava/io/FileInputStream;->close()V

    .line 194
    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p2

    invoke-virtual {p2}, Ljava/io/PrintWriter;->flush()V

    .line 196
    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p1

    iget-object p2, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->BOUNDARY:Ljava/lang/String;

    invoke-virtual {p1, p2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p1

    invoke-virtual {p1, v0}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/io/PrintWriter;->append(Ljava/lang/CharSequence;)Ljava/io/PrintWriter;

    move-result-object p1

    invoke-virtual {p1}, Ljava/io/PrintWriter;->flush()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;
    .locals 1

    .line 45
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;

    move-result-object v0

    return-object v0
.end method

.method protected getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;
    .locals 1

    .line 231
    invoke-super {p0}, Lcom/arialyy/aria/http/BaseHttpThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    return-object v0
.end method

.method protected handlerThreadTask()V
    .locals 9

    .line 57
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;

    move-result-object v1

    invoke-virtual {v1}, Lcom/arialyy/aria/core/upload/UploadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 58
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-nez v1, :cond_0

    .line 59
    new-instance v0, Lcom/arialyy/aria/exception/AriaHTTPException;

    new-array v1, v2, [Ljava/lang/Object;

    .line 60
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/arialyy/aria/core/upload/UploadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    .line 61
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;

    move-result-object v2

    invoke-virtual {v2}, Lcom/arialyy/aria/core/upload/UploadEntity;->getUrl()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v4

    const-string v2, "\u4e0a\u4f20\u5931\u8d25\uff0c\u6587\u4ef6\u4e0d\u5b58\u5728\uff1bfilePath: %s, url: %s"

    .line 60
    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;)V

    .line 59
    invoke-direct {p0, v0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->fail(Lcom/arialyy/aria/exception/AriaHTTPException;)V

    return-void

    .line 66
    :cond_0
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getThreadConfig()Lcom/arialyy/aria/core/common/SubThreadConfig;

    move-result-object v5

    iget-object v5, v5, Lcom/arialyy/aria/core/common/SubThreadConfig;->url:Ljava/lang/String;

    invoke-static {v5}, Lcom/arialyy/aria/util/CommonUtil;->convertUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v1, v5}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 68
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    iput-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    .line 69
    iget-object v5, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v5}, Lcom/arialyy/aria/http/HttpTaskOption;->getRequestEnum()Lcom/arialyy/aria/core/common/RequestEnum;

    move-result-object v5

    iget-object v5, v5, Lcom/arialyy/aria/core/common/RequestEnum;->name:Ljava/lang/String;

    invoke-virtual {v1, v5}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 70
    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v1, v3}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 71
    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v1, v4}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 72
    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v1, v4}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 73
    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    const-string v5, "Connection"

    const-string v6, "Keep-Alive"

    invoke-virtual {v1, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    const-string v5, "Content-Type"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 75
    invoke-direct {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getContentType()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "; boundary="

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v7, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->BOUNDARY:Ljava/lang/String;

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 74
    invoke-virtual {v1, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    const-string v5, "User-Agent"

    invoke-direct {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getUserAgent()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v5, v6}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getTaskConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object v5

    invoke-virtual {v5}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getConnectTimeOut()I

    move-result v5

    invoke-virtual {v1, v5}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 78
    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getTaskConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object v5

    invoke-virtual {v5}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getIOTimeOut()I

    move-result v5

    invoke-virtual {v1, v5}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 80
    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getTaskConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object v5

    invoke-virtual {v5}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getBuffSize()I

    move-result v5

    invoke-virtual {v1, v5}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 83
    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v1}, Lcom/arialyy/aria/http/HttpTaskOption;->getHeaders()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 84
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 85
    iget-object v6, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    iget-object v7, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v7}, Lcom/arialyy/aria/http/HttpTaskOption;->getHeaders()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v6, v5, v7}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 87
    :cond_1
    iget-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mHttpConn:Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    iput-object v1, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mOutputStream:Ljava/io/OutputStream;

    .line 88
    new-instance v1, Ljava/io/PrintWriter;

    new-instance v5, Ljava/io/OutputStreamWriter;

    iget-object v6, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mOutputStream:Ljava/io/OutputStream;

    iget-object v7, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    .line 89
    invoke-virtual {v7}, Lcom/arialyy/aria/http/HttpTaskOption;->getCharSet()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;Ljava/lang/String;)V

    invoke-direct {v1, v5, v4}, Ljava/io/PrintWriter;-><init>(Ljava/io/Writer;Z)V

    .line 91
    iget-object v5, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v5}, Lcom/arialyy/aria/http/HttpTaskOption;->getParams()Ljava/util/Map;

    move-result-object v5

    if-eqz v5, :cond_2

    .line 92
    invoke-interface {v5}, Ljava/util/Map;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_2

    .line 93
    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_2

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    .line 94
    invoke-interface {v5, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    invoke-direct {p0, v1, v7, v8}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->addFormField(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 99
    :cond_2
    iget-object v5, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v5}, Lcom/arialyy/aria/http/HttpTaskOption;->getFormFields()Ljava/util/Map;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    .line 100
    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_2
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    .line 101
    iget-object v7, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v7}, Lcom/arialyy/aria/http/HttpTaskOption;->getFormFields()Ljava/util/Map;

    move-result-object v7

    invoke-interface {v7, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-direct {p0, v1, v6, v7}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->addFormField(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    .line 104
    :cond_3
    iget-object v5, p0, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v5}, Lcom/arialyy/aria/http/HttpTaskOption;->getAttachment()Ljava/lang/String;

    move-result-object v5

    invoke-direct {p0, v1, v5, v0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->uploadFile(Ljava/io/PrintWriter;Ljava/lang/String;Ljava/io/File;)V

    .line 105
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;

    move-result-object v0

    invoke-direct {p0, v1}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->finish(Ljava/io/PrintWriter;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/upload/UploadEntity;->setResponseStr(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    .line 107
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 108
    new-instance v1, Lcom/arialyy/aria/exception/AriaHTTPException;

    new-array v2, v2, [Ljava/lang/Object;

    .line 109
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/arialyy/aria/core/upload/UploadEntity;->getFilePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v3

    .line 110
    invoke-virtual {p0}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/upload/UploadEntity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/arialyy/aria/core/upload/UploadEntity;->getUrl()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    const-string v3, "\u4e0a\u4f20\u5931\u8d25\uff0cfilePath: %s, url: %s"

    .line 109
    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2, v0}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 108
    invoke-direct {p0, v1}, Lcom/arialyy/aria/http/upload/HttpUThreadTaskAdapter;->fail(Lcom/arialyy/aria/exception/AriaHTTPException;)V

    :goto_3
    return-void
.end method
