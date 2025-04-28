.class public Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;
.super Landroid/app/Activity;
.source "ChooseAppInstallMethodActivity.java"


# instance fields
.field apkInstallMethodId:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 19
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    .line 21
    iput v0, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->apkInstallMethodId:I

    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 131
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 135
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 6

    .line 25
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 27
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->requestWindowFeature(I)Z

    const p1, 0x7f0b0023

    .line 28
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->setContentView(I)V

    const p1, 0x7f08013f

    .line 30
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    const v0, 0x7f080168

    .line 32
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const v1, 0x7f080169

    .line 33
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    const v2, 0x7f080114

    .line 35
    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const v3, 0x7f080115

    .line 36
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    const v4, 0x7f080063

    .line 38
    invoke-virtual {p0, v4}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/Button;

    .line 40
    new-instance v5, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$1;

    invoke-direct {v5, p0}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$1;-><init>(Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;)V

    invoke-virtual {p1, v5}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 49
    new-instance p1, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2;

    invoke-direct {p1, p0, v2, v3}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$2;-><init>(Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;Landroid/widget/ImageView;Landroid/widget/ImageView;)V

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 63
    new-instance p1, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$3;

    invoke-direct {p1, p0, v2, v3}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$3;-><init>(Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;Landroid/widget/ImageView;Landroid/widget/ImageView;)V

    invoke-virtual {v1, p1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 77
    new-instance p1, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$4;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$4;-><init>(Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;)V

    invoke-virtual {v4, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 4

    .line 120
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "UsePackageInstaller.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 121
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "UseWlanAdb.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 122
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 123
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 124
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->startActivity(Landroid/content/Intent;)V

    .line 126
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method
