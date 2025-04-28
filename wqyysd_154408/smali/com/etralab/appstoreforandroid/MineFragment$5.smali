.class Lcom/etralab/appstoreforandroid/MineFragment$5;
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

    .line 103
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/MineFragment$5;->this$0:Lcom/etralab/appstoreforandroid/MineFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 106
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/MineFragment$5;->this$0:Lcom/etralab/appstoreforandroid/MineFragment;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/MineFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 107
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/SettingsActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 108
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
