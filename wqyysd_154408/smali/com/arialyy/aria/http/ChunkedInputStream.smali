.class public Lcom/arialyy/aria/http/ChunkedInputStream;
.super Ljava/io/InputStream;
.source "ChunkedInputStream.java"


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "ChunkedInputStream"


# instance fields
.field private din:Ljava/io/DataInputStream;

.field private endOfData:Z

.field private id:Ljava/lang/String;

.field private singleByte:[B

.field private unreadBytes:I


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 3

    .line 38
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    const/4 v0, 0x0

    .line 33
    iput v0, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->unreadBytes:I

    const/4 v1, 0x1

    new-array v2, v1, [B

    .line 34
    iput-object v2, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->singleByte:[B

    .line 35
    iput-boolean v0, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->endOfData:Z

    .line 39
    new-instance v2, Ljava/io/DataInputStream;

    invoke-direct {v2, p1}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v2, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->din:Ljava/io/DataInputStream;

    .line 40
    iput-object p2, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->id:Ljava/lang/String;

    new-array p1, v1, [Ljava/lang/Object;

    aput-object p2, p1, v0

    const-string p2, "Creating chunked input for %s"

    .line 41
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "ChunkedInputStream"

    invoke-static {p2, p1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public close()V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    .line 46
    iget-object v1, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->id:Ljava/lang/String;

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "%s: Closing chunked input."

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "ChunkedInputStream"

    invoke-static {v1, v0}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    iget-object v0, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->din:Ljava/io/DataInputStream;

    invoke-virtual {v0}, Ljava/io/DataInputStream;->close()V

    return-void
.end method

.method public isEndOfData()Z
    .locals 1

    .line 99
    iget-boolean v0, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->endOfData:Z

    return v0
.end method

.method public read()I
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 52
    iget-object v0, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->singleByte:[B

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {p0, v0, v1, v2}, Lcom/arialyy/aria/http/ChunkedInputStream;->read([BII)I

    move-result v0

    const/4 v2, -0x1

    if-ne v0, v2, :cond_0

    goto :goto_0

    .line 53
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->singleByte:[B

    aget-byte v2, v0, v1

    :goto_0
    return v2
.end method

.method public read([BII)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "ChunkedInputStream"

    if-ltz p3, :cond_2

    const/4 v1, 0x0

    if-nez p3, :cond_0

    return v1

    .line 67
    :cond_0
    iget v2, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->unreadBytes:I

    if-nez v2, :cond_1

    .line 70
    :try_start_0
    iget-object v2, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->din:Ljava/io/DataInputStream;

    invoke-virtual {v2}, Ljava/io/DataInputStream;->readInt()I

    move-result v2

    iput v2, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->unreadBytes:I

    const-string v3, "%s: Chunk size %s"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    .line 72
    iget-object v5, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->id:Ljava/lang/String;

    aput-object v5, v4, v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    const/4 v5, 0x1

    aput-object v2, v4, v5

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    iget v2, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->unreadBytes:I

    if-nez v2, :cond_1

    const-string p1, "%s: Hit end of data"

    new-array p2, v5, [Ljava/lang/Object;

    .line 75
    iget-object p3, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->id:Ljava/lang/String;

    aput-object p3, p2, v1

    invoke-static {p1, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 76
    iput-boolean v5, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->endOfData:Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p1, -0x1

    return p1

    :catch_0
    move-exception p1

    .line 80
    new-instance p2, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->id:Ljava/lang/String;

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ": Error while attempting to read chunk length"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p3, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    .line 84
    :cond_1
    iget v0, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->unreadBytes:I

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 86
    :try_start_1
    iget-object v0, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->din:Ljava/io/DataInputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/DataInputStream;->readFully([BII)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 92
    iget p1, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->unreadBytes:I

    sub-int/2addr p1, p3

    iput p1, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->unreadBytes:I

    add-int/2addr v1, p3

    return v1

    :catch_1
    move-exception p1

    .line 88
    new-instance p2, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->id:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ": Error while attempting to read "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " bytes from current chunk"

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p3

    invoke-direct {p2, p3, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2

    .line 61
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object p3, p0, Lcom/arialyy/aria/http/ChunkedInputStream;->id:Ljava/lang/String;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p3, ": Negative read length"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
