.class Lcom/etralab/appstoreforandroid/ClearDataActivity$2;
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

.field final synthetic val$iv_cache_data:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ClearDataActivity;Landroid/widget/ImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 135
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$2;->val$iv_cache_data:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 139
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iget-boolean p1, p1, Lcom/etralab/appstoreforandroid/ClearDataActivity;->isCheckBoxApplicationDataFull:Z

    if-nez p1, :cond_1

    .line 140
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iget-boolean p1, p1, Lcom/etralab/appstoreforandroid/ClearDataActivity;->isCheckBoxCacheDataFull:Z

    if-nez p1, :cond_0

    .line 141
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/etralab/appstoreforandroid/ClearDataActivity;->isCheckBoxCacheDataFull:Z

    .line 142
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    new-instance v0, Lcom/etralab/appstoreforandroid/ClearDataActivity$2$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity$2$1;-><init>(Lcom/etralab/appstoreforandroid/ClearDataActivity$2;)V

    invoke-virtual {p1, v0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    goto :goto_0

    .line 149
    :cond_0
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    const/4 v0, 0x0

    iput-boolean v0, p1, Lcom/etralab/appstoreforandroid/ClearDataActivity;->isCheckBoxCacheDataFull:Z

    .line 150
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    new-instance v0, Lcom/etralab/appstoreforandroid/ClearDataActivity$2$2;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity$2$2;-><init>(Lcom/etralab/appstoreforandroid/ClearDataActivity$2;)V

    invoke-virtual {p1, v0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method
