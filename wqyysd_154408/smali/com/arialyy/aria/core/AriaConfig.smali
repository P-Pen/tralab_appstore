.class public Lcom/arialyy/aria/core/AriaConfig;
.super Ljava/lang/Object;
.source "AriaConfig.java"


# static fields
.field private static APP:Landroid/content/Context; = null

.field public static final DOWNLOAD_TEMP_DIR:Ljava/lang/String; = "/Aria/temp/download/"

.field public static final IGNORE_CLASS_KLASS:Ljava/lang/String; = "shadow$_klass_"

.field public static final IGNORE_CLASS_MONITOR:Ljava/lang/String; = "shadow$_monitor_"

.field private static volatile Instance:Lcom/arialyy/aria/core/AriaConfig; = null

.field private static final TAG:Ljava/lang/String; = "AriaConfig"

.field public static final UPLOAD_TEMP_DIR:Ljava/lang/String; = "/Aria/temp/upload/"

.field private static isConnectedNet:Z = true


# instance fields
.field private mAConfig:Lcom/arialyy/aria/core/config/AppConfig;

.field private mAriaHandler:Landroid/os/Handler;

.field private mDConfig:Lcom/arialyy/aria/core/config/DownloadConfig;

.field private mDGConfig:Lcom/arialyy/aria/core/config/DGroupConfig;

.field private mUConfig:Lcom/arialyy/aria/core/config/UploadConfig;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 65
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 66
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    sput-object p1, Lcom/arialyy/aria/core/AriaConfig;->APP:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000()Z
    .locals 1

    .line 45
    sget-boolean v0, Lcom/arialyy/aria/core/AriaConfig;->isConnectedNet:Z

    return v0
.end method

.method static synthetic access$002(Z)Z
    .locals 0

    .line 45
    sput-boolean p0, Lcom/arialyy/aria/core/AriaConfig;->isConnectedNet:Z

    return p0
.end method

.method static synthetic access$100(Lcom/arialyy/aria/core/AriaConfig;)Z
    .locals 0

    .line 45
    invoke-direct {p0}, Lcom/arialyy/aria/core/AriaConfig;->isNetworkAvailable()Z

    move-result p0

    return p0
.end method

.method public static getInstance()Lcom/arialyy/aria/core/AriaConfig;
    .locals 2

    .line 82
    sget-object v0, Lcom/arialyy/aria/core/AriaConfig;->Instance:Lcom/arialyy/aria/core/AriaConfig;

    if-nez v0, :cond_0

    const-string v0, "AriaConfig"

    const-string v1, "\u8bf7\u4f7f\u7528init()\u521d\u59cb\u5316"

    .line 83
    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 85
    :cond_0
    sget-object v0, Lcom/arialyy/aria/core/AriaConfig;->Instance:Lcom/arialyy/aria/core/AriaConfig;

    return-object v0
.end method

.method public static init(Landroid/content/Context;)Lcom/arialyy/aria/core/AriaConfig;
    .locals 2

    .line 70
    sget-object v0, Lcom/arialyy/aria/core/AriaConfig;->Instance:Lcom/arialyy/aria/core/AriaConfig;

    if-nez v0, :cond_1

    .line 71
    const-class v0, Lcom/arialyy/aria/core/AriaConfig;

    monitor-enter v0

    .line 72
    :try_start_0
    sget-object v1, Lcom/arialyy/aria/core/AriaConfig;->Instance:Lcom/arialyy/aria/core/AriaConfig;

    if-nez v1, :cond_0

    .line 73
    new-instance v1, Lcom/arialyy/aria/core/AriaConfig;

    invoke-direct {v1, p0}, Lcom/arialyy/aria/core/AriaConfig;-><init>(Landroid/content/Context;)V

    sput-object v1, Lcom/arialyy/aria/core/AriaConfig;->Instance:Lcom/arialyy/aria/core/AriaConfig;

    .line 74
    sget-object p0, Lcom/arialyy/aria/core/AriaConfig;->Instance:Lcom/arialyy/aria/core/AriaConfig;

    invoke-direct {p0}, Lcom/arialyy/aria/core/AriaConfig;->initData()V

    .line 76
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    .line 78
    :cond_1
    :goto_0
    sget-object p0, Lcom/arialyy/aria/core/AriaConfig;->Instance:Lcom/arialyy/aria/core/AriaConfig;

    return-object p0
.end method

.method private initConfig()V
    .locals 5

    .line 193
    invoke-static {}, Lcom/arialyy/aria/core/config/Configuration;->getInstance()Lcom/arialyy/aria/core/config/Configuration;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/config/Configuration;->downloadCfg:Lcom/arialyy/aria/core/config/DownloadConfig;

    iput-object v0, p0, Lcom/arialyy/aria/core/AriaConfig;->mDConfig:Lcom/arialyy/aria/core/config/DownloadConfig;

    .line 194
    invoke-static {}, Lcom/arialyy/aria/core/config/Configuration;->getInstance()Lcom/arialyy/aria/core/config/Configuration;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/config/Configuration;->uploadCfg:Lcom/arialyy/aria/core/config/UploadConfig;

    iput-object v0, p0, Lcom/arialyy/aria/core/AriaConfig;->mUConfig:Lcom/arialyy/aria/core/config/UploadConfig;

    .line 195
    invoke-static {}, Lcom/arialyy/aria/core/config/Configuration;->getInstance()Lcom/arialyy/aria/core/config/Configuration;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/config/Configuration;->appCfg:Lcom/arialyy/aria/core/config/AppConfig;

    iput-object v0, p0, Lcom/arialyy/aria/core/AriaConfig;->mAConfig:Lcom/arialyy/aria/core/config/AppConfig;

    .line 196
    invoke-static {}, Lcom/arialyy/aria/core/config/Configuration;->getInstance()Lcom/arialyy/aria/core/config/Configuration;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/config/Configuration;->dGroupCfg:Lcom/arialyy/aria/core/config/DGroupConfig;

    iput-object v0, p0, Lcom/arialyy/aria/core/AriaConfig;->mDGConfig:Lcom/arialyy/aria/core/config/DGroupConfig;

    .line 198
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/arialyy/aria/core/AriaConfig;->APP:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/Aria/aria_config.xml"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 199
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/arialyy/aria/core/AriaConfig;->APP:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/temp"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 200
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 201
    invoke-direct {p0}, Lcom/arialyy/aria/core/AriaConfig;->loadConfig()V

    goto :goto_0

    .line 204
    :cond_0
    :try_start_0
    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getFileMD5(Ljava/io/File;)Ljava/lang/String;

    move-result-object v0

    .line 205
    new-instance v2, Ljava/io/File;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lcom/arialyy/aria/core/AriaConfig;->APP:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "/temp.xml"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 206
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_1

    .line 207
    invoke-virtual {v2}, Ljava/io/File;->delete()Z

    .line 209
    :cond_1
    sget-object v3, Lcom/arialyy/aria/core/AriaConfig;->APP:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    const-string v4, "aria_config.xml"

    invoke-virtual {v3, v4}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    .line 210
    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v4

    .line 209
    invoke-static {v3, v4}, Lcom/arialyy/aria/util/FileUtil;->createFileFormInputStream(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 211
    invoke-static {v0, v2}, Lcom/arialyy/aria/util/CommonUtil;->checkMD5(Ljava/lang/String;Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-static {}, Lcom/arialyy/aria/core/config/Configuration;->getInstance()Lcom/arialyy/aria/core/config/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/Configuration;->configExists()Z

    move-result v0

    if-nez v0, :cond_3

    .line 212
    :cond_2
    invoke-direct {p0}, Lcom/arialyy/aria/core/AriaConfig;->loadConfig()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 215
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 218
    :cond_3
    :goto_0
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_4

    .line 219
    new-instance v0, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Lcom/arialyy/aria/core/AriaConfig;->APP:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "/Aria/temp/download/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 220
    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 221
    invoke-virtual {v1, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    :cond_4
    return-void
.end method

.method private initData()V
    .locals 1

    .line 93
    invoke-direct {p0}, Lcom/arialyy/aria/core/AriaConfig;->initConfig()V

    .line 94
    sget-object v0, Lcom/arialyy/aria/core/AriaConfig;->APP:Landroid/content/Context;

    invoke-direct {p0, v0}, Lcom/arialyy/aria/core/AriaConfig;->regNetCallBack(Landroid/content/Context;)V

    return-void
.end method

.method private isNetworkAvailable()Z
    .locals 6

    .line 163
    invoke-virtual {p0}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object v0

    const-string v1, "connectivity"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/net/ConnectivityManager;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 170
    :cond_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getAllNetworkInfo()[Landroid/net/NetworkInfo;

    move-result-object v0

    if-eqz v0, :cond_2

    .line 172
    array-length v2, v0

    if-lez v2, :cond_2

    .line 173
    array-length v2, v0

    move v3, v1

    :goto_0
    if-ge v3, v2, :cond_2

    aget-object v4, v0, v3

    .line 175
    invoke-virtual {v4}, Landroid/net/NetworkInfo;->getState()Landroid/net/NetworkInfo$State;

    move-result-object v4

    sget-object v5, Landroid/net/NetworkInfo$State;->CONNECTED:Landroid/net/NetworkInfo$State;

    if-ne v4, v5, :cond_1

    const/4 v0, 0x1

    return v0

    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    return v1
.end method

.method private loadConfig()V
    .locals 4

    const-string v0, "aria_config.xml"

    .line 230
    :try_start_0
    new-instance v1, Lcom/arialyy/aria/core/config/XMLReader;

    invoke-direct {v1}, Lcom/arialyy/aria/core/config/XMLReader;-><init>()V

    .line 231
    invoke-static {}, Ljavax/xml/parsers/SAXParserFactory;->newInstance()Ljavax/xml/parsers/SAXParserFactory;

    move-result-object v2

    .line 232
    invoke-virtual {v2}, Ljavax/xml/parsers/SAXParserFactory;->newSAXParser()Ljavax/xml/parsers/SAXParser;

    move-result-object v2

    .line 233
    sget-object v3, Lcom/arialyy/aria/core/AriaConfig;->APP:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v3

    invoke-virtual {v3, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v3

    invoke-virtual {v2, v3, v1}, Ljavax/xml/parsers/SAXParser;->parse(Ljava/io/InputStream;Lorg/xml/sax/helpers/DefaultHandler;)V

    .line 234
    sget-object v1, Lcom/arialyy/aria/core/AriaConfig;->APP:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v2, Lcom/arialyy/aria/core/AriaConfig;->APP:Landroid/content/Context;

    .line 235
    invoke-virtual {v2}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v2}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "/Aria/aria_config.xml"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 234
    invoke-static {v0, v1}, Lcom/arialyy/aria/util/FileUtil;->createFileFormInputStream(Ljava/io/InputStream;Ljava/lang/String;)V
    :try_end_0
    .catch Ljavax/xml/parsers/ParserConfigurationException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lorg/xml/sax/SAXException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    goto :goto_0

    :catch_1
    move-exception v0

    goto :goto_0

    :catch_2
    move-exception v0

    .line 237
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Exception;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "AriaConfig"

    invoke-static {v1, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_1
    return-void
.end method

.method private regNetCallBack(Landroid/content/Context;)V
    .locals 3

    .line 124
    invoke-direct {p0}, Lcom/arialyy/aria/core/AriaConfig;->isNetworkAvailable()Z

    move-result v0

    sput-boolean v0, Lcom/arialyy/aria/core/AriaConfig;->isConnectedNet:Z

    .line 125
    invoke-virtual {p0}, Lcom/arialyy/aria/core/AriaConfig;->getAConfig()Lcom/arialyy/aria/core/config/AppConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/AppConfig;->isNetCheck()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 128
    :cond_0
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_1

    return-void

    :cond_1
    const-string v0, "connectivity"

    .line 132
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/net/ConnectivityManager;

    if-nez p1, :cond_2

    return-void

    .line 137
    :cond_2
    new-instance v0, Landroid/net/NetworkRequest$Builder;

    invoke-direct {v0}, Landroid/net/NetworkRequest$Builder;-><init>()V

    const/16 v2, 0xc

    .line 138
    invoke-virtual {v0, v2}, Landroid/net/NetworkRequest$Builder;->addCapability(I)Landroid/net/NetworkRequest$Builder;

    move-result-object v0

    const/4 v2, 0x1

    .line 139
    invoke-virtual {v0, v2}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    move-result-object v0

    const/4 v2, 0x0

    .line 140
    invoke-virtual {v0, v2}, Landroid/net/NetworkRequest$Builder;->addTransportType(I)Landroid/net/NetworkRequest$Builder;

    move-result-object v0

    .line 141
    invoke-virtual {v0}, Landroid/net/NetworkRequest$Builder;->build()Landroid/net/NetworkRequest;

    move-result-object v0

    .line 142
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v1, :cond_3

    .line 143
    new-instance v1, Lcom/arialyy/aria/core/AriaConfig$1;

    invoke-direct {v1, p0}, Lcom/arialyy/aria/core/AriaConfig$1;-><init>(Lcom/arialyy/aria/core/AriaConfig;)V

    invoke-virtual {p1, v0, v1}, Landroid/net/ConnectivityManager;->registerNetworkCallback(Landroid/net/NetworkRequest;Landroid/net/ConnectivityManager$NetworkCallback;)V

    :cond_3
    return-void
.end method


# virtual methods
.method public getAConfig()Lcom/arialyy/aria/core/config/AppConfig;
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaConfig;->mAConfig:Lcom/arialyy/aria/core/config/AppConfig;

    return-object v0
.end method

.method public getAPP()Landroid/content/Context;
    .locals 1

    .line 89
    sget-object v0, Lcom/arialyy/aria/core/AriaConfig;->APP:Landroid/content/Context;

    return-object v0
.end method

.method public declared-synchronized getAriaHandler()Landroid/os/Handler;
    .locals 2

    monitor-enter p0

    .line 114
    :try_start_0
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaConfig;->mAriaHandler:Landroid/os/Handler;

    if-nez v0, :cond_0

    .line 115
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Lcom/arialyy/aria/core/AriaConfig;->mAriaHandler:Landroid/os/Handler;

    .line 117
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaConfig;->mAriaHandler:Landroid/os/Handler;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getDConfig()Lcom/arialyy/aria/core/config/DownloadConfig;
    .locals 1

    .line 98
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaConfig;->mDConfig:Lcom/arialyy/aria/core/config/DownloadConfig;

    return-object v0
.end method

.method public getDGConfig()Lcom/arialyy/aria/core/config/DGroupConfig;
    .locals 1

    .line 110
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaConfig;->mDGConfig:Lcom/arialyy/aria/core/config/DGroupConfig;

    return-object v0
.end method

.method public getUConfig()Lcom/arialyy/aria/core/config/UploadConfig;
    .locals 1

    .line 102
    iget-object v0, p0, Lcom/arialyy/aria/core/AriaConfig;->mUConfig:Lcom/arialyy/aria/core/config/UploadConfig;

    return-object v0
.end method

.method public isConnectedNet()Z
    .locals 1

    .line 186
    sget-boolean v0, Lcom/arialyy/aria/core/AriaConfig;->isConnectedNet:Z

    return v0
.end method
