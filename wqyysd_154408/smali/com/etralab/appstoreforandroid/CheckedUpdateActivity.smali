.class public Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;
.super Landroid/app/Activity;
.source "CheckedUpdateActivity.java"


# instance fields
.field apkDownloadFailedNum:I

.field app_download_url:Ljava/lang/String;

.field app_name_en:Ljava/lang/String;

.field app_pkg_name:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 48
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    .line 50
    iput v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->apkDownloadFailedNum:I

    return-void
.end method

.method private ClickToBackLastActivity()V
    .locals 2

    const v0, 0x7f080127

    .line 483
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 484
    new-instance v1, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$9;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$9;-><init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private ReloadUpdateInformation()V
    .locals 9

    const v0, 0x7f0800e5

    .line 282
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f080242

    .line 283
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/widget/TextView;

    const v1, 0x7f0800e4

    .line 285
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Landroid/widget/ImageView;

    const v1, 0x7f08026c

    .line 286
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/TextView;

    const v1, 0x7f080069

    .line 287
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/Button;

    .line 289
    new-instance v8, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$6;

    move-object v1, v8

    move-object v2, p0

    move-object v4, v0

    invoke-direct/range {v1 .. v7}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$6;-><init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/Button;)V

    invoke-virtual {p0, v8}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    if-eqz v0, :cond_0

    .line 303
    invoke-virtual {v0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 306
    :cond_0
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->parseByJSONObject()V

    return-void
.end method

.method private ShowUpdateInformation()V
    .locals 4

    const v0, 0x7f08014d

    .line 259
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const v1, 0x7f0801f5

    .line 260
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ScrollView;

    const v2, 0x7f0800e5

    .line 261
    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    if-eqz v2, :cond_0

    .line 264
    invoke-virtual {v2}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v3

    check-cast v3, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/AnimationDrawable;->isRunning()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 265
    invoke-virtual {v2}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    check-cast v2, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    .line 268
    :cond_0
    new-instance v2, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$5;

    invoke-direct {v2, p0, v0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$5;-><init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;Landroid/widget/LinearLayout;Landroid/widget/ScrollView;)V

    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private UpdateAppDownloadNum()V
    .locals 2

    .line 417
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/php/checked_update_activity/update_app_download_num.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 420
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 424
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 426
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 429
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 432
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method private UpdateCheckedUpdateActivityTotalPv()V
    .locals 2

    .line 440
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/pv/checked_update_activity/pv.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 443
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 447
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 449
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 452
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 455
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->ReloadUpdateInformation()V

    return-void
.end method

.method static synthetic access$100(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->UpdateAppDownloadNum()V

    return-void
.end method

.method static synthetic access$200(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->UpdateCheckedUpdateActivityTotalPv()V

    return-void
.end method

.method static synthetic access$300(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)Ljava/lang/String;
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->getJson()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$400(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V
    .locals 0

    .line 48
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->ShowUpdateInformation()V

    return-void
.end method

.method private getJson()Ljava/lang/String;
    .locals 6

    .line 222
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "appId"

    .line 223
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 225
    new-instance v2, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v2}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 226
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const/16 v4, 0x1388

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "http.connection.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 227
    invoke-interface {v2}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v3

    const-string v5, "http.socket.timeout"

    invoke-interface {v3, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 229
    new-instance v3, Lorg/apache/http/client/methods/HttpPost;

    const-string v4, "http://106.53.152.67/etralab_appstore_android/php/checked_update_activity/get_update_data.php"

    invoke-direct {v3, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 230
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 231
    new-instance v5, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v5, v1, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 234
    :try_start_0
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v1, "UTF-8"

    invoke-direct {v0, v4, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v3, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 235
    invoke-interface {v2, v3}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 236
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    .line 238
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 240
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    .line 241
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 242
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 244
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 247
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 252
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method public InstallUpdateWithPackageInstaller(Landroid/content/Context;Ljava/lang/String;)V
    .locals 5

    .line 385
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 386
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p2

    if-nez p2, :cond_0

    return-void

    .line 389
    :cond_0
    new-instance p2, Landroid/content/Intent;

    const-string v1, "android.intent.action.VIEW"

    invoke-direct {p2, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 390
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x18

    const/high16 v3, 0x10000000

    const-string v4, "application/vnd.android.package-archive"

    if-lt v1, v2, :cond_1

    .line 391
    invoke-virtual {p2, v3}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const/4 v1, 0x1

    .line 393
    invoke-virtual {p2, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    const-string v1, "com.etralab.appstoreforandroid.FileProvider"

    .line 394
    invoke-static {p1, v1, v0}, Landroidx/core/content/FileProvider;->getUriForFile(Landroid/content/Context;Ljava/lang/String;Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    .line 395
    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_0

    .line 397
    :cond_1
    invoke-static {v0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p2, v0, v4}, Landroid/content/Intent;->setDataAndType(Landroid/net/Uri;Ljava/lang/String;)Landroid/content/Intent;

    .line 398
    invoke-virtual {p2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    .line 400
    :goto_0
    invoke-virtual {p1, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method public InstallUpdateWithWlanAdb(Ljava/lang/String;)V
    .locals 2

    .line 408
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "apkPath"

    .line 409
    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 410
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 58
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 61
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->requestWindowFeature(I)Z

    .line 63
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->setLayout()V

    .line 66
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->ClickToBackLastActivity()V

    .line 69
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x80

    invoke-virtual {p1, v0, v0}, Landroid/view/Window;->setFlags(II)V

    .line 71
    invoke-static {p0}, Lcom/arialyy/aria/core/Aria;->download(Ljava/lang/Object;)Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object p1

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadReceiver;->register()V

    .line 73
    new-instance p1, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$1;-><init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V

    .line 84
    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$1;->start()V

    .line 87
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->parseByJSONObject()V

    const p1, 0x7f080069

    .line 90
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 91
    new-instance v0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$2;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$2;-><init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f08006a

    .line 98
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 100
    new-instance v0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$3;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$3;-><init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 140
    invoke-static {p0}, Lcom/arialyy/aria/core/Aria;->download(Ljava/lang/Object;)Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DownloadReceiver;->stopAllTask()V

    .line 141
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method

.method public parseByJSONObject()V
    .locals 1

    .line 145
    new-instance v0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;-><init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V

    .line 216
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$4;->start()V

    return-void
.end method

.method protected running(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 8

    const v0, 0x7f08026b

    .line 332
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    const v1, 0x7f08023e

    .line 333
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/TextView;

    const v1, 0x7f08023d

    .line 334
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/TextView;

    .line 337
    invoke-virtual {v0}, Landroid/widget/TextView;->getWidth()I

    move-result v5

    .line 339
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->getPercent()I

    move-result v6

    .line 340
    new-instance p1, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$7;

    move-object v2, p1

    move-object v3, p0

    invoke-direct/range {v2 .. v7}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$7;-><init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;Landroid/widget/TextView;IILandroid/widget/TextView;)V

    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method setLayout()V
    .locals 4

    .line 462
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "CircleLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 463
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "SquareLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 464
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    const v3, 0x7f0b0021

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 465
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->setContentView(I)V

    .line 466
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 467
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->startActivity(Landroid/content/Intent;)V

    .line 468
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->finish()V

    goto :goto_0

    .line 469
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 470
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->setContentView(I)V

    goto :goto_0

    .line 471
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0b0022

    .line 472
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->setContentView(I)V

    goto :goto_0

    .line 474
    :cond_2
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->setContentView(I)V

    .line 475
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 476
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->startActivity(Landroid/content/Intent;)V

    .line 477
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->finish()V

    :goto_0
    return-void
.end method

.method taskComplete(Lcom/arialyy/aria/core/task/DownloadTask;)V
    .locals 3

    const p1, 0x7f0800b6

    .line 350
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    const v0, 0x7f0800b7

    .line 351
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 354
    new-instance v1, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$8;

    invoke-direct {v1, p0, p1, v0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$8;-><init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;)V

    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 364
    new-instance p1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "UsePackageInstaller.txt"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 365
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "UseWlanAdb.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 366
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 367
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 368
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->startActivity(Landroid/content/Intent;)V

    .line 369
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->finish()V

    goto :goto_0

    .line 370
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result p1

    const-string v1, ".apk"

    const-string v2, "/"

    if-eqz p1, :cond_1

    .line 371
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->app_name_en:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p0, p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->InstallUpdateWithPackageInstaller(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 372
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_2

    .line 373
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->app_name_en:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->InstallUpdateWithWlanAdb(Ljava/lang/String;)V

    goto :goto_0

    .line 375
    :cond_2
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 376
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->startActivity(Landroid/content/Intent;)V

    .line 377
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->finish()V

    :goto_0
    return-void
.end method

.method taskFail(Lcom/arialyy/aria/core/task/DownloadTask;Ljava/lang/Exception;)V
    .locals 2

    .line 313
    invoke-static {p2}, Lcom/arialyy/aria/util/ALog;->getExceptionString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "TAG"

    invoke-static {v0, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 316
    iget p2, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->apkDownloadFailedNum:I

    const/4 v0, 0x3

    if-gt p2, v0, :cond_0

    const/4 v0, 0x1

    add-int/2addr p2, v0

    .line 317
    iput p2, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->apkDownloadFailedNum:I

    if-eqz p1, :cond_0

    .line 320
    invoke-virtual {p1}, Lcom/arialyy/aria/core/task/DownloadTask;->cancel()V

    .line 322
    invoke-static {p0}, Lcom/arialyy/aria/core/Aria;->download(Ljava/lang/Object;)Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object p1

    iget-object p2, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->app_download_url:Ljava/lang/String;

    .line 323
    invoke-virtual {p1, p2}, Lcom/arialyy/aria/core/download/DownloadReceiver;->load(Ljava/lang/String;)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;

    move-result-object p1

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    .line 324
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v1

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->app_name_en:Ljava/lang/String;

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".apk"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2, v0}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->setFilePath(Ljava/lang/String;Z)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;

    move-result-object p1

    .line 325
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->create()J

    :cond_0
    return-void
.end method
