.class Lcom/etralab/appstoreforandroid/AppActivity$5$1;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity$5;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/AppActivity$5;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AppActivity$5;)V
    .locals 0

    .line 188
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$5$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$5;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 191
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$5$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$5;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$5;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const-string v1, "\u8be5\u529f\u80fd\u6682\u672a\u5f00\u653e\uff0c\u656c\u8bf7\u671f\u5f85\uff01"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    .line 192
    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    return-void
.end method
