.class public Lcom/etralab/appstoreforandroid/ClassificationActivity;
.super Landroid/app/Activity;
.source "ClassificationActivity.java"


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

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity;->appList:Ljava/util/List;

    const/4 v0, 0x0

    .line 47
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity;->isPrepareData:Z

    return-void
.end method

.method private ClickToBackLastActivity()V
    .locals 2

    const v0, 0x7f080127

    .line 442
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 443
    new-instance v1, Lcom/etralab/appstoreforandroid/ClassificationActivity$5;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity$5;-><init>(Lcom/etralab/appstoreforandroid/ClassificationActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private ShowAppsData()V
    .locals 2

    const v0, 0x7f0801b1

    .line 84
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x1

    .line 87
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    const/4 v1, 0x0

    .line 88
    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 90
    new-instance v1, Lcom/etralab/appstoreforandroid/ClassificationActivity$2;

    invoke-direct {v1, p0, v0}, Lcom/etralab/appstoreforandroid/ClassificationActivity$2;-><init>(Lcom/etralab/appstoreforandroid/ClassificationActivity;Landroidx/recyclerview/widget/RecyclerView;)V

    .line 152
    invoke-virtual {v1}, Lcom/etralab/appstoreforandroid/ClassificationActivity$2;->start()V

    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/ClassificationActivity;)Ljava/util/List;
    .locals 0

    .line 42
    iget-object p0, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity;->appList:Ljava/util/List;

    return-object p0
.end method

.method static synthetic access$100(Lcom/etralab/appstoreforandroid/ClassificationActivity;)Ljava/lang/String;
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->getJson()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic access$200(Lcom/etralab/appstoreforandroid/ClassificationActivity;)V
    .locals 0

    .line 42
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->ShowAppsData()V

    return-void
.end method

.method private getJson()Ljava/lang/String;
    .locals 9

    .line 203
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "appClassificationEn"

    .line 204
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Ranking"

    .line 206
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    const/4 v3, -0x1

    const/16 v4, 0x400

    const/16 v5, 0x1770

    const-string v6, "GET"

    const/16 v7, 0xc8

    const/4 v8, 0x0

    if-eqz v1, :cond_2

    .line 210
    :try_start_0
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/php/classification_activity/get_download_ranking_apps_data.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 213
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 217
    invoke-virtual {v0, v6}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 219
    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 222
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    if-ne v1, v7, :cond_1

    .line 225
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    new-array v1, v4, [B

    .line 228
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 231
    :goto_0
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5

    if-le v5, v3, :cond_0

    .line 236
    invoke-virtual {v4, v1, v2, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 239
    :cond_0
    new-instance v0, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception v0

    .line 243
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_1
    return-object v8

    :cond_2
    const-string v1, "NewArrival"

    .line 246
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_5

    .line 250
    :try_start_1
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/php/classification_activity/get_new_apps_data.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 253
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 257
    invoke-virtual {v0, v6}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 259
    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 262
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    if-ne v1, v7, :cond_4

    .line 265
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    new-array v1, v4, [B

    .line 268
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 271
    :goto_1
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5

    if-le v5, v3, :cond_3

    .line 276
    invoke-virtual {v4, v1, v2, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 279
    :cond_3
    new-instance v0, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    return-object v0

    :catch_1
    move-exception v0

    .line 283
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_4
    return-object v8

    :cond_5
    const-string v1, "Hot"

    .line 286
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_8

    .line 290
    :try_start_2
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/php/classification_activity/get_hot_apps_data.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 293
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 297
    invoke-virtual {v0, v6}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 299
    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 302
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    if-ne v1, v7, :cond_7

    .line 305
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    new-array v1, v4, [B

    .line 308
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 311
    :goto_2
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5

    if-le v5, v3, :cond_6

    .line 316
    invoke-virtual {v4, v1, v2, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_2

    .line 319
    :cond_6
    new-instance v0, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    return-object v0

    :catch_2
    move-exception v0

    .line 323
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_7
    return-object v8

    :cond_8
    const-string v1, "HankMiSection"

    .line 326
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_b

    .line 330
    :try_start_3
    new-instance v0, Ljava/net/URL;

    const-string v1, "http://106.53.152.67/etralab_appstore_android/php/classification_activity/get_hankmi_apps_data.php"

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 333
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 337
    invoke-virtual {v0, v6}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 339
    invoke-virtual {v0, v5}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 342
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    if-ne v1, v7, :cond_a

    .line 345
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    new-array v1, v4, [B

    .line 348
    new-instance v4, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v4}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 351
    :goto_3
    invoke-virtual {v0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5

    if-le v5, v3, :cond_9

    .line 356
    invoke-virtual {v4, v1, v2, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_3

    .line 359
    :cond_9
    new-instance v0, Ljava/lang/String;

    invoke-virtual {v4}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/String;-><init>([B)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    return-object v0

    :catch_3
    move-exception v0

    .line 363
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_a
    return-object v8

    .line 368
    :cond_b
    new-instance v1, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v1}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    .line 369
    invoke-interface {v1}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    const/16 v3, 0x1388

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const-string v5, "http.connection.timeout"

    invoke-interface {v2, v5, v4}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 370
    invoke-interface {v1}, Lorg/apache/http/client/HttpClient;->getParams()Lorg/apache/http/params/HttpParams;

    move-result-object v2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-string v4, "http.socket.timeout"

    invoke-interface {v2, v4, v3}, Lorg/apache/http/params/HttpParams;->setParameter(Ljava/lang/String;Ljava/lang/Object;)Lorg/apache/http/params/HttpParams;

    .line 372
    new-instance v2, Lorg/apache/http/client/methods/HttpPost;

    const-string v3, "http://106.53.152.67/etralab_appstore_android/php/classification_activity/get_apps_data_new.php"

    invoke-direct {v2, v3}, Lorg/apache/http/client/methods/HttpPost;-><init>(Ljava/lang/String;)V

    .line 373
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 374
    new-instance v4, Lorg/apache/http/message/BasicNameValuePair;

    const-string v5, "classification"

    invoke-direct {v4, v5, v0}, Lorg/apache/http/message/BasicNameValuePair;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 377
    :try_start_4
    new-instance v0, Lorg/apache/http/client/entity/UrlEncodedFormEntity;

    const-string v4, "UTF-8"

    invoke-direct {v0, v3, v4}, Lorg/apache/http/client/entity/UrlEncodedFormEntity;-><init>(Ljava/util/List;Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Lorg/apache/http/client/methods/HttpPost;->setEntity(Lorg/apache/http/HttpEntity;)V

    .line 378
    invoke-interface {v1, v2}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    .line 379
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v1

    invoke-interface {v1}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v1

    if-ne v1, v7, :cond_d

    .line 381
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 383
    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    .line 384
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 385
    :goto_4
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_c

    .line 387
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_4

    .line 390
    :cond_c
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    return-object v0

    :catch_4
    move-exception v0

    .line 395
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_d
    return-object v8
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 51
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 53
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->requestWindowFeature(I)Z

    .line 55
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->setLayout()V

    .line 58
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->ClickToBackLastActivity()V

    .line 61
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->setTitle()V

    .line 63
    new-instance p1, Lcom/etralab/appstoreforandroid/ClassificationActivity$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity$1;-><init>(Lcom/etralab/appstoreforandroid/ClassificationActivity;)V

    .line 74
    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ClassificationActivity$1;->start()V

    .line 77
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->parseByJSONObject()V

    return-void
.end method

.method public parseByJSONObject()V
    .locals 1

    .line 156
    new-instance v0, Lcom/etralab/appstoreforandroid/ClassificationActivity$3;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity$3;-><init>(Lcom/etralab/appstoreforandroid/ClassificationActivity;)V

    .line 197
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/ClassificationActivity$3;->start()V

    return-void
.end method

.method setLayout()V
    .locals 4

    .line 421
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "CircleLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 422
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "SquareLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 423
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    const v3, 0x7f0b0025

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 424
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->setContentView(I)V

    .line 425
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 426
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->startActivity(Landroid/content/Intent;)V

    .line 427
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->finish()V

    goto :goto_0

    .line 428
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 429
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->setContentView(I)V

    goto :goto_0

    .line 430
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0b0026

    .line 431
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->setContentView(I)V

    goto :goto_0

    .line 433
    :cond_2
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->setContentView(I)V

    .line 434
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 435
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->startActivity(Landroid/content/Intent;)V

    .line 436
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->finish()V

    :goto_0
    return-void
.end method

.method setTitle()V
    .locals 3

    .line 403
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "appClassification"

    .line 404
    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const v1, 0x7f08026e

    .line 406
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    if-eqz v1, :cond_0

    .line 409
    new-instance v2, Lcom/etralab/appstoreforandroid/ClassificationActivity$4;

    invoke-direct {v2, p0, v1, v0}, Lcom/etralab/appstoreforandroid/ClassificationActivity$4;-><init>(Lcom/etralab/appstoreforandroid/ClassificationActivity;Landroid/widget/TextView;Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method
