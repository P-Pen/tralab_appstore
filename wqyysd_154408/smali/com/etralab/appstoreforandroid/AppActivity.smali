.class public Lcom/etralab/appstoreforandroid/AppActivity;
.super Landroid/app/Activity;
.source "AppActivity.java"


# instance fields
.field apkDownloadFailedNum:I

.field appScreenshotUrlList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field app_developer:Ljava/lang/String;

.field app_download_number:Ljava/lang/String;

.field app_download_url:Ljava/lang/String;

.field app_like_number:Ljava/lang/String;

.field app_name_en:Ljava/lang/String;

.field app_pkg_name:Ljava/lang/String;

.field app_screen_shot_0:Ljava/lang/String;

.field app_screen_shot_1:Ljava/lang/String;

.field app_screen_shot_2:Ljava/lang/String;

.field app_screen_shot_3:Ljava/lang/String;

.field app_screen_shot_4:Ljava/lang/String;

.field app_screen_shot_5:Ljava/lang/String;

.field app_screen_shot_6:Ljava/lang/String;

.field app_screen_shot_7:Ljava/lang/String;

.field app_version_code:Ljava/lang/String;

.field isAppDownloading:Z

.field isLikeApp:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 61
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    .line 63
    iput v0, p0, Lcom/etralab/appstoreforandroid/AppActivity;->apkDownloadFailedNum:I

    .line 75
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity;->appScreenshotUrlList:Ljava/util/List;

    .line 77
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/AppActivity;->isAppDownloading:Z

    .line 79
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/AppActivity;->isLikeApp:Z

    return-void
.end method

.method private CheckAppInstalled(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 3

    const/4 v0, 0x0

    if-eqz p2, :cond_3

    .line 312
    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    .line 315
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    .line 316
    invoke-virtual {p1, v0}, Landroid/content/pm/PackageManager;->getInstalledPackages(I)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_3

    .line 317
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1

    goto :goto_1

    :cond_1
    move v1, v0

    .line 319
    :goto_0
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v2

    if-ge v1, v2, :cond_3

    .line 320
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/PackageInfo;

    iget-object v2, v2, Landroid/content/pm/PackageInfo;->packageName:Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const/4 p1, 0x1

    return p1

    :cond_2
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    :goto_1
    return v0
.end method

.method private ClickToBackLastActivity()V
    .locals 2

    const v0, 0x7f080127

    .line 1080
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 1081
    new-instance v1, Lcom/etralab/appstoreforandroid/AppActivity$22;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/AppActivity$22;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private DownloadApp()V
    .locals 1

    .line 1259
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_download_url:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 1260
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$27;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$27;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    .line 1326
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/AppActivity$27;->start()V

    :cond_0
    return-void
.end method

.method private OpenUninstallAppOnClick()V
    .locals 3

    const v0, 0x7f080154

    .line 1137
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const v1, 0x7f080164

    .line 1138
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 1140
    new-instance v2, Lcom/etralab/appstoreforandroid/AppActivity$23;

    invoke-direct {v2, p0}, Lcom/etralab/appstoreforandroid/AppActivity$23;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1155
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$24;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$24;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private ReloadAppInformation()V
    .locals 9

    const v0, 0x7f0800e5

    .line 818
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f080242

    .line 819
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/widget/TextView;

    const v1, 0x7f0800e4

    .line 821
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/ImageView;

    const v1, 0x7f08026c

    .line 822
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/TextView;

    const v1, 0x7f080069

    .line 823
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/Button;

    .line 825
    new-instance v8, Lcom/etralab/appstoreforandroid/AppActivity$11;

    move-object v1, v8

    move-object v2, p0

    move-object v4, v0

    invoke-direct/range {v1 .. v7}, Lcom/etralab/appstoreforandroid/AppActivity$11;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/Button;)V

    invoke-virtual {p0, v8}, Lcom/etralab/appstoreforandroid/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    if-eqz v0, :cond_0

    .line 839
    invoke-virtual {v0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 842
    :cond_0
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->parseByJSONObject()V

    return-void
.end method

.method private ScreenshotImageViewOnClick()V
    .locals 9

    const v0, 0x7f080108

    .line 979
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f080109

    .line 980
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const v2, 0x7f08010a

    .line 981
    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const v3, 0x7f08010b

    .line 982
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    const v4, 0x7f08010c

    .line 983
    invoke-virtual {p0, v4}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    const v5, 0x7f08010d

    .line 984
    invoke-virtual {p0, v5}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/ImageView;

    const v6, 0x7f08010e

    .line 985
    invoke-virtual {p0, v6}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/ImageView;

    const v7, 0x7f08010f

    .line 986
    invoke-virtual {p0, v7}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/ImageView;

    .line 989
    new-instance v8, Lcom/etralab/appstoreforandroid/AppActivity$14;

    invoke-direct {v8, p0}, Lcom/etralab/appstoreforandroid/AppActivity$14;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {v0, v8}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1000
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$15;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$15;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1011
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$16;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$16;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {v2, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1022
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$17;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$17;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1033
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$18;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$18;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {v4, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1044
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$19;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$19;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {v5, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1055
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$20;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$20;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {v6, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1066
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$21;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$21;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {v7, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private ShowAppInformation()V
    .locals 4

    const v0, 0x7f08014b

    .line 765
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const v1, 0x7f0801f5

    .line 766
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ScrollView;

    const v2, 0x7f0800e5

    .line 767
    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_0

    .line 770
    invoke-virtual {v2}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/AnimationDrawable;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 771
    invoke-virtual {v2}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 775
    :cond_0
    new-instance v2, Lcom/etralab/appstoreforandroid/AppActivity$10;

    invoke-direct {v2, p0, v0, v1}, Lcom/etralab/appstoreforandroid/AppActivity$10;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;Landroid/widget/LinearLayout;Landroid/widget/ScrollView;)V

    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private SubAppLikeNum()V
    .locals 6

    .line 743
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "appId"

    .line 744
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 746
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 747
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const/16 v4, 0x1388

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "http.connection.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 748
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v5, "http.socket.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 750
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    const-string v4, "http://106.53.152.67/etralab_appstore_android/php/app_activity/sub_app_like_num.php"

    invoke-direct {v3, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 751
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 752
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v5, v1, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 755
    :try_start_0
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v1, "UTF-8"

    invoke-direct {v0, v4, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 756
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 759
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private UpdateAppActivityTotalPv()V
    .locals 2

    .line 1094
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/pv/app_activity/pv.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1097
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 1101
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 1103
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 1106
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 1109
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private UpdateAppDownloadNum()V
    .locals 6

    .line 697
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "appId"

    .line 698
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 700
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 701
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const/16 v4, 0x1388

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "http.connection.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 702
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v5, "http.socket.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 704
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    const-string v4, "http://106.53.152.67/etralab_appstore_android/php/app_activity/update_app_download_num.php"

    invoke-direct {v3, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 705
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 706
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v5, v1, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 709
    :try_start_0
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v1, "UTF-8"

    invoke-direct {v0, v4, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 710
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 713
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private UpdateAppLikeNum()V
    .locals 6

    .line 720
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "appId"

    .line 721
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 723
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 724
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const/16 v4, 0x1388

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "http.connection.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 725
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v5, "http.socket.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 727
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    const-string v4, "http://106.53.152.67/etralab_appstore_android/php/app_activity/update_app_like_num.php"

    invoke-direct {v3, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 728
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 729
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v5, v1, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 732
    :try_start_0
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v1, "UTF-8"

    invoke-direct {v0, v4, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 733
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 736
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private UpdateDownloadAppTotalPv()V
    .locals 2

    .line 1117
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/pv/download_app/pv.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 1120
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 1124
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 1126
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 1129
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 1132
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private UpdateUninstallAppOnClick()V
    .locals 3

    const v0, 0x7f080167

    .line 1174
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const v1, 0x7f080165

    .line 1175
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 1177
    new-instance v2, Lcom/etralab/appstoreforandroid/AppActivity$25;

    invoke-direct {v2, p0}, Lcom/etralab/appstoreforandroid/AppActivity$25;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1185
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$26;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$26;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->ReloadAppInformation()V

    return-void
.end method

.method static synthetic access$100(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->UpdateAppLikeNum()V

    return-void
.end method

.method static synthetic access$1000(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->UpdateDownloadAppTotalPv()V

    return-void
.end method

.method static synthetic access$1100(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->UpdateAppDownloadNum()V

    return-void
.end method

.method static synthetic access$200(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->SubAppLikeNum()V

    return-void
.end method

.method static synthetic access$300(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->DownloadApp()V

    return-void
.end method

.method static synthetic access$400(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->UpdateUninstallAppOnClick()V

    return-void
.end method

.method static synthetic access$500(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->OpenUninstallAppOnClick()V

    return-void
.end method

.method static synthetic access$600(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->UpdateAppActivityTotalPv()V

    return-void
.end method

.method static synthetic access$700(Lcom/etralab/appstoreforandroid/AppActivity;)Ljava/lang/String;
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->getJson()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$800(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->ShowAppInformation()V

    return-void
.end method

.method static synthetic access$900(Lcom/etralab/appstoreforandroid/AppActivity;Landroid/content/Context;Ljava/lang/String;)Z
    .locals 0

    .line 61
    invoke-direct {p0, p1, p2}, Lcom/etralab/appstoreforandroid/AppActivity;->CheckAppInstalled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private getJson()Ljava/lang/String;
    .locals 6

    .line 621
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "appId"

    .line 622
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 624
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 625
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const/16 v4, 0x1388

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "http.connection.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 626
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v5, "http.socket.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 628
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    const-string v4, "http://106.53.152.67/etralab_appstore_android/php/app_activity/get_app_data.php"

    invoke-direct {v3, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 629
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 630
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v5, v1, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 633
    :try_start_0
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v1, "UTF-8"

    invoke-direct {v0, v4, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 634
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 635
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    .line 637
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 639
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    .line 640
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 641
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 643
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 646
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 651
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public InstallAppWithPackageInstaller(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5

    .line 929
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 930
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p2

    if-nez p2, :cond_0

    return-void

    .line 933
    :cond_0
    new-instance p2, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {p2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 934
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    const/high16 v3, 0x10000000

    const-string v4, "application/vnd.android.package-archive"

    if-lt v1, v2, :cond_1

    .line 935
    invoke-virtual {p2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/4 v1, 0x1

    .line 937
    invoke-virtual {p2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v1, "com.etralab.appstoreforandroid.FileProvider"

    .line 938
    invoke-static {p1, v1, v0}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 939
    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 941
    :cond_1
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 942
    invoke-virtual {p2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 944
    :goto_0
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public InstallAppWithWlanAdb(Ljava/lang/String;)V
    .locals 2

    .line 952
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "apkPath"

    .line 953
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 954
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public getAppVersionCode(Landroid/content/Context;)I
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 1251
    :cond_0
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p1

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_pkg_name:Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p1

    .line 1252
    iget p1, p1, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    return p1

    :catch_0
    return v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    const/4 v0, 0x1

    .line 84
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->requestWindowFeature(I)Z

    .line 85
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 87
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->setLayout()V

    .line 90
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x80

    invoke-virtual {p1, v0, v0}, Landroid/view/Window;->setFlags(II)V

    .line 93
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->ClickToBackLastActivity()V

    .line 95
    invoke-static {p0}, Lcom/arialyy/aria/core/Aria;->download(Ljava/lang/Object;)Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadReceiver;->register()V

    .line 97
    new-instance p1, Lcom/etralab/appstoreforandroid/AppActivity$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/AppActivity$1;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    .line 108
    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/AppActivity$1;->start()V

    .line 111
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->parseByJSONObject()V

    const p1, 0x7f080069

    .line 114
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 115
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$2;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$2;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f080223

    .line 123
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 124
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$3;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$3;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f080149

    .line 140
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 141
    new-instance v0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;

    new-instance v1, Lcom/etralab/appstoreforandroid/AppActivity$4;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/AppActivity$4;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-direct {v0, v1}, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;-><init>(Lcom/etralab/appstoreforandroid/OnDoubleClickListener$DoubleClickCallback;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 182
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->ScreenshotImageViewOnClick()V

    const p1, 0x7f080140

    .line 184
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 185
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$5;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$5;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f080123

    .line 198
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 199
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$6;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$6;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f080135

    .line 246
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 248
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$7;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$7;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 307
    invoke-static {p0}, Lcom/arialyy/aria/core/Aria;->download(Ljava/lang/Object;)Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadReceiver;->stopAllTask()V

    .line 308
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method protected onResume()V
    .locals 4

    const v0, 0x7f0800b7

    .line 260
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    const v1, 0x7f080145

    .line 261
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    const v2, 0x7f080166

    .line 262
    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/LinearLayout;

    .line 265
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_pkg_name:Ljava/lang/String;

    invoke-direct {p0, p0, v3}, Lcom/etralab/appstoreforandroid/AppActivity;->CheckAppInstalled(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 266
    iget-boolean v3, p0, Lcom/etralab/appstoreforandroid/AppActivity;->isAppDownloading:Z

    if-nez v3, :cond_0

    .line 267
    new-instance v3, Lcom/etralab/appstoreforandroid/AppActivity$8;

    invoke-direct {v3, p0, v0, v2, v1}, Lcom/etralab/appstoreforandroid/AppActivity$8;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V

    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 301
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    return-void
.end method

.method public parseByJSONObject()V
    .locals 1

    .line 328
    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$9;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$9;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;)V

    .line 615
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/AppActivity$9;->start()V

    return-void
.end method

.method protected running(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 8

    const/4 v0, 0x1

    .line 868
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/AppActivity;->isAppDownloading:Z

    const v0, 0x7f08026b

    .line 870
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f08023e

    .line 871
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/TextView;

    const v1, 0x7f08023d

    .line 872
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/TextView;

    .line 875
    invoke-virtual {v0}, Landroid/widget/TextView;->getWidth()I

    move-result v5

    .line 877
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->getPercent()I

    move-result v6

    .line 878
    new-instance p1, Lcom/etralab/appstoreforandroid/AppActivity$12;

    move-object v2, p1

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Lcom/etralab/appstoreforandroid/AppActivity$12;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;Landroid/widget/TextView;IILandroid/widget/TextView;)V

    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method public setDownloadServerData()V
    .locals 5

    .line 1205
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    if-eqz v0, :cond_3

    const-string v1, ""

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_3

    const/4 v0, 0x1

    .line 1207
    invoke-static {}, Ljava/lang/Math;->random()D

    move-result-wide v1

    const/16 v3, 0x270f

    int-to-double v3, v3

    mul-double/2addr v1, v3

    int-to-double v3, v0

    add-double/2addr v1, v3

    double-to-int v0, v1

    const/4 v1, 0x0

    const-string v2, "AppDownloadData"

    .line 1210
    invoke-virtual {p0, v2, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 1211
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3

    const/16 v2, 0x9c4

    if-gt v0, v2, :cond_0

    .line 1215
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1217
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    const-string v2, "1"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1219
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0

    :cond_0
    const/16 v2, 0x1388

    if-gt v0, v2, :cond_1

    .line 1222
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1224
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    const-string v2, "2"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1226
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0

    :cond_1
    const/16 v2, 0x1d4c

    if-gt v0, v2, :cond_2

    .line 1229
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1231
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    const-string v2, "3"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1233
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0

    .line 1236
    :cond_2
    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 1238
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    const-string v2, "4"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 1240
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_3
    :goto_0
    return-void
.end method

.method setLayout()V
    .locals 4

    .line 960
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "CircleLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 961
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "SquareLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 962
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 963
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 964
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->startActivity(Landroid/content/Intent;)V

    .line 965
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->finish()V

    goto :goto_0

    .line 966
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    const v0, 0x7f0b001d

    .line 967
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->setContentView(I)V

    goto :goto_0

    .line 968
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0b001e

    .line 969
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->setContentView(I)V

    goto :goto_0

    .line 971
    :cond_2
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 972
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->startActivity(Landroid/content/Intent;)V

    .line 973
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->finish()V

    :goto_0
    return-void
.end method

.method taskComplete(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 3

    const/4 p1, 0x0

    .line 888
    iput-boolean p1, p0, Lcom/etralab/appstoreforandroid/AppActivity;->isAppDownloading:Z

    const p1, 0x7f0800b6

    .line 890
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    const v0, 0x7f0800b7

    .line 891
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    const v1, 0x7f080145

    .line 892
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    const v1, 0x7f080154

    .line 894
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    const v1, 0x7f080164

    .line 895
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    .line 898
    new-instance v1, Lcom/etralab/appstoreforandroid/AppActivity$13;

    invoke-direct {v1, p0, p1, v0}, Lcom/etralab/appstoreforandroid/AppActivity$13;-><init>(Lcom/etralab/appstoreforandroid/AppActivity;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;)V

    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 908
    new-instance p1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "UsePackageInstaller.txt"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 909
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "UseWlanAdb.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 910
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 911
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 912
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->startActivity(Landroid/content/Intent;)V

    .line 913
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->finish()V

    goto :goto_0

    .line 914
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    const-string v1, ".apk"

    const-string v2, "/"

    if-eqz p1, :cond_1

    .line 915
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->InstallAppWithPackageInstaller(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 916
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 917
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->InstallAppWithWlanAdb(Ljava/lang/String;)V

    goto :goto_0

    .line 919
    :cond_2
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 920
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AppActivity;->startActivity(Landroid/content/Intent;)V

    .line 921
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->finish()V

    :goto_0
    return-void
.end method

.method taskFail(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;)V
    .locals 2

    .line 849
    invoke-static {p2}, Lcom/arialyy/aria/util/ALog;->getExceptionString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "TAG"

    invoke-static {v0, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 852
    iget p2, p0, Lcom/etralab/appstoreforandroid/AppActivity;->apkDownloadFailedNum:I

    const/4 v0, 0x3

    if-gt p2, v0, :cond_0

    const/4 v0, 0x1

    add-int/2addr p2, v0

    .line 853
    iput p2, p0, Lcom/etralab/appstoreforandroid/AppActivity;->apkDownloadFailedNum:I

    if-eqz p1, :cond_0

    .line 856
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->cancel()V

    .line 858
    invoke-static {p0}, Lcom/arialyy/aria/core/Aria;->download(Ljava/lang/Object;)Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object p1

    iget-object p2, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_download_url:Ljava/lang/String;

    .line 859
    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/download/DownloadReceiver;->load(Ljava/lang/String;)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 860
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/AppActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".apk"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2, v0}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->setFilePath(Ljava/lang/String;Z)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;

    move-result-object p1

    .line 861
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->create()J

    :cond_0
    return-void
.end method
