.class Lcom/etralab/appstoreforandroid/ClearDataActivity$3$2;
.super Ljava/lang/Object;
.source "ClearDataActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ClearDataActivity$3;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/ClearDataActivity$3;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ClearDataActivity$3;)V
    .locals 0

    .line 180
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3$2;->this$1:Lcom/etralab/appstoreforandroid/ClearDataActivity$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 183
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3$2;->this$1:Lcom/etralab/appstoreforandroid/ClearDataActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;->val$iv_cache_data:Landroid/widget/ImageView;

    const v1, 0x7f07010b

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 184
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3$2;->this$1:Lcom/etralab/appstoreforandroid/ClearDataActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;->val$iv_application_data:Landroid/widget/ImageView;

    const v1, 0x7f07010a

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method
