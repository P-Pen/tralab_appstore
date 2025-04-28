.class Lcom/etralab/appstoreforandroid/SupportUsActivity$2;
.super Ljava/lang/Object;
.source "SupportUsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/SupportUsActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/SupportUsActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/SupportUsActivity;)V
    .locals 0

    .line 36
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SupportUsActivity$2;->this$0:Lcom/etralab/appstoreforandroid/SupportUsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 39
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/SupportUsActivity$2;->this$0:Lcom/etralab/appstoreforandroid/SupportUsActivity;

    const-class v1, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 40
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/SupportUsActivity$2;->this$0:Lcom/etralab/appstoreforandroid/SupportUsActivity;

    invoke-virtual {v0, p1}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
