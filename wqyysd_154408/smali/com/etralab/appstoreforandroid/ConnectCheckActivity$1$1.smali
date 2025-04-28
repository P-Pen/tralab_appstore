.class Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1$1;
.super Ljava/lang/Object;
.source "ConnectCheckActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;)V
    .locals 0

    .line 33
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1$1;->this$1:Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 36
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1$1;->this$1:Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ConnectCheckActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/ConnectCheckActivity;->isConnByHttp()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 37
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 38
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1$1;->this$1:Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ConnectCheckActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/ConnectCheckActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "\u6210\u529f\u8fde\u63a5\u81f3\u4e3b\u670d\u52a1\u5668"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 39
    invoke-static {}, Landroid/os/Looper;->loop()V

    goto :goto_0

    .line 41
    :cond_0
    invoke-static {}, Landroid/os/Looper;->prepare()V

    .line 42
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1$1;->this$1:Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ConnectCheckActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/ConnectCheckActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v2, "\u65e0\u6cd5\u8fde\u63a5\u81f3\u4e3b\u670d\u52a1\u5668"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 43
    invoke-static {}, Landroid/os/Looper;->loop()V

    :goto_0
    return-void
.end method
