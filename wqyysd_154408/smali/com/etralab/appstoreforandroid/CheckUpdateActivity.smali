.class public Lcom/etralab/appstoreforandroid/CheckUpdateActivity;
.super Landroid/app/Activity;
.source "CheckUpdateActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 27
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private CheckForUpdatesByVersionCode()V
    .locals 1

    .line 58
    new-instance v0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;-><init>(Lcom/etralab/appstoreforandroid/CheckUpdateActivity;)V

    .line 176
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->start()V

    return-void
.end method

.method private ClickToBackLastActivity()V
    .locals 2

    const v0, 0x7f080127

    .line 203
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 204
    new-instance v1, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$3;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$3;-><init>(Lcom/etralab/appstoreforandroid/CheckUpdateActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private UpdateCheckUpdateActivityTotalPv()V
    .locals 2

    .line 251
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/pv/check_update_activity/pv.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 254
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 258
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 260
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 263
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 266
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/CheckUpdateActivity;)V
    .locals 0

    .line 27
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->CheckForUpdatesByVersionCode()V

    return-void
.end method

.method static synthetic access$100(Lcom/etralab/appstoreforandroid/CheckUpdateActivity;)V
    .locals 0

    .line 27
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->UpdateCheckUpdateActivityTotalPv()V

    return-void
.end method

.method public static getAppVersionCode(Landroid/content/Context;)J
    .locals 2

    .line 218
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 219
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 220
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    .line 221
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 222
    invoke-virtual {p0}, Landroid/content/pm/PackageInfo;->getLongVersionCode()J

    move-result-wide v0

    goto :goto_0

    .line 224
    :cond_0
    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    int-to-long v0, p0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 227
    invoke-virtual {p0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object p0

    const-string v0, ""

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method

.method public static getAppVersionName(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 238
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 239
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 240
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    .line 241
    iget-object p0, p0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const-string p0, ""

    :goto_0
    return-object p0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 31
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 34
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->requestWindowFeature(I)Z

    .line 36
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->setLayout()V

    .line 39
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->ClickToBackLastActivity()V

    .line 42
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x80

    invoke-virtual {p1, v0, v0}, Landroid/view/Window;->setFlags(II)V

    .line 45
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->CheckForUpdatesByVersionCode()V

    const p1, 0x7f080069

    .line 48
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 49
    new-instance v0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$1;-><init>(Lcom/etralab/appstoreforandroid/CheckUpdateActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method setLayout()V
    .locals 4

    .line 182
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "CircleLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 183
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "SquareLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 184
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    const v3, 0x7f0b001f

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 185
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->setContentView(I)V

    .line 186
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 187
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->startActivity(Landroid/content/Intent;)V

    .line 188
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->finish()V

    goto :goto_0

    .line 189
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 190
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->setContentView(I)V

    goto :goto_0

    .line 191
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0b0020

    .line 192
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->setContentView(I)V

    goto :goto_0

    .line 194
    :cond_2
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->setContentView(I)V

    .line 195
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 196
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->startActivity(Landroid/content/Intent;)V

    .line 197
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->finish()V

    :goto_0
    return-void
.end method
