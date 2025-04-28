.class Lcom/etralab/appstoreforandroid/AboutActivity$1;
.super Ljava/lang/Object;
.source "AboutActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AboutActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/AboutActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AboutActivity;)V
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AboutActivity$1;->this$0:Lcom/etralab/appstoreforandroid/AboutActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 27
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AboutActivity$1;->this$0:Lcom/etralab/appstoreforandroid/AboutActivity;

    iget v0, p1, Lcom/etralab/appstoreforandroid/AboutActivity;->tv_buildCode_clickNumber:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p1, Lcom/etralab/appstoreforandroid/AboutActivity;->tv_buildCode_clickNumber:I

    .line 28
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AboutActivity$1;->this$0:Lcom/etralab/appstoreforandroid/AboutActivity;

    iget p1, p1, Lcom/etralab/appstoreforandroid/AboutActivity;->tv_buildCode_clickNumber:I

    const/4 v0, 0x5

    if-lt p1, v0, :cond_0

    .line 30
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AboutActivity$1;->this$0:Lcom/etralab/appstoreforandroid/AboutActivity;

    const-class v1, Lcom/etralab/appstoreforandroid/DeveloperOptionActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 31
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AboutActivity$1;->this$0:Lcom/etralab/appstoreforandroid/AboutActivity;

    invoke-virtual {v0, p1}, Lcom/etralab/appstoreforandroid/AboutActivity;->startActivity(Landroid/content/Intent;)V

    .line 33
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AboutActivity$1;->this$0:Lcom/etralab/appstoreforandroid/AboutActivity;

    const/4 v0, 0x0

    iput v0, p1, Lcom/etralab/appstoreforandroid/AboutActivity;->tv_buildCode_clickNumber:I

    :cond_0
    return-void
.end method
