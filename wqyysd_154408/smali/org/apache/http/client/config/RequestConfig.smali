.class public Lorg/apache/http/client/config/RequestConfig;
.super Ljava/lang/Object;
.source "RequestConfig.java"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/http/client/config/RequestConfig$Builder;
    }
.end annotation


# static fields
.field public static final DEFAULT:Lorg/apache/http/client/config/RequestConfig;


# instance fields
.field private final authenticationEnabled:Z

.field private final circularRedirectsAllowed:Z

.field private final connectTimeout:I

.field private final connectionRequestTimeout:I

.field private final contentCompressionEnabled:Z

.field private final cookieSpec:Ljava/lang/String;

.field private final expectContinueEnabled:Z

.field private final localAddress:Ljava/net/InetAddress;

.field private final maxRedirects:I

.field private final normalizeUri:Z

.field private final proxy:Lorg/apache/http/HttpHost;

.field private final proxyPreferredAuthSchemes:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final redirectsEnabled:Z

.field private final relativeRedirectsAllowed:Z

.field private final socketTimeout:I

.field private final staleConnectionCheckEnabled:Z

.field private final targetPreferredAuthSchemes:Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 45
    new-instance v0, Lorg/apache/http/client/config/RequestConfig$Builder;

    invoke-direct {v0}, Lorg/apache/http/client/config/RequestConfig$Builder;-><init>()V

    invoke-virtual {v0}, Lorg/apache/http/client/config/RequestConfig$Builder;->build()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v0

    sput-object v0, Lorg/apache/http/client/config/RequestConfig;->DEFAULT:Lorg/apache/http/client/config/RequestConfig;

    return-void
.end method

.method protected constructor <init>()V
    .locals 18

    move-object/from16 v0, p0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x1

    const/16 v17, 0x1

    .line 69
    invoke-direct/range {v0 .. v17}, Lorg/apache/http/client/config/RequestConfig;-><init>(ZLorg/apache/http/HttpHost;Ljava/net/InetAddress;ZLjava/lang/String;ZZZIZLjava/util/Collection;Ljava/util/Collection;IIIZZ)V

    return-void
.end method

.method constructor <init>(ZLorg/apache/http/HttpHost;Ljava/net/InetAddress;ZLjava/lang/String;ZZZIZLjava/util/Collection;Ljava/util/Collection;IIIZZ)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Lorg/apache/http/HttpHost;",
            "Ljava/net/InetAddress;",
            "Z",
            "Ljava/lang/String;",
            "ZZZIZ",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;IIIZZ)V"
        }
    .end annotation

    move-object v0, p0

    .line 90
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    move v1, p1

    .line 91
    iput-boolean v1, v0, Lorg/apache/http/client/config/RequestConfig;->expectContinueEnabled:Z

    move-object v1, p2

    .line 92
    iput-object v1, v0, Lorg/apache/http/client/config/RequestConfig;->proxy:Lorg/apache/http/HttpHost;

    move-object v1, p3

    .line 93
    iput-object v1, v0, Lorg/apache/http/client/config/RequestConfig;->localAddress:Ljava/net/InetAddress;

    move v1, p4

    .line 94
    iput-boolean v1, v0, Lorg/apache/http/client/config/RequestConfig;->staleConnectionCheckEnabled:Z

    move-object v1, p5

    .line 95
    iput-object v1, v0, Lorg/apache/http/client/config/RequestConfig;->cookieSpec:Ljava/lang/String;

    move v1, p6

    .line 96
    iput-boolean v1, v0, Lorg/apache/http/client/config/RequestConfig;->redirectsEnabled:Z

    move v1, p7

    .line 97
    iput-boolean v1, v0, Lorg/apache/http/client/config/RequestConfig;->relativeRedirectsAllowed:Z

    move v1, p8

    .line 98
    iput-boolean v1, v0, Lorg/apache/http/client/config/RequestConfig;->circularRedirectsAllowed:Z

    move v1, p9

    .line 99
    iput v1, v0, Lorg/apache/http/client/config/RequestConfig;->maxRedirects:I

    move v1, p10

    .line 100
    iput-boolean v1, v0, Lorg/apache/http/client/config/RequestConfig;->authenticationEnabled:Z

    move-object v1, p11

    .line 101
    iput-object v1, v0, Lorg/apache/http/client/config/RequestConfig;->targetPreferredAuthSchemes:Ljava/util/Collection;

    move-object v1, p12

    .line 102
    iput-object v1, v0, Lorg/apache/http/client/config/RequestConfig;->proxyPreferredAuthSchemes:Ljava/util/Collection;

    move v1, p13

    .line 103
    iput v1, v0, Lorg/apache/http/client/config/RequestConfig;->connectionRequestTimeout:I

    move/from16 v1, p14

    .line 104
    iput v1, v0, Lorg/apache/http/client/config/RequestConfig;->connectTimeout:I

    move/from16 v1, p15

    .line 105
    iput v1, v0, Lorg/apache/http/client/config/RequestConfig;->socketTimeout:I

    move/from16 v1, p16

    .line 106
    iput-boolean v1, v0, Lorg/apache/http/client/config/RequestConfig;->contentCompressionEnabled:Z

    move/from16 v1, p17

    .line 107
    iput-boolean v1, v0, Lorg/apache/http/client/config/RequestConfig;->normalizeUri:Z

    return-void
.end method

.method public static copy(Lorg/apache/http/client/config/RequestConfig;)Lorg/apache/http/client/config/RequestConfig$Builder;
    .locals 2

    .line 385
    new-instance v0, Lorg/apache/http/client/config/RequestConfig$Builder;

    invoke-direct {v0}, Lorg/apache/http/client/config/RequestConfig$Builder;-><init>()V

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->isExpectContinueEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setExpectContinueEnabled(Z)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->getProxy()Lorg/apache/http/HttpHost;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setProxy(Lorg/apache/http/HttpHost;)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->getLocalAddress()Ljava/net/InetAddress;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setLocalAddress(Ljava/net/InetAddress;)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->isStaleConnectionCheckEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setStaleConnectionCheckEnabled(Z)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->getCookieSpec()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setCookieSpec(Ljava/lang/String;)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->isRedirectsEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setRedirectsEnabled(Z)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->isRelativeRedirectsAllowed()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setRelativeRedirectsAllowed(Z)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->isCircularRedirectsAllowed()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setCircularRedirectsAllowed(Z)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->getMaxRedirects()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setMaxRedirects(I)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->isAuthenticationEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setAuthenticationEnabled(Z)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->getTargetPreferredAuthSchemes()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setTargetPreferredAuthSchemes(Ljava/util/Collection;)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->getProxyPreferredAuthSchemes()Ljava/util/Collection;

    move-result-object v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setProxyPreferredAuthSchemes(Ljava/util/Collection;)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->getConnectionRequestTimeout()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setConnectionRequestTimeout(I)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->getConnectTimeout()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setConnectTimeout(I)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->getSocketTimeout()I

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setSocketTimeout(I)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->isDecompressionEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setDecompressionEnabled(Z)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->isContentCompressionEnabled()Z

    move-result v1

    invoke-virtual {v0, v1}, Lorg/apache/http/client/config/RequestConfig$Builder;->setContentCompressionEnabled(Z)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object v0

    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->isNormalizeUri()Z

    move-result p0

    invoke-virtual {v0, p0}, Lorg/apache/http/client/config/RequestConfig$Builder;->setNormalizeUri(Z)Lorg/apache/http/client/config/RequestConfig$Builder;

    move-result-object p0

    return-object p0
.end method

.method public static custom()Lorg/apache/http/client/config/RequestConfig$Builder;
    .locals 1

    .line 380
    new-instance v0, Lorg/apache/http/client/config/RequestConfig$Builder;

    invoke-direct {v0}, Lorg/apache/http/client/config/RequestConfig$Builder;-><init>()V

    return-object v0
.end method


# virtual methods
.method protected bridge synthetic clone()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 42
    invoke-virtual {p0}, Lorg/apache/http/client/config/RequestConfig;->clone()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v0

    return-object v0
.end method

.method protected clone()Lorg/apache/http/client/config/RequestConfig;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/CloneNotSupportedException;
        }
    .end annotation

    .line 352
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lorg/apache/http/client/config/RequestConfig;

    return-object v0
.end method

.method public getConnectTimeout()I
    .locals 1

    .line 293
    iget v0, p0, Lorg/apache/http/client/config/RequestConfig;->connectTimeout:I

    return v0
.end method

.method public getConnectionRequestTimeout()I
    .locals 1

    .line 278
    iget v0, p0, Lorg/apache/http/client/config/RequestConfig;->connectionRequestTimeout:I

    return v0
.end method

.method public getCookieSpec()Ljava/lang/String;
    .locals 1

    .line 186
    iget-object v0, p0, Lorg/apache/http/client/config/RequestConfig;->cookieSpec:Ljava/lang/String;

    return-object v0
.end method

.method public getLocalAddress()Ljava/net/InetAddress;
    .locals 1

    .line 158
    iget-object v0, p0, Lorg/apache/http/client/config/RequestConfig;->localAddress:Ljava/net/InetAddress;

    return-object v0
.end method

.method public getMaxRedirects()I
    .locals 1

    .line 230
    iget v0, p0, Lorg/apache/http/client/config/RequestConfig;->maxRedirects:I

    return v0
.end method

.method public getProxy()Lorg/apache/http/HttpHost;
    .locals 1

    .line 143
    iget-object v0, p0, Lorg/apache/http/client/config/RequestConfig;->proxy:Lorg/apache/http/HttpHost;

    return-object v0
.end method

.method public getProxyPreferredAuthSchemes()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 262
    iget-object v0, p0, Lorg/apache/http/client/config/RequestConfig;->proxyPreferredAuthSchemes:Ljava/util/Collection;

    return-object v0
.end method

.method public getSocketTimeout()I
    .locals 1

    .line 309
    iget v0, p0, Lorg/apache/http/client/config/RequestConfig;->socketTimeout:I

    return v0
.end method

.method public getTargetPreferredAuthSchemes()Ljava/util/Collection;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 251
    iget-object v0, p0, Lorg/apache/http/client/config/RequestConfig;->targetPreferredAuthSchemes:Ljava/util/Collection;

    return-object v0
.end method

.method public isAuthenticationEnabled()Z
    .locals 1

    .line 240
    iget-boolean v0, p0, Lorg/apache/http/client/config/RequestConfig;->authenticationEnabled:Z

    return v0
.end method

.method public isCircularRedirectsAllowed()Z
    .locals 1

    .line 219
    iget-boolean v0, p0, Lorg/apache/http/client/config/RequestConfig;->circularRedirectsAllowed:Z

    return v0
.end method

.method public isContentCompressionEnabled()Z
    .locals 1

    .line 335
    iget-boolean v0, p0, Lorg/apache/http/client/config/RequestConfig;->contentCompressionEnabled:Z

    return v0
.end method

.method public isDecompressionEnabled()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 323
    iget-boolean v0, p0, Lorg/apache/http/client/config/RequestConfig;->contentCompressionEnabled:Z

    return v0
.end method

.method public isExpectContinueEnabled()Z
    .locals 1

    .line 133
    iget-boolean v0, p0, Lorg/apache/http/client/config/RequestConfig;->expectContinueEnabled:Z

    return v0
.end method

.method public isNormalizeUri()Z
    .locals 1

    .line 347
    iget-boolean v0, p0, Lorg/apache/http/client/config/RequestConfig;->normalizeUri:Z

    return v0
.end method

.method public isRedirectsEnabled()Z
    .locals 1

    .line 196
    iget-boolean v0, p0, Lorg/apache/http/client/config/RequestConfig;->redirectsEnabled:Z

    return v0
.end method

.method public isRelativeRedirectsAllowed()Z
    .locals 1

    .line 207
    iget-boolean v0, p0, Lorg/apache/http/client/config/RequestConfig;->relativeRedirectsAllowed:Z

    return v0
.end method

.method public isStaleConnectionCheckEnabled()Z
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 175
    iget-boolean v0, p0, Lorg/apache/http/client/config/RequestConfig;->staleConnectionCheckEnabled:Z

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 357
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "["

    .line 358
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "expectContinueEnabled="

    .line 359
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lorg/apache/http/client/config/RequestConfig;->expectContinueEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", proxy="

    .line 360
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/http/client/config/RequestConfig;->proxy:Lorg/apache/http/HttpHost;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", localAddress="

    .line 361
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/http/client/config/RequestConfig;->localAddress:Ljava/net/InetAddress;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", cookieSpec="

    .line 362
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/http/client/config/RequestConfig;->cookieSpec:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ", redirectsEnabled="

    .line 363
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lorg/apache/http/client/config/RequestConfig;->redirectsEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", relativeRedirectsAllowed="

    .line 364
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lorg/apache/http/client/config/RequestConfig;->relativeRedirectsAllowed:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", maxRedirects="

    .line 365
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/apache/http/client/config/RequestConfig;->maxRedirects:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", circularRedirectsAllowed="

    .line 366
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lorg/apache/http/client/config/RequestConfig;->circularRedirectsAllowed:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", authenticationEnabled="

    .line 367
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lorg/apache/http/client/config/RequestConfig;->authenticationEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", targetPreferredAuthSchemes="

    .line 368
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/http/client/config/RequestConfig;->targetPreferredAuthSchemes:Ljava/util/Collection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", proxyPreferredAuthSchemes="

    .line 369
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/apache/http/client/config/RequestConfig;->proxyPreferredAuthSchemes:Ljava/util/Collection;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", connectionRequestTimeout="

    .line 370
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/apache/http/client/config/RequestConfig;->connectionRequestTimeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", connectTimeout="

    .line 371
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/apache/http/client/config/RequestConfig;->connectTimeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", socketTimeout="

    .line 372
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v1, p0, Lorg/apache/http/client/config/RequestConfig;->socketTimeout:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, ", contentCompressionEnabled="

    .line 373
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lorg/apache/http/client/config/RequestConfig;->contentCompressionEnabled:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", normalizeUri="

    .line 374
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lorg/apache/http/client/config/RequestConfig;->normalizeUri:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, "]"

    .line 375
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
