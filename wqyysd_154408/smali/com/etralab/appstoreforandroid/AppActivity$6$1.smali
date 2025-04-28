.class Lcom/etralab/appstoreforandroid/AppActivity$6$1;
.super Ljava/lang/Thread;
.source "AppActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity$6;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/AppActivity$6;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AppActivity$6;)V
    .locals 0

    .line 202
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$6$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$6;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 205
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 207
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$6$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$6;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$6;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-boolean v0, v0, Lcom/etralab/appstoreforandroid/AppActivity;->isLikeApp:Z

    const v1, 0x7f0800d4

    const v2, 0x7f080226

    if-nez v0, :cond_0

    .line 209
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$6$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$6;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$6;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AppActivity;->access$100(Lcom/etralab/appstoreforandroid/AppActivity;)V

    .line 211
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$6$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$6;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$6;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v0, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 212
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$6$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$6;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$6;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v2, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 214
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$6$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$6;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$6;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v3, Lcom/etralab/appstoreforandroid/AppActivity$6$1$1;

    invoke-direct {v3, p0, v1, v0}, Lcom/etralab/appstoreforandroid/AppActivity$6$1$1;-><init>(Lcom/etralab/appstoreforandroid/AppActivity$6$1;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    invoke-virtual {v2, v3}, Lcom/etralab/appstoreforandroid/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 222
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$6$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$6;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$6;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const/4 v1, 0x1

    iput-boolean v1, v0, Lcom/etralab/appstoreforandroid/AppActivity;->isLikeApp:Z

    goto :goto_0

    .line 225
    :cond_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$6$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$6;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$6;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AppActivity;->access$200(Lcom/etralab/appstoreforandroid/AppActivity;)V

    .line 227
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$6$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$6;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$6;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v0, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 228
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$6$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$6;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$6;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v2, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    .line 230
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$6$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$6;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$6;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v3, Lcom/etralab/appstoreforandroid/AppActivity$6$1$2;

    invoke-direct {v3, p0, v1, v0}, Lcom/etralab/appstoreforandroid/AppActivity$6$1$2;-><init>(Lcom/etralab/appstoreforandroid/AppActivity$6$1;Landroid/widget/ImageView;Landroid/widget/TextView;)V

    invoke-virtual {v2, v3}, Lcom/etralab/appstoreforandroid/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 238
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$6$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$6;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$6;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/etralab/appstoreforandroid/AppActivity;->isLikeApp:Z

    :goto_0
    return-void
.end method
