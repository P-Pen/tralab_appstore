.class public Lcom/etralab/appstoreforandroid/HelpForChooseApkInstallMethodActivity;
.super Landroid/app/Activity;
.source "HelpForChooseApkInstallMethodActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 9
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 13
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 15
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/HelpForChooseApkInstallMethodActivity;->requestWindowFeature(I)Z

    const p1, 0x7f0b0030

    .line 16
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/HelpForChooseApkInstallMethodActivity;->setContentView(I)V

    const p1, 0x7f080068

    .line 19
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/HelpForChooseApkInstallMethodActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 20
    new-instance v0, Lcom/etralab/appstoreforandroid/HelpForChooseApkInstallMethodActivity$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/HelpForChooseApkInstallMethodActivity$1;-><init>(Lcom/etralab/appstoreforandroid/HelpForChooseApkInstallMethodActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
