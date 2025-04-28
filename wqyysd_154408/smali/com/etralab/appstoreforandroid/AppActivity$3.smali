.class Lcom/etralab/appstoreforandroid/AppActivity$3;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/AppActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 124
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 127
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v0, Lcom/etralab/appstoreforandroid/AppActivity$3$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AppActivity$3$1;-><init>(Lcom/etralab/appstoreforandroid/AppActivity$3;)V

    invoke-virtual {p1, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
