.class Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;
.super Ljava/lang/Thread;
.source "NoticeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/NoticeActivity$4;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/NoticeActivity$4;)V
    .locals 0

    .line 137
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 140
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 142
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$4;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    iget-boolean v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity;->isLikeNotice:Z

    const v1, 0x7f0800e3

    const v2, 0x7f080240

    if-nez v0, :cond_0

    .line 144
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$4;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->access$100(Lcom/etralab/appstoreforandroid/NoticeActivity;)V

    .line 146
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$4;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-virtual {v0, v2}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 147
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/NoticeActivity$4;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-virtual {v2, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 149
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/NoticeActivity$4;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    new-instance v3, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1$1;

    invoke-direct {v3, p0, v1, v0}, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1$1;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    invoke-virtual {v2, v3}, Lcom/etralab/appstoreforandroid/NoticeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 157
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$4;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/etralab/appstoreforandroid/NoticeActivity;->isLikeNotice:Z

    goto :goto_0

    .line 160
    :cond_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$4;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->access$200(Lcom/etralab/appstoreforandroid/NoticeActivity;)V

    .line 162
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$4;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-virtual {v0, v2}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 163
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/NoticeActivity$4;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-virtual {v2, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 165
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/NoticeActivity$4;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    new-instance v3, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1$2;

    invoke-direct {v3, p0, v1, v0}, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1$2;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    invoke-virtual {v2, v3}, Lcom/etralab/appstoreforandroid/NoticeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 173
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$4$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$4;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$4;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/etralab/appstoreforandroid/NoticeActivity;->isLikeNotice:Z

    :goto_0
    return-void
.end method
