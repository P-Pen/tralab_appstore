.class public Lcom/etralab/appstoreforandroid/ConnectCheckActivity;
.super Landroid/app/Activity;
.source "ConnectCheckActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public isConnByHttp()Z
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 56
    :try_start_0
    new-instance v2, Ljava/net/URL;

    const-string v3, "http://106.53.152.67/"

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 57
    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/16 v1, 0x1388

    .line 58
    :try_start_1
    invoke-virtual {v2, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 59
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/16 v3, 0xc8

    if-ne v1, v3, :cond_0

    const/4 v0, 0x1

    .line 70
    :cond_0
    :goto_0
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_3

    :catch_0
    move-exception v1

    goto :goto_1

    :catch_1
    move-exception v1

    goto :goto_2

    :catchall_0
    move-exception v0

    goto :goto_4

    :catch_2
    move-exception v2

    move-object v4, v2

    move-object v2, v1

    move-object v1, v4

    .line 68
    :goto_1
    :try_start_2
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    :catch_3
    move-exception v2

    move-object v4, v2

    move-object v2, v1

    move-object v1, v4

    .line 65
    :goto_2
    invoke-virtual {v1}, Ljava/net/MalformedURLException;->printStackTrace()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_0

    :goto_3
    return v0

    :catchall_1
    move-exception v0

    move-object v1, v2

    .line 70
    :goto_4
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 71
    throw v0
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 20
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 22
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ConnectCheckActivity;->requestWindowFeature(I)Z

    const p1, 0x7f0b0029

    .line 23
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ConnectCheckActivity;->setContentView(I)V

    const p1, 0x7f080067

    .line 25
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ConnectCheckActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 27
    new-instance v0, Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;-><init>(Lcom/etralab/appstoreforandroid/ConnectCheckActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
