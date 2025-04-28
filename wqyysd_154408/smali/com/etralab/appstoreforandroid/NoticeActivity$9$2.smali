.class Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;
.super Ljava/lang/Object;
.source "NoticeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/NoticeActivity$9;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$9;

.field final synthetic val$btn_retry:Landroid/widget/Button;

.field final synthetic val$iv_load_failed:Landroid/widget/ImageView;

.field final synthetic val$iv_loading_anim:Landroid/widget/ImageView;

.field final synthetic val$tv_loading_text:Landroid/widget/TextView;

.field final synthetic val$tv_retry_text:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/NoticeActivity$9;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/Button;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 854
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$9;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;->val$iv_loading_anim:Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;->val$tv_loading_text:Landroid/widget/TextView;

    iput-object p4, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;->val$iv_load_failed:Landroid/widget/ImageView;

    iput-object p5, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;->val$tv_retry_text:Landroid/widget/TextView;

    iput-object p6, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;->val$btn_retry:Landroid/widget/Button;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 857
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;->val$iv_loading_anim:Landroid/widget/ImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 858
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;->val$tv_loading_text:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 860
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;->val$iv_load_failed:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 861
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;->val$tv_retry_text:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setVisibility(I)V

    .line 862
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$9$2;->val$btn_retry:Landroid/widget/Button;

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    return-void
.end method
