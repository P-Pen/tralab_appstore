.class public Lcom/etralab/appstoreforandroid/ScreenshotActivity;
.super Landroid/app/Activity;
.source "ScreenshotActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;,
        Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;
    }
.end annotation


# instance fields
.field appScreenshotUrlIndex:I

.field appScreenshotUrlList:[Ljava/lang/String;

.field viewList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 30
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private UpdateScreenshotActivityTotalPv()V
    .locals 2

    .line 177
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/pv/screenshot_activity/pv.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 180
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 184
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 186
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 189
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 192
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/ScreenshotActivity;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->UpdateScreenshotActivityTotalPv()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 5

    .line 39
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 41
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->requestWindowFeature(I)Z

    const p1, 0x7f0b0039

    .line 42
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->setContentView(I)V

    .line 45
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    const-string v0, "appScreenshotUrlList"

    .line 46
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringArrayExtra(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->appScreenshotUrlList:[Ljava/lang/String;

    const-string v0, "appScreenshotUrlIndex"

    const/4 v1, 0x0

    .line 47
    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result p1

    iput p1, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->appScreenshotUrlIndex:I

    .line 48
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object p1

    .line 50
    iget v0, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->appScreenshotUrlIndex:I

    if-eqz v0, :cond_0

    .line 51
    new-instance v0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$1;-><init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity;)V

    .line 58
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$1;->start()V

    :cond_0
    const v0, 0x7f08027a

    .line 61
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/viewpager2/widget/ViewPager2;

    .line 63
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iput-object v2, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->viewList:Ljava/util/ArrayList;

    move v2, v1

    .line 64
    :goto_0
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->appScreenshotUrlList:[Ljava/lang/String;

    array-length v3, v3

    const/4 v4, 0x0

    if-ge v2, v3, :cond_1

    const v3, 0x7f0b0061

    .line 66
    invoke-virtual {p1, v3, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v3

    .line 67
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->viewList:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 70
    :cond_1
    invoke-virtual {v0, v1}, Landroidx/viewpager2/widget/ViewPager2;->setOrientation(I)V

    .line 71
    new-instance p1, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;

    invoke-direct {p1, p0, v4}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;-><init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity;Lcom/etralab/appstoreforandroid/ScreenshotActivity$1;)V

    .line 72
    invoke-virtual {v0, p1}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 73
    iget p1, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->appScreenshotUrlIndex:I

    invoke-virtual {v0, p1, v1}, Landroidx/viewpager2/widget/ViewPager2;->setCurrentItem(IZ)V

    .line 75
    new-instance p1, Lcom/etralab/appstoreforandroid/ScreenshotActivity$2;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$2;-><init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity;)V

    invoke-virtual {v0, p1}, Landroidx/viewpager2/widget/ViewPager2;->registerOnPageChangeCallback(Landroidx/viewpager2/widget/ViewPager2$OnPageChangeCallback;)V

    const p1, 0x7f08015a

    .line 91
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 92
    new-instance v0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$3;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$3;-><init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
