.class public Lcom/etralab/appstoreforandroid/SearchResultActivity;
.super Landroid/app/Activity;
.source "SearchResultActivity.java"


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

    .line 40
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 43
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity;->appList:Ljava/util/List;

    const/4 v0, 0x0

    .line 45
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity;->isPrepareData:Z

    return-void
.end method

.method private ClickToBackLastActivity()V
    .locals 2

    const v0, 0x7f080127

    .line 292
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 293
    new-instance v1, Lcom/etralab/appstoreforandroid/SearchResultActivity$4;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity$4;-><init>(Lcom/etralab/appstoreforandroid/SearchResultActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private ShowAppsData()V
    .locals 2

    const v0, 0x7f0801bd

    .line 79
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x1

    .line 82
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    const/4 v1, 0x0

    .line 83
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 85
    new-instance v1, Lcom/etralab/appstoreforandroid/SearchResultActivity$2;

    invoke-direct {v1, p0, v0}, Lcom/etralab/appstoreforandroid/SearchResultActivity$2;-><init>(Lcom/etralab/appstoreforandroid/SearchResultActivity;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 147
    invoke-virtual {v1}, Lcom/etralab/appstoreforandroid/SearchResultActivity$2;->start()V

    return-void
.end method

.method private UpdateSearchResultActivityTotalPv()V
    .locals 2

    .line 250
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/pv/search_result_activity/pv.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 253
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 257
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x1770

    .line 259
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 262
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 265
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :goto_0
    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/SearchResultActivity;)Ljava/util/List;
    .locals 0

    .line 40
    iget-object p0, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity;->appList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/etralab/appstoreforandroid/SearchResultActivity;)Ljava/lang/String;
    .locals 0

    .line 40
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->getJson()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/etralab/appstoreforandroid/SearchResultActivity;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->UpdateSearchResultActivityTotalPv()V

    return-void
.end method

.method static synthetic access$300(Lcom/etralab/appstoreforandroid/SearchResultActivity;)V
    .locals 0

    .line 40
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->ShowAppsData()V

    return-void
.end method

.method private getJson()Ljava/lang/String;
    .locals 8

    .line 210
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "searchText"

    .line 211
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const/4 v2, 0x0

    .line 213
    :try_start_0
    new-instance v3, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v3}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 214
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v4

    const-string v5, "http.connection.timeout"

    const/16 v6, 0x1388

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-interface {v4, v5, v7}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 215
    invoke-interface {v3}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v4

    const-string v5, "http.socket.timeout"

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v4, v5, v6}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    const-string v4, "http://106.53.152.67/etralab_appstore_android/php/search_result_activity/get_apps_data.php"

    .line 217
    new-instance v5, Lorg/apache/http/client/methods/HttpPost;

    invoke-direct {v5, v4}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 218
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 219
    new-instance v6, Lorg/apache/http/message/BasicNameValuePair;

    invoke-direct {v6, v1, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v4, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    .line 221
    :try_start_1
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v1, "UTF-8"

    invoke-direct {v0, v4, v1}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v5, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 222
    invoke-interface {v3, v5}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 223
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    const/16 v3, 0xc8

    if-ne v1, v3, :cond_1

    .line 225
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 227
    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    .line 228
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 229
    :goto_0
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 230
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 233
    :cond_0
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 237
    :try_start_2
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    :cond_1
    return-object v2

    :catch_1
    move-exception v0

    .line 241
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    return-object v2
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 49
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 51
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->requestWindowFeature(I)Z

    .line 53
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->setLayout()V

    .line 56
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->ClickToBackLastActivity()V

    .line 59
    new-instance p1, Lcom/etralab/appstoreforandroid/SearchResultActivity$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity$1;-><init>(Lcom/etralab/appstoreforandroid/SearchResultActivity;)V

    .line 70
    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/SearchResultActivity$1;->start()V

    .line 73
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->parseByJSONObject()V

    return-void
.end method

.method public parseByJSONObject()V
    .locals 1

    .line 151
    new-instance v0, Lcom/etralab/appstoreforandroid/SearchResultActivity$3;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity$3;-><init>(Lcom/etralab/appstoreforandroid/SearchResultActivity;)V

    .line 204
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/SearchResultActivity$3;->start()V

    return-void
.end method

.method setLayout()V
    .locals 4

    .line 271
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "CircleLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 272
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "SquareLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 273
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    const v3, 0x7f0b003b

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 274
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->setContentView(I)V

    .line 275
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 276
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->startActivity(Landroid/content/Intent;)V

    .line 277
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->finish()V

    goto :goto_0

    .line 278
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 279
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->setContentView(I)V

    goto :goto_0

    .line 280
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0b003c

    .line 281
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->setContentView(I)V

    goto :goto_0

    .line 283
    :cond_2
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->setContentView(I)V

    .line 284
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 285
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->startActivity(Landroid/content/Intent;)V

    .line 286
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->finish()V

    :goto_0
    return-void
.end method
