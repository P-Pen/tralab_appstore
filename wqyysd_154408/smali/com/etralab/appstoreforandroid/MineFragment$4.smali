.class Lcom/etralab/appstoreforandroid/MineFragment$4;
.super Ljava/lang/Object;
.source "MineFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/MineFragment;->onActivityCreated(Landroid/os/Bundle;)V
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

    .line 95
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/MineFragment$4;->this$0:Lcom/etralab/appstoreforandroid/MineFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 97
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/MineFragment$4;->this$0:Lcom/etralab/appstoreforandroid/MineFragment;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/MineFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/fragment/app/FragmentActivity;->finish()V

    return-void
.end method
