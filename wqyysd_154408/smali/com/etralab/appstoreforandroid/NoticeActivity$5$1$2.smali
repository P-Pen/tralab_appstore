.class Lcom/etralab/appstoreforandroid/NoticeActivity$5$1$2;
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

    .line 210
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1$2;->this$2:Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1$2;->val$iv_dislike_number:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 214
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1$2;->val$iv_dislike_number:Landroid/widget/ImageView;

    const v1, 0x7f070114

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method
