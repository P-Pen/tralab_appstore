.class Lcom/etralab/appstoreforandroid/ForceUpdateActivity$6;
.super Ljava/lang/Object;
.source "ForceUpdateActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ForceUpdateActivity;->ReloadUpdateInformation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

.field final synthetic val$btn_retry:Landroid/widget/Button;

.field final synthetic val$iv_load_failed:Landroid/widget/ImageView;

.field final synthetic val$iv_loading_anim:Landroid/widget/ImageView;

.field final synthetic val$tv_loading_text:Landroid/widget/TextView;

.field final synthetic val$tv_retry_text:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ForceUpdateActivity;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 310
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$6;->this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$6;->val$tv_loading_text:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$6;->val$iv_loading_anim:Landroid/widget/ImageView;

    iput-object p4, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$6;->val$iv_load_failed:Landroid/widget/ImageView;

    iput-object p5, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$6;->val$tv_retry_text:Landroid/widget/TextView;

    iput-object p6, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$6;->val$btn_retry:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 313
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$6;->val$tv_loading_text:Landroid/widget/TextView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 314
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$6;->val$iv_loading_anim:Landroid/widget/ImageView;

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 316
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$6;->val$iv_load_failed:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 317
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$6;->val$tv_retry_text:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 318
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$6;->val$btn_retry:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    return-void
.end method
