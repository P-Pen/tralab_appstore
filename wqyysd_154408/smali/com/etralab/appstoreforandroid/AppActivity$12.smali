.class Lcom/etralab/appstoreforandroid/AppActivity$12;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity;->running(Lcom/arialyy/aria/core/task/DownloadTask;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/AppActivity;

.field final synthetic val$p:I

.field final synthetic val$progressBarMaxWidth:I

.field final synthetic val$tv_donloading_progress:Landroid/widget/TextView;

.field final synthetic val$tv_download_progress_bar:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AppActivity;Landroid/widget/TextView;IILandroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 878
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$12;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/AppActivity$12;->val$tv_download_progress_bar:Landroid/widget/TextView;

    iput p3, p0, Lcom/etralab/appstoreforandroid/AppActivity$12;->val$progressBarMaxWidth:I

    iput p4, p0, Lcom/etralab/appstoreforandroid/AppActivity$12;->val$p:I

    iput-object p5, p0, Lcom/etralab/appstoreforandroid/AppActivity$12;->val$tv_donloading_progress:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 881
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$12;->val$tv_download_progress_bar:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$12;->val$progressBarMaxWidth:I

    iget v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$12;->val$p:I

    mul-int/2addr v1, v2

    int-to-double v1, v1

    const-wide v3, 0x3f847ae147ae147bL    # 0.01

    mul-double/2addr v1, v3

    double-to-int v1, v1

    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 882
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$12;->val$tv_donloading_progress:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$12;->val$p:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "%"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
