.class public Lcom/etralab/appstoreforandroid/DeveloperAppActivity;
.super Landroid/app/Activity;
.source "DeveloperAppActivity.java"


# instance fields
.field private final appList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/etralab/appstoreforandroid/App;",
            ">;"
        }
    .end annotation
.end field

.field isPrepareData:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 42
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 45
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->appList:Ljava/util/List;

    const/4 v0, 0x0

    .line 47
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->isPrepareData:Z

    return-void
.end method

.method private ClickToBackLastActivity()V
    .locals 2

    const v0, 0x7f080127

    .line 295
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 296
    new-instance v1, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$7;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$7;-><init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private ShowAppsData()V
    .locals 2

    const v0, 0x7f0801b9

    .line 92
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x1

    .line 95
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    const/4 v1, 0x0

    .line 96
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 98
    new-instance v1, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    invoke-direct {v1, p0, v0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;-><init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 160
    invoke-virtual {v1}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->start()V

    return-void
.end method

.method private UpdateDeveloperAppActivityTotalPv()V
    .locals 2

    .line 308
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/pv/developer_app_activity/pv.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 311
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 315
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 317
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 320
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 323
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)V
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->UpdateDeveloperAppActivityTotalPv()V

    return-void
.end method

.method static synthetic access$100(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)Ljava/util/List;
    .locals 0

    .line 42
    iget-object p0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->appList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$200(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)Ljava/lang/String;
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->getJson()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$300(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)V
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->ShowAppsData()V

    return-void
.end method

.method private getJson()Ljava/lang/String;
    .locals 6

    .line 208
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "appDeveloperName"

    .line 209
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 211
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 212
    invoke-interface {v1}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    const/16 v3, 0x1388

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "http.connection.timeout"

    invoke-interface {v2, v4, v3}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 213
    invoke-interface {v1}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    const-string v4, "http.socket.timeout"

    invoke-interface {v2, v4, v3}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 215
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    const-string v3, "http://106.53.152.67/etralab_appstore_android/php/developer_app_activity/get_developer_apps_data.php"

    invoke-direct {v2, v3}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 216
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 217
    new-instance v4, Lorg/apache/http/message/BasicNameValuePair;

    const-string v5, "developerName"

    invoke-direct {v4, v5, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 220
    :try_start_0
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v4, "UTF-8"

    invoke-direct {v0, v3, v4}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 221
    invoke-interface {v1, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 222
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_1

    .line 224
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 226
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    .line 227
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 228
    :goto_0
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 230
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :cond_0
    const-string v0, "TAG"

    .line 233
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 234
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 239
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    const/4 v0, 0x0

    return-object v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    const/4 v0, 0x1

    .line 52
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->requestWindowFeature(I)Z

    .line 53
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 55
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->setLayout()V

    .line 58
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->ClickToBackLastActivity()V

    .line 61
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->setTitle()V

    .line 63
    new-instance p1, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$1;-><init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)V

    .line 70
    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$1;->start()V

    .line 72
    new-instance p1, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$2;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$2;-><init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)V

    .line 83
    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$2;->start()V

    .line 86
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->parseByJSONObject()V

    return-void
.end method

.method public parseByJSONObject()V
    .locals 1

    .line 164
    new-instance v0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$4;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$4;-><init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)V

    .line 202
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$4;->start()V

    return-void
.end method

.method setLayout()V
    .locals 4

    .line 274
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "CircleLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 275
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "SquareLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 276
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    const v3, 0x7f0b002a

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 277
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->setContentView(I)V

    .line 278
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 279
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->startActivity(Landroid/content/Intent;)V

    .line 280
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->finish()V

    goto :goto_0

    .line 281
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 282
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->setContentView(I)V

    goto :goto_0

    .line 283
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0b002b

    .line 284
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->setContentView(I)V

    goto :goto_0

    .line 286
    :cond_2
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->setContentView(I)V

    .line 287
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 288
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->startActivity(Landroid/content/Intent;)V

    .line 289
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->finish()V

    :goto_0
    return-void
.end method

.method setTitle()V
    .locals 4

    .line 246
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "appDeveloperName"

    .line 247
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f08026e

    .line 249
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f080191

    .line 250
    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/etralab/appstoreforandroid/MarqueeTextView;

    if-eqz v1, :cond_0

    .line 253
    new-instance v3, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$5;

    invoke-direct {v3, p0, v1, v0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$5;-><init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;Landroid/widget/TextView;Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    if-eqz v2, :cond_1

    .line 262
    new-instance v1, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$6;

    invoke-direct {v1, p0, v2, v0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$6;-><init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;Lcom/etralab/appstoreforandroid/MarqueeTextView;Ljava/lang/String;)V

    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_1
    return-void
.end method
