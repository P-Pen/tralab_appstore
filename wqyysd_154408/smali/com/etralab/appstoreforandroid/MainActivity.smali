.class public Lcom/etralab/appstoreforandroid/MainActivity;
.super Landroidx/fragment/app/FragmentActivity;
.source "MainActivity.java"


# static fields
.field public static instance:Lcom/etralab/appstoreforandroid/MainActivity;


# instance fields
.field dots:Landroid/widget/LinearLayout;

.field isPostedDeviceInfo:Z

.field isVersionCheckJsonDownload:Z

.field list:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/fragment/app/Fragment;",
            ">;"
        }
    .end annotation
.end field

.field versionCheck:I

.field viewPager:Landroidx/viewpager2/widget/ViewPager2;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 43
    invoke-direct {p0}, Landroidx/fragment/app/FragmentActivity;-><init>()V

    const/4 v0, 0x0

    .line 45
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/MainActivity;->isVersionCheckJsonDownload:Z

    .line 47
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/MainActivity;->isPostedDeviceInfo:Z

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity;->list:Ljava/util/List;

    return-void
.end method

.method private PostDeviceInfo()V
    .locals 17

    .line 362
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static/range {p0 .. p0}, Lcom/etralab/appstoreforandroid/DeviceIdUtil;->getDeviceUUID(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 363
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v3, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 364
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 365
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v5, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 366
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v6, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 367
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    .line 368
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v8, Landroid/os/Build;->ID:Ljava/lang/String;

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    .line 369
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static/range {p0 .. p0}, Lcom/etralab/appstoreforandroid/DeviceIdUtil;->getIMEI(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v0, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 370
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static/range {p0 .. p0}, Lcom/etralab/appstoreforandroid/DeviceIdUtil;->getAndroidId(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 371
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/etralab/appstoreforandroid/DeviceIdUtil;->getSERIAL()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    .line 372
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/etralab/appstoreforandroid/DeviceIdUtil;->getDeviceID()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v0, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    .line 376
    :try_start_0
    invoke-virtual/range {p0 .. p0}, Lcom/etralab/appstoreforandroid/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 377
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 378
    invoke-virtual/range {p0 .. p0}, Lcom/etralab/appstoreforandroid/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v0, v14, v13}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 379
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, v0, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-virtual {v14, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    move-object v14, v0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 381
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v14, v0

    check-cast v14, Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    move-object v14, v1

    .line 386
    :goto_0
    :try_start_1
    invoke-virtual/range {p0 .. p0}, Lcom/etralab/appstoreforandroid/MainActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 387
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 388
    invoke-virtual/range {p0 .. p0}, Lcom/etralab/appstoreforandroid/MainActivity;->getPackageName()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v0, v15, v13}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v0

    .line 389
    sget v13, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v15, 0x1c

    if-lt v13, v15, :cond_0

    .line 390
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_2

    move-object/from16 v16, v14

    :try_start_2
    invoke-virtual {v0}, Landroid/content/pm/PackageInfo;->getLongVersionCode()J

    move-result-wide v14

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_1

    :cond_0
    move-object/from16 v16, v14

    .line 392
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    iget v0, v0, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-virtual {v13, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_2
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_2 .. :try_end_2} :catch_1

    :goto_1
    move-object v1, v0

    goto :goto_3

    :catch_1
    move-exception v0

    goto :goto_2

    :catch_2
    move-exception v0

    move-object/from16 v16, v14

    .line 395
    :goto_2
    invoke-virtual {v0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object v13, v0

    check-cast v13, Ljava/lang/String;

    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :goto_3
    const-string v0, "deviceModel = "

    .line 401
    invoke-static {v0, v4}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 415
    :try_start_3
    new-instance v0, Lokhttp3/FormBody$Builder;

    invoke-direct {v0}, Lokhttp3/FormBody$Builder;-><init>()V

    const-string v13, "deviceUUID"

    .line 416
    invoke-virtual {v0, v13, v2}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v0

    const-string v2, "deviceBrand"

    .line 417
    invoke-virtual {v0, v2, v3}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v0

    const-string v2, "deviceModel"

    .line 418
    invoke-virtual {v0, v2, v4}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v0

    const-string v2, "deviceProduct"

    .line 419
    invoke-virtual {v0, v2, v5}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v0

    const-string v2, "deviceAndroidVerName"

    .line 420
    invoke-virtual {v0, v2, v6}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v0

    const-string v2, "deviceAndroidVerCode"

    .line 421
    invoke-virtual {v0, v2, v7}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v0

    const-string v2, "deviceOSVer"

    .line 422
    invoke-virtual {v0, v2, v8}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v0

    const-string v2, "deviceIMEI"

    .line 423
    invoke-virtual {v0, v2, v9}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v0

    const-string v2, "deviceAndroidId"

    .line 424
    invoke-virtual {v0, v2, v10}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v0

    const-string v2, "deviceSerial"

    .line 425
    invoke-virtual {v0, v2, v11}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v0

    const-string v2, "deviceID"

    .line 426
    invoke-virtual {v0, v2, v12}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v0

    const-string v2, "appVerName"

    move-object/from16 v3, v16

    .line 427
    invoke-virtual {v0, v2, v3}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v0

    const-string v2, "appVerCode"

    .line 428
    invoke-virtual {v0, v2, v1}, Lokhttp3/FormBody$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lokhttp3/FormBody$Builder;

    move-result-object v0

    .line 429
    invoke-virtual {v0}, Lokhttp3/FormBody$Builder;->build()Lokhttp3/FormBody;

    move-result-object v0

    .line 431
    new-instance v1, Lokhttp3/OkHttpClient;

    invoke-direct {v1}, Lokhttp3/OkHttpClient;-><init>()V

    .line 432
    new-instance v2, Lokhttp3/Request$Builder;

    invoke-direct {v2}, Lokhttp3/Request$Builder;-><init>()V

    const-string v3, "http://106.53.152.67/etralab_appstore_android/php/uuid/post_device_info.php"

    .line 433
    invoke-virtual {v2, v3}, Lokhttp3/Request$Builder;->url(Ljava/lang/String;)Lokhttp3/Request$Builder;

    move-result-object v2

    .line 434
    invoke-virtual {v2, v0}, Lokhttp3/Request$Builder;->post(Lokhttp3/RequestBody;)Lokhttp3/Request$Builder;

    move-result-object v0

    .line 435
    invoke-virtual {v0}, Lokhttp3/Request$Builder;->build()Lokhttp3/Request;

    move-result-object v0

    .line 436
    invoke-virtual {v1, v0}, Lokhttp3/OkHttpClient;->newCall(Lokhttp3/Request;)Lokhttp3/Call;

    move-result-object v0

    .line 437
    new-instance v1, Lcom/etralab/appstoreforandroid/MainActivity$5;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_4

    move-object/from16 v2, p0

    :try_start_4
    invoke-direct {v1, v2}, Lcom/etralab/appstoreforandroid/MainActivity$5;-><init>(Lcom/etralab/appstoreforandroid/MainActivity;)V

    invoke-interface {v0, v1}, Lokhttp3/Call;->enqueue(Lokhttp3/Callback;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    goto :goto_5

    :catch_3
    move-exception v0

    goto :goto_4

    :catch_4
    move-exception v0

    move-object/from16 v2, p0

    .line 451
    :goto_4
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_5
    return-void
.end method

.method private VersionCheck()V
    .locals 2

    .line 348
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/MainActivity;->isVersionCheckJsonDownload:Z

    if-eqz v0, :cond_0

    iget v0, p0, Lcom/etralab/appstoreforandroid/MainActivity;->versionCheck:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 349
    new-instance v0, Lcom/etralab/appstoreforandroid/MainActivity$4;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/MainActivity$4;-><init>(Lcom/etralab/appstoreforandroid/MainActivity;)V

    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/MainActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 356
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 357
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/MainActivity;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/MainActivity;)Ljava/lang/String;
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->getVersionCheckJson()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$100(Lcom/etralab/appstoreforandroid/MainActivity;)V
    .locals 0

    .line 43
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->VersionCheck()V

    return-void
.end method

.method private getVersionCheckJson()Ljava/lang/String;
    .locals 5

    .line 310
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/json/version_check.json"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 313
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 317
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 319
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 322
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    .line 325
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    const/16 v1, 0x400

    new-array v1, v1, [B

    .line 328
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 331
    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-le v3, v4, :cond_0

    const/4 v4, 0x0

    .line 336
    invoke-virtual {v2, v1, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 338
    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 341
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public InitViewPager()V
    .locals 4

    const v0, 0x7f080277

    .line 216
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/viewpager2/widget/ViewPager2;

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity;->viewPager:Landroidx/viewpager2/widget/ViewPager2;

    .line 219
    new-instance v0, Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-direct {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;-><init>()V

    .line 220
    new-instance v1, Lcom/etralab/appstoreforandroid/ClassificationFragment;

    invoke-direct {v1}, Lcom/etralab/appstoreforandroid/ClassificationFragment;-><init>()V

    .line 221
    new-instance v2, Lcom/etralab/appstoreforandroid/RankingFragment;

    invoke-direct {v2}, Lcom/etralab/appstoreforandroid/RankingFragment;-><init>()V

    .line 222
    new-instance v2, Lcom/etralab/appstoreforandroid/MineFragment;

    invoke-direct {v2}, Lcom/etralab/appstoreforandroid/MineFragment;-><init>()V

    .line 234
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/MainActivity;->list:Ljava/util/List;

    invoke-interface {v3, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 235
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity;->list:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 236
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity;->list:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 239
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity;->viewPager:Landroidx/viewpager2/widget/ViewPager2;

    new-instance v1, Lcom/etralab/appstoreforandroid/MainActivity$1;

    invoke-direct {v1, p0, p0}, Lcom/etralab/appstoreforandroid/MainActivity$1;-><init>(Lcom/etralab/appstoreforandroid/MainActivity;Landroidx/fragment/app/FragmentActivity;)V

    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method public SetDots()V
    .locals 2

    const v0, 0x7f08009a

    .line 255
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/MainActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity;->dots:Landroid/widget/LinearLayout;

    .line 257
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity;->viewPager:Landroidx/viewpager2/widget/ViewPager2;

    new-instance v1, Lcom/etralab/appstoreforandroid/MainActivity$2;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/MainActivity$2;-><init>(Lcom/etralab/appstoreforandroid/MainActivity;)V

    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->registerOnPageChangeCallback(Landroidx/viewpager2/widget/ViewPager2$OnPageChangeCallback;)V

    return-void
.end method

.method public isChooseApkInstallMethod()V
    .locals 4

    .line 174
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "UsePackageInstaller.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 175
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "UseWlanAdb.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 176
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 180
    :try_start_0
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 182
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 184
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 185
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 186
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/MainActivity;->startActivity(Landroid/content/Intent;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public isChooseLayout()V
    .locals 4

    .line 161
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "SquareLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 162
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "CircleLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 163
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-nez v2, :cond_0

    .line 164
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 165
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/MainActivity;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 166
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 167
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 168
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/MainActivity;->startActivity(Landroid/content/Intent;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public isNameChangeHintAgree()V
    .locals 3

    .line 132
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "isNameChangeHintAgree"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 133
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 135
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/NameChangeHintActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 136
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/MainActivity;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method public isUserAgreementAgree()V
    .locals 3

    .line 203
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "isUserAgreementAgree4"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 204
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 206
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/UserAgreementActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 207
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 210
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->finish()V

    :cond_0
    return-void
.end method

.method public isWarmHintAgree()V
    .locals 3

    .line 151
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "isWarmHintAgree.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 152
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 154
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/WarmHintActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 155
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/MainActivity;->startActivity(Landroid/content/Intent;)V

    :cond_0
    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 63
    invoke-super {p0, p1}, Landroidx/fragment/app/FragmentActivity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 65
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/MainActivity;->requestWindowFeature(I)Z

    const p1, 0x7f0b0033

    .line 66
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/MainActivity;->setContentView(I)V

    .line 69
    sput-object p0, Lcom/etralab/appstoreforandroid/MainActivity;->instance:Lcom/etralab/appstoreforandroid/MainActivity;

    .line 78
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->isChooseLayout()V

    .line 81
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->isChooseApkInstallMethod()V

    .line 87
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->isWarmHintAgree()V

    .line 90
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->isUserAgreementAgree()V

    .line 93
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/etralab/appstoreforandroid/PermissionActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 94
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/MainActivity;->startActivity(Landroid/content/Intent;)V

    .line 97
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->InitViewPager()V

    .line 100
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->SetDots()V

    .line 103
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->parseVersionCheckJsonByJSONObject()V

    .line 106
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x80

    invoke-virtual {p1, v0, v0}, Landroid/view/Window;->setFlags(II)V

    return-void
.end method

.method protected onDestroy()V
    .locals 0

    .line 122
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onDestroy()V

    return-void
.end method

.method protected onResume()V
    .locals 1

    .line 111
    invoke-super {p0}, Landroidx/fragment/app/FragmentActivity;->onResume()V

    .line 114
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/MainActivity;->isPostedDeviceInfo:Z

    if-nez v0, :cond_0

    .line 115
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/MainActivity;->PostDeviceInfo()V

    const/4 v0, 0x1

    .line 116
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/MainActivity;->isPostedDeviceInfo:Z

    :cond_0
    return-void
.end method

.method public parseVersionCheckJsonByJSONObject()V
    .locals 1

    .line 281
    new-instance v0, Lcom/etralab/appstoreforandroid/MainActivity$3;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/MainActivity$3;-><init>(Lcom/etralab/appstoreforandroid/MainActivity;)V

    .line 302
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/MainActivity$3;->start()V

    return-void
.end method
