.class Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;
.super Ljava/lang/Thread;
.source "CheckUpdateActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->CheckForUpdatesByVersionCode()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/CheckUpdateActivity;)V
    .locals 0

    .line 58
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 17

    move-object/from16 v8, p0

    .line 63
    iget-object v0, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    const v1, 0x7f08012d

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 64
    iget-object v1, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    const v2, 0x7f080152

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v9, v1

    check-cast v9, Landroid/widget/LinearLayout;

    .line 66
    iget-object v1, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    const v2, 0x7f0800e5

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Landroid/widget/ImageView;

    .line 67
    iget-object v1, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    const v2, 0x7f080242

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v11, v1

    check-cast v11, Landroid/widget/TextView;

    .line 69
    iget-object v1, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    const v2, 0x7f0800e4

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v12, v1

    check-cast v12, Landroid/widget/ImageView;

    .line 70
    iget-object v1, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    const v2, 0x7f08026c

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v13, v1

    check-cast v13, Landroid/widget/TextView;

    .line 71
    iget-object v1, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    const v2, 0x7f080069

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v14, v1

    check-cast v14, Landroid/widget/Button;

    .line 73
    iget-object v15, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    new-instance v7, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$1;

    move-object v1, v7

    move-object/from16 v2, p0

    move-object v3, v11

    move-object v4, v10

    move-object v5, v12

    move-object v6, v13

    move-object/from16 v16, v13

    move-object v13, v7

    move-object v7, v14

    invoke-direct/range {v1 .. v7}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$1;-><init>(Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/Button;)V

    invoke-virtual {v15, v13}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    if-eqz v10, :cond_0

    .line 87
    invoke-virtual {v10}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 93
    :cond_0
    :try_start_0
    new-instance v1, Ljava/net/URL;

    const-string v2, "http://106.53.152.67/etralab_appstore_android/php/check_update_activity/get_latest_version_data.php"

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 96
    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    const-string v2, "GET"

    .line 100
    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v2, 0x1770

    .line 102
    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 105
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    const/16 v3, 0xc8

    if-ne v2, v3, :cond_3

    .line 108
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1

    const/16 v2, 0x400

    new-array v2, v2, [B

    .line 111
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 114
    :goto_0
    invoke-virtual {v1, v2}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-le v4, v5, :cond_1

    const/4 v5, 0x0

    .line 119
    invoke-virtual {v3, v2, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_0

    .line 122
    :cond_1
    new-instance v1, Ljava/lang/String;

    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/String;-><init>([B)V

    .line 125
    iget-object v2, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    invoke-static {v2}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->access$100(Lcom/etralab/appstoreforandroid/CheckUpdateActivity;)V

    .line 128
    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    .line 129
    iget-object v3, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    invoke-static {v3}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->getAppVersionCode(Landroid/content/Context;)J

    move-result-wide v3

    cmp-long v1, v3, v1

    if-gez v1, :cond_2

    .line 132
    new-instance v0, Landroid/content/Intent;

    iget-object v1, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    const-class v2, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 133
    iget-object v1, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->startActivity(Landroid/content/Intent;)V

    .line 134
    iget-object v0, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->finish()V

    goto :goto_1

    .line 136
    :cond_2
    iget-object v1, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    new-instance v2, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;

    invoke-direct {v2, v8, v0, v9}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;-><init>(Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->runOnUiThread(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    return-void

    :catch_0
    move-exception v0

    .line 160
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 164
    :cond_3
    iget-object v0, v8, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    new-instance v9, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$3;

    move-object v1, v9

    move-object/from16 v2, p0

    move-object v3, v10

    move-object v4, v11

    move-object v5, v12

    move-object/from16 v6, v16

    move-object v7, v14

    invoke-direct/range {v1 .. v7}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$3;-><init>(Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/Button;)V

    invoke-virtual {v0, v9}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
