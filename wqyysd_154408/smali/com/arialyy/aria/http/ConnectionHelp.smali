.class public final Lcom/arialyy/aria/http/ConnectionHelp;
.super Ljava/lang/Object;
.source "ConnectionHelp.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ConnectionHelp"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static convertInputStream(Ljava/net/HttpURLConnection;)Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "Content-Encoding"

    .line 83
    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 84
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 85
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    return-object p0

    :cond_0
    const-string v1, "gzip"

    .line 87
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 88
    new-instance v0, Ljava/util/zip/GZIPInputStream;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v0

    :cond_1
    const-string v1, "deflate"

    .line 89
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 90
    new-instance v0, Ljava/util/zip/InflaterInputStream;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    return-object v0

    .line 92
    :cond_2
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public static handleConnection(Ljava/net/URL;Lcom/arialyy/aria/http/HttpTaskOption;)Ljava/net/HttpURLConnection;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 105
    invoke-virtual {p1}, Lcom/arialyy/aria/http/HttpTaskOption;->getProxy()Ljava/net/Proxy;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 106
    invoke-virtual {p1}, Lcom/arialyy/aria/http/HttpTaskOption;->getProxy()Ljava/net/Proxy;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/net/URL;->openConnection(Ljava/net/Proxy;)Ljava/net/URLConnection;

    move-result-object p0

    goto :goto_0

    .line 108
    :cond_0
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    .line 110
    :goto_0
    instance-of p1, p0, Ljavax/net/ssl/HttpsURLConnection;

    if-eqz p1, :cond_2

    .line 111
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object p1

    .line 112
    check-cast p0, Ljavax/net/ssl/HttpsURLConnection;

    .line 114
    invoke-virtual {p1}, Lcom/arialyy/aria/core/AriaConfig;->getDConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/DownloadConfig;->getCaName()Ljava/lang/String;

    move-result-object v0

    .line 115
    invoke-virtual {p1}, Lcom/arialyy/aria/core/AriaConfig;->getDConfig()Lcom/arialyy/aria/core/config/DownloadConfig;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/config/DownloadConfig;->getCaPath()Ljava/lang/String;

    move-result-object p1

    const-string v1, "TLS"

    .line 114
    invoke-static {v0, p1, v1}, Lcom/arialyy/aria/util/SSLContextUtil;->getSSLContextFromAssets(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object p1

    if-nez p1, :cond_1

    .line 117
    invoke-static {v1}, Lcom/arialyy/aria/util/SSLContextUtil;->getDefaultSLLContext(Ljava/lang/String;)Ljavax/net/ssl/SSLContext;

    move-result-object p1

    .line 119
    :cond_1
    invoke-virtual {p1}, Ljavax/net/ssl/SSLContext;->getSocketFactory()Ljavax/net/ssl/SSLSocketFactory;

    move-result-object p1

    .line 120
    move-object v0, p0

    check-cast v0, Ljavax/net/ssl/HttpsURLConnection;

    invoke-virtual {p0, p1}, Ljavax/net/ssl/HttpsURLConnection;->setSSLSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)V

    .line 121
    sget-object p1, Lcom/arialyy/aria/util/SSLContextUtil;->HOSTNAME_VERIFIER:Ljavax/net/ssl/HostnameVerifier;

    invoke-virtual {p0, p1}, Ljavax/net/ssl/HttpsURLConnection;->setHostnameVerifier(Ljavax/net/ssl/HostnameVerifier;)V

    goto :goto_1

    .line 123
    :cond_2
    check-cast p0, Ljava/net/HttpURLConnection;

    :goto_1
    return-object p0
.end method

.method public static handleUrl(Ljava/lang/String;Lcom/arialyy/aria/http/HttpTaskOption;)Ljava/net/URL;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/MalformedURLException;
        }
    .end annotation

    .line 56
    invoke-virtual {p1}, Lcom/arialyy/aria/http/HttpTaskOption;->getParams()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 57
    invoke-virtual {p1}, Lcom/arialyy/aria/http/HttpTaskOption;->getRequestEnum()Lcom/arialyy/aria/core/common/RequestEnum;

    move-result-object p1

    sget-object v1, Lcom/arialyy/aria/core/common/RequestEnum;->GET:Lcom/arialyy/aria/core/common/RequestEnum;

    if-ne p1, v1, :cond_2

    const-string p1, "?"

    .line 58
    invoke-virtual {p0, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eqz v1, :cond_0

    new-array p1, v3, [Ljava/lang/Object;

    aput-object p0, p1, v2

    const-string v0, "\u8bbe\u7f6e\u53c2\u6570\u5931\u8d25\uff0curl\u4e2d\u5df2\u7ecf\u6709?\uff0curl: %s"

    .line 59
    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    const-string v0, "ConnectionHelp"

    invoke-static {v0, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    new-instance p1, Ljava/net/URL;

    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->convertUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    return-object p1

    .line 62
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p0

    .line 65
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    .line 66
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "="

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {p1}, Ljava/net/URLEncoder;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "&"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 68
    :cond_1
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 69
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p1

    sub-int/2addr p1, v3

    invoke-virtual {p0, v2, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 70
    new-instance p1, Ljava/net/URL;

    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->convertUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    return-object p1

    .line 72
    :cond_2
    new-instance p1, Ljava/net/URL;

    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->convertUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    return-object p1
.end method

.method public static setConnectParam(Lcom/arialyy/aria/http/HttpTaskOption;Ljava/net/HttpURLConnection;)Ljava/net/HttpURLConnection;
    .locals 4

    .line 134
    invoke-virtual {p0}, Lcom/arialyy/aria/http/HttpTaskOption;->getRequestEnum()Lcom/arialyy/aria/core/common/RequestEnum;

    move-result-object v0

    sget-object v1, Lcom/arialyy/aria/core/common/RequestEnum;->POST:Lcom/arialyy/aria/core/common/RequestEnum;

    const/4 v2, 0x0

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    .line 135
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setDoInput(Z)V

    .line 136
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 137
    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setUseCaches(Z)V

    .line 140
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/http/HttpTaskOption;->getHeaders()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Lcom/arialyy/aria/http/HttpTaskOption;->getHeaders()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    if-lez v0, :cond_1

    .line 141
    invoke-virtual {p0}, Lcom/arialyy/aria/http/HttpTaskOption;->getHeaders()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 142
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 143
    invoke-virtual {p0}, Lcom/arialyy/aria/http/HttpTaskOption;->getHeaders()Ljava/util/Map;

    move-result-object v3

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    invoke-virtual {p1, v1, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    const-string v0, "Accept-Language"

    .line 146
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_2

    const-string v1, "zh-CN,zh;q=0.9,en;q=0.8,ja;q=0.7"

    .line 147
    invoke-virtual {p1, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2
    const-string v0, "Accept-Encoding"

    .line 149
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_3

    const-string v1, "identity"

    .line 150
    invoke-virtual {p1, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    const-string v0, "Accept-Charset"

    .line 152
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "UTF-8"

    if-nez v1, :cond_4

    .line 153
    invoke-virtual {p1, v0, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_4
    const-string v0, "Connection"

    .line 155
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_5

    const-string v1, "Keep-Alive"

    .line 156
    invoke-virtual {p1, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    const-string v0, "Charset"

    .line 158
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_6

    .line 159
    invoke-virtual {p1, v0, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_6
    const-string v0, "User-Agent"

    .line 161
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_7

    const-string v1, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36"

    .line 162
    invoke-virtual {p1, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    const-string v0, "Accept"

    .line 165
    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->getRequestProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_8

    .line 166
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "image/gif, "

    .line 167
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "image/jpeg, "

    .line 168
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "image/pjpeg, "

    .line 169
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "image/webp, "

    .line 170
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "image/apng, "

    .line 171
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "application/xml, "

    .line 172
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "application/xaml+xml, "

    .line 173
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "application/xhtml+xml, "

    .line 174
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "application/x-shockwave-flash, "

    .line 175
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "application/x-ms-xbap, "

    .line 176
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "application/x-ms-application, "

    .line 177
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "application/msword, "

    .line 178
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "application/vnd.ms-excel, "

    .line 179
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "application/vnd.ms-xpsdocument, "

    .line 180
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "application/vnd.ms-powerpoint, "

    .line 181
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "application/signed-exchange, "

    .line 182
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "text/plain, "

    .line 183
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "text/html, "

    .line 184
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "*/*"

    .line 185
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p1, v0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    :cond_8
    invoke-virtual {p1, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 191
    invoke-virtual {p0}, Lcom/arialyy/aria/http/HttpTaskOption;->getCookieManager()Ljava/net/CookieManager;

    move-result-object p0

    if-eqz p0, :cond_9

    .line 193
    invoke-virtual {p0}, Ljava/net/CookieManager;->getCookieStore()Ljava/net/CookieStore;

    move-result-object p0

    if-eqz p0, :cond_9

    .line 194
    invoke-interface {p0}, Ljava/net/CookieStore;->getCookies()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    if-lez v0, :cond_9

    .line 196
    invoke-interface {p0}, Ljava/net/CookieStore;->getCookies()Ljava/util/List;

    move-result-object p0

    const-string v0, ";"

    invoke-static {v0, p0}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "Cookie"

    .line 195
    invoke-virtual {p1, v0, p0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9
    return-object p1
.end method
