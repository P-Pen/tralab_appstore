.class Lcom/etralab/appstoreforandroid/InstallApkActivity$1;
.super Ljava/lang/Thread;
.source "InstallApkActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/InstallApkActivity;->onCreate(Landroid/os/Bundle;)V
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

    .line 59
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$1;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 62
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 64
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$1;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/InstallApkActivity;->iv_loading_anim:Landroid/widget/ImageView;

    if-eqz v0, :cond_0

    .line 66
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$1;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/InstallApkActivity;->iv_loading_anim:Landroid/widget/ImageView;

    invoke-virtual {v0}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    :cond_0
    return-void
.end method
