.class Lcom/etralab/appstoreforandroid/AppActivity$13;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity;->taskComplete(Lcom/arialyy/aria/core/task/DownloadTask;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/AppActivity;

.field final synthetic val$fl_downloading_progress:Landroid/widget/FrameLayout;

.field final synthetic val$fl_installing:Landroid/widget/FrameLayout;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AppActivity;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 898
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$13;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/AppActivity$13;->val$fl_downloading_progress:Landroid/widget/FrameLayout;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/AppActivity$13;->val$fl_installing:Landroid/widget/FrameLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 902
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$13;->val$fl_downloading_progress:Landroid/widget/FrameLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    .line 903
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$13;->val$fl_installing:Landroid/widget/FrameLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setVisibility(I)V

    return-void
.end method
