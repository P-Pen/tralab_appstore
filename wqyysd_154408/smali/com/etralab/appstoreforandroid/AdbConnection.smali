.class public Lcom/etralab/appstoreforandroid/AdbConnection;
.super Ljava/lang/Object;
.source "AdbConnection.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private connectAttempted:Z

.field private connected:Z

.field private connectionThread:Ljava/lang/Thread;

.field private crypto:Lcom/etralab/appstoreforandroid/AdbCrypto;

.field private inputStream:Ljava/io/InputStream;

.field private lastLocalId:I

.field private maxData:I

.field private openStreams:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Lcom/etralab/appstoreforandroid/AdbStream;",
            ">;"
        }
    .end annotation
.end field

.field outputStream:Ljava/io/OutputStream;

.field private sentSignature:Z

.field private socket:Ljava/net/Socket;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 81
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 82
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->openStreams:Ljava/util/HashMap;

    const/4 v0, 0x0

    .line 83
    iput v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->lastLocalId:I

    .line 84
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AdbConnection;->createConnectionThread()Ljava/lang/Thread;

    move-result-object v0

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connectionThread:Ljava/lang/Thread;

    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/AdbConnection;)Ljava/lang/Thread;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connectionThread:Ljava/lang/Thread;

    return-object p0
.end method

.method static synthetic access$100(Lcom/etralab/appstoreforandroid/AdbConnection;)Ljava/io/InputStream;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->inputStream:Ljava/io/InputStream;

    return-object p0
.end method

.method static synthetic access$200(Lcom/etralab/appstoreforandroid/AdbConnection;)Z
    .locals 0

    .line 17
    iget-boolean p0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connected:Z

    return p0
.end method

.method static synthetic access$202(Lcom/etralab/appstoreforandroid/AdbConnection;Z)Z
    .locals 0

    .line 17
    iput-boolean p1, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connected:Z

    return p1
.end method

.method static synthetic access$300(Lcom/etralab/appstoreforandroid/AdbConnection;)Ljava/util/HashMap;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->openStreams:Ljava/util/HashMap;

    return-object p0
.end method

.method static synthetic access$400(Lcom/etralab/appstoreforandroid/AdbConnection;)Z
    .locals 0

    .line 17
    iget-boolean p0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->sentSignature:Z

    return p0
.end method

.method static synthetic access$402(Lcom/etralab/appstoreforandroid/AdbConnection;Z)Z
    .locals 0

    .line 17
    iput-boolean p1, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->sentSignature:Z

    return p1
.end method

.method static synthetic access$500(Lcom/etralab/appstoreforandroid/AdbConnection;)Lcom/etralab/appstoreforandroid/AdbCrypto;
    .locals 0

    .line 17
    iget-object p0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->crypto:Lcom/etralab/appstoreforandroid/AdbCrypto;

    return-object p0
.end method

.method static synthetic access$602(Lcom/etralab/appstoreforandroid/AdbConnection;I)I
    .locals 0

    .line 17
    iput p1, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->maxData:I

    return p1
.end method

.method static synthetic access$700(Lcom/etralab/appstoreforandroid/AdbConnection;)V
    .locals 0

    .line 17
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AdbConnection;->cleanupStreams()V

    return-void
.end method

.method static synthetic access$802(Lcom/etralab/appstoreforandroid/AdbConnection;Z)Z
    .locals 0

    .line 17
    iput-boolean p1, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connectAttempted:Z

    return p1
.end method

.method private cleanupStreams()V
    .locals 2

    .line 344
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->openStreams:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :catch_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/etralab/appstoreforandroid/AdbStream;

    .line 348
    :try_start_0
    invoke-virtual {v1}, Lcom/etralab/appstoreforandroid/AdbStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 353
    :cond_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->openStreams:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    return-void
.end method

.method public static create(Ljava/net/Socket;Lcom/etralab/appstoreforandroid/AdbCrypto;)Lcom/etralab/appstoreforandroid/AdbConnection;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 97
    new-instance v0, Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-direct {v0}, Lcom/etralab/appstoreforandroid/AdbConnection;-><init>()V

    .line 99
    iput-object p1, v0, Lcom/etralab/appstoreforandroid/AdbConnection;->crypto:Lcom/etralab/appstoreforandroid/AdbCrypto;

    .line 101
    iput-object p0, v0, Lcom/etralab/appstoreforandroid/AdbConnection;->socket:Ljava/net/Socket;

    .line 102
    invoke-virtual {p0}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object p1

    iput-object p1, v0, Lcom/etralab/appstoreforandroid/AdbConnection;->inputStream:Ljava/io/InputStream;

    .line 103
    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p1

    iput-object p1, v0, Lcom/etralab/appstoreforandroid/AdbConnection;->outputStream:Ljava/io/OutputStream;

    const/4 p1, 0x1

    .line 106
    invoke-virtual {p0, p1}, Ljava/net/Socket;->setTcpNoDelay(Z)V

    return-object v0
.end method

.method private createConnectionThread()Ljava/lang/Thread;
    .locals 2

    .line 119
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lcom/etralab/appstoreforandroid/AdbConnection$1;

    invoke-direct {v1, p0, p0}, Lcom/etralab/appstoreforandroid/AdbConnection$1;-><init>(Lcom/etralab/appstoreforandroid/AdbConnection;Lcom/etralab/appstoreforandroid/AdbConnection;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    return-object v0
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 362
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connectionThread:Ljava/lang/Thread;

    if-nez v0, :cond_0

    return-void

    .line 366
    :cond_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->socket:Ljava/net/Socket;

    invoke-virtual {v0}, Ljava/net/Socket;->close()V

    .line 369
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connectionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V

    .line 371
    :try_start_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connectionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method public connect()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 270
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connected:Z

    if-nez v0, :cond_2

    .line 274
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-static {}, Lcom/etralab/appstoreforandroid/AdbProtocol;->generateConnect()[B

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 275
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    const/4 v0, 0x1

    .line 278
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connectAttempted:Z

    .line 279
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connectionThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 282
    monitor-enter p0

    .line 283
    :try_start_0
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connected:Z

    if-nez v0, :cond_0

    .line 284
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 286
    :cond_0
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connected:Z

    if-eqz v0, :cond_1

    .line 289
    monitor-exit p0

    return-void

    .line 287
    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Connection failed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    .line 289
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    .line 271
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public getMaxData()I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 246
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connectAttempted:Z

    if-eqz v0, :cond_2

    .line 249
    monitor-enter p0

    .line 251
    :try_start_0
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connected:Z

    if-nez v0, :cond_0

    .line 252
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 254
    :cond_0
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connected:Z

    if-eqz v0, :cond_1

    .line 257
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 259
    iget v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->maxData:I

    return v0

    .line 255
    :cond_1
    :try_start_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Connection failed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :catchall_0
    move-exception v0

    .line 257
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    .line 247
    :cond_2
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "connect() must be called first"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public open(Ljava/lang/String;)Lcom/etralab/appstoreforandroid/AdbStream;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/UnsupportedEncodingException;,
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 303
    iget v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->lastLocalId:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->lastLocalId:I

    .line 305
    iget-boolean v1, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connectAttempted:Z

    if-eqz v1, :cond_3

    .line 309
    monitor-enter p0

    .line 310
    :try_start_0
    iget-boolean v1, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connected:Z

    if-nez v1, :cond_0

    .line 311
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    .line 313
    :cond_0
    iget-boolean v1, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->connected:Z

    if-eqz v1, :cond_2

    .line 316
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 319
    new-instance v1, Lcom/etralab/appstoreforandroid/AdbStream;

    invoke-direct {v1, p0, v0}, Lcom/etralab/appstoreforandroid/AdbStream;-><init>(Lcom/etralab/appstoreforandroid/AdbConnection;I)V

    .line 320
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->openStreams:Ljava/util/HashMap;

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 323
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-static {v0, p1}, Lcom/etralab/appstoreforandroid/AdbProtocol;->generateOpen(ILjava/lang/String;)[B

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/io/OutputStream;->write([B)V

    .line 324
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    .line 327
    monitor-enter v1

    .line 328
    :try_start_1
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V

    .line 329
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 332
    invoke-virtual {v1}, Lcom/etralab/appstoreforandroid/AdbStream;->isClosed()Z

    move-result p1

    if-nez p1, :cond_1

    return-object v1

    .line 333
    :cond_1
    new-instance p1, Ljava/net/ConnectException;

    const-string v0, "Stream open actively rejected by remote peer"

    invoke-direct {p1, v0}, Ljava/net/ConnectException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    .line 329
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    .line 314
    :cond_2
    :try_start_3
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Connection failed"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_1
    move-exception p1

    .line 316
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    throw p1

    .line 306
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "connect() must be called first"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
