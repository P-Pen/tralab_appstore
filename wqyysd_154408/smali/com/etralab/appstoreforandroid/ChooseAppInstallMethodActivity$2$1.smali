.class Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2$1;
.super Ljava/lang/Object;
.source "ChooseAppInstallMethodActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2;)V
    .locals 0

    .line 53
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2$1;->this$1:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 56
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2$1;->this$1:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2;->val$iv_use_package_installer:Landroid/widget/ImageView;

    const v1, 0x7f07016a

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 57
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2$1;->this$1:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2;->val$iv_use_wlan_adb:Landroid/widget/ImageView;

    const v1, 0x7f070169

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method
