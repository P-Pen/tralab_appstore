.class Lcom/etralab/appstoreforandroid/MyImageView$2;
.super Ljava/lang/Thread;
.source "MyImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/MyImageView;->setImageURL(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/MyImageView;

.field final synthetic val$path:Ljava/lang/String;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/MyImageView;Ljava/lang/String;)V
    .locals 0

    .line 55
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/MyImageView$2;->this$0:Lcom/etralab/appstoreforandroid/MyImageView;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/MyImageView$2;->val$path:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 60
    :try_start_0
    new-instance v0, Ljava/net/URL;

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/MyImageView$2;->val$path:Ljava/lang/String;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 62
    invoke-virtual {v0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    const-string v1, "GET"

    .line 64
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v1, 0x2710

    .line 66
    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 68
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_0

    .line 70
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0

    .line 72
    invoke-static {v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1

    .line 74
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    move-result-object v2

    .line 75
    iput-object v1, v2, Landroid/os/Message;->obj:Ljava/lang/Object;

    const/4 v1, 0x1

    .line 76
    iput v1, v2, Landroid/os/Message;->what:I

    .line 77
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/MyImageView$2;->this$0:Lcom/etralab/appstoreforandroid/MyImageView;

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/MyImageView;->access$000(Lcom/etralab/appstoreforandroid/MyImageView;)Landroid/os/Handler;

    move-result-object v1

    invoke-virtual {v1, v2}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 78
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    goto :goto_0

    .line 81
    :cond_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MyImageView$2;->this$0:Lcom/etralab/appstoreforandroid/MyImageView;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/MyImageView;->access$000(Lcom/etralab/appstoreforandroid/MyImageView;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 84
    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    .line 86
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MyImageView$2;->this$0:Lcom/etralab/appstoreforandroid/MyImageView;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/MyImageView;->access$000(Lcom/etralab/appstoreforandroid/MyImageView;)Landroid/os/Handler;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    :goto_0
    return-void
.end method
