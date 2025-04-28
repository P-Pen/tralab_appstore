.class Lcom/etralab/appstoreforandroid/HomeFragment$1$1$4;
.super Ljava/lang/Object;
.source "HomeFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/etralab/appstoreforandroid/HomeFragment$1$1;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/HomeFragment$1$1;)V
    .locals 0

    .line 220
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$4;->this$2:Lcom/etralab/appstoreforandroid/HomeFragment$1$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 223
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$4;->this$2:Lcom/etralab/appstoreforandroid/HomeFragment$1$1;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/HomeFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 224
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ClassificationActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "appClassification"

    const-string v2, "\u4e0b\u8f7d\u6392\u884c"

    .line 225
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "appClassificationEn"

    const-string v2, "Ranking"

    .line 226
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 227
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
