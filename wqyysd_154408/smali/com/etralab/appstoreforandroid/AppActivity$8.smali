.class Lcom/etralab/appstoreforandroid/AppActivity$8;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/AppActivity;

.field final synthetic val$fl_installing:Landroid/widget/FrameLayout;

.field final synthetic val$ll_installed:Landroid/widget/LinearLayout;

.field final synthetic val$ll_update:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AppActivity;Landroid/widget/FrameLayout;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 267
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->val$fl_installing:Landroid/widget/FrameLayout;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->val$ll_update:Landroid/widget/LinearLayout;

    iput-object p4, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->val$ll_installed:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    const/4 v0, 0x0

    .line 272
    :try_start_0
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_version_code:Ljava/lang/String;

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 274
    invoke-virtual {v1}, Ljava/lang/NumberFormatException;->printStackTrace()V

    move v1, v0

    :goto_0
    const/16 v2, 0x8

    if-eqz v1, :cond_0

    .line 276
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v3, v3}, Lcom/etralab/appstoreforandroid/AppActivity;->getAppVersionCode(Landroid/content/Context;)I

    move-result v3

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    .line 277
    invoke-virtual {v3, v3}, Lcom/etralab/appstoreforandroid/AppActivity;->getAppVersionCode(Landroid/content/Context;)I

    move-result v3

    if-le v1, v3, :cond_0

    .line 279
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->val$fl_installing:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 280
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->val$ll_update:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 283
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AppActivity;->access$400(Lcom/etralab/appstoreforandroid/AppActivity;)V

    goto :goto_1

    .line 285
    :cond_0
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->val$fl_installing:Landroid/widget/FrameLayout;

    invoke-virtual {v1, v2}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 286
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->val$ll_installed:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 289
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v1}, Lcom/etralab/appstoreforandroid/AppActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v3, v3, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, ".apk"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 290
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 291
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 295
    :cond_1
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$8;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AppActivity;->access$500(Lcom/etralab/appstoreforandroid/AppActivity;)V

    :goto_1
    return-void
.end method
