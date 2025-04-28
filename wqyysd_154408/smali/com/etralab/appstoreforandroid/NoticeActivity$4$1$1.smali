.class Lcom/etralab/appstoreforandroid/NoticeActivity$4$1$1;
.super Ljava/lang/Object;
.source "NoticeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;

.field final synthetic val$iv_like_number:Landroid/widget/ImageView;

.field final synthetic val$tv_like_number:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;Landroid/widget/ImageView;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 149
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1$1;->this$2:Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1$1;->val$iv_like_number:Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1$1;->val$tv_like_number:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 153
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1$1;->val$iv_like_number:Landroid/widget/ImageView;

    const v1, 0x7f07012e

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 154
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1$1;->val$tv_like_number:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1$1;->this$2:Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/NoticeActivity$4;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/NoticeActivity;->notice_like_num:Ljava/lang/String;

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    add-int/lit8 v2, v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/NumUnitConversionUtil;->NumUnitConversion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
