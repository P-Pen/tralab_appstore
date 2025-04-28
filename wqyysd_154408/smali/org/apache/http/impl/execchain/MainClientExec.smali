.class public Lorg/apache/http/impl/execchain/MainClientExec;
.super Ljava/lang/Object;
.source "MainClientExec.java"

# interfaces
.implements Lorg/apache/http/impl/execchain/ClientExecChain;


# instance fields
.field private final authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

.field private final connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

.field private final keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

.field private final log:Lorg/apache/commons/logging/Log;

.field private final proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

.field private final proxyHttpProcessor:Lorg/apache/http/protocol/HttpProcessor;

.field private final requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

.field private final reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

.field private final routeDirector:Lorg/apache/http/conn/routing/HttpRouteDirector;

.field private final targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

.field private final userTokenHandler:Lorg/apache/http/client/UserTokenHandler;


# direct methods
.method public constructor <init>(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;)V
    .locals 9

    .line 144
    new-instance v5, Lorg/apache/http/protocol/ImmutableHttpProcessor;

    const/4 v0, 0x1

    new-array v0, v0, [Lorg/apache/http/HttpRequestInterceptor;

    new-instance v1, Lorg/apache/http/protocol/RequestTargetHost;

    invoke-direct {v1}, Lorg/apache/http/protocol/RequestTargetHost;-><init>()V

    const/4 v2, 0x0

    aput-object v1, v0, v2

    invoke-direct {v5, v0}, Lorg/apache/http/protocol/ImmutableHttpProcessor;-><init>([Lorg/apache/http/HttpRequestInterceptor;)V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v4, p4

    move-object v6, p5

    move-object v7, p6

    move-object/from16 v8, p7

    invoke-direct/range {v0 .. v8}, Lorg/apache/http/impl/execchain/MainClientExec;-><init>(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/http/protocol/HttpRequestExecutor;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/ConnectionReuseStrategy;Lorg/apache/http/conn/ConnectionKeepAliveStrategy;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/client/UserTokenHandler;)V
    .locals 1

    .line 115
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 91
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lorg/apache/commons/logging/LogFactory;->getLog(Ljava/lang/Class;)Lorg/apache/commons/logging/Log;

    move-result-object v0

    iput-object v0, p0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v0, "HTTP request executor"

    .line 116
    invoke-static {p1, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Client connection manager"

    .line 117
    invoke-static {p2, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Connection reuse strategy"

    .line 118
    invoke-static {p3, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Connection keep alive strategy"

    .line 119
    invoke-static {p4, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Proxy HTTP processor"

    .line 120
    invoke-static {p5, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Target authentication strategy"

    .line 121
    invoke-static {p6, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "Proxy authentication strategy"

    .line 122
    invoke-static {p7, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v0, "User token handler"

    .line 123
    invoke-static {p8, v0}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 124
    new-instance v0, Lorg/apache/http/impl/auth/HttpAuthenticator;

    invoke-direct {v0}, Lorg/apache/http/impl/auth/HttpAuthenticator;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    .line 125
    new-instance v0, Lorg/apache/http/conn/routing/BasicRouteDirector;

    invoke-direct {v0}, Lorg/apache/http/conn/routing/BasicRouteDirector;-><init>()V

    iput-object v0, p0, Lorg/apache/http/impl/execchain/MainClientExec;->routeDirector:Lorg/apache/http/conn/routing/HttpRouteDirector;

    .line 126
    iput-object p1, p0, Lorg/apache/http/impl/execchain/MainClientExec;->requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

    .line 127
    iput-object p2, p0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    .line 128
    iput-object p3, p0, Lorg/apache/http/impl/execchain/MainClientExec;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    .line 129
    iput-object p4, p0, Lorg/apache/http/impl/execchain/MainClientExec;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    .line 130
    iput-object p5, p0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyHttpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    .line 131
    iput-object p6, p0, Lorg/apache/http/impl/execchain/MainClientExec;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 132
    iput-object p7, p0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    .line 133
    iput-object p8, p0, Lorg/apache/http/impl/execchain/MainClientExec;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

    return-void
.end method

.method private createTunnelToProxy(Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/client/protocol/HttpClientContext;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;
        }
    .end annotation

    .line 555
    new-instance p1, Lorg/apache/http/HttpException;

    const-string p2, "Proxy chains are not supported."

    invoke-direct {p1, p2}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private createTunnelToTarget(Lorg/apache/http/auth/AuthState;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/protocol/HttpClientContext;)Z
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    move-object/from16 v8, p5

    .line 461
    invoke-virtual/range {p5 .. p5}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v9

    .line 462
    invoke-virtual {v9}, Lorg/apache/http/client/config/RequestConfig;->getConnectTimeout()I

    move-result v10

    .line 464
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    .line 465
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v11

    .line 468
    invoke-virtual {v2}, Lorg/apache/http/HttpHost;->toHostString()Ljava/lang/String;

    move-result-object v2

    .line 469
    new-instance v12, Lorg/apache/http/message/BasicHttpRequest;

    invoke-interface/range {p4 .. p4}, Lorg/apache/http/HttpRequest;->getProtocolVersion()Lorg/apache/http/ProtocolVersion;

    move-result-object v3

    const-string v4, "CONNECT"

    invoke-direct {v12, v4, v2, v3}, Lorg/apache/http/message/BasicHttpRequest;-><init>(Ljava/lang/String;Ljava/lang/String;Lorg/apache/http/ProtocolVersion;)V

    .line 471
    iget-object v2, v0, Lorg/apache/http/impl/execchain/MainClientExec;->requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

    iget-object v3, v0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyHttpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    invoke-virtual {v2, v12, v3, v8}, Lorg/apache/http/protocol/HttpRequestExecutor;->preProcess(Lorg/apache/http/HttpRequest;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V

    const/4 v13, 0x0

    :goto_0
    move-object v2, v13

    :goto_1
    const/4 v3, 0x0

    if-nez v2, :cond_6

    .line 474
    invoke-interface/range {p2 .. p2}, Lorg/apache/http/HttpClientConnection;->isOpen()Z

    move-result v2

    if-nez v2, :cond_1

    .line 475
    iget-object v2, v0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    move-object/from16 v14, p3

    if-lez v10, :cond_0

    move v3, v10

    :cond_0
    invoke-interface {v2, v1, v14, v3, v8}, Lorg/apache/http/conn/HttpClientConnectionManager;->connect(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/protocol/HttpContext;)V

    goto :goto_2

    :cond_1
    move-object/from16 v14, p3

    :goto_2
    const-string v2, "Proxy-Authorization"

    .line 482
    invoke-interface {v12, v2}, Lorg/apache/http/HttpRequest;->removeHeaders(Ljava/lang/String;)V

    .line 483
    iget-object v2, v0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    move-object/from16 v15, p1

    invoke-virtual {v2, v12, v15, v8}, Lorg/apache/http/impl/auth/HttpAuthenticator;->generateAuthResponse(Lorg/apache/http/HttpRequest;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)V

    .line 485
    iget-object v2, v0, Lorg/apache/http/impl/execchain/MainClientExec;->requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

    invoke-virtual {v2, v12, v1, v8}, Lorg/apache/http/protocol/HttpRequestExecutor;->execute(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v7

    .line 486
    iget-object v2, v0, Lorg/apache/http/impl/execchain/MainClientExec;->requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

    iget-object v3, v0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyHttpProcessor:Lorg/apache/http/protocol/HttpProcessor;

    invoke-virtual {v2, v7, v3, v8}, Lorg/apache/http/protocol/HttpRequestExecutor;->postProcess(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpProcessor;Lorg/apache/http/protocol/HttpContext;)V

    .line 488
    invoke-interface {v7}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v2

    const/16 v3, 0xc8

    if-lt v2, v3, :cond_5

    .line 494
    invoke-virtual {v9}, Lorg/apache/http/client/config/RequestConfig;->isAuthenticationEnabled()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 495
    iget-object v2, v0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    iget-object v5, v0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object v3, v11

    move-object v4, v7

    move-object/from16 v6, p1

    move-object/from16 p4, v7

    move-object/from16 v7, p5

    invoke-virtual/range {v2 .. v7}, Lorg/apache/http/impl/auth/HttpAuthenticator;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 497
    iget-object v2, v0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    iget-object v5, v0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object v3, v11

    move-object/from16 v4, p4

    move-object/from16 v6, p1

    move-object/from16 v7, p5

    invoke-virtual/range {v2 .. v7}, Lorg/apache/http/impl/auth/HttpAuthenticator;->handleAuthChallenge(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 500
    iget-object v2, v0, Lorg/apache/http/impl/execchain/MainClientExec;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    move-object/from16 v3, p4

    invoke-interface {v2, v3, v8}, Lorg/apache/http/ConnectionReuseStrategy;->keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 501
    iget-object v2, v0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v4, "Connection kept alive"

    invoke-interface {v2, v4}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 503
    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    .line 504
    invoke-static {v2}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    goto :goto_0

    .line 506
    :cond_2
    invoke-interface/range {p2 .. p2}, Lorg/apache/http/HttpClientConnection;->close()V

    goto/16 :goto_0

    :cond_3
    move-object/from16 v3, p4

    goto :goto_3

    :cond_4
    move-object v3, v7

    :goto_3
    move-object v2, v3

    goto/16 :goto_1

    :cond_5
    move-object v3, v7

    .line 490
    new-instance v1, Lorg/apache/http/HttpException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Unexpected response to CONNECT request: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v3}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 514
    :cond_6
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-interface {v4}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v4

    const/16 v5, 0x12b

    if-le v4, v5, :cond_8

    .line 519
    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v3

    if-eqz v3, :cond_7

    .line 521
    new-instance v4, Lorg/apache/http/entity/BufferedHttpEntity;

    invoke-direct {v4, v3}, Lorg/apache/http/entity/BufferedHttpEntity;-><init>(Lorg/apache/http/HttpEntity;)V

    invoke-interface {v2, v4}, Lorg/apache/http/HttpResponse;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 524
    :cond_7
    invoke-interface/range {p2 .. p2}, Lorg/apache/http/HttpClientConnection;->close()V

    .line 525
    new-instance v1, Lorg/apache/http/impl/execchain/TunnelRefusedException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CONNECT refused by proxy: "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v2}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3, v2}, Lorg/apache/http/impl/execchain/TunnelRefusedException;-><init>(Ljava/lang/String;Lorg/apache/http/HttpResponse;)V

    throw v1

    :cond_8
    return v3
.end method

.method private needAuthentication(Lorg/apache/http/auth/AuthState;Lorg/apache/http/auth/AuthState;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/protocol/HttpClientContext;)Z
    .locals 10

    .line 564
    invoke-virtual {p5}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v0

    .line 565
    invoke-virtual {v0}, Lorg/apache/http/client/config/RequestConfig;->isAuthenticationEnabled()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 566
    invoke-virtual {p5}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v0

    if-nez v0, :cond_0

    .line 568
    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v0

    .line 570
    :cond_0
    invoke-virtual {v0}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v1

    if-gez v1, :cond_1

    .line 571
    new-instance v1, Lorg/apache/http/HttpHost;

    invoke-virtual {v0}, Lorg/apache/http/HttpHost;->getHostName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v3

    invoke-virtual {v3}, Lorg/apache/http/HttpHost;->getPort()I

    move-result v3

    invoke-virtual {v0}, Lorg/apache/http/HttpHost;->getSchemeName()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v2, v3, v0}, Lorg/apache/http/HttpHost;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    move-object v0, v1

    .line 576
    :cond_1
    iget-object v4, p0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    iget-object v7, p0, Lorg/apache/http/impl/execchain/MainClientExec;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object v5, v0

    move-object v6, p4

    move-object v8, p1

    move-object v9, p5

    invoke-virtual/range {v4 .. v9}, Lorg/apache/http/impl/auth/HttpAuthenticator;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v1

    .line 579
    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    if-nez v2, :cond_2

    .line 582
    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->getTargetHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    .line 584
    :cond_2
    iget-object v3, p0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    iget-object v6, p0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object v4, v2

    move-object v5, p4

    move-object v7, p2

    move-object v8, p5

    invoke-virtual/range {v3 .. v8}, Lorg/apache/http/impl/auth/HttpAuthenticator;->isAuthenticationRequested(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result p3

    if-eqz v1, :cond_3

    .line 588
    iget-object v4, p0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    iget-object v7, p0, Lorg/apache/http/impl/execchain/MainClientExec;->targetAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object v5, v0

    move-object v6, p4

    move-object v8, p1

    move-object v9, p5

    invoke-virtual/range {v4 .. v9}, Lorg/apache/http/impl/auth/HttpAuthenticator;->handleAuthChallenge(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result p1

    return p1

    :cond_3
    if-eqz p3, :cond_4

    .line 592
    iget-object v3, p0, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    iget-object v6, p0, Lorg/apache/http/impl/execchain/MainClientExec;->proxyAuthStrategy:Lorg/apache/http/client/AuthenticationStrategy;

    move-object v4, v2

    move-object v5, p4

    move-object v7, p2

    move-object v8, p5

    invoke-virtual/range {v3 .. v8}, Lorg/apache/http/impl/auth/HttpAuthenticator;->handleAuthChallenge(Lorg/apache/http/HttpHost;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/AuthenticationStrategy;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)Z

    move-result p1

    return p1

    :cond_4
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method establishRoute(Lorg/apache/http/auth/AuthState;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/protocol/HttpClientContext;)V
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/apache/http/HttpException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 382
    invoke-virtual {p5}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v0

    .line 383
    invoke-virtual {v0}, Lorg/apache/http/client/config/RequestConfig;->getConnectTimeout()I

    move-result v0

    .line 384
    new-instance v1, Lorg/apache/http/conn/routing/RouteTracker;

    invoke-direct {v1, p3}, Lorg/apache/http/conn/routing/RouteTracker;-><init>(Lorg/apache/http/conn/routing/HttpRoute;)V

    .line 387
    :cond_0
    invoke-virtual {v1}, Lorg/apache/http/conn/routing/RouteTracker;->toRoute()Lorg/apache/http/conn/routing/HttpRoute;

    move-result-object v2

    .line 388
    iget-object v3, p0, Lorg/apache/http/impl/execchain/MainClientExec;->routeDirector:Lorg/apache/http/conn/routing/HttpRouteDirector;

    invoke-interface {v3, p3, v2}, Lorg/apache/http/conn/routing/HttpRouteDirector;->nextStep(Lorg/apache/http/conn/routing/RouteInfo;Lorg/apache/http/conn/routing/RouteInfo;)I

    move-result v3

    const/4 v4, 0x1

    const/4 v5, 0x0

    packed-switch v3, :pswitch_data_0

    .line 439
    new-instance p1, Ljava/lang/IllegalStateException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "Unknown step indicator "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " from RouteDirector."

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 428
    :pswitch_0
    iget-object v2, p0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    invoke-interface {v2, p2, p3, p5}, Lorg/apache/http/conn/HttpClientConnectionManager;->upgrade(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)V

    .line 429
    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->isSecure()Z

    move-result v2

    invoke-virtual {v1, v2}, Lorg/apache/http/conn/routing/RouteTracker;->layerProtocol(Z)V

    goto :goto_2

    .line 421
    :pswitch_1
    invoke-virtual {v2}, Lorg/apache/http/conn/routing/HttpRoute;->getHopCount()I

    move-result v2

    sub-int/2addr v2, v4

    .line 422
    invoke-direct {p0, p3, v2, p5}, Lorg/apache/http/impl/execchain/MainClientExec;->createTunnelToProxy(Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/client/protocol/HttpClientContext;)Z

    move-result v4

    .line 423
    iget-object v5, p0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v6, "Tunnel to proxy created."

    invoke-interface {v5, v6}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 424
    invoke-virtual {p3, v2}, Lorg/apache/http/conn/routing/HttpRoute;->getHopTarget(I)Lorg/apache/http/HttpHost;

    move-result-object v2

    invoke-virtual {v1, v2, v4}, Lorg/apache/http/conn/routing/RouteTracker;->tunnelProxy(Lorg/apache/http/HttpHost;Z)V

    goto :goto_2

    .line 410
    :pswitch_2
    invoke-direct/range {p0 .. p5}, Lorg/apache/http/impl/execchain/MainClientExec;->createTunnelToTarget(Lorg/apache/http/auth/AuthState;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/protocol/HttpClientContext;)Z

    move-result v2

    .line 412
    iget-object v4, p0, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v5, "Tunnel to target created."

    invoke-interface {v4, v5}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 413
    invoke-virtual {v1, v2}, Lorg/apache/http/conn/routing/RouteTracker;->tunnelTarget(Z)V

    goto :goto_2

    .line 401
    :pswitch_3
    iget-object v2, p0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    if-lez v0, :cond_1

    move v6, v0

    goto :goto_0

    :cond_1
    move v6, v5

    :goto_0
    invoke-interface {v2, p2, p3, v6, p5}, Lorg/apache/http/conn/HttpClientConnectionManager;->connect(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/protocol/HttpContext;)V

    .line 406
    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->getProxyHost()Lorg/apache/http/HttpHost;

    move-result-object v2

    .line 407
    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->isSecure()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->isTunnelled()Z

    move-result v6

    if-nez v6, :cond_2

    goto :goto_1

    :cond_2
    move v4, v5

    :goto_1
    invoke-virtual {v1, v2, v4}, Lorg/apache/http/conn/routing/RouteTracker;->connectProxy(Lorg/apache/http/HttpHost;Z)V

    goto :goto_2

    .line 393
    :pswitch_4
    iget-object v2, p0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    if-lez v0, :cond_3

    move v5, v0

    :cond_3
    invoke-interface {v2, p2, p3, v5, p5}, Lorg/apache/http/conn/HttpClientConnectionManager;->connect(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;ILorg/apache/http/protocol/HttpContext;)V

    .line 398
    invoke-virtual {p3}, Lorg/apache/http/conn/routing/HttpRoute;->isSecure()Z

    move-result v2

    invoke-virtual {v1, v2}, Lorg/apache/http/conn/routing/RouteTracker;->connectTarget(Z)V

    goto :goto_2

    .line 436
    :pswitch_5
    iget-object v2, p0, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    invoke-interface {v2, p2, p3, p5}, Lorg/apache/http/conn/HttpClientConnectionManager;->routeComplete(Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/protocol/HttpContext;)V

    :goto_2
    if-gtz v3, :cond_0

    return-void

    .line 433
    :pswitch_6
    new-instance p1, Lorg/apache/http/HttpException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p4, "Unable to establish route: planned = "

    invoke-virtual {p2, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p3, "; current = "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Lorg/apache/http/HttpException;-><init>(Ljava/lang/String;)V

    throw p1

    nop

    :pswitch_data_0
    .packed-switch -0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public execute(Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/client/methods/HttpRequestWrapper;Lorg/apache/http/client/protocol/HttpClientContext;Lorg/apache/http/client/methods/HttpExecutionAware;)Lorg/apache/http/client/methods/CloseableHttpResponse;
    .locals 24
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Lorg/apache/http/HttpException;
        }
    .end annotation

    move-object/from16 v7, p0

    move-object/from16 v8, p1

    move-object/from16 v9, p2

    move-object/from16 v10, p3

    move-object/from16 v11, p4

    const-string v12, "Proxy-Authorization"

    const-string v13, "Authorization"

    const-string v1, "HTTP route"

    .line 155
    invoke-static {v8, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v1, "HTTP request"

    .line 156
    invoke-static {v9, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    const-string v1, "HTTP context"

    .line 157
    invoke-static {v10, v1}, Lorg/apache/http/util/Args;->notNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 159
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getTargetAuthState()Lorg/apache/http/auth/AuthState;

    move-result-object v1

    if-nez v1, :cond_0

    .line 161
    new-instance v1, Lorg/apache/http/auth/AuthState;

    invoke-direct {v1}, Lorg/apache/http/auth/AuthState;-><init>()V

    const-string v2, "http.auth.target-scope"

    .line 162
    invoke-virtual {v10, v2, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_0
    move-object v14, v1

    .line 164
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getProxyAuthState()Lorg/apache/http/auth/AuthState;

    move-result-object v1

    if-nez v1, :cond_1

    .line 166
    new-instance v1, Lorg/apache/http/auth/AuthState;

    invoke-direct {v1}, Lorg/apache/http/auth/AuthState;-><init>()V

    const-string v2, "http.auth.proxy-scope"

    .line 167
    invoke-virtual {v10, v2, v1}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    :cond_1
    move-object v15, v1

    .line 170
    instance-of v1, v9, Lorg/apache/http/HttpEntityEnclosingRequest;

    if-eqz v1, :cond_2

    .line 171
    move-object v1, v9

    check-cast v1, Lorg/apache/http/HttpEntityEnclosingRequest;

    invoke-static {v1}, Lorg/apache/http/impl/execchain/RequestEntityProxy;->enhance(Lorg/apache/http/HttpEntityEnclosingRequest;)V

    .line 174
    :cond_2
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getUserToken()Ljava/lang/Object;

    move-result-object v6

    .line 176
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    invoke-interface {v1, v8, v6}, Lorg/apache/http/conn/HttpClientConnectionManager;->requestConnection(Lorg/apache/http/conn/routing/HttpRoute;Ljava/lang/Object;)Lorg/apache/http/conn/ConnectionRequest;

    move-result-object v1

    const-string v5, "Request aborted"

    if-eqz v11, :cond_4

    .line 178
    invoke-interface/range {p4 .. p4}, Lorg/apache/http/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v2

    if-nez v2, :cond_3

    .line 182
    invoke-interface {v11, v1}, Lorg/apache/http/client/methods/HttpExecutionAware;->setCancellable(Lorg/apache/http/concurrent/Cancellable;)V

    goto :goto_0

    .line 179
    :cond_3
    invoke-interface {v1}, Lorg/apache/http/conn/ConnectionRequest;->cancel()Z

    .line 180
    new-instance v1, Lorg/apache/http/impl/execchain/RequestAbortedException;

    invoke-direct {v1, v5}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 185
    :cond_4
    :goto_0
    invoke-virtual/range {p3 .. p3}, Lorg/apache/http/client/protocol/HttpClientContext;->getRequestConfig()Lorg/apache/http/client/config/RequestConfig;

    move-result-object v16

    .line 189
    :try_start_0
    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/client/config/RequestConfig;->getConnectionRequestTimeout()I

    move-result v2

    const-wide/16 v17, 0x0

    if-lez v2, :cond_5

    int-to-long v2, v2

    goto :goto_1

    :cond_5
    move-wide/from16 v2, v17

    .line 190
    :goto_1
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-interface {v1, v2, v3, v4}, Lorg/apache/http/conn/ConnectionRequest;->get(JLjava/util/concurrent/TimeUnit;)Lorg/apache/http/HttpClientConnection;

    move-result-object v4
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_1f
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1e

    const-string v1, "http.connection"

    .line 202
    invoke-virtual {v10, v1, v4}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 204
    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/client/config/RequestConfig;->isStaleConnectionCheckEnabled()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 206
    invoke-interface {v4}, Lorg/apache/http/HttpClientConnection;->isOpen()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 207
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Stale connection check"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 208
    invoke-interface {v4}, Lorg/apache/http/HttpClientConnection;->isStale()Z

    move-result v1

    if-eqz v1, :cond_6

    .line 209
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Stale connection detected"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 210
    invoke-interface {v4}, Lorg/apache/http/HttpClientConnection;->close()V

    .line 215
    :cond_6
    new-instance v3, Lorg/apache/http/impl/execchain/ConnectionHolder;

    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    iget-object v2, v7, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    invoke-direct {v3, v1, v2, v4}, Lorg/apache/http/impl/execchain/ConnectionHolder;-><init>(Lorg/apache/commons/logging/Log;Lorg/apache/http/conn/HttpClientConnectionManager;Lorg/apache/http/HttpClientConnection;)V

    if-eqz v11, :cond_7

    .line 218
    :try_start_1
    invoke-interface {v11, v3}, Lorg/apache/http/client/methods/HttpExecutionAware;->setCancellable(Lorg/apache/http/concurrent/Cancellable;)V

    goto :goto_2

    :catch_0
    move-exception v0

    move-object v1, v0

    goto/16 :goto_17

    :catch_1
    move-exception v0

    move-object v1, v0

    move-object v11, v3

    move-object/from16 v22, v15

    goto/16 :goto_19

    :catch_2
    move-exception v0

    move-object v1, v0

    move-object v11, v3

    move-object/from16 v22, v15

    goto/16 :goto_1b

    :catch_3
    move-exception v0

    move-object v1, v0

    move-object v11, v3

    goto/16 :goto_1d

    :catch_4
    move-exception v0

    move-object v1, v0

    goto/16 :goto_1e

    :cond_7
    :goto_2
    const/4 v2, 0x1

    move v1, v2

    :goto_3
    if-le v1, v2, :cond_9

    .line 224
    invoke-static/range {p2 .. p2}, Lorg/apache/http/impl/execchain/RequestEntityProxy;->isRepeatable(Lorg/apache/http/HttpRequest;)Z

    move-result v19

    if-eqz v19, :cond_8

    goto :goto_4

    .line 225
    :cond_8
    new-instance v1, Lorg/apache/http/client/NonRepeatableRequestException;

    const-string v2, "Cannot retry request with a non-repeatable request entity."

    invoke-direct {v1, v2}, Lorg/apache/http/client/NonRepeatableRequestException;-><init>(Ljava/lang/String;)V

    throw v1

    :cond_9
    :goto_4
    if-eqz v11, :cond_b

    .line 229
    invoke-interface/range {p4 .. p4}, Lorg/apache/http/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v19

    if-nez v19, :cond_a

    goto :goto_5

    .line 230
    :cond_a
    new-instance v1, Lorg/apache/http/impl/execchain/RequestAbortedException;

    invoke-direct {v1, v5}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_1
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_1 .. :try_end_1} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_1 .. :try_end_1} :catch_3
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_0

    .line 233
    :cond_b
    :goto_5
    :try_start_2
    invoke-interface {v4}, Lorg/apache/http/HttpClientConnection;->isOpen()Z

    move-result v19
    :try_end_2
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_2 .. :try_end_2} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_2 .. :try_end_2} :catch_1d
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1c
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1b
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_0

    if-nez v19, :cond_d

    .line 234
    :try_start_3
    iget-object v2, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    move/from16 v20, v1

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_3
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_3 .. :try_end_3} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/Error; {:try_start_3 .. :try_end_3} :catch_0

    move-object/from16 v21, v3

    :try_start_4
    const-string v3, "Opening connection "

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v2, v1}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_4
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_4 .. :try_end_4} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_4 .. :try_end_4} :catch_a
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_7
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_6
    .catch Ljava/lang/Error; {:try_start_4 .. :try_end_4} :catch_0

    move-object/from16 v1, p0

    const/16 v19, 0x1

    move-object v2, v15

    move-object/from16 v8, v21

    move-object v3, v4

    move-object v8, v4

    move-object/from16 v4, p1

    move-object/from16 v22, v15

    move-object v15, v5

    move-object/from16 v5, p2

    move-object/from16 v23, v6

    move-object/from16 v6, p3

    .line 236
    :try_start_5
    invoke-virtual/range {v1 .. v6}, Lorg/apache/http/impl/execchain/MainClientExec;->establishRoute(Lorg/apache/http/auth/AuthState;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpRequest;Lorg/apache/http/client/protocol/HttpClientContext;)V
    :try_end_5
    .catch Lorg/apache/http/impl/execchain/TunnelRefusedException; {:try_start_5 .. :try_end_5} :catch_5
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_5 .. :try_end_5} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_5 .. :try_end_5} :catch_a
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_5 .. :try_end_5} :catch_8
    .catch Ljava/lang/Error; {:try_start_5 .. :try_end_5} :catch_0

    goto :goto_6

    :catch_5
    move-exception v0

    move-object v1, v0

    .line 238
    :try_start_6
    iget-object v2, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v2}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v2

    if-eqz v2, :cond_c

    .line 239
    iget-object v2, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    invoke-virtual {v1}, Lorg/apache/http/impl/execchain/TunnelRefusedException;->getMessage()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 241
    :cond_c
    invoke-virtual {v1}, Lorg/apache/http/impl/execchain/TunnelRefusedException;->getResponse()Lorg/apache/http/HttpResponse;

    move-result-object v1
    :try_end_6
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_6 .. :try_end_6} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_6 .. :try_end_6} :catch_a
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_8
    .catch Ljava/lang/Error; {:try_start_6 .. :try_end_6} :catch_0

    move-object/from16 v11, v21

    goto/16 :goto_12

    :catch_6
    move-exception v0

    move-object v1, v0

    move-object/from16 v22, v15

    goto :goto_7

    :catch_7
    move-exception v0

    move-object v1, v0

    move-object/from16 v22, v15

    goto :goto_8

    :cond_d
    move/from16 v20, v1

    move/from16 v19, v2

    move-object/from16 v21, v3

    move-object v8, v4

    move-object/from16 v23, v6

    move-object/from16 v22, v15

    move-object v15, v5

    .line 245
    :goto_6
    :try_start_7
    invoke-virtual/range {v16 .. v16}, Lorg/apache/http/client/config/RequestConfig;->getSocketTimeout()I

    move-result v1
    :try_end_7
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_7 .. :try_end_7} :catch_1a
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_19
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_18
    .catch Ljava/lang/Error; {:try_start_7 .. :try_end_7} :catch_0

    if-ltz v1, :cond_e

    .line 247
    :try_start_8
    invoke-interface {v8, v1}, Lorg/apache/http/HttpClientConnection;->setSocketTimeout(I)V

    goto :goto_9

    :catch_8
    move-exception v0

    move-object v1, v0

    :goto_7
    move-object/from16 v11, v21

    goto/16 :goto_19

    :catch_9
    move-exception v0

    move-object v1, v0

    :goto_8
    move-object/from16 v11, v21

    goto/16 :goto_1b

    :catch_a
    move-exception v0

    move-object v1, v0

    move-object/from16 v11, v21

    goto/16 :goto_1d

    :cond_e
    :goto_9
    if-eqz v11, :cond_10

    .line 250
    invoke-interface/range {p4 .. p4}, Lorg/apache/http/client/methods/HttpExecutionAware;->isAborted()Z

    move-result v1

    if-nez v1, :cond_f

    goto :goto_a

    .line 251
    :cond_f
    new-instance v1, Lorg/apache/http/impl/execchain/RequestAbortedException;

    invoke-direct {v1, v15}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_8
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_8 .. :try_end_8} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_8 .. :try_end_8} :catch_a
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_8
    .catch Ljava/lang/Error; {:try_start_8 .. :try_end_8} :catch_0

    .line 254
    :cond_10
    :goto_a
    :try_start_9
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1
    :try_end_9
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_9 .. :try_end_9} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_9 .. :try_end_9} :catch_1a
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_19
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_18
    .catch Ljava/lang/Error; {:try_start_9 .. :try_end_9} :catch_0

    if-eqz v1, :cond_11

    .line 255
    :try_start_a
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Executing request "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getRequestLine()Lorg/apache/http/RequestLine;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_a
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_a .. :try_end_a} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_a .. :try_end_a} :catch_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_a .. :try_end_a} :catch_8
    .catch Ljava/lang/Error; {:try_start_a .. :try_end_a} :catch_0

    .line 258
    :cond_11
    :try_start_b
    invoke-virtual {v9, v13}, Lorg/apache/http/client/methods/HttpRequestWrapper;->containsHeader(Ljava/lang/String;)Z

    move-result v1
    :try_end_b
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_b .. :try_end_b} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_b .. :try_end_b} :catch_1a
    .catch Ljava/io/IOException; {:try_start_b .. :try_end_b} :catch_19
    .catch Ljava/lang/RuntimeException; {:try_start_b .. :try_end_b} :catch_18
    .catch Ljava/lang/Error; {:try_start_b .. :try_end_b} :catch_0

    if-nez v1, :cond_13

    .line 259
    :try_start_c
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_12

    .line 260
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Target auth state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 262
    :cond_12
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;

    invoke-virtual {v1, v9, v14, v10}, Lorg/apache/http/impl/auth/HttpAuthenticator;->generateAuthResponse(Lorg/apache/http/HttpRequest;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)V
    :try_end_c
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_c .. :try_end_c} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_c .. :try_end_c} :catch_a
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_c} :catch_8
    .catch Ljava/lang/Error; {:try_start_c .. :try_end_c} :catch_0

    .line 264
    :cond_13
    :try_start_d
    invoke-virtual {v9, v12}, Lorg/apache/http/client/methods/HttpRequestWrapper;->containsHeader(Ljava/lang/String;)Z

    move-result v1
    :try_end_d
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_d .. :try_end_d} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_d .. :try_end_d} :catch_1a
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_19
    .catch Ljava/lang/RuntimeException; {:try_start_d .. :try_end_d} :catch_18
    .catch Ljava/lang/Error; {:try_start_d .. :try_end_d} :catch_0

    if-nez v1, :cond_15

    :try_start_e
    invoke-virtual/range {p1 .. p1}, Lorg/apache/http/conn/routing/HttpRoute;->isTunnelled()Z

    move-result v1

    if-nez v1, :cond_15

    .line 265
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v1}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v1

    if-eqz v1, :cond_14

    .line 266
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Proxy auth state: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 268
    :cond_14
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->authenticator:Lorg/apache/http/impl/auth/HttpAuthenticator;
    :try_end_e
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_e .. :try_end_e} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_e .. :try_end_e} :catch_a
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_e} :catch_9
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_e} :catch_8
    .catch Ljava/lang/Error; {:try_start_e .. :try_end_e} :catch_0

    move-object/from16 v6, v22

    :try_start_f
    invoke-virtual {v1, v9, v6, v10}, Lorg/apache/http/impl/auth/HttpAuthenticator;->generateAuthResponse(Lorg/apache/http/HttpRequest;Lorg/apache/http/auth/AuthState;Lorg/apache/http/protocol/HttpContext;)V
    :try_end_f
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_f .. :try_end_f} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_f .. :try_end_f} :catch_a
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_c
    .catch Ljava/lang/RuntimeException; {:try_start_f .. :try_end_f} :catch_b
    .catch Ljava/lang/Error; {:try_start_f .. :try_end_f} :catch_0

    goto :goto_b

    :catch_b
    move-exception v0

    move-object v1, v0

    move-object/from16 v22, v6

    goto/16 :goto_7

    :catch_c
    move-exception v0

    move-object v1, v0

    move-object/from16 v22, v6

    goto/16 :goto_8

    :cond_15
    move-object/from16 v6, v22

    :goto_b
    :try_start_10
    const-string v1, "http.request"

    .line 271
    invoke-virtual {v10, v1, v9}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    .line 272
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->requestExecutor:Lorg/apache/http/protocol/HttpRequestExecutor;

    invoke-virtual {v1, v9, v8, v10}, Lorg/apache/http/protocol/HttpRequestExecutor;->execute(Lorg/apache/http/HttpRequest;Lorg/apache/http/HttpClientConnection;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v5

    .line 275
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->reuseStrategy:Lorg/apache/http/ConnectionReuseStrategy;

    invoke-interface {v1, v5, v10}, Lorg/apache/http/ConnectionReuseStrategy;->keepAlive(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)Z

    move-result v1
    :try_end_10
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_10 .. :try_end_10} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_10 .. :try_end_10} :catch_1a
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_10} :catch_17
    .catch Ljava/lang/RuntimeException; {:try_start_10 .. :try_end_10} :catch_16
    .catch Ljava/lang/Error; {:try_start_10 .. :try_end_10} :catch_0

    if-eqz v1, :cond_18

    .line 277
    :try_start_11
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->keepAliveStrategy:Lorg/apache/http/conn/ConnectionKeepAliveStrategy;

    invoke-interface {v1, v5, v10}, Lorg/apache/http/conn/ConnectionKeepAliveStrategy;->getKeepAliveDuration(Lorg/apache/http/HttpResponse;Lorg/apache/http/protocol/HttpContext;)J

    move-result-wide v1

    .line 278
    iget-object v3, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    invoke-interface {v3}, Lorg/apache/commons/logging/Log;->isDebugEnabled()Z

    move-result v3
    :try_end_11
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_11 .. :try_end_11} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_11 .. :try_end_11} :catch_1a
    .catch Ljava/io/IOException; {:try_start_11 .. :try_end_11} :catch_10
    .catch Ljava/lang/RuntimeException; {:try_start_11 .. :try_end_11} :catch_f
    .catch Ljava/lang/Error; {:try_start_11 .. :try_end_11} :catch_0

    if-eqz v3, :cond_17

    cmp-long v3, v1, v17

    if-lez v3, :cond_16

    .line 281
    :try_start_12
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_c

    :cond_16
    const-string v3, "indefinitely"

    .line 285
    :goto_c
    iget-object v4, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    move-object/from16 v22, v5

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Connection can be kept alive "

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v3}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V
    :try_end_12
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_12 .. :try_end_12} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_12 .. :try_end_12} :catch_a
    .catch Ljava/io/IOException; {:try_start_12 .. :try_end_12} :catch_c
    .catch Ljava/lang/RuntimeException; {:try_start_12 .. :try_end_12} :catch_b
    .catch Ljava/lang/Error; {:try_start_12 .. :try_end_12} :catch_0

    goto :goto_d

    :cond_17
    move-object/from16 v22, v5

    .line 287
    :goto_d
    :try_start_13
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;
    :try_end_13
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_13 .. :try_end_13} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_13 .. :try_end_13} :catch_1a
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_10
    .catch Ljava/lang/RuntimeException; {:try_start_13 .. :try_end_13} :catch_f
    .catch Ljava/lang/Error; {:try_start_13 .. :try_end_13} :catch_0

    move-object/from16 v11, v21

    :try_start_14
    invoke-virtual {v11, v1, v2, v3}, Lorg/apache/http/impl/execchain/ConnectionHolder;->setValidFor(JLjava/util/concurrent/TimeUnit;)V

    .line 288
    invoke-virtual {v11}, Lorg/apache/http/impl/execchain/ConnectionHolder;->markReusable()V
    :try_end_14
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_14 .. :try_end_14} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_14 .. :try_end_14} :catch_13
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_e
    .catch Ljava/lang/RuntimeException; {:try_start_14 .. :try_end_14} :catch_d
    .catch Ljava/lang/Error; {:try_start_14 .. :try_end_14} :catch_0

    goto :goto_10

    :catch_d
    move-exception v0

    goto :goto_e

    :catch_e
    move-exception v0

    goto :goto_f

    :catch_f
    move-exception v0

    move-object/from16 v11, v21

    :goto_e
    move-object v1, v0

    move-object/from16 v22, v6

    goto/16 :goto_19

    :catch_10
    move-exception v0

    move-object/from16 v11, v21

    :goto_f
    move-object v1, v0

    move-object/from16 v22, v6

    goto/16 :goto_1b

    :cond_18
    move-object/from16 v22, v5

    move-object/from16 v11, v21

    .line 290
    :try_start_15
    invoke-virtual {v11}, Lorg/apache/http/impl/execchain/ConnectionHolder;->markNonReusable()V
    :try_end_15
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_15 .. :try_end_15} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_15 .. :try_end_15} :catch_13
    .catch Ljava/io/IOException; {:try_start_15 .. :try_end_15} :catch_15
    .catch Ljava/lang/RuntimeException; {:try_start_15 .. :try_end_15} :catch_14
    .catch Ljava/lang/Error; {:try_start_15 .. :try_end_15} :catch_0

    :goto_10
    move-object/from16 v1, p0

    move-object v2, v14

    move-object v3, v6

    move-object/from16 v4, p1

    move-object/from16 v21, v22

    move-object/from16 v5, v21

    move-object/from16 v22, v6

    move-object/from16 v6, p3

    .line 293
    :try_start_16
    invoke-direct/range {v1 .. v6}, Lorg/apache/http/impl/execchain/MainClientExec;->needAuthentication(Lorg/apache/http/auth/AuthState;Lorg/apache/http/auth/AuthState;Lorg/apache/http/conn/routing/HttpRoute;Lorg/apache/http/HttpResponse;Lorg/apache/http/client/protocol/HttpClientContext;)Z

    move-result v1

    if-eqz v1, :cond_1e

    .line 296
    invoke-interface/range {v21 .. v21}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v1

    .line 297
    invoke-virtual {v11}, Lorg/apache/http/impl/execchain/ConnectionHolder;->isReusable()Z

    move-result v2

    if-eqz v2, :cond_19

    .line 298
    invoke-static {v1}, Lorg/apache/http/util/EntityUtils;->consume(Lorg/apache/http/HttpEntity;)V

    goto :goto_11

    .line 300
    :cond_19
    invoke-interface {v8}, Lorg/apache/http/HttpClientConnection;->close()V

    .line 301
    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v1

    sget-object v2, Lorg/apache/http/auth/AuthProtocolState;->SUCCESS:Lorg/apache/http/auth/AuthProtocolState;

    if-ne v1, v2, :cond_1a

    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/auth/AuthState;->isConnectionBased()Z

    move-result v1

    if-eqz v1, :cond_1a

    .line 303
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Resetting proxy auth state"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 304
    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 306
    :cond_1a
    invoke-virtual {v14}, Lorg/apache/http/auth/AuthState;->getState()Lorg/apache/http/auth/AuthProtocolState;

    move-result-object v1

    sget-object v2, Lorg/apache/http/auth/AuthProtocolState;->SUCCESS:Lorg/apache/http/auth/AuthProtocolState;

    if-ne v1, v2, :cond_1b

    invoke-virtual {v14}, Lorg/apache/http/auth/AuthState;->isConnectionBased()Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 308
    iget-object v1, v7, Lorg/apache/http/impl/execchain/MainClientExec;->log:Lorg/apache/commons/logging/Log;

    const-string v2, "Resetting target auth state"

    invoke-interface {v1, v2}, Lorg/apache/commons/logging/Log;->debug(Ljava/lang/Object;)V

    .line 309
    invoke-virtual {v14}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 313
    :cond_1b
    :goto_11
    invoke-virtual/range {p2 .. p2}, Lorg/apache/http/client/methods/HttpRequestWrapper;->getOriginal()Lorg/apache/http/HttpRequest;

    move-result-object v1

    .line 314
    invoke-interface {v1, v13}, Lorg/apache/http/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1c

    .line 315
    invoke-virtual {v9, v13}, Lorg/apache/http/client/methods/HttpRequestWrapper;->removeHeaders(Ljava/lang/String;)V

    .line 317
    :cond_1c
    invoke-interface {v1, v12}, Lorg/apache/http/HttpRequest;->containsHeader(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1d

    .line 318
    invoke-virtual {v9, v12}, Lorg/apache/http/client/methods/HttpRequestWrapper;->removeHeaders(Ljava/lang/String;)V

    :cond_1d
    add-int/lit8 v1, v20, 0x1

    move-object v4, v8

    move-object v3, v11

    move-object v5, v15

    move/from16 v2, v19

    move-object/from16 v15, v22

    move-object/from16 v6, v23

    move-object/from16 v8, p1

    move-object/from16 v11, p4

    goto/16 :goto_3

    :cond_1e
    move-object/from16 v1, v21

    :goto_12
    if-nez v23, :cond_1f

    .line 326
    iget-object v2, v7, Lorg/apache/http/impl/execchain/MainClientExec;->userTokenHandler:Lorg/apache/http/client/UserTokenHandler;

    invoke-interface {v2, v10}, Lorg/apache/http/client/UserTokenHandler;->getUserToken(Lorg/apache/http/protocol/HttpContext;)Ljava/lang/Object;

    move-result-object v6

    const-string v2, "http.user-token"

    .line 327
    invoke-virtual {v10, v2, v6}, Lorg/apache/http/client/protocol/HttpClientContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_13

    :catch_11
    move-exception v0

    goto :goto_18

    :catch_12
    move-exception v0

    goto/16 :goto_1a

    :catch_13
    move-exception v0

    goto/16 :goto_1c

    :cond_1f
    move-object/from16 v6, v23

    :goto_13
    if-eqz v6, :cond_20

    .line 330
    invoke-virtual {v11, v6}, Lorg/apache/http/impl/execchain/ConnectionHolder;->setState(Ljava/lang/Object;)V

    .line 334
    :cond_20
    invoke-interface {v1}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v2

    if-eqz v2, :cond_22

    .line 335
    invoke-interface {v2}, Lorg/apache/http/HttpEntity;->isStreaming()Z

    move-result v2

    if-nez v2, :cond_21

    goto :goto_14

    .line 340
    :cond_21
    new-instance v2, Lorg/apache/http/impl/execchain/HttpResponseProxy;

    invoke-direct {v2, v1, v11}, Lorg/apache/http/impl/execchain/HttpResponseProxy;-><init>(Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/execchain/ConnectionHolder;)V

    return-object v2

    .line 337
    :cond_22
    :goto_14
    invoke-virtual {v11}, Lorg/apache/http/impl/execchain/ConnectionHolder;->releaseConnection()V

    .line 338
    new-instance v2, Lorg/apache/http/impl/execchain/HttpResponseProxy;

    const/4 v3, 0x0

    invoke-direct {v2, v1, v3}, Lorg/apache/http/impl/execchain/HttpResponseProxy;-><init>(Lorg/apache/http/HttpResponse;Lorg/apache/http/impl/execchain/ConnectionHolder;)V
    :try_end_16
    .catch Lorg/apache/http/impl/conn/ConnectionShutdownException; {:try_start_16 .. :try_end_16} :catch_4
    .catch Lorg/apache/http/HttpException; {:try_start_16 .. :try_end_16} :catch_13
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_12
    .catch Ljava/lang/RuntimeException; {:try_start_16 .. :try_end_16} :catch_11
    .catch Ljava/lang/Error; {:try_start_16 .. :try_end_16} :catch_0

    return-object v2

    :catch_14
    move-exception v0

    move-object/from16 v22, v6

    goto :goto_18

    :catch_15
    move-exception v0

    move-object/from16 v22, v6

    goto :goto_1a

    :catch_16
    move-exception v0

    move-object/from16 v22, v6

    goto :goto_15

    :catch_17
    move-exception v0

    move-object/from16 v22, v6

    goto :goto_16

    :catch_18
    move-exception v0

    :goto_15
    move-object/from16 v11, v21

    goto :goto_18

    :catch_19
    move-exception v0

    :goto_16
    move-object/from16 v11, v21

    goto :goto_1a

    :catch_1a
    move-exception v0

    move-object/from16 v11, v21

    goto :goto_1c

    .line 368
    :goto_17
    iget-object v2, v7, Lorg/apache/http/impl/execchain/MainClientExec;->connManager:Lorg/apache/http/conn/HttpClientConnectionManager;

    invoke-interface {v2}, Lorg/apache/http/conn/HttpClientConnectionManager;->shutdown()V

    .line 369
    throw v1

    :catch_1b
    move-exception v0

    move-object v11, v3

    move-object/from16 v22, v15

    :goto_18
    move-object v1, v0

    .line 359
    :goto_19
    invoke-virtual {v11}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 360
    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/auth/AuthState;->isConnectionBased()Z

    move-result v2

    if-eqz v2, :cond_23

    .line 361
    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 363
    :cond_23
    invoke-virtual {v14}, Lorg/apache/http/auth/AuthState;->isConnectionBased()Z

    move-result v2

    if-eqz v2, :cond_24

    .line 364
    invoke-virtual {v14}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 366
    :cond_24
    throw v1

    :catch_1c
    move-exception v0

    move-object v11, v3

    move-object/from16 v22, v15

    :goto_1a
    move-object v1, v0

    .line 350
    :goto_1b
    invoke-virtual {v11}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 351
    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/auth/AuthState;->isConnectionBased()Z

    move-result v2

    if-eqz v2, :cond_25

    .line 352
    invoke-virtual/range {v22 .. v22}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 354
    :cond_25
    invoke-virtual {v14}, Lorg/apache/http/auth/AuthState;->isConnectionBased()Z

    move-result v2

    if-eqz v2, :cond_26

    .line 355
    invoke-virtual {v14}, Lorg/apache/http/auth/AuthState;->reset()V

    .line 357
    :cond_26
    throw v1

    :catch_1d
    move-exception v0

    move-object v11, v3

    :goto_1c
    move-object v1, v0

    .line 347
    :goto_1d
    invoke-virtual {v11}, Lorg/apache/http/impl/execchain/ConnectionHolder;->abortConnection()V

    .line 348
    throw v1

    .line 342
    :goto_1e
    new-instance v2, Ljava/io/InterruptedIOException;

    const-string v3, "Connection has been shut down"

    invoke-direct {v2, v3}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 344
    invoke-virtual {v2, v1}, Ljava/io/InterruptedIOException;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 345
    throw v2

    :catch_1e
    move-exception v0

    move-object v1, v0

    .line 195
    invoke-virtual {v1}, Ljava/util/concurrent/ExecutionException;->getCause()Ljava/lang/Throwable;

    move-result-object v2

    if-nez v2, :cond_27

    goto :goto_1f

    :cond_27
    move-object v1, v2

    .line 199
    :goto_1f
    new-instance v2, Lorg/apache/http/impl/execchain/RequestAbortedException;

    const-string v3, "Request execution failed"

    invoke-direct {v2, v3, v1}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2

    :catch_1f
    move-exception v0

    move-object v15, v5

    move-object v1, v0

    .line 192
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->interrupt()V

    .line 193
    new-instance v2, Lorg/apache/http/impl/execchain/RequestAbortedException;

    invoke-direct {v2, v15, v1}, Lorg/apache/http/impl/execchain/RequestAbortedException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v2
.end method
