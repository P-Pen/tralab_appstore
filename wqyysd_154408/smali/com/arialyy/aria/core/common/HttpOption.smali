.class public Lcom/arialyy/aria/core/common/HttpOption;
.super Lcom/arialyy/aria/core/common/BaseOption;
.source "HttpOption.java"


# instance fields
.field private attachment:Ljava/lang/String;

.field private fileLenAdapter:Lcom/arialyy/aria/core/processor/IHttpFileLenAdapter;

.field private fileNameAdapter:Lcom/arialyy/aria/core/processor/IHttpFileNameAdapter;

.field private formFields:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private headers:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private proxy:Ljava/net/Proxy;

.field private requestEnum:Lcom/arialyy/aria/core/common/RequestEnum;

.field private useServerFileName:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Lcom/arialyy/aria/core/common/BaseOption;-><init>()V

    .line 34
    sget-object v0, Lcom/arialyy/aria/core/common/RequestEnum;->GET:Lcom/arialyy/aria/core/common/RequestEnum;

    iput-object v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->requestEnum:Lcom/arialyy/aria/core/common/RequestEnum;

    const/4 v0, 0x0

    .line 37
    iput-boolean v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->useServerFileName:Z

    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/arialyy/aria/core/common/HttpOption;
    .locals 1

    .line 111
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 112
    iget-object p1, p0, Lcom/arialyy/aria/core/common/HttpOption;->TAG:Ljava/lang/String;

    const-string p2, "\u8bbe\u7f6eheader\u5931\u8d25\uff0cheader\u5bf9\u5e94\u7684key\u4e0d\u80fd\u4e3anull"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0

    .line 114
    :cond_0
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 115
    iget-object p1, p0, Lcom/arialyy/aria/core/common/HttpOption;->TAG:Ljava/lang/String;

    const-string p2, "\u8bbe\u7f6eheader\u5931\u8d25\uff0cheader\u5bf9\u5e94\u7684value\u4e0d\u80fd\u4e3anull"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0

    .line 118
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->headers:Ljava/util/Map;

    if-nez v0, :cond_2

    .line 119
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->headers:Ljava/util/Map;

    .line 121
    :cond_2
    iget-object v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->headers:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public addHeaders(Ljava/util/Map;)Lcom/arialyy/aria/core/common/HttpOption;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/arialyy/aria/core/common/HttpOption;"
        }
    .end annotation

    .line 132
    invoke-interface {p1}, Ljava/util/Map;->size()I

    move-result v0

    if-nez v0, :cond_0

    .line 133
    iget-object p1, p0, Lcom/arialyy/aria/core/common/HttpOption;->TAG:Ljava/lang/String;

    const-string v0, "\u8bbe\u7f6eheader\u5931\u8d25\uff0cmap\u6ca1\u6709header\u6570\u636e"

    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0

    .line 136
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->headers:Ljava/util/Map;

    if-nez v0, :cond_1

    .line 137
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->headers:Ljava/util/Map;

    .line 139
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->headers:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    return-object p0
.end method

.method public setAttachment(Ljava/lang/String;)Lcom/arialyy/aria/core/common/HttpOption;
    .locals 1

    .line 96
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p1, "file"

    .line 99
    :cond_0
    iput-object p1, p0, Lcom/arialyy/aria/core/common/HttpOption;->attachment:Ljava/lang/String;

    return-object p0
.end method

.method public setFilNameAdapter(Lcom/arialyy/aria/core/processor/IHttpFileNameAdapter;)Lcom/arialyy/aria/core/common/HttpOption;
    .locals 1

    if-eqz p1, :cond_0

    .line 177
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CheckUtil;->checkMemberClass(Ljava/lang/Class;)V

    .line 178
    iput-object p1, p0, Lcom/arialyy/aria/core/common/HttpOption;->fileNameAdapter:Lcom/arialyy/aria/core/processor/IHttpFileNameAdapter;

    return-object p0

    .line 175
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "adapter\u4e3a\u7a7a"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setFileLenAdapter(Lcom/arialyy/aria/core/processor/IHttpFileLenAdapter;)Lcom/arialyy/aria/core/common/HttpOption;
    .locals 1

    if-eqz p1, :cond_0

    .line 169
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CheckUtil;->checkMemberClass(Ljava/lang/Class;)V

    .line 170
    iput-object p1, p0, Lcom/arialyy/aria/core/common/HttpOption;->fileLenAdapter:Lcom/arialyy/aria/core/processor/IHttpFileLenAdapter;

    return-object p0

    .line 167
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "adapter\u4e3a\u7a7a"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setFormFields(Ljava/util/Map;)Lcom/arialyy/aria/core/common/HttpOption;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/arialyy/aria/core/common/HttpOption;"
        }
    .end annotation

    .line 86
    iput-object p1, p0, Lcom/arialyy/aria/core/common/HttpOption;->formFields:Ljava/util/Map;

    return-object p0
.end method

.method public setParam(Ljava/lang/String;Ljava/lang/String;)Lcom/arialyy/aria/core/common/HttpOption;
    .locals 1

    .line 71
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_2

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 75
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->params:Ljava/util/Map;

    if-nez v0, :cond_1

    .line 76
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->params:Ljava/util/Map;

    .line 78
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->params:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0

    .line 72
    :cond_2
    :goto_0
    iget-object p1, p0, Lcom/arialyy/aria/core/common/HttpOption;->TAG:Ljava/lang/String;

    const-string p2, "key \u6216value \u4e3a\u7a7a"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0
.end method

.method public setParams(Ljava/util/Map;)Lcom/arialyy/aria/core/common/HttpOption;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/arialyy/aria/core/common/HttpOption;"
        }
    .end annotation

    .line 60
    iget-object v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->params:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 61
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->params:Ljava/util/Map;

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/common/HttpOption;->params:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    return-object p0
.end method

.method public setRequestType(Lcom/arialyy/aria/core/common/RequestEnum;)Lcom/arialyy/aria/core/common/HttpOption;
    .locals 0

    .line 52
    iput-object p1, p0, Lcom/arialyy/aria/core/common/HttpOption;->requestEnum:Lcom/arialyy/aria/core/common/RequestEnum;

    return-object p0
.end method

.method public setUrlProxy(Ljava/net/Proxy;)Lcom/arialyy/aria/core/common/HttpOption;
    .locals 0

    .line 147
    iput-object p1, p0, Lcom/arialyy/aria/core/common/HttpOption;->proxy:Ljava/net/Proxy;

    return-object p0
.end method

.method public useServerFileName(Z)Lcom/arialyy/aria/core/common/HttpOption;
    .locals 0

    .line 158
    iput-boolean p1, p0, Lcom/arialyy/aria/core/common/HttpOption;->useServerFileName:Z

    return-object p0
.end method
