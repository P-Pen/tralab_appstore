.class Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;
.super Ljava/lang/Object;
.source "ClassificationActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1;

.field final synthetic val$btn_retry:Landroid/widget/Button;

.field final synthetic val$iv_load_failed:Landroid/widget/ImageView;

.field final synthetic val$iv_loading_anim:Landroid/widget/ImageView;

.field final synthetic val$tv_loading_app_list:Landroid/widget/TextView;

.field final synthetic val$tv_retry_text:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 131
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;->this$2:Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;->val$iv_loading_anim:Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;->val$tv_loading_app_list:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;->val$iv_load_failed:Landroid/widget/ImageView;

    iput-object p5, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;->val$tv_retry_text:Landroid/widget/TextView;

    iput-object p6, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;->val$btn_retry:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 134
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;->val$iv_loading_anim:Landroid/widget/ImageView;

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 135
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;->val$tv_loading_app_list:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 137
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;->val$iv_load_failed:Landroid/widget/ImageView;

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 138
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;->val$tv_retry_text:Landroid/widget/TextView;

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 139
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;->val$btn_retry:Landroid/widget/Button;

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setVisibility(I)V

    .line 142
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;->val$iv_loading_anim:Landroid/widget/ImageView;

    invoke-virtual {p1}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/AnimationDrawable;->start()V

    .line 144
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1$1;->this$2:Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1;->this$1:Lcom/etralab/appstoreforandroid/ClassificationActivity$2;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/ClassificationActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ClassificationActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->parseByJSONObject()V

    return-void
.end method
