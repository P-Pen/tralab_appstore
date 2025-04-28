.class Lcom/etralab/appstoreforandroid/InstallApkActivity$3;
.super Landroid/os/Handler;
.source "InstallApkActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etralab/appstoreforandroid/InstallApkActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/InstallApkActivity;)V
    .locals 0

    .line 323
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$3;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)V
    .locals 6

    .line 329
    invoke-super {p0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V

    .line 330
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 332
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$3;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->regular(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 335
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$3;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/InstallApkActivity;->debug:Landroid/widget/TextView;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\n"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->append(Ljava/lang/CharSequence;)V

    .line 338
    :cond_0
    iget v0, p1, Landroid/os/Message;->what:I

    const/16 v1, 0x8

    const/16 v2, 0xbb8

    const/16 v3, 0x7d0

    if-ne v0, v3, :cond_1

    .line 341
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$3;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/InstallApkActivity;->iv_loading_anim:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 342
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$3;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/InstallApkActivity;->state:Landroid/widget/TextView;

    const-string v1, "\u5b89\u88c5\u5e94\u7528\u6210\u529f\uff01"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_0

    .line 345
    :cond_1
    iget v0, p1, Landroid/os/Message;->what:I

    if-ne v0, v2, :cond_2

    .line 348
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    .line 349
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$3;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/InstallApkActivity;->iv_loading_anim:Landroid/widget/ImageView;

    invoke-virtual {v4, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 350
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$3;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/InstallApkActivity;->state:Landroid/widget/TextView;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "\u5b89\u88c5\u5e94\u7528\u5931\u8d25\uff1a"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 353
    :cond_2
    :goto_0
    iget v0, p1, Landroid/os/Message;->what:I

    if-eq v0, v3, :cond_3

    iget p1, p1, Landroid/os/Message;->what:I

    if-ne p1, v2, :cond_4

    .line 355
    :cond_3
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/etralab/appstoreforandroid/InstallApkActivity$3$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/InstallApkActivity$3$1;-><init>(Lcom/etralab/appstoreforandroid/InstallApkActivity$3;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 369
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    :cond_4
    return-void
.end method
