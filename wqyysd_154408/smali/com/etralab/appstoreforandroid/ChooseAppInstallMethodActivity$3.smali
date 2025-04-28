.class Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$3;
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

.field final synthetic val$iv_use_package_installer:Landroid/widget/ImageView;

.field final synthetic val$iv_use_wlan_adb:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;Landroid/widget/ImageView;Landroid/widget/ImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 63
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$3;->val$iv_use_package_installer:Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$3;->val$iv_use_wlan_adb:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 1

    .line 66
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    const/4 v0, 0x2

    iput v0, p1, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->apkInstallMethodId:I

    .line 67
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    new-instance v0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$3$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$3$1;-><init>(Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$3;)V

    invoke-virtual {p1, v0}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
