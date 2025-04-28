.class Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;
.super Ljava/lang/Thread;
.source "NoticeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/NoticeActivity$5;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$5;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/NoticeActivity$5;)V
    .locals 0

    .line 184
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$5;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 187
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 189
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$5;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$5;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    iget-boolean v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity;->isDislikeNotice:Z

    const v1, 0x7f0800dc

    if-nez v0, :cond_0

    .line 191
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$5;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$5;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->access$300(Lcom/etralab/appstoreforandroid/NoticeActivity;)V

    .line 193
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$5;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$5;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 195
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$5;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/NoticeActivity$5;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    new-instance v2, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1$1;

    invoke-direct {v2, p0, v0}, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1$1;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;Landroid/widget/ImageView;)V

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/NoticeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 203
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$5;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$5;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/etralab/appstoreforandroid/NoticeActivity;->isDislikeNotice:Z

    goto :goto_0

    .line 206
    :cond_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$5;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$5;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->access$400(Lcom/etralab/appstoreforandroid/NoticeActivity;)V

    .line 208
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$5;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$5;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 210
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$5;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/NoticeActivity$5;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    new-instance v2, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1$2;

    invoke-direct {v2, p0, v0}, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1$2;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;Landroid/widget/ImageView;)V

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/NoticeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 217
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$5$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$5;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$5;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/etralab/appstoreforandroid/NoticeActivity;->isDislikeNotice:Z

    :goto_0
    return-void
.end method
