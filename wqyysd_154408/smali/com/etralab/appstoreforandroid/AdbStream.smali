.class public Lcom/etralab/appstoreforandroid/AdbStream;
.super Ljava/lang/Object;
.source "AdbStream.java"

# interfaces
.implements Ljava/io/Closeable;


# instance fields
.field private adbConn:Lcom/etralab/appstoreforandroid/AdbConnection;

.field private isClosed:Z

.field private localId:I

.field private readQueue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "[B>;"
        }
    .end annotation
.end field

.field private remoteId:I

.field private writeReady:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public constructor <init>(Lcom/etralab/appstoreforandroid/AdbConnection;I)V
    .locals 0

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->adbConn:Lcom/etralab/appstoreforandroid/AdbConnection;

    .line 42
    iput p2, p0, Lcom/etralab/appstoreforandroid/AdbStream;->localId:I

    .line 43
    new-instance p1, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->readQueue:Ljava/util/Queue;

    .line 44
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 p2, 0x0

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->writeReady:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 45
    iput-boolean p2, p0, Lcom/etralab/appstoreforandroid/AdbStream;->isClosed:Z

    return-void
.end method


# virtual methods
.method addPayload([B)V
    .locals 2

    .line 54
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->readQueue:Ljava/util/Queue;

    monitor-enter v0

    .line 55
    :try_start_0
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->readQueue:Ljava/util/Queue;

    invoke-interface {v1, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 56
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->readQueue:Ljava/util/Queue;

    invoke-virtual {p1}, Ljava/lang/Object;->notifyAll()V

    .line 57
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public close()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 188
    monitor-enter p0

    .line 190
    :try_start_0
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->isClosed:Z

    if-eqz v0, :cond_0

    .line 191
    monitor-exit p0

    return-void

    .line 194
    :cond_0
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AdbStream;->notifyClose()V

    .line 195
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 197
    iget v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->localId:I

    iget v1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->remoteId:I

    invoke-static {v0, v1}, Lcom/etralab/appstoreforandroid/AdbProtocol;->generateClose(II)[B

    move-result-object v0

    .line 198
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->adbConn:Lcom/etralab/appstoreforandroid/AdbConnection;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 199
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->adbConn:Lcom/etralab/appstoreforandroid/AdbConnection;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    return-void

    :catchall_0
    move-exception v0

    .line 195
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public isClosed()Z
    .locals 1

    .line 207
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->isClosed:Z

    return v0
.end method

.method notifyClose()V
    .locals 2

    const/4 v0, 0x1

    .line 96
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->isClosed:Z

    .line 99
    monitor-enter p0

    .line 100
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 101
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 102
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->readQueue:Ljava/util/Queue;

    monitor-enter v0

    .line 103
    :try_start_1
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->readQueue:Ljava/util/Queue;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 104
    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :catchall_1
    move-exception v0

    .line 101
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0
.end method

.method public read()[B
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 117
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->readQueue:Ljava/util/Queue;

    monitor-enter v0

    const/4 v1, 0x0

    .line 119
    :goto_0
    :try_start_0
    iget-boolean v2, p0, Lcom/etralab/appstoreforandroid/AdbStream;->isClosed:Z

    if-nez v2, :cond_0

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->readQueue:Ljava/util/Queue;

    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [B

    if-nez v1, :cond_0

    .line 120
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AdbStream;->readQueue:Ljava/util/Queue;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V

    goto :goto_0

    .line 123
    :cond_0
    iget-boolean v2, p0, Lcom/etralab/appstoreforandroid/AdbStream;->isClosed:Z

    if-nez v2, :cond_1

    .line 126
    monitor-exit v0

    return-object v1

    .line 124
    :cond_1
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Stream closed"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    :catchall_0
    move-exception v1

    .line 126
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1
.end method

.method readyForWrite()V
    .locals 2

    .line 87
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->writeReady:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    return-void
.end method

.method sendReady()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    iget v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->localId:I

    iget v1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->remoteId:I

    invoke-static {v0, v1}, Lcom/etralab/appstoreforandroid/AdbProtocol;->generateReady(II)[B

    move-result-object v0

    .line 69
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->adbConn:Lcom/etralab/appstoreforandroid/AdbConnection;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 70
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->adbConn:Lcom/etralab/appstoreforandroid/AdbConnection;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    return-void
.end method

.method updateRemoteId(I)V
    .locals 0

    .line 79
    iput p1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->remoteId:I

    return-void
.end method

.method public write(Ljava/lang/String;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const-string v0, "UTF-8"

    .line 140
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/etralab/appstoreforandroid/AdbStream;->write([BZ)V

    const/4 p1, 0x1

    new-array v1, p1, [B

    aput-byte v0, v1, v0

    .line 141
    invoke-virtual {p0, v1, p1}, Lcom/etralab/appstoreforandroid/AdbStream;->write([BZ)V

    return-void
.end method

.method public write([B)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    const/4 v0, 0x1

    .line 152
    invoke-virtual {p0, p1, v0}, Lcom/etralab/appstoreforandroid/AdbStream;->write([BZ)V

    return-void
.end method

.method public write([BZ)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 164
    monitor-enter p0

    .line 166
    :goto_0
    :try_start_0
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->isClosed:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->writeReady:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-nez v0, :cond_0

    .line 167
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V

    goto :goto_0

    .line 169
    :cond_0
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->isClosed:Z

    if-nez v0, :cond_2

    .line 172
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    iget v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->localId:I

    iget v1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->remoteId:I

    invoke-static {v0, v1, p1}, Lcom/etralab/appstoreforandroid/AdbProtocol;->generateWrite(II[B)[B

    move-result-object p1

    .line 176
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbStream;->adbConn:Lcom/etralab/appstoreforandroid/AdbConnection;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0, p1}, Ljava/io/OutputStream;->write([B)V

    if-eqz p2, :cond_1

    .line 179
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AdbStream;->adbConn:Lcom/etralab/appstoreforandroid/AdbConnection;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V

    :cond_1
    return-void

    .line 170
    :cond_2
    :try_start_1
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Stream closed"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :catchall_0
    move-exception p1

    .line 172
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method
