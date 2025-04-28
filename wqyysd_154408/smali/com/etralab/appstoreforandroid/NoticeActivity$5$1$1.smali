.class Lcom/etralab/appstoreforandroid/NoticeActivity$5$1$1;
.super Ljava/lang/Object;
.source "NoticeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;

.field final synthetic val$iv_dislike_number:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;Landroid/widget/ImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 195
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1$1;->this$2:Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1$1;->val$iv_dislike_number:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 199
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1$1;->val$iv_dislike_number:Landroid/widget/ImageView;

    const v1, 0x7f070115

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 200
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1$1;->this$2:Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$5;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$5;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const-string v1, "\u611f\u8c22\u60a8\u7684\u53cd\u9988\uff01\n\u6211\u4eec\u5c06\u5bf9\u540e\u7eed\u516c\u544a\u7684\u5185\u5bb9\u8fdb\u884c\u4f18\u5316\u3002"

    const/4 v2, 0x1

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
