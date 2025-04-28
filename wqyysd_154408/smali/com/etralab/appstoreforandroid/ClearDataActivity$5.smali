.class Lcom/etralab/appstoreforandroid/ClearDataActivity$5;
.super Ljava/lang/Object;
.source "ClearDataActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ClearDataActivity;->ShowFilesDirSize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

.field final synthetic val$totalDataSize:Ljava/lang/String;

.field final synthetic val$tv_application_data_size:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ClearDataActivity;Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 224
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$5;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$5;->val$tv_application_data_size:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$5;->val$totalDataSize:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 227
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$5;->val$tv_application_data_size:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$5;->val$totalDataSize:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "KB"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
