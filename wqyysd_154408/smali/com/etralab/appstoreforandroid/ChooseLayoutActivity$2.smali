.class Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$2;
.super Ljava/lang/Object;
.source "ChooseLayoutActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

.field final synthetic val$iv_circle_layout:Landroid/widget/ImageView;

.field final synthetic val$iv_square_layout:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;Landroid/widget/ImageView;Landroid/widget/ImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 46
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$2;->val$iv_square_layout:Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$2;->val$iv_circle_layout:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 49
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    const/4 v0, 0x1

    iput v0, p1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->layoutId:I

    .line 50
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    new-instance v0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$2$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$2$1;-><init>(Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$2;)V

    invoke-virtual {p1, v0}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
