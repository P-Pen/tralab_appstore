.class public Lcom/arialyy/aria/core/config/AppConfig;
.super Lcom/arialyy/aria/core/config/BaseConfig;
.source "AppConfig.java"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field logLevel:I

.field netCheck:Z

.field notNetRetry:Z

.field useAriaCrashHandler:Z

.field useBroadcast:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 25
    invoke-direct {p0}, Lcom/arialyy/aria/core/config/BaseConfig;-><init>()V

    const/4 v0, 0x1

    .line 41
    iput-boolean v0, p0, Lcom/arialyy/aria/core/config/AppConfig;->netCheck:Z

    const/4 v0, 0x0

    .line 46
    iput-boolean v0, p0, Lcom/arialyy/aria/core/config/AppConfig;->useBroadcast:Z

    .line 51
    iput-boolean v0, p0, Lcom/arialyy/aria/core/config/AppConfig;->notNetRetry:Z

    return-void
.end method


# virtual methods
.method public getLogLevel()I
    .locals 1

    .line 91
    iget v0, p0, Lcom/arialyy/aria/core/config/AppConfig;->logLevel:I

    return v0
.end method

.method getType()I
    .locals 1

    const/4 v0, 0x3

    return v0
.end method

.method public getUseAriaCrashHandler()Z
    .locals 1

    .line 95
    iget-boolean v0, p0, Lcom/arialyy/aria/core/config/AppConfig;->useAriaCrashHandler:Z

    return v0
.end method

.method public isNetCheck()Z
    .locals 1

    .line 74
    iget-boolean v0, p0, Lcom/arialyy/aria/core/config/AppConfig;->netCheck:Z

    return v0
.end method

.method public isNotNetRetry()Z
    .locals 1

    .line 54
    iget-boolean v0, p0, Lcom/arialyy/aria/core/config/AppConfig;->notNetRetry:Z

    return v0
.end method

.method public isUseBroadcast()Z
    .locals 1

    .line 64
    iget-boolean v0, p0, Lcom/arialyy/aria/core/config/AppConfig;->useBroadcast:Z

    return v0
.end method

.method public setLogLevel(I)Lcom/arialyy/aria/core/config/AppConfig;
    .locals 0

    .line 84
    iput p1, p0, Lcom/arialyy/aria/core/config/AppConfig;->logLevel:I

    .line 85
    sput p1, Lcom/arialyy/aria/util/ALog;->LOG_LEVEL:I

    .line 86
    invoke-virtual {p0}, Lcom/arialyy/aria/core/config/AppConfig;->save()V

    return-object p0
.end method

.method public setNetCheck(Z)Lcom/arialyy/aria/core/config/AppConfig;
    .locals 0

    .line 78
    iput-boolean p1, p0, Lcom/arialyy/aria/core/config/AppConfig;->netCheck:Z

    .line 79
    invoke-virtual {p0}, Lcom/arialyy/aria/core/config/AppConfig;->save()V

    return-object p0
.end method

.method public setNotNetRetry(Z)Lcom/arialyy/aria/core/config/AppConfig;
    .locals 0

    .line 58
    iput-boolean p1, p0, Lcom/arialyy/aria/core/config/AppConfig;->notNetRetry:Z

    .line 59
    invoke-virtual {p0}, Lcom/arialyy/aria/core/config/AppConfig;->save()V

    return-object p0
.end method

.method public setUseAriaCrashHandler(Z)Lcom/arialyy/aria/core/config/AppConfig;
    .locals 0

    .line 99
    iput-boolean p1, p0, Lcom/arialyy/aria/core/config/AppConfig;->useAriaCrashHandler:Z

    if-eqz p1, :cond_0

    .line 101
    new-instance p1, Lcom/arialyy/aria/util/AriaCrashHandler;

    invoke-direct {p1}, Lcom/arialyy/aria/util/AriaCrashHandler;-><init>()V

    invoke-static {p1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 103
    invoke-static {p1}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 105
    :goto_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/config/AppConfig;->save()V

    return-object p0
.end method

.method public setUseBroadcast(Z)Lcom/arialyy/aria/core/config/AppConfig;
    .locals 0

    .line 68
    iput-boolean p1, p0, Lcom/arialyy/aria/core/config/AppConfig;->useBroadcast:Z

    .line 69
    invoke-virtual {p0}, Lcom/arialyy/aria/core/config/AppConfig;->save()V

    return-object p0
.end method
