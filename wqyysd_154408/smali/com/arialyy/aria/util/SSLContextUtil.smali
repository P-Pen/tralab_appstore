.class public Lcom/arialyy/aria/util/SSLContextUtil;
.super Ljava/lang/Object;
.source "SSLContextUtil.java"


# static fields
.field public static final HOSTNAME_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

.field private static SSL_CACHE:Ljava/util/Map; = null
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljavax/net/ssl/SSLContext;",
            ">;"
        }
    .end annotation
.end field

.field private static final TAG:Ljava/lang/String; = "SSLContextUtil"

.field private static trustManagers:Ljavax/net/ssl/TrustManager;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 50
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Lcom/arialyy/aria/util/SSLContextUtil;->SSL_CACHE:Ljava/util/Map;

    .line 170
    new-instance v0, Lcom/arialyy/aria/util/SSLContextUtil$1;

    invoke-direct {v0}, Lcom/arialyy/aria/util/SSLContextUtil$1;-><init>()V

    sput-object v0, Lcom/arialyy/aria/util/SSLContextUtil;->trustManagers:Ljavax/net/ssl/TrustManager;

    .line 186
    new-instance v0, Lcom/arialyy/aria/util/SSLContextUtil$2;

    invoke-direct {v0}, Lcom/arialyy/aria/util/SSLContextUtil$2;-><init>()V

    sput-object v0, Lcom/arialyy/aria/util/SSLContextUtil;->HOSTNAME_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 48
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static createContext(Ljava/lang/String;Ljava/security/cert/Certificate;Ljava/lang/String;Ljava/lang/String;)Ljavax/net/ssl/SSLContext;
    .locals 2

    const/4 v0, 0x0

    .line 109
    :try_start_0
    invoke-static {}, Ljava/security/KeyStore;->getDefaultType()Ljava/lang/String;

    move-result-object v1

    .line 110
    invoke-static {v1}, Ljava/security/KeyStore;->getInstance(Ljava/lang/String;)Ljava/security/KeyStore;

    move-result-object v1

    .line 111
    invoke-virtual {v1, v0, v0}, Ljava/security/KeyStore;->load(Ljava/io/InputStream;[C)V

    .line 112
    invoke-virtual {v1, p0, p1}, Ljava/security/KeyStore;->setCertificateEntry(Ljava/lang/String;Ljava/security/cert/Certificate;)V

    .line 115
    invoke-static {}, Ljavax/net/ssl/TrustManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object p0

    .line 116
    invoke-static {p0}, Ljavax/net/ssl/TrustManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/TrustManagerFactory;

    move-result-object p0

    .line 117
    invoke-virtual {p0, v1}, Ljavax/net/ssl/TrustManagerFactory;->init(Ljava/security/KeyStore;)V

    .line 119
    invoke-static {}, Ljavax/net/ssl/KeyManagerFactory;->getDefaultAlgorithm()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Ljavax/net/ssl/KeyManagerFactory;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/KeyManagerFactory;

    move-result-object p1

    .line 120
    invoke-virtual {p1, v1, v0}, Ljavax/net/ssl/KeyManagerFactory;->init(Ljava/security/KeyStore;[C)V

    .line 124
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p2, "TLS"

    :cond_0
    invoke-static {p2}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object p2

    .line 125
    invoke-virtual {p1}, Ljavax/net/ssl/KeyManagerFactory;->getKeyManagers()[Ljavax/net/ssl/KeyManager;

    move-result-object p1

    invoke-virtual {p0}, Ljavax/net/ssl/TrustManagerFactory;->getTrustManagers()[Ljavax/net/ssl/TrustManager;

    move-result-object p0

    new-instance v1, Ljava/security/SecureRandom;

    invoke-direct {v1}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {p2, p1, p0, v1}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V

    .line 126
    sget-object p0, Lcom/arialyy/aria/util/SSLContextUtil;->SSL_CACHE:Ljava/util/Map;

    invoke-interface {p0, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/security/KeyStoreException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/KeyManagementException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/UnrecoverableKeyException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p2

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    goto :goto_0

    :catch_2
    move-exception p0

    goto :goto_0

    :catch_3
    move-exception p0

    goto :goto_0

    :catch_4
    move-exception p0

    goto :goto_0

    :catch_5
    move-exception p0

    .line 129
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return-object v0
.end method

.method private static getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    aput-object p0, v0, v1

    const/4 p0, 0x1

    aput-object p1, v0, p0

    const-string p0, "%s_%s"

    .line 135
    invoke-static {p0, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getStrMd5(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static getDefaultSLLContext(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;
    .locals 5

    const/4 v0, 0x0

    .line 159
    :try_start_0
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string p0, "TLS"

    :cond_0
    invoke-static {p0}, Ljavax/net/ssl/SSLContext;->getInstance(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    const/4 v1, 0x1

    :try_start_1
    new-array v1, v1, [Ljavax/net/ssl/TrustManager;

    const/4 v2, 0x0

    .line 160
    sget-object v3, Lcom/arialyy/aria/util/SSLContextUtil;->trustManagers:Ljavax/net/ssl/TrustManager;

    aput-object v3, v1, v2

    new-instance v2, Ljava/security/SecureRandom;

    invoke-direct {v2}, Ljava/security/SecureRandom;-><init>()V

    invoke-virtual {p0, v0, v1, v2}, Ljavax/net/ssl/SSLContext;->init([Ljavax/net/ssl/KeyManager;[Ljavax/net/ssl/TrustManager;Ljava/security/SecureRandom;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    move-object v4, v0

    move-object v0, p0

    move-object p0, v4

    goto :goto_0

    :catch_1
    move-exception p0

    .line 162
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    move-object p0, v0

    :goto_1
    return-object p0
.end method

.method public static getSSLContext(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljavax/net/ssl/SSLContext;
    .locals 3

    .line 86
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 90
    :cond_0
    :try_start_0
    invoke-static {p0, p1}, Lcom/arialyy/aria/util/SSLContextUtil;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 91
    sget-object v2, Lcom/arialyy/aria/util/SSLContextUtil;->SSL_CACHE:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/net/ssl/SSLContext;

    if-eqz v2, :cond_1

    return-object v2

    .line 95
    :cond_1
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, p1}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Lcom/arialyy/aria/util/SSLContextUtil;->loadCert(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object p1

    .line 96
    invoke-static {p0, p1, p2, v0}, Lcom/arialyy/aria/util/SSLContextUtil;->createContext(Ljava/lang/String;Ljava/security/cert/Certificate;Ljava/lang/String;Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object p0
    :try_end_0
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    .line 98
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    :goto_1
    return-object v1
.end method

.method public static getSSLContextFromAssets(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljavax/net/ssl/SSLContext;
    .locals 3

    .line 60
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_2

    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_1

    .line 64
    :cond_0
    :try_start_0
    invoke-static {p0, p1}, Lcom/arialyy/aria/util/SSLContextUtil;->getCacheKey(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 65
    sget-object v2, Lcom/arialyy/aria/util/SSLContextUtil;->SSL_CACHE:Ljava/util/Map;

    invoke-interface {v2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljavax/net/ssl/SSLContext;

    if-eqz v2, :cond_1

    return-object v2

    .line 69
    :cond_1
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v2

    invoke-virtual {v2}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v2

    invoke-virtual {v2, p1}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    .line 70
    invoke-static {p1}, Lcom/arialyy/aria/util/SSLContextUtil;->loadCert(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object p1

    .line 71
    invoke-static {p0, p1, p2, v0}, Lcom/arialyy/aria/util/SSLContextUtil;->createContext(Ljava/lang/String;Ljava/security/cert/Certificate;Ljava/lang/String;Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/security/cert/CertificateException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    .line 73
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_2
    :goto_1
    return-object v1
.end method

.method private static loadCert(Ljava/io/InputStream;)Ljava/security/cert/Certificate;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/cert/CertificateException;,
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "X.509"

    .line 145
    invoke-static {v0}, Ljava/security/cert/CertificateFactory;->getInstance(Ljava/lang/String;)Ljava/security/cert/CertificateFactory;

    move-result-object v0

    .line 146
    invoke-virtual {v0, p0}, Ljava/security/cert/CertificateFactory;->generateCertificate(Ljava/io/InputStream;)Ljava/security/cert/Certificate;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    .line 147
    move-object v2, v0

    check-cast v2, Ljava/security/cert/X509Certificate;

    invoke-virtual {v2}, Ljava/security/cert/X509Certificate;->getSubjectDN()Ljava/security/Principal;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "ca\u3010%s\u3011"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "SSLContextUtil"

    invoke-static {v2, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 148
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    return-object v0
.end method
