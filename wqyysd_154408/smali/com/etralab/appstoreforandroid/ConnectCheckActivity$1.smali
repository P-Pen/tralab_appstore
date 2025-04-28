.class Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;
.super Ljava/lang/Object;
.source "ConnectCheckActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ConnectCheckActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ConnectCheckActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ConnectCheckActivity;)V
    .locals 0

    .line 27
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ConnectCheckActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 31
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ConnectCheckActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ConnectCheckActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    const-string v0, "\u6b63\u5728\u8fde\u63a5\u81f3\u4e3b\u670d\u52a1\u5668"

    const/4 v1, 0x0

    invoke-static {p1, v0, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 33
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1$1;-><init>(Lcom/etralab/appstoreforandroid/ConnectCheckActivity$1;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 46
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void
.end method
