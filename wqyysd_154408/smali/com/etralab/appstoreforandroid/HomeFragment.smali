.class public Lcom/etralab/appstoreforandroid/HomeFragment;
.super Landroidx/fragment/app/Fragment;
.source "HomeFragment.java"


# instance fields
.field private final bannerList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/etralab/appstoreforandroid/BannerDataBean;",
            ">;"
        }
    .end annotation
.end field

.field bn_banner:Lcom/youth/banner/Banner;

.field private final downloadRankingAppsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/etralab/appstoreforandroid/App;",
            ">;"
        }
    .end annotation
.end field

.field isPrepareData:Z

.field isShowData:Z

.field iv_loading_anim:Landroid/widget/ImageView;

.field private final newArrivalAppsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/etralab/appstoreforandroid/App;",
            ">;"
        }
    .end annotation
.end field

.field private final recommendationAppsList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/etralab/appstoreforandroid/App;",
            ">;"
        }
    .end annotation
.end field

.field rv_download_ranking:Landroidx/recyclerview/widget/RecyclerView;

.field rv_new_arrival:Landroidx/recyclerview/widget/RecyclerView;

.field rv_recommendation:Landroidx/recyclerview/widget/RecyclerView;

.field view:Landroid/view/View;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 49
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    const/4 v0, 0x0

    .line 50
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->isPrepareData:Z

    .line 51
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->isShowData:Z

    .line 56
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->bannerList:Ljava/util/List;

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->newArrivalAppsList:Ljava/util/List;

    .line 68
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->recommendationAppsList:Ljava/util/List;

    .line 69
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->downloadRankingAppsList:Ljava/util/List;

    return-void
.end method

.method private ShowAppsData()V
    .locals 1

    .line 122
    new-instance v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/HomeFragment$1;-><init>(Lcom/etralab/appstoreforandroid/HomeFragment;)V

    .line 266
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/HomeFragment$1;->start()V

    return-void
.end method

.method private UpdateHomeFragmentTotalPv()V
    .locals 2

    .line 590
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/pv/home_fragment/pv.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 593
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 597
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 599
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 602
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 605
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->newArrivalAppsList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->recommendationAppsList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->downloadRankingAppsList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$300(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/lang/String;
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getBannerImgUrlJson()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;
    .locals 0

    .line 49
    iget-object p0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->bannerList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$500(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/lang/String;
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getNewArrivalAppsJson()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$600(Lcom/etralab/appstoreforandroid/HomeFragment;)V
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/HomeFragment;->UpdateHomeFragmentTotalPv()V

    return-void
.end method

.method static synthetic access$700(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/lang/String;
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getRecommendationAppsJson()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$800(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/lang/String;
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getDownloadRankingAppsJson()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$900(Lcom/etralab/appstoreforandroid/HomeFragment;)V
    .locals 0

    .line 49
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/HomeFragment;->ShowAppsData()V

    return-void
.end method

.method private getBannerImgUrlJson()Ljava/lang/String;
    .locals 5

    .line 421
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/php/home_fragment/get_notice_data.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 424
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 428
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 430
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 433
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    .line 436
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    const/16 v1, 0x400

    new-array v1, v1, [B

    .line 439
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 442
    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-le v3, v4, :cond_0

    const/4 v4, 0x0

    .line 447
    invoke-virtual {v2, v1, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 450
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

    .line 454
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private getDownloadRankingAppsJson()Ljava/lang/String;
    .locals 5

    .line 548
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/php/home_fragment/get_download_ranking_apps_data.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 551
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 555
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 557
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 560
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    .line 563
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    const/16 v1, 0x400

    new-array v1, v1, [B

    .line 566
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 569
    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-le v3, v4, :cond_0

    const/4 v4, 0x0

    .line 574
    invoke-virtual {v2, v1, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 577
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

    .line 581
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private getNewArrivalAppsJson()Ljava/lang/String;
    .locals 5

    .line 463
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/php/home_fragment/get_new_arrival_apps_data.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 466
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 470
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 472
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 475
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    .line 478
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    const/16 v1, 0x400

    new-array v1, v1, [B

    .line 481
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 484
    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-le v3, v4, :cond_0

    const/4 v4, 0x0

    .line 489
    invoke-virtual {v2, v1, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 492
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

    .line 496
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method

.method private getRecommendationAppsJson()Ljava/lang/String;
    .locals 5

    .line 505
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/php/home_fragment/get_recommendation_apps_data.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 508
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 512
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 514
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 517
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    .line 520
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    const/16 v1, 0x400

    new-array v1, v1, [B

    .line 523
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 526
    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v3

    const/4 v4, -0x1

    if-le v3, v4, :cond_0

    const/4 v4, 0x0

    .line 531
    invoke-virtual {v2, v1, v4, v3}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 534
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

    .line 538
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public initBanner()V
    .locals 5

    .line 611
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f08005f

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/youth/banner/Banner;

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->bn_banner:Lcom/youth/banner/Banner;

    .line 612
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f080233

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 613
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    const v2, 0x7f0800b5

    invoke-virtual {v1, v2}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    .line 615
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->bn_banner:Lcom/youth/banner/Banner;

    new-instance v3, Lcom/etralab/appstoreforandroid/HomeFragment$4;

    iget-object v4, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->bannerList:Ljava/util/List;

    invoke-direct {v3, p0, v4}, Lcom/etralab/appstoreforandroid/HomeFragment$4;-><init>(Lcom/etralab/appstoreforandroid/HomeFragment;Ljava/util/List;)V

    invoke-virtual {v2, v3}, Lcom/youth/banner/Banner;->setAdapter(Lcom/youth/banner/adapter/BannerAdapter;)Lcom/youth/banner/Banner;

    move-result-object v2

    .line 633
    invoke-virtual {v2, p0}, Lcom/youth/banner/Banner;->addBannerLifecycleObserver(Landroidx/lifecycle/LifecycleOwner;)Lcom/youth/banner/Banner;

    move-result-object v2

    new-instance v3, Lcom/etralab/appstoreforandroid/HomeFragment$3;

    invoke-direct {v3, p0, v1, v0}, Lcom/etralab/appstoreforandroid/HomeFragment$3;-><init>(Lcom/etralab/appstoreforandroid/HomeFragment;Landroid/widget/FrameLayout;Landroid/widget/TextView;)V

    .line 634
    invoke-virtual {v2, v3}, Lcom/youth/banner/Banner;->addOnPageChangeListener(Lcom/youth/banner/listener/OnPageChangeListener;)Lcom/youth/banner/Banner;

    .line 663
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->bn_banner:Lcom/youth/banner/Banner;

    new-instance v2, Lcom/etralab/appstoreforandroid/HomeFragment$5;

    invoke-direct {v2, p0}, Lcom/etralab/appstoreforandroid/HomeFragment$5;-><init>(Lcom/etralab/appstoreforandroid/HomeFragment;)V

    invoke-virtual {v1, v2}, Lcom/youth/banner/Banner;->setOnBannerListener(Lcom/youth/banner/listener/OnBannerListener;)Lcom/youth/banner/Banner;

    .line 674
    :try_start_0
    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->bn_banner:Lcom/youth/banner/Banner;

    invoke-virtual {v2}, Lcom/youth/banner/Banner;->getRealCount()I

    move-result v2

    div-int/2addr v0, v2

    add-int/lit8 v0, v0, 0x1

    iput v0, v1, Landroid/view/ViewGroup$LayoutParams;->width:I
    :try_end_0
    .catch Ljava/lang/ArithmeticException; {:try_start_0 .. :try_end_0} :catch_0

    .line 679
    :catch_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->bn_banner:Lcom/youth/banner/Banner;

    invoke-virtual {v0}, Lcom/youth/banner/Banner;->start()Lcom/youth/banner/Banner;

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 73
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    .line 76
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/HomeFragment;->parseByJSONObject()V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    .line 82
    new-instance p3, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "CircleLayout.txt"

    invoke-direct {p3, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 83
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "SquareLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 84
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result p3

    const v1, 0x7f0b005a

    const/4 v2, 0x0

    if-eqz p3, :cond_0

    .line 85
    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->view:Landroid/view/View;

    goto :goto_0

    .line 86
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p3

    if-eqz p3, :cond_1

    const p3, 0x7f0b005b

    .line 87
    invoke-virtual {p1, p3, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->view:Landroid/view/View;

    goto :goto_0

    .line 89
    :cond_1
    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->view:Landroid/view/View;

    .line 93
    :goto_0
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->view:Landroid/view/View;

    const p2, 0x7f0801bb

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_new_arrival:Landroidx/recyclerview/widget/RecyclerView;

    .line 94
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->view:Landroid/view/View;

    const p2, 0x7f0801ba

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_download_ranking:Landroidx/recyclerview/widget/RecyclerView;

    .line 95
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->view:Landroid/view/View;

    const p2, 0x7f0801bc

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_recommendation:Landroidx/recyclerview/widget/RecyclerView;

    .line 97
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->view:Landroid/view/View;

    const p2, 0x7f0800e5

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->iv_loading_anim:Landroid/widget/ImageView;

    if-eqz p1, :cond_2

    .line 102
    invoke-virtual {p1}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 105
    :cond_2
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->view:Landroid/view/View;

    return-object p1
.end method

.method public onResume()V
    .locals 1

    .line 114
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 115
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->isPrepareData:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment;->isShowData:Z

    if-nez v0, :cond_0

    .line 117
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/HomeFragment;->ShowAppsData()V

    :cond_0
    return-void
.end method

.method public parseByJSONObject()V
    .locals 1

    .line 270
    new-instance v0, Lcom/etralab/appstoreforandroid/HomeFragment$2;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/HomeFragment$2;-><init>(Lcom/etralab/appstoreforandroid/HomeFragment;)V

    .line 413
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/HomeFragment$2;->start()V

    return-void
.end method
