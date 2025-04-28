.class Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1$1;
.super Ljava/lang/Object;
.source "ChooseLayoutActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1$1;->this$1:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 39
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1$1;->this$1:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1;->val$iv_square_layout:Landroid/widget/ImageView;

    const v1, 0x7f070173

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 40
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1$1;->this$1:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1;->val$iv_circle_layout:Landroid/widget/ImageView;

    const v1, 0x7f07010f

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method
