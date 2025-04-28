.class public final Lcom/arialyy/aria/util/BufferedRandomAccessFile;
.super Ljava/io/RandomAccessFile;
.source "BufferedRandomAccessFile.java"


# static fields
.field static final BuffMask_:J = -0x10000L

.field public static final BuffSz_:I = 0x10000

.field static final LogBuffSz_:I = 0x10


# instance fields
.field private buff_:[B

.field private closed_:Z

.field private curr_:J

.field private dirty_:Z

.field private diskPos_:J

.field private hi_:J

.field private hitEOF_:Z

.field private lo_:J

.field private maxHi_:J


# direct methods
.method public constructor <init>(Ljava/io/File;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 118
    invoke-direct {p0, p1, p2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 119
    invoke-direct {p0, p1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->init(I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 123
    invoke-direct {p0, p1, p2}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 124
    invoke-direct {p0, p3}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->init(I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 133
    invoke-direct {p0, p1, p2}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p1, 0x0

    .line 134
    invoke-direct {p0, p1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->init(I)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 138
    invoke-direct {p0, p1, p2}, Ljava/io/RandomAccessFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    invoke-direct {p0, p3}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->init(I)V

    return-void
.end method

.method private fillBuffer()I
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 183
    iget-object v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->buff_:[B

    array-length v0, v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-lez v0, :cond_1

    .line 185
    iget-object v3, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->buff_:[B

    invoke-super {p0, v3, v2, v0}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result v3

    if-gez v3, :cond_0

    goto :goto_1

    :cond_0
    add-int/2addr v2, v3

    sub-int/2addr v0, v3

    goto :goto_0

    :cond_1
    :goto_1
    if-gez v2, :cond_3

    .line 190
    iget-object v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->buff_:[B

    array-length v3, v0

    if-ge v2, v3, :cond_2

    const/4 v1, 0x1

    :cond_2
    iput-boolean v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hitEOF_:Z

    if-eqz v1, :cond_3

    .line 192
    array-length v1, v0

    const/4 v3, -0x1

    invoke-static {v0, v2, v1, v3}, Ljava/util/Arrays;->fill([BIIB)V

    .line 194
    :cond_3
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->diskPos_:J

    int-to-long v3, v2

    add-long/2addr v0, v3

    iput-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->diskPos_:J

    return v2
.end method

.method private flushBuffer()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 167
    iget-boolean v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->dirty_:Z

    if-eqz v0, :cond_1

    .line 168
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->diskPos_:J

    iget-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->lo_:J

    cmp-long v0, v0, v2

    if-eqz v0, :cond_0

    invoke-super {p0, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 169
    :cond_0
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iget-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->lo_:J

    sub-long/2addr v0, v2

    long-to-int v0, v0

    .line 170
    iget-object v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->buff_:[B

    const/4 v2, 0x0

    invoke-super {p0, v1, v2, v0}, Ljava/io/RandomAccessFile;->write([BII)V

    .line 171
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iput-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->diskPos_:J

    .line 172
    iput-boolean v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->dirty_:Z

    :cond_1
    return-void
.end method

.method private init(I)V
    .locals 5

    const/4 v0, 0x0

    .line 143
    iput-boolean v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->closed_:Z

    iput-boolean v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->dirty_:Z

    const-wide/16 v1, 0x0

    .line 144
    iput-wide v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    iput-wide v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iput-wide v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->lo_:J

    const/high16 v3, 0x10000

    if-le p1, v3, :cond_0

    .line 145
    new-array p1, p1, [B

    goto :goto_0

    :cond_0
    new-array p1, v3, [B

    :goto_0
    iput-object p1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->buff_:[B

    const-wide/32 v3, 0x10000

    .line 146
    iput-wide v3, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->maxHi_:J

    .line 147
    iput-boolean v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hitEOF_:Z

    .line 148
    iput-wide v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->diskPos_:J

    return-void
.end method

.method private writeAtMost([BII)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 310
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iget-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    cmp-long v4, v0, v2

    if-ltz v4, :cond_1

    .line 311
    iget-boolean v4, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hitEOF_:Z

    if-eqz v4, :cond_0

    iget-wide v4, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->maxHi_:J

    cmp-long v2, v2, v4

    if-gez v2, :cond_0

    .line 313
    iput-wide v4, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    goto :goto_0

    .line 316
    :cond_0
    invoke-virtual {p0, v0, v1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->seek(J)V

    .line 317
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iget-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    .line 319
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->maxHi_:J

    iput-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    .line 323
    :cond_1
    :goto_0
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    iget-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    sub-long/2addr v0, v2

    long-to-int v0, v0

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 324
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iget-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->lo_:J

    sub-long/2addr v0, v2

    long-to-int v0, v0

    .line 325
    iget-object v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->buff_:[B

    invoke-static {p1, p2, v1, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 326
    iget-wide p1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    int-to-long v0, p3

    add-long/2addr p1, v0

    iput-wide p1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    return p3
.end method


# virtual methods
.method public close()V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 152
    invoke-virtual {p0}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->flush()V

    const/4 v0, 0x1

    .line 153
    iput-boolean v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->closed_:Z

    .line 154
    invoke-super {p0}, Ljava/io/RandomAccessFile;->close()V

    return-void
.end method

.method public flush()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 162
    invoke-direct {p0}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->flushBuffer()V

    return-void
.end method

.method public getFilePointer()J
    .locals 2

    .line 230
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    return-wide v0
.end method

.method public length()J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 234
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    invoke-super {p0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v2

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public read()I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 238
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iget-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_1

    .line 241
    iget-boolean v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hitEOF_:Z

    const/4 v3, -0x1

    if-eqz v2, :cond_0

    return v3

    .line 244
    :cond_0
    invoke-virtual {p0, v0, v1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->seek(J)V

    .line 245
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iget-wide v4, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    cmp-long v0, v0, v4

    if-nez v0, :cond_1

    return v3

    .line 247
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->buff_:[B

    iget-wide v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iget-wide v3, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->lo_:J

    sub-long v3, v1, v3

    long-to-int v3, v3

    aget-byte v0, v0, v3

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    .line 248
    iput-wide v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    and-int/lit16 v0, v0, 0xff

    return v0
.end method

.method public read([B)I
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 253
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->read([BII)I

    move-result p1

    return p1
.end method

.method public read([BII)I
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 257
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iget-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    cmp-long v2, v0, v2

    if-ltz v2, :cond_1

    .line 260
    iget-boolean v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hitEOF_:Z

    const/4 v3, -0x1

    if-eqz v2, :cond_0

    return v3

    .line 263
    :cond_0
    invoke-virtual {p0, v0, v1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->seek(J)V

    .line 264
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iget-wide v4, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    cmp-long v0, v0, v4

    if-nez v0, :cond_1

    return v3

    .line 266
    :cond_1
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    iget-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    sub-long/2addr v0, v2

    long-to-int v0, v0

    invoke-static {p3, v0}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 267
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iget-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->lo_:J

    sub-long/2addr v0, v2

    long-to-int v0, v0

    .line 268
    iget-object v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->buff_:[B

    invoke-static {v1, v0, p1, p2, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 269
    iget-wide p1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    int-to-long v0, p3

    add-long/2addr p1, v0

    iput-wide p1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    return p3
.end method

.method public seek(J)V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 208
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    cmp-long v0, p1, v0

    if-gez v0, :cond_1

    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->lo_:J

    cmp-long v0, p1, v0

    if-gez v0, :cond_0

    goto :goto_0

    .line 221
    :cond_0
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    cmp-long v0, p1, v0

    if-gez v0, :cond_3

    .line 223
    invoke-direct {p0}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->flushBuffer()V

    goto :goto_1

    .line 210
    :cond_1
    :goto_0
    invoke-direct {p0}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->flushBuffer()V

    const-wide/32 v0, -0x10000

    and-long/2addr v0, p1

    .line 211
    iput-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->lo_:J

    .line 212
    iget-object v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->buff_:[B

    array-length v2, v2

    int-to-long v2, v2

    add-long/2addr v2, v0

    iput-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->maxHi_:J

    .line 213
    iget-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->diskPos_:J

    cmp-long v2, v2, v0

    if-eqz v2, :cond_2

    .line 214
    invoke-super {p0, v0, v1}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 215
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->lo_:J

    iput-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->diskPos_:J

    .line 217
    :cond_2
    invoke-direct {p0}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->fillBuffer()I

    move-result v0

    .line 218
    iget-wide v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->lo_:J

    int-to-long v3, v0

    add-long/2addr v1, v3

    iput-wide v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    .line 226
    :cond_3
    :goto_1
    iput-wide p1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    return-void
.end method

.method public write(I)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 274
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iget-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    cmp-long v4, v0, v2

    const-wide/16 v5, 0x1

    if-ltz v4, :cond_1

    .line 275
    iget-boolean v4, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hitEOF_:Z

    if-eqz v4, :cond_0

    iget-wide v7, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->maxHi_:J

    cmp-long v4, v2, v7

    if-gez v4, :cond_0

    add-long/2addr v2, v5

    .line 277
    iput-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    goto :goto_0

    .line 280
    :cond_0
    invoke-virtual {p0, v0, v1}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->seek(J)V

    .line 281
    iget-wide v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iget-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    cmp-long v0, v0, v2

    if-nez v0, :cond_1

    add-long/2addr v2, v5

    .line 283
    iput-wide v2, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->hi_:J

    .line 287
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->buff_:[B

    iget-wide v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    iget-wide v3, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->lo_:J

    sub-long v3, v1, v3

    long-to-int v3, v3

    int-to-byte p1, p1

    aput-byte p1, v0, v3

    add-long/2addr v1, v5

    .line 288
    iput-wide v1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->curr_:J

    const/4 p1, 0x1

    .line 289
    iput-boolean p1, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->dirty_:Z

    return-void
.end method

.method public write([B)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 293
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    :goto_0
    if-lez p3, :cond_0

    .line 298
    invoke-direct {p0, p1, p2, p3}, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->writeAtMost([BII)I

    move-result v0

    add-int/2addr p2, v0

    sub-int/2addr p3, v0

    const/4 v0, 0x1

    .line 301
    iput-boolean v0, p0, Lcom/arialyy/aria/util/BufferedRandomAccessFile;->dirty_:Z

    goto :goto_0

    :cond_0
    return-void
.end method
