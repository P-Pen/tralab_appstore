.class public final Lorg/apache/http/params/HttpConnectionParams;
.super Ljava/lang/Object;
.source "HttpConnectionParams.java"

# interfaces
.implements Lorg/apache/http/params/CoreConnectionPNames;


# annotations
.annotation runtime Ljava/lang/Deprecated;
.end annotation


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getConnectionTimeout(Lorg/apache/http/params/HttpParams;)I
    .locals 2

    const-string v0, "HTTP parameters"

    .line 176
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.connection.timeout"

    const/4 v1, 0x0

    .line 177
    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static getLinger(Lorg/apache/http/params/HttpParams;)I
    .locals 2

    const-string v0, "HTTP parameters"

    .line 153
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.socket.linger"

    const/4 v1, -0x1

    .line 154
    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static getSoKeepalive(Lorg/apache/http/params/HttpParams;)Z
    .locals 2

    const-string v0, "HTTP parameters"

    .line 226
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.socket.keepalive"

    const/4 v1, 0x0

    .line 227
    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static getSoReuseaddr(Lorg/apache/http/params/HttpParams;)Z
    .locals 2

    const-string v0, "HTTP parameters"

    .line 81
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.socket.reuseaddr"

    const/4 v1, 0x0

    .line 82
    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static getSoTimeout(Lorg/apache/http/params/HttpParams;)I
    .locals 2

    const-string v0, "HTTP parameters"

    .line 55
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.socket.timeout"

    const/4 v1, 0x0

    .line 56
    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static getSocketBufferSize(Lorg/apache/http/params/HttpParams;)I
    .locals 2

    const-string v0, "HTTP parameters"

    .line 129
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.socket.buffer-size"

    const/4 v1, -0x1

    .line 130
    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getIntParameter(Ljava/lang/String;I)I

    move-result p0

    return p0
.end method

.method public static getTcpNoDelay(Lorg/apache/http/params/HttpParams;)Z
    .locals 2

    const-string v0, "HTTP parameters"

    .line 106
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.tcp.nodelay"

    const/4 v1, 0x1

    .line 107
    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static isStaleCheckingEnabled(Lorg/apache/http/params/HttpParams;)Z
    .locals 2

    const-string v0, "HTTP parameters"

    .line 200
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.connection.stalecheck"

    const/4 v1, 0x1

    .line 201
    invoke-interface {p0, v0, v1}, Lorg/apache/http/params/HttpParams;->getBooleanParameter(Ljava/lang/String;Z)Z

    move-result p0

    return p0
.end method

.method public static setConnectionTimeout(Lorg/apache/http/params/HttpParams;I)V
    .locals 1

    const-string v0, "HTTP parameters"

    .line 188
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.connection.timeout"

    .line 189
    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    return-void
.end method

.method public static setLinger(Lorg/apache/http/params/HttpParams;I)V
    .locals 1

    const-string v0, "HTTP parameters"

    .line 164
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.socket.linger"

    .line 165
    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    return-void
.end method

.method public static setSoKeepalive(Lorg/apache/http/params/HttpParams;Z)V
    .locals 1

    const-string v0, "HTTP parameters"

    .line 239
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.socket.keepalive"

    .line 240
    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    return-void
.end method

.method public static setSoReuseaddr(Lorg/apache/http/params/HttpParams;Z)V
    .locals 1

    const-string v0, "HTTP parameters"

    .line 94
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.socket.reuseaddr"

    .line 95
    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    return-void
.end method

.method public static setSoTimeout(Lorg/apache/http/params/HttpParams;I)V
    .locals 1

    const-string v0, "HTTP parameters"

    .line 66
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.socket.timeout"

    .line 67
    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    return-void
.end method

.method public static setSocketBufferSize(Lorg/apache/http/params/HttpParams;I)V
    .locals 1

    const-string v0, "HTTP parameters"

    .line 141
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.socket.buffer-size"

    .line 142
    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setIntParameter(Ljava/lang/String;I)Lorg/apache/http/params/HttpParams;

    return-void
.end method

.method public static setStaleCheckingEnabled(Lorg/apache/http/params/HttpParams;Z)V
    .locals 1

    const-string v0, "HTTP parameters"

    .line 212
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.connection.stalecheck"

    .line 213
    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    return-void
.end method

.method public static setTcpNoDelay(Lorg/apache/http/params/HttpParams;Z)V
    .locals 1

    const-string v0, "HTTP parameters"

    .line 117
    invoke-static {p0, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "http.tcp.nodelay"

    .line 118
    invoke-interface {p0, v0, p1}, Lorg/apache/http/params/HttpParams;->setBooleanParameter(Ljava/lang/String;Z)Lorg/apache/http/params/HttpParams;

    return-void
.end method
