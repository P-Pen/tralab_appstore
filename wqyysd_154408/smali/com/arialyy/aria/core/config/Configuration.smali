.class public final Lcom/arialyy/aria/core/config/Configuration;
.super Ljava/lang/Object;
.source "Configuration.java"


# static fields
.field static final APP_CONFIG_FILE:Ljava/lang/String; = "/Aria/AriaApp.cfg"

.field static final DGROUP_CONFIG_FILE:Ljava/lang/String; = "/Aria/AriaDGroup.cfg"

.field static final DOWNLOAD_CONFIG_FILE:Ljava/lang/String; = "/Aria/AriaDownload.cfg"

.field private static volatile INSTANCE:Lcom/arialyy/aria/core/config/Configuration; = null

.field private static final TAG:Ljava/lang/String; = "Configuration"

.field static final UPLOAD_CONFIG_FILE:Ljava/lang/String; = "/Aria/AriaUpload.cfg"

.field public static final XML_FILE:Ljava/lang/String; = "/Aria/aria_config.xml"


# instance fields
.field public appCfg:Lcom/arialyy/aria/core/config/AppConfig;

.field public dGroupCfg:Lcom/arialyy/aria/core/config/DGroupConfig;

.field public downloadCfg:Lcom/arialyy/aria/core/config/DownloadConfig;

.field public uploadCfg:Lcom/arialyy/aria/core/config/UploadConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>()V
    .locals 10

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 41
    invoke-direct {p0, v0}, Lcom/arialyy/aria/core/config/Configuration;->del351Config(Ljava/lang/String;)V

    .line 42
    new-instance v1, Ljava/io/File;

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const-string v5, "/Aria/AriaDownload.cfg"

    const/4 v6, 0x1

    aput-object v5, v3, v6

    const-string v5, "%s%s"

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 43
    new-instance v3, Ljava/io/File;

    new-array v7, v2, [Ljava/lang/Object;

    aput-object v0, v7, v4

    const-string v8, "/Aria/AriaUpload.cfg"

    aput-object v8, v7, v6

    invoke-static {v5, v7}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v3, v7}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 44
    new-instance v7, Ljava/io/File;

    new-array v8, v2, [Ljava/lang/Object;

    aput-object v0, v8, v4

    const-string v9, "/Aria/AriaApp.cfg"

    aput-object v9, v8, v6

    invoke-static {v5, v8}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 45
    new-instance v8, Ljava/io/File;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v4

    const-string v0, "/Aria/AriaDGroup.cfg"

    aput-object v0, v2, v6

    invoke-static {v5, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v8, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 47
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 48
    invoke-virtual {v1}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->readObjFromFile(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/config/DownloadConfig;

    iput-object v0, p0, Lcom/arialyy/aria/core/config/Configuration;->downloadCfg:Lcom/arialyy/aria/core/config/DownloadConfig;

    .line 50
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/config/Configuration;->downloadCfg:Lcom/arialyy/aria/core/config/DownloadConfig;

    if-nez v0, :cond_1

    .line 51
    new-instance v0, Lcom/arialyy/aria/core/config/DownloadConfig;

    invoke-direct {v0}, Lcom/arialyy/aria/core/config/DownloadConfig;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/config/Configuration;->downloadCfg:Lcom/arialyy/aria/core/config/DownloadConfig;

    .line 54
    :cond_1
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 55
    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->readObjFromFile(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/config/UploadConfig;

    iput-object v0, p0, Lcom/arialyy/aria/core/config/Configuration;->uploadCfg:Lcom/arialyy/aria/core/config/UploadConfig;

    .line 57
    :cond_2
    iget-object v0, p0, Lcom/arialyy/aria/core/config/Configuration;->uploadCfg:Lcom/arialyy/aria/core/config/UploadConfig;

    if-nez v0, :cond_3

    .line 58
    new-instance v0, Lcom/arialyy/aria/core/config/UploadConfig;

    invoke-direct {v0}, Lcom/arialyy/aria/core/config/UploadConfig;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/config/Configuration;->uploadCfg:Lcom/arialyy/aria/core/config/UploadConfig;

    .line 61
    :cond_3
    invoke-virtual {v7}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 62
    invoke-virtual {v7}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->readObjFromFile(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/config/AppConfig;

    iput-object v0, p0, Lcom/arialyy/aria/core/config/Configuration;->appCfg:Lcom/arialyy/aria/core/config/AppConfig;

    .line 64
    :cond_4
    iget-object v0, p0, Lcom/arialyy/aria/core/config/Configuration;->appCfg:Lcom/arialyy/aria/core/config/AppConfig;

    if-nez v0, :cond_5

    .line 65
    new-instance v0, Lcom/arialyy/aria/core/config/AppConfig;

    invoke-direct {v0}, Lcom/arialyy/aria/core/config/AppConfig;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/config/Configuration;->appCfg:Lcom/arialyy/aria/core/config/AppConfig;

    .line 68
    :cond_5
    invoke-virtual {v8}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_6

    .line 69
    invoke-virtual {v8}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/FileUtil;->readObjFromFile(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/config/DGroupConfig;

    iput-object v0, p0, Lcom/arialyy/aria/core/config/Configuration;->dGroupCfg:Lcom/arialyy/aria/core/config/DGroupConfig;

    .line 71
    :cond_6
    iget-object v0, p0, Lcom/arialyy/aria/core/config/Configuration;->dGroupCfg:Lcom/arialyy/aria/core/config/DGroupConfig;

    if-nez v0, :cond_7

    .line 72
    new-instance v0, Lcom/arialyy/aria/core/config/DGroupConfig;

    invoke-direct {v0}, Lcom/arialyy/aria/core/config/DGroupConfig;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/config/Configuration;->dGroupCfg:Lcom/arialyy/aria/core/config/DGroupConfig;

    :cond_7
    return-void
.end method

.method private del351Config(Ljava/lang/String;)V
    .locals 7

    .line 103
    new-instance v0, Ljava/io/File;

    const/4 v1, 0x1

    new-array v2, v1, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const-string v4, "%s/Aria/DownloadConfig.properties"

    invoke-static {v4, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 104
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 105
    new-instance v2, Ljava/io/File;

    new-array v4, v1, [Ljava/lang/Object;

    aput-object p1, v4, v3

    const-string v5, "%s/Aria/UploadConfig.properties"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 106
    new-instance v4, Ljava/io/File;

    new-array v5, v1, [Ljava/lang/Object;

    aput-object p1, v5, v3

    const-string v6, "%s/Aria/AppConfig.properties"

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 107
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 108
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 109
    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    .line 111
    new-instance v0, Ljava/io/File;

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    aput-object p1, v2, v3

    const-string p1, "/Aria/aria_config.xml"

    aput-object p1, v2, v1

    const-string p1, "%s%s"

    invoke-static {p1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 112
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 113
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    :cond_0
    return-void
.end method

.method public static getInstance()Lcom/arialyy/aria/core/config/Configuration;
    .locals 2

    .line 77
    sget-object v0, Lcom/arialyy/aria/core/config/Configuration;->INSTANCE:Lcom/arialyy/aria/core/config/Configuration;

    if-nez v0, :cond_0

    .line 78
    const-class v0, Lcom/arialyy/aria/core/config/AppConfig;

    monitor-enter v0

    .line 79
    :try_start_0
    new-instance v1, Lcom/arialyy/aria/core/config/Configuration;

    invoke-direct {v1}, Lcom/arialyy/aria/core/config/Configuration;-><init>()V

    sput-object v1, Lcom/arialyy/aria/core/config/Configuration;->INSTANCE:Lcom/arialyy/aria/core/config/Configuration;

    .line 80
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    .line 82
    :cond_0
    :goto_0
    sget-object v0, Lcom/arialyy/aria/core/config/Configuration;->INSTANCE:Lcom/arialyy/aria/core/config/Configuration;

    return-object v0
.end method


# virtual methods
.method public configExists()Z
    .locals 8

    .line 92
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v0

    .line 93
    new-instance v1, Ljava/io/File;

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v0, v3, v4

    const-string v5, "/Aria/AriaDownload.cfg"

    const/4 v6, 0x1

    aput-object v5, v3, v6

    const-string v5, "%s%s"

    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/io/File;

    new-array v3, v2, [Ljava/lang/Object;

    aput-object v0, v3, v4

    const-string v7, "/Aria/AriaUpload.cfg"

    aput-object v7, v3, v6

    .line 94
    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/io/File;

    new-array v3, v2, [Ljava/lang/Object;

    aput-object v0, v3, v4

    const-string v7, "/Aria/AriaApp.cfg"

    aput-object v7, v3, v6

    .line 95
    invoke-static {v5, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    new-instance v1, Ljava/io/File;

    new-array v2, v2, [Ljava/lang/Object;

    aput-object v0, v2, v4

    const-string v0, "/Aria/AriaDGroup.cfg"

    aput-object v0, v2, v6

    .line 96
    invoke-static {v5, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    move v4, v6

    :cond_0
    return v4
.end method
