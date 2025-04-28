.class Lcom/etralab/appstoreforandroid/ClearDataActivity$3;
.super Ljava/lang/Object;
.source "ClearDataActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ClearDataActivity;->OnClickCheckBox()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

.field final synthetic val$iv_application_data:Landroid/widget/ImageView;

.field final synthetic val$iv_cache_data:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ClearDataActivity;Landroid/widget/ImageView;Landroid/widget/ImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 162
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;->val$iv_cache_data:Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;->val$iv_application_data:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 165
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iget-boolean p1, p1, Lcom/etralab/appstoreforandroid/ClearDataActivity;->isCheckBoxApplicationDataFull:Z

    const/4 v0, 0x1

    if-nez p1, :cond_0

    .line 166
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iput-boolean v0, p1, Lcom/etralab/appstoreforandroid/ClearDataActivity;->isCheckBoxApplicationDataFull:Z

    .line 168
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iput-boolean v0, p1, Lcom/etralab/appstoreforandroid/ClearDataActivity;->isCheckBoxCacheDataFull:Z

    .line 169
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    new-instance v0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity$3$1;-><init>(Lcom/etralab/appstoreforandroid/ClearDataActivity$3;)V

    invoke-virtual {p1, v0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 177
    :cond_0
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    const/4 v1, 0x0

    iput-boolean v1, p1, Lcom/etralab/appstoreforandroid/ClearDataActivity;->isCheckBoxApplicationDataFull:Z

    .line 179
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iput-boolean v0, p1, Lcom/etralab/appstoreforandroid/ClearDataActivity;->isCheckBoxCacheDataFull:Z

    .line 180
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    new-instance v0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3$2;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity$3$2;-><init>(Lcom/etralab/appstoreforandroid/ClearDataActivity$3;)V

    invoke-virtual {p1, v0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :goto_0
    return-void
.end method
