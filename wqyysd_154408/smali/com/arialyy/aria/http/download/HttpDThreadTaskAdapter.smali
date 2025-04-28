.class final Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;
.super Lcom/arialyy/aria/http/BaseHttpThreadTaskAdapter;
.source "HttpDThreadTaskAdapter.java"


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/common/SubThreadConfig;)V
    .locals 0

    .line 50
    invoke-direct {p0, p1}, Lcom/arialyy/aria/http/BaseHttpThreadTaskAdapter;-><init>(Lcom/arialyy/aria/core/common/SubThreadConfig;)V

    const-string p1, "HttpDThreadTaskAdapter"

    .line 46
    iput-object p1, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->TAG:Ljava/lang/String;

    return-void
.end method

.method private handleComplete()V
    .locals 1

    .line 266
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadTask()Lcom/arialyy/aria/core/task/IThreadTask;

    move-result-object v0

    invoke-interface {v0}, Lcom/arialyy/aria/core/task/IThreadTask;->isBreak()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 269
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadTask()Lcom/arialyy/aria/core/task/IThreadTask;

    move-result-object v0

    invoke-interface {v0}, Lcom/arialyy/aria/core/task/IThreadTask;->checkBlock()Z

    move-result v0

    if-nez v0, :cond_1

    return-void

    .line 273
    :cond_1
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->complete()V

    return-void
.end method

.method private readChunked(Ljava/io/InputStream;)V
    .locals 7

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 155
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadConfig()Lcom/arialyy/aria/core/common/SubThreadConfig;

    move-result-object v4

    iget-object v4, v4, Lcom/arialyy/aria/core/common/SubThreadConfig;->tempFile:Ljava/io/File;

    invoke-direct {v3, v4, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 156
    :try_start_1
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getTaskConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getBuffSize()I

    move-result v2

    new-array v2, v2, [B

    .line 158
    :goto_0
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadTask()Lcom/arialyy/aria/core/task/IThreadTask;

    move-result-object v4

    invoke-interface {v4}, Lcom/arialyy/aria/core/task/IThreadTask;->isLive()Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {p1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_2

    .line 159
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadTask()Lcom/arialyy/aria/core/task/IThreadTask;

    move-result-object v5

    invoke-interface {v5}, Lcom/arialyy/aria/core/task/IThreadTask;->isBreak()Z

    move-result v5

    if-eqz v5, :cond_0

    goto :goto_1

    .line 162
    :cond_0
    iget-object v5, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mSpeedBandUtil:Lcom/arialyy/aria/util/BandwidthLimiter;

    if-eqz v5, :cond_1

    .line 163
    iget-object v5, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mSpeedBandUtil:Lcom/arialyy/aria/util/BandwidthLimiter;

    invoke-virtual {v5, v4}, Lcom/arialyy/aria/util/BandwidthLimiter;->limitNextBytes(I)V

    .line 165
    :cond_1
    invoke-virtual {v3, v2, v0, v4}, Ljava/io/FileOutputStream;->write([BII)V

    int-to-long v4, v4

    .line 166
    invoke-virtual {p0, v4, v5}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->progress(J)V

    goto :goto_0

    .line 168
    :cond_2
    :goto_1
    invoke-direct {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->handleComplete()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 176
    :try_start_2
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_3

    :catch_0
    move-exception p1

    .line 178
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_3

    :catchall_0
    move-exception p1

    move-object v2, v3

    goto :goto_4

    :catch_1
    move-exception p1

    move-object v2, v3

    goto :goto_2

    :catchall_1
    move-exception p1

    goto :goto_4

    :catch_2
    move-exception p1

    .line 170
    :goto_2
    :try_start_3
    new-instance v3, Lcom/arialyy/aria/exception/AriaHTTPException;

    const-string v4, "\u6587\u4ef6\u4e0b\u8f7d\u5931\u8d25\uff0csavePath: %s, url: %s"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    .line 171
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFilePath()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v5, v0

    .line 172
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadConfig()Lcom/arialyy/aria/core/common/SubThreadConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/common/SubThreadConfig;->url:Ljava/lang/String;

    aput-object v0, v5, v1

    .line 171
    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0, p1}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 170
    invoke-virtual {p0, v3, v1}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->fail(Lcom/arialyy/aria/exception/AriaException;Z)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    if-eqz v2, :cond_3

    .line 176
    :try_start_4
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0

    :cond_3
    :goto_3
    return-void

    :goto_4
    if-eqz v2, :cond_4

    :try_start_5
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_5

    :catch_3
    move-exception v0

    .line 178
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 181
    :cond_4
    :goto_5
    throw p1
.end method

.method private readDynamicFile(Ljava/io/InputStream;)V
    .locals 13

    const/4 v0, 0x0

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 193
    :try_start_0
    new-instance v3, Ljava/io/FileOutputStream;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadConfig()Lcom/arialyy/aria/core/common/SubThreadConfig;

    move-result-object v4

    iget-object v4, v4, Lcom/arialyy/aria/core/common/SubThreadConfig;->tempFile:Ljava/io/File;

    invoke-direct {v3, v4, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 194
    :try_start_1
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v4
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 195
    :try_start_2
    invoke-static {p1}, Ljava/nio/channels/Channels;->newChannel(Ljava/io/InputStream;)Ljava/nio/channels/ReadableByteChannel;

    move-result-object v2

    .line 197
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getTaskConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getBuffSize()I

    move-result p1

    invoke-static {p1}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 200
    :goto_0
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadTask()Lcom/arialyy/aria/core/task/IThreadTask;

    move-result-object v5

    invoke-interface {v5}, Lcom/arialyy/aria/core/task/IThreadTask;->isLive()Z

    move-result v5

    if-eqz v5, :cond_3

    invoke-interface {v2, p1}, Ljava/nio/channels/ReadableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result v5

    const/4 v6, -0x1

    if-eq v5, v6, :cond_3

    .line 201
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadTask()Lcom/arialyy/aria/core/task/IThreadTask;

    move-result-object v6

    invoke-interface {v6}, Lcom/arialyy/aria/core/task/IThreadTask;->isBreak()Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_1

    .line 204
    :cond_0
    iget-object v6, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mSpeedBandUtil:Lcom/arialyy/aria/util/BandwidthLimiter;

    if-eqz v6, :cond_1

    .line 205
    iget-object v6, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mSpeedBandUtil:Lcom/arialyy/aria/util/BandwidthLimiter;

    invoke-virtual {v6, v5}, Lcom/arialyy/aria/util/BandwidthLimiter;->limitNextBytes(I)V

    .line 207
    :cond_1
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getRangeProgress()J

    move-result-wide v6

    int-to-long v8, v5

    add-long/2addr v6, v8

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadRecord()Lcom/arialyy/aria/core/ThreadRecord;

    move-result-object v5

    iget-wide v10, v5, Lcom/arialyy/aria/core/ThreadRecord;->endLocation:J

    cmp-long v5, v6, v10

    if-ltz v5, :cond_2

    .line 208
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadRecord()Lcom/arialyy/aria/core/ThreadRecord;

    move-result-object v5

    iget-wide v5, v5, Lcom/arialyy/aria/core/ThreadRecord;->endLocation:J

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getRangeProgress()J

    move-result-wide v7

    sub-long/2addr v5, v7

    long-to-int v5, v5

    .line 209
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 210
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object v6

    invoke-virtual {v3, v6, v0, v5}, Ljava/io/FileOutputStream;->write([BII)V

    .line 211
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;

    int-to-long v5, v5

    .line 212
    invoke-virtual {p0, v5, v6}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->progress(J)V

    goto :goto_1

    .line 215
    :cond_2
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 216
    invoke-virtual {v4, p1}, Ljava/nio/channels/FileChannel;->write(Ljava/nio/ByteBuffer;)I

    .line 217
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->compact()Ljava/nio/ByteBuffer;

    .line 218
    invoke-virtual {p0, v8, v9}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->progress(J)V

    goto :goto_0

    .line 221
    :cond_3
    :goto_1
    invoke-direct {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->handleComplete()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 228
    :try_start_3
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->flush()V

    .line 229
    invoke-virtual {v3}, Ljava/io/FileOutputStream;->close()V

    if-eqz v4, :cond_4

    .line 232
    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->close()V

    :cond_4
    if-eqz v2, :cond_7

    .line 235
    invoke-interface {v2}, Ljava/nio/channels/ReadableByteChannel;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    goto/16 :goto_5

    :catchall_0
    move-exception p1

    move-object v12, v3

    move-object v3, v2

    move-object v2, v12

    goto/16 :goto_6

    :catch_0
    move-exception p1

    move-object v12, v3

    move-object v3, v2

    move-object v2, v12

    goto :goto_2

    :catchall_1
    move-exception p1

    move-object v4, v2

    move-object v2, v3

    move-object v3, v4

    goto :goto_6

    :catch_1
    move-exception p1

    move-object v4, v2

    move-object v2, v3

    move-object v3, v4

    goto :goto_2

    :catchall_2
    move-exception p1

    move-object v3, v2

    move-object v4, v3

    goto :goto_6

    :catch_2
    move-exception p1

    move-object v3, v2

    move-object v4, v3

    .line 223
    :goto_2
    :try_start_4
    new-instance v5, Lcom/arialyy/aria/exception/AriaHTTPException;

    const-string v6, "\u6587\u4ef6\u4e0b\u8f7d\u5931\u8d25\uff0csavePath: %s, url: %s"

    const/4 v7, 0x2

    new-array v7, v7, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v8

    invoke-virtual {v8}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFilePath()Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v0

    .line 224
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadConfig()Lcom/arialyy/aria/core/common/SubThreadConfig;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/common/SubThreadConfig;->url:Ljava/lang/String;

    aput-object v0, v7, v1

    .line 223
    invoke-static {v6, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0, p1}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-virtual {p0, v5, v1}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->fail(Lcom/arialyy/aria/exception/AriaException;Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    if-eqz v2, :cond_5

    .line 228
    :try_start_5
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    .line 229
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    goto :goto_3

    :catch_3
    move-exception p1

    goto :goto_4

    :cond_5
    :goto_3
    if-eqz v4, :cond_6

    .line 232
    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->close()V

    :cond_6
    if-eqz v3, :cond_7

    .line 235
    invoke-interface {v3}, Ljava/nio/channels/ReadableByteChannel;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    goto :goto_5

    .line 238
    :goto_4
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    :cond_7
    :goto_5
    return-void

    :catchall_3
    move-exception p1

    :goto_6
    if-eqz v2, :cond_8

    .line 228
    :try_start_6
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->flush()V

    .line 229
    invoke-virtual {v2}, Ljava/io/FileOutputStream;->close()V

    goto :goto_7

    :catch_4
    move-exception v0

    goto :goto_8

    :cond_8
    :goto_7
    if-eqz v4, :cond_9

    .line 232
    invoke-virtual {v4}, Ljava/nio/channels/FileChannel;->close()V

    :cond_9
    if-eqz v3, :cond_a

    .line 235
    invoke-interface {v3}, Ljava/nio/channels/ReadableByteChannel;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    goto :goto_9

    .line 238
    :goto_8
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 240
    :cond_a
    :goto_9
    throw p1
.end method

.method private readNormal(Ljava/io/InputStream;Lcom/arialyy/aria/util/BufferedRandomAccessFile;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 248
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getTaskConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getBuffSize()I

    move-result v0

    new-array v0, v0, [B

    .line 250
    :goto_0
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadTask()Lcom/arialyy/aria/core/task/IThreadTask;

    move-result-object v1

    invoke-interface {v1}, Lcom/arialyy/aria/core/task/IThreadTask;->isLive()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-virtual {p1, v0}, Ljava/io/InputStream;->read([B)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_2

    .line 251
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadTask()Lcom/arialyy/aria/core/task/IThreadTask;

    move-result-object v2

    invoke-interface {v2}, Lcom/arialyy/aria/core/task/IThreadTask;->isBreak()Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_1

    .line 254
    :cond_0
    iget-object v2, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mSpeedBandUtil:Lcom/arialyy/aria/util/BandwidthLimiter;

    if-eqz v2, :cond_1

    .line 255
    iget-object v2, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mSpeedBandUtil:Lcom/arialyy/aria/util/BandwidthLimiter;

    invoke-virtual {v2, v1}, Lcom/arialyy/aria/util/BandwidthLimiter;->limitNextBytes(I)V

    :cond_1
    const/4 v2, 0x0

    .line 257
    invoke-virtual {p2, v0, v2, v1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->write([BII)V

    int-to-long v1, v1

    .line 258
    invoke-virtual {p0, v1, v2}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->progress(J)V

    goto :goto_0

    :cond_2
    :goto_1
    return-void
.end method


# virtual methods
.method protected handlerThreadTask()V
    .locals 15

    const-string v0, "\u4efb\u52a1\u3010%s\u3011\u4e0b\u8f7d\u5931\u8d25\uff0cfilePath: %s, url: %s"

    .line 54
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    iput-object v1, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    .line 55
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadRecord()Lcom/arialyy/aria/core/ThreadRecord;

    move-result-object v1

    iget-boolean v1, v1, Lcom/arialyy/aria/core/ThreadRecord;->isComplete:Z

    if-eqz v1, :cond_0

    .line 56
    invoke-direct {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->handleComplete()V

    return-void

    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x3

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    .line 63
    :try_start_0
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadConfig()Lcom/arialyy/aria/core/common/SubThreadConfig;

    move-result-object v6

    iget-object v6, v6, Lcom/arialyy/aria/core/common/SubThreadConfig;->url:Ljava/lang/String;

    iget-object v7, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-static {v6, v7}, Lcom/arialyy/aria/http/ConnectionHelp;->handleUrl(Ljava/lang/String;Lcom/arialyy/aria/http/HttpTaskOption;)Ljava/net/URL;

    move-result-object v6

    .line 64
    iget-object v7, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-static {v6, v7}, Lcom/arialyy/aria/http/ConnectionHelp;->handleConnection(Ljava/net/URL;Lcom/arialyy/aria/http/HttpTaskOption;)Ljava/net/HttpURLConnection;

    move-result-object v6
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_f
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_e
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_0 .. :try_end_0} :catch_d
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_c
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 65
    :try_start_1
    iget-object v7, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mTaskWrapper:Lcom/arialyy/aria/core/download/DTaskWrapper;

    invoke-virtual {v7}, Lcom/arialyy/aria/core/download/DTaskWrapper;->isSupportBP()Z

    move-result v7
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_b
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_a
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_1 .. :try_end_1} :catch_9
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_8
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const-string v8, "HttpDThreadTaskAdapter"

    if-eqz v7, :cond_1

    :try_start_2
    const-string v7, "\u4efb\u52a1\u3010%s\u3011\u7ebf\u7a0b__%s__\u5f00\u59cb\u4e0b\u8f7d\u3010\u5f00\u59cb\u4f4d\u7f6e : %s\uff0c\u7ed3\u675f\u4f4d\u7f6e\uff1a%s\u3011"

    const/4 v9, 0x4

    new-array v9, v9, [Ljava/lang/Object;

    .line 67
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getFileName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v9, v5

    .line 68
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadRecord()Lcom/arialyy/aria/core/ThreadRecord;

    move-result-object v10

    iget v10, v10, Lcom/arialyy/aria/core/ThreadRecord;->threadId:I

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    aput-object v10, v9, v4

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadRecord()Lcom/arialyy/aria/core/ThreadRecord;

    move-result-object v10

    iget-wide v10, v10, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v9, v3

    .line 69
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadRecord()Lcom/arialyy/aria/core/ThreadRecord;

    move-result-object v10

    iget-wide v10, v10, Lcom/arialyy/aria/core/ThreadRecord;->endLocation:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v9, v2

    .line 67
    invoke-static {v7, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    .line 66
    invoke-static {v8, v7}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    const-string v7, "Range"

    const-string v8, "bytes=%s-%s"

    new-array v9, v3, [Ljava/lang/Object;

    .line 71
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadRecord()Lcom/arialyy/aria/core/ThreadRecord;

    move-result-object v10

    iget-wide v10, v10, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v9, v5

    .line 72
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadRecord()Lcom/arialyy/aria/core/ThreadRecord;

    move-result-object v10

    iget-wide v10, v10, Lcom/arialyy/aria/core/ThreadRecord;->endLocation:J

    const-wide/16 v12, 0x1

    sub-long/2addr v10, v12

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v10

    aput-object v10, v9, v4

    .line 71
    invoke-static {v8, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    .line 70
    invoke-virtual {v6, v7, v8}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string v7, "\u8be5\u4e0b\u8f7d\u4e0d\u652f\u6301\u65ad\u70b9"

    .line 74
    invoke-static {v8, v7}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    :goto_0
    iget-object v7, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-static {v7, v6}, Lcom/arialyy/aria/http/ConnectionHelp;->setConnectParam(Lcom/arialyy/aria/http/HttpTaskOption;Ljava/net/HttpURLConnection;)Ljava/net/HttpURLConnection;

    .line 77
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getTaskConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object v7

    invoke-virtual {v7}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getConnectTimeOut()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 78
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getTaskConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object v7

    invoke-virtual {v7}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getIOTimeOut()I

    move-result v7

    invoke-virtual {v6, v7}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 79
    iget-object v7, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v7}, Lcom/arialyy/aria/http/HttpTaskOption;->isChunked()Z

    move-result v7

    if-eqz v7, :cond_2

    .line 80
    invoke-virtual {v6, v4}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 81
    invoke-virtual {v6, v5}, Ljava/net/HttpURLConnection;->setChunkedStreamingMode(I)V

    .line 83
    :cond_2
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->connect()V

    .line 85
    iget-object v7, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v7}, Lcom/arialyy/aria/http/HttpTaskOption;->getRequestEnum()Lcom/arialyy/aria/core/common/RequestEnum;

    move-result-object v7

    sget-object v8, Lcom/arialyy/aria/core/common/RequestEnum;->POST:Lcom/arialyy/aria/core/common/RequestEnum;

    if-ne v7, v8, :cond_4

    .line 86
    iget-object v7, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v7}, Lcom/arialyy/aria/http/HttpTaskOption;->getParams()Ljava/util/Map;

    move-result-object v7

    if-eqz v7, :cond_4

    .line 88
    new-instance v8, Ljava/io/OutputStreamWriter;

    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v9

    invoke-direct {v8, v9}, Ljava/io/OutputStreamWriter;-><init>(Ljava/io/OutputStream;)V

    .line 89
    invoke-interface {v7}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v9

    .line 90
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    .line 91
    invoke-interface {v9}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v11

    if-eqz v11, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    .line 92
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, "="

    invoke-virtual {v10, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v7, v11}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/String;

    invoke-static {v11}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "&"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 94
    :cond_3
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 95
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v4

    invoke-virtual {v7, v5, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 96
    invoke-virtual {v8, v7}, Ljava/io/OutputStreamWriter;->write(Ljava/lang/String;)V

    .line 97
    invoke-virtual {v8}, Ljava/io/OutputStreamWriter;->flush()V

    .line 98
    invoke-virtual {v8}, Ljava/io/OutputStreamWriter;->close()V

    .line 102
    :cond_4
    new-instance v7, Ljava/io/BufferedInputStream;

    invoke-static {v6}, Lcom/arialyy/aria/http/ConnectionHelp;->convertInputStream(Ljava/net/HttpURLConnection;)Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_2
    .catch Ljava/net/MalformedURLException; {:try_start_2 .. :try_end_2} :catch_b
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_a
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_2 .. :try_end_2} :catch_9
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_8
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 103
    :try_start_3
    iget-object v8, p0, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->mTaskOption:Lcom/arialyy/aria/http/HttpTaskOption;

    invoke-virtual {v8}, Lcom/arialyy/aria/http/HttpTaskOption;->isChunked()Z

    move-result v8

    if-eqz v8, :cond_5

    .line 104
    invoke-direct {p0, v7}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->readChunked(Ljava/io/InputStream;)V

    goto :goto_2

    .line 105
    :cond_5
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadConfig()Lcom/arialyy/aria/core/common/SubThreadConfig;

    move-result-object v8

    iget-boolean v8, v8, Lcom/arialyy/aria/core/common/SubThreadConfig;->isBlock:Z

    if-eqz v8, :cond_6

    .line 106
    invoke-direct {p0, v7}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->readDynamicFile(Ljava/io/InputStream;)V

    goto :goto_2

    .line 109
    :cond_6
    new-instance v8, Lcom/arialyy/aria/util/BufferedRandomAccessFile;

    .line 110
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadConfig()Lcom/arialyy/aria/core/common/SubThreadConfig;

    move-result-object v9

    iget-object v9, v9, Lcom/arialyy/aria/core/common/SubThreadConfig;->tempFile:Ljava/io/File;

    const-string v10, "rwd"

    .line 111
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getTaskConfig()Lcom/arialyy/aria/core/config/BaseTaskConfig;

    move-result-object v11

    invoke-virtual {v11}, Lcom/arialyy/aria/core/config/BaseTaskConfig;->getBuffSize()I

    move-result v11

    invoke-direct {v8, v9, v10, v11}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;I)V
    :try_end_3
    .catch Ljava/net/MalformedURLException; {:try_start_3 .. :try_end_3} :catch_7
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_6
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    .line 113
    :try_start_4
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadRecord()Lcom/arialyy/aria/core/ThreadRecord;

    move-result-object v1

    iget-wide v9, v1, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    const-wide/16 v11, 0x0

    cmp-long v1, v9, v11

    if-lez v1, :cond_7

    .line 114
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getThreadRecord()Lcom/arialyy/aria/core/ThreadRecord;

    move-result-object v1

    iget-wide v9, v1, Lcom/arialyy/aria/core/ThreadRecord;->startLocation:J

    invoke-virtual {v8, v9, v10}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->seek(J)V

    .line 116
    :cond_7
    invoke-direct {p0, v7, v8}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->readNormal(Ljava/io/InputStream;Lcom/arialyy/aria/util/BufferedRandomAccessFile;)V

    .line 117
    invoke-direct {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->handleComplete()V
    :try_end_4
    .catch Ljava/net/MalformedURLException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/ArrayIndexOutOfBoundsException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    move-object v1, v8

    :goto_2
    if-eqz v1, :cond_8

    .line 134
    :try_start_5
    invoke-virtual {v1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->close()V

    .line 137
    :cond_8
    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V

    if-eqz v6, :cond_11

    .line 140
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 141
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_10

    goto/16 :goto_9

    :catchall_0
    move-exception v0

    move-object v1, v8

    goto/16 :goto_a

    :catch_0
    move-exception v1

    move-object v14, v8

    move-object v8, v1

    move-object v1, v14

    goto :goto_3

    :catch_1
    move-exception v1

    move-object v14, v8

    move-object v8, v1

    move-object v1, v14

    goto/16 :goto_4

    :catch_2
    move-exception v1

    move-object v14, v8

    move-object v8, v1

    move-object v1, v14

    goto/16 :goto_5

    :catch_3
    move-exception v1

    move-object v14, v8

    move-object v8, v1

    move-object v1, v14

    goto/16 :goto_6

    :catch_4
    move-exception v8

    goto :goto_3

    :catch_5
    move-exception v8

    goto/16 :goto_4

    :catch_6
    move-exception v8

    goto/16 :goto_5

    :catch_7
    move-exception v8

    goto/16 :goto_6

    :catchall_1
    move-exception v0

    move-object v7, v1

    goto/16 :goto_a

    :catch_8
    move-exception v7

    move-object v8, v7

    move-object v7, v1

    goto :goto_3

    :catch_9
    move-exception v7

    move-object v8, v7

    move-object v7, v1

    goto :goto_4

    :catch_a
    move-exception v7

    move-object v8, v7

    move-object v7, v1

    goto/16 :goto_5

    :catch_b
    move-exception v7

    move-object v8, v7

    move-object v7, v1

    goto/16 :goto_6

    :catchall_2
    move-exception v0

    move-object v6, v1

    move-object v7, v6

    goto/16 :goto_a

    :catch_c
    move-exception v7

    move-object v6, v1

    move-object v8, v7

    move-object v7, v6

    .line 129
    :goto_3
    :try_start_6
    new-instance v9, Lcom/arialyy/aria/exception/AriaHTTPException;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getFileName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v2, v5

    .line 130
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v10

    invoke-virtual {v10}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFilePath()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v2, v4

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getUrl()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 129
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v9, v0, v8}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-virtual {p0, v9, v5}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->fail(Lcom/arialyy/aria/exception/AriaException;Z)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    if-eqz v1, :cond_9

    .line 134
    :try_start_7
    invoke-virtual {v1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->close()V

    :cond_9
    if-eqz v7, :cond_a

    .line 137
    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V

    :cond_a
    if-eqz v6, :cond_11

    .line 140
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 141
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_7
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_10

    goto/16 :goto_9

    :catch_d
    move-exception v7

    move-object v6, v1

    move-object v8, v7

    move-object v7, v6

    .line 126
    :goto_4
    :try_start_8
    new-instance v9, Lcom/arialyy/aria/exception/AriaHTTPException;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getFileName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v2, v5

    .line 127
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v10

    invoke-virtual {v10}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFilePath()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v2, v4

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getUrl()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 126
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v9, v0, v8}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-virtual {p0, v9, v5}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->fail(Lcom/arialyy/aria/exception/AriaException;Z)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    if-eqz v1, :cond_b

    .line 134
    :try_start_9
    invoke-virtual {v1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->close()V

    :cond_b
    if-eqz v7, :cond_c

    .line 137
    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V

    :cond_c
    if-eqz v6, :cond_11

    .line 140
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 141
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_10

    goto/16 :goto_9

    :catch_e
    move-exception v7

    move-object v6, v1

    move-object v8, v7

    move-object v7, v6

    .line 123
    :goto_5
    :try_start_a
    new-instance v9, Lcom/arialyy/aria/exception/AriaHTTPException;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getFileName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v2, v5

    .line 124
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFilePath()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v4

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getUrl()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v2, v3

    .line 123
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v9, v0, v8}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-virtual {p0, v9, v4}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->fail(Lcom/arialyy/aria/exception/AriaException;Z)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    if-eqz v1, :cond_d

    .line 134
    :try_start_b
    invoke-virtual {v1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->close()V

    :cond_d
    if-eqz v7, :cond_e

    .line 137
    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V

    :cond_e
    if-eqz v6, :cond_11

    .line 140
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 141
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_b
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_10

    goto :goto_9

    :catch_f
    move-exception v7

    move-object v6, v1

    move-object v8, v7

    move-object v7, v6

    .line 120
    :goto_6
    :try_start_c
    new-instance v9, Lcom/arialyy/aria/exception/AriaHTTPException;

    new-array v2, v2, [Ljava/lang/Object;

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getFileName()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v2, v5

    .line 121
    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v10

    invoke-virtual {v10}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getFilePath()Ljava/lang/String;

    move-result-object v10

    aput-object v10, v2, v4

    invoke-virtual {p0}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->getEntity()Lcom/arialyy/aria/core/common/AbsNormalEntity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->getUrl()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    .line 120
    invoke-static {v0, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v9, v0, v8}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    invoke-virtual {p0, v9, v5}, Lcom/arialyy/aria/http/download/HttpDThreadTaskAdapter;->fail(Lcom/arialyy/aria/exception/AriaException;Z)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    if-eqz v1, :cond_f

    .line 134
    :try_start_d
    invoke-virtual {v1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->close()V

    goto :goto_7

    :catch_10
    move-exception v0

    goto :goto_8

    :cond_f
    :goto_7
    if-eqz v7, :cond_10

    .line 137
    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V

    :cond_10
    if-eqz v6, :cond_11

    .line 140
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 141
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_10

    goto :goto_9

    .line 144
    :goto_8
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_11
    :goto_9
    return-void

    :catchall_3
    move-exception v0

    :goto_a
    if-eqz v1, :cond_12

    .line 134
    :try_start_e
    invoke-virtual {v1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->close()V

    goto :goto_b

    :catch_11
    move-exception v1

    goto :goto_c

    :cond_12
    :goto_b
    if-eqz v7, :cond_13

    .line 137
    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V

    :cond_13
    if-eqz v6, :cond_14

    .line 140
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 141
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_11

    goto :goto_d

    .line 144
    :goto_c
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    .line 146
    :cond_14
    :goto_d
    throw v0
.end method
