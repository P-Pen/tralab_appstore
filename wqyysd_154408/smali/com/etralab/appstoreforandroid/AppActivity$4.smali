.class Lcom/etralab/appstoreforandroid/AppActivity$4;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Lcom/etralab/appstoreforandroid/OnDoubleClickListener$DoubleClickCallback;


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

    .line 141
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$4;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDoubleClick()V
    .locals 2

    .line 145
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$4;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v1, Lcom/etralab/appstoreforandroid/AppActivity$4$1;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/AppActivity$4$1;-><init>(Lcom/etralab/appstoreforandroid/AppActivity$4;)V

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
