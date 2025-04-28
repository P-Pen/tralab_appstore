.class Lcom/etralab/appstoreforandroid/MineFragment$1;
.super Ljava/lang/Object;
.source "MineFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/MineFragment;->onResume()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/MineFragment;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/MineFragment;)V
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/MineFragment$1;->this$0:Lcom/etralab/appstoreforandroid/MineFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 57
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MineFragment$1;->this$0:Lcom/etralab/appstoreforandroid/MineFragment;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/MineFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f080111

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const/4 v1, 0x0

    .line 58
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    return-void
.end method
