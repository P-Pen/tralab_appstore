.class Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1$1;
.super Ljava/lang/Object;
.source "ForceUpdateActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;

.field final synthetic val$btn_update:Landroid/widget/Button;

.field final synthetic val$fl_downloading_progress:Landroid/widget/FrameLayout;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;Landroid/widget/Button;Landroid/widget/FrameLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 124
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1$1;->this$2:Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1$1;->val$btn_update:Landroid/widget/Button;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1$1;->val$fl_downloading_progress:Landroid/widget/FrameLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 128
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1$1;->val$btn_update:Landroid/widget/Button;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setVisibility(I)V

    .line 129
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1$1;->val$fl_downloading_progress:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    return-void
.end method
