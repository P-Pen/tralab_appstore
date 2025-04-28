.class Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$1;
.super Ljava/lang/Object;
.source "ChooseAppInstallMethodActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;)V
    .locals 0

    .line 40
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 43
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    const-class v1, Lcom/etralab/appstoreforandroid/HelpForChooseApkInstallMethodActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 44
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-virtual {v0, p1}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
