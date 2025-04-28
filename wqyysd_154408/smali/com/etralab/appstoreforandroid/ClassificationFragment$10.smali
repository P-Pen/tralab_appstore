.class Lcom/etralab/appstoreforandroid/ClassificationFragment$10;
.super Ljava/lang/Object;
.source "ClassificationFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ClassificationFragment;->onActivityCreated(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ClassificationFragment;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ClassificationFragment;)V
    .locals 0

    .line 163
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ClassificationFragment$10;->this$0:Lcom/etralab/appstoreforandroid/ClassificationFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 166
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClassificationFragment$10;->this$0:Lcom/etralab/appstoreforandroid/ClassificationFragment;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ClassificationFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 167
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ClassificationActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "appClassification"

    const-string v2, "\u8868\u76d8"

    .line 168
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "appClassificationEn"

    const-string v2, "WatchFace"

    .line 169
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 170
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
