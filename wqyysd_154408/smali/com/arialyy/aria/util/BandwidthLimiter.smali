.class public Lcom/arialyy/aria/util/BandwidthLimiter;
.super Ljava/lang/Object;
.source "BandwidthLimiter.java"


# static fields
.field private static CHUNK_LENGTH:Ljava/lang/Long; = null

.field private static KB:Ljava/lang/Long; = null

.field public static maxBandWith:I = 0x800


# instance fields
.field private bytesWillBeSentOrReceive:I

.field private lastPieceSentOrReceiveTick:J

.field private maxRate:I

.field private timeCostPerChunk:J


# direct methods
.method static constructor <clinit>()V
    .locals 2

    const-wide/16 v0, 0x400

    .line 27
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    sput-object v0, Lcom/arialyy/aria/util/BandwidthLimiter;->KB:Ljava/lang/Long;

    .line 29
    sput-object v0, Lcom/arialyy/aria/util/BandwidthLimiter;->CHUNK_LENGTH:Ljava/lang/Long;

    return-void
.end method

.method public constructor <init>(II)V
    .locals 6

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 31
    iput v0, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->bytesWillBeSentOrReceive:I

    .line 33
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->lastPieceSentOrReceiveTick:J

    const/16 v0, 0x400

    .line 35
    iput v0, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->maxRate:I

    .line 37
    sget-object v0, Lcom/arialyy/aria/util/BandwidthLimiter;->CHUNK_LENGTH:Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    const-wide/32 v2, 0x3b9aca00

    mul-long/2addr v0, v2

    iget v2, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->maxRate:I

    int-to-long v2, v2

    sget-object v4, Lcom/arialyy/aria/util/BandwidthLimiter;->KB:Ljava/lang/Long;

    .line 38
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    mul-long/2addr v2, v4

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->timeCostPerChunk:J

    const/4 v0, 0x1

    if-le p2, v0, :cond_0

    .line 47
    div-int/2addr p1, p2

    .line 49
    :cond_0
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/util/BandwidthLimiter;->setMaxRate(I)V

    return-void
.end method


# virtual methods
.method public declared-synchronized limitNextBytes()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x1

    .line 77
    :try_start_0
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/util/BandwidthLimiter;->limitNextBytes(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public declared-synchronized limitNextBytes(I)V
    .locals 10

    monitor-enter p0

    .line 84
    :try_start_0
    iget v0, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->bytesWillBeSentOrReceive:I

    add-int/2addr v0, p1

    iput v0, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->bytesWillBeSentOrReceive:I

    .line 87
    :goto_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Thread;->isInterrupted()Z

    move-result p1

    if-nez p1, :cond_2

    iget p1, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->bytesWillBeSentOrReceive:I

    int-to-long v0, p1

    sget-object p1, Lcom/arialyy/aria/util/BandwidthLimiter;->CHUNK_LENGTH:Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    cmp-long p1, v0, v2

    if-lez p1, :cond_2

    .line 88
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 89
    iget-wide v2, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->timeCostPerChunk:J

    iget-wide v4, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->lastPieceSentOrReceiveTick:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-long v4, v0, v4

    sub-long/2addr v2, v4

    const-wide/16 v4, 0x0

    cmp-long p1, v2, v4

    if-lez p1, :cond_0

    .line 93
    :try_start_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    const-wide/32 v6, 0xf4240

    div-long v8, v2, v6

    rem-long v6, v2, v6

    long-to-int v6, v6

    invoke-static {v8, v9, v6}, Ljava/lang/Thread;->sleep(JI)V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_1

    :catch_0
    move-exception v6

    .line 96
    :try_start_2
    invoke-virtual {v6}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 99
    :cond_0
    :goto_1
    iget v6, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->bytesWillBeSentOrReceive:I

    int-to-long v6, v6

    sget-object v8, Lcom/arialyy/aria/util/BandwidthLimiter;->CHUNK_LENGTH:Ljava/lang/Long;

    invoke-virtual {v8}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    sub-long/2addr v6, v8

    long-to-int v6, v6

    iput v6, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->bytesWillBeSentOrReceive:I

    if-lez p1, :cond_1

    goto :goto_2

    :cond_1
    move-wide v2, v4

    :goto_2
    add-long/2addr v0, v2

    .line 100
    iput-wide v0, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->lastPieceSentOrReceiveTick:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 103
    :cond_2
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public declared-synchronized setMaxRate(I)V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/IllegalArgumentException;
        }
    .end annotation

    monitor-enter p0

    if-ltz p1, :cond_1

    .line 64
    :try_start_0
    iput p1, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->maxRate:I

    if-nez p1, :cond_0

    const-wide/16 v0, 0x0

    .line 66
    iput-wide v0, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->timeCostPerChunk:J

    goto :goto_0

    :cond_0
    const-wide/32 v0, 0x3b9aca00

    .line 68
    sget-object p1, Lcom/arialyy/aria/util/BandwidthLimiter;->CHUNK_LENGTH:Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    mul-long/2addr v2, v0

    iget p1, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->maxRate:I

    int-to-long v0, p1

    sget-object p1, Lcom/arialyy/aria/util/BandwidthLimiter;->KB:Ljava/lang/Long;

    .line 69
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    mul-long/2addr v0, v4

    div-long/2addr v2, v0

    iput-wide v2, p0, Lcom/arialyy/aria/util/BandwidthLimiter;->timeCostPerChunk:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 62
    :cond_1
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "maxRate can not less than 0"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_1
    monitor-exit p0

    throw p1
.end method
