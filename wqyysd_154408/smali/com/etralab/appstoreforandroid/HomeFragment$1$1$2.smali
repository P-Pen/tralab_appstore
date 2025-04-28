.class Lcom/etralab/appstoreforandroid/HomeFragment$1$1$2;
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

    .line 194
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$2;->this$2:Lcom/etralab/appstoreforandroid/HomeFragment$1$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 197
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$2;->this$2:Lcom/etralab/appstoreforandroid/HomeFragment$1$1;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/HomeFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 198
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ClassificationActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "appClassification"

    const-string v2, "\u6700\u65b0\u4e0a\u67b6"

    .line 199
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "appClassificationEn"

    const-string v2, "NewArrival"

    .line 200
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 201
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
