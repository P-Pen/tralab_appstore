.class public Lcom/arialyy/aria/util/ALog;
.super Ljava/lang/Object;
.source "ALog.java"


# static fields
.field public static final DEBUG:Z = true

.field public static final LOG_CLOSE:I = 0x8

.field public static final LOG_DEFAULT:I = 0x3

.field public static LOG_LEVEL:I = 0x3

.field public static final LOG_LEVEL_ASSERT:I = 0x7

.field public static final LOG_LEVEL_DEBUG:I = 0x3

.field public static final LOG_LEVEL_ERROR:I = 0x6

.field public static final LOG_LEVEL_INFO:I = 0x4

.field public static final LOG_LEVEL_VERBOSE:I = 0x2

.field public static final LOG_LEVEL_WARN:I = 0x5


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x3

    .line 51
    invoke-static {v0, p0, p1}, Lcom/arialyy/aria/util/ALog;->println(ILjava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x6

    .line 63
    invoke-static {v0, p0, p1}, Lcom/arialyy/aria/util/ALog;->println(ILjava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 0

    .line 67
    invoke-static {p0, p1, p2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public static getExceptionString(Ljava/lang/Throwable;)Ljava/lang/String;
    .locals 7

    if-nez p0, :cond_0

    const-string p0, ""

    return-object p0

    .line 121
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "ExceptionDetailed:\n"

    .line 122
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "====================Exception Info====================\n"

    .line 123
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    .line 125
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v2

    .line 127
    array-length v3, v2

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v3, :cond_1

    aget-object v6, v2, v5

    .line 128
    invoke-virtual {v6}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 130
    :cond_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    if-eqz p0, :cond_2

    const-string v2, "\u3010Caused by\u3011: "

    .line 132
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    invoke-virtual {p0}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object p0

    .line 136
    array-length v2, p0

    :goto_1
    if-ge v4, v2, :cond_2

    aget-object v3, p0, v4

    .line 137
    invoke-virtual {v3}, Ljava/lang/StackTraceElement;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    :cond_2
    const-string p0, "==================================================="

    .line 140
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 141
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x4

    .line 55
    invoke-static {v0, p0, p1}, Lcom/arialyy/aria/util/ALog;->println(ILjava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static j(Ljava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 95
    sget v0, Lcom/arialyy/aria/util/ALog;->LOG_LEVEL:I

    const/4 v1, 0x3

    if-gt v0, v1, :cond_2

    :try_start_0
    const-string v0, "{"

    .line 98
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x4

    if-eqz v0, :cond_0

    .line 99
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 100
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->toString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const-string v0, "["

    .line 101
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 102
    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0, p1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 103
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->toString(I)Ljava/lang/String;

    move-result-object p1
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    :catch_0
    :cond_1
    :goto_0
    invoke-static {v1, p0, p1}, Lcom/arialyy/aria/util/ALog;->println(ILjava/lang/String;Ljava/lang/String;)I

    :cond_2
    return-void
.end method

.method public static m(Ljava/lang/String;Ljava/util/Map;)V
    .locals 7

    .line 74
    sget v0, Lcom/arialyy/aria/util/ALog;->LOG_LEVEL:I

    const/4 v1, 0x3

    if-gt v0, v1, :cond_2

    .line 75
    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    .line 76
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v0

    const/4 v2, 0x1

    if-ge v0, v2, :cond_0

    const-string p1, "[]"

    .line 77
    invoke-static {p0, p1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 81
    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v3

    new-array v3, v3, [Ljava/lang/String;

    .line 82
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 83
    check-cast v4, Ljava/util/Map$Entry;

    .line 84
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {v4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v6, " = "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface {v4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, ",\n"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v3, v0

    add-int/2addr v0, v2

    goto :goto_0

    .line 87
    :cond_1
    invoke-static {v3}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v1, p0, p1}, Lcom/arialyy/aria/util/ALog;->println(ILjava/lang/String;Ljava/lang/String;)I

    :cond_2
    return-void
.end method

.method private static println(ILjava/lang/String;Ljava/lang/String;)I
    .locals 1

    .line 145
    sget v0, Lcom/arialyy/aria/util/ALog;->LOG_LEVEL:I

    if-gt v0, p0, :cond_1

    .line 146
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string p2, "null"

    :cond_0
    invoke-static {p0, p1, p2}, Landroid/util/Log;->println(ILjava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public static v(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x2

    .line 47
    invoke-static {v0, p0, p1}, Lcom/arialyy/aria/util/ALog;->println(ILjava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static w(Ljava/lang/String;Ljava/lang/String;)I
    .locals 1

    const/4 v0, 0x5

    .line 59
    invoke-static {v0, p0, p1}, Lcom/arialyy/aria/util/ALog;->println(ILjava/lang/String;Ljava/lang/String;)I

    move-result p0

    return p0
.end method
