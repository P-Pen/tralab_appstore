.class Lcom/etralab/appstoreforandroid/MyImageView$1;
.super Landroid/os/Handler;
.source "MyImageView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etralab/appstoreforandroid/MyImageView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/MyImageView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/MyImageView;)V
    .locals 0

    .line 22
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/MyImageView$1;->this$0:Lcom/etralab/appstoreforandroid/MyImageView;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 2

    .line 25
    iget v0, p1, Landroid/os/Message;->what:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    goto :goto_0

    .line 27
    :cond_0
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Landroid/graphics/Bitmap;

    .line 28
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MyImageView$1;->this$0:Lcom/etralab/appstoreforandroid/MyImageView;

    invoke-virtual {v0, p1}, Lcom/etralab/appstoreforandroid/MyImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    :goto_0
    return-void
.end method
