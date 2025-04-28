.class Lcom/etralab/appstoreforandroid/MineFragment$6;
.super Ljava/lang/Thread;
.source "MineFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/MineFragment;->CheckForUpdatesByVersionCode()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/MineFragment;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/MineFragment;)V
    .locals 0

    .line 114
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/MineFragment$6;->this$0:Lcom/etralab/appstoreforandroid/MineFragment;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 120
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/php/check_update_activity/get_latest_version_data.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 123
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 127
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 129
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 132
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    .line 135
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    const/16 v1, 0x400

    new-array v1, v1, [B

    .line 138
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 141
    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-le v3, v4, :cond_0

    const/4 v4, 0x0

    .line 146
    invoke-virtual {v2, v1, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 149
    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V

    .line 152
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/MineFragment$6;->this$0:Lcom/etralab/appstoreforandroid/MineFragment;

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v2

    iput-wide v2, v1, Lcom/etralab/appstoreforandroid/MineFragment;->latestVersionCode:J

    .line 153
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MineFragment$6;->this$0:Lcom/etralab/appstoreforandroid/MineFragment;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/MineFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/MineFragment;->getAppVersionCode(Landroid/content/Context;)J

    move-result-wide v1

    iput-wide v1, v0, Lcom/etralab/appstoreforandroid/MineFragment;->currentVersionCode:J
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v0

    .line 156
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_1
    :goto_1
    return-void
.end method
