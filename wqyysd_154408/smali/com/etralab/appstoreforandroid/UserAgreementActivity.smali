.class public Lcom/etralab/appstoreforandroid/UserAgreementActivity;
.super Landroid/app/Activity;
.source "UserAgreementActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 21
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 100
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 104
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 2

    .line 25
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 27
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/UserAgreementActivity;->requestWindowFeature(I)Z

    const p1, 0x7f0b0046

    .line 28
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/UserAgreementActivity;->setContentView(I)V

    const p1, 0x7f080062

    .line 51
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/UserAgreementActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    const v0, 0x7f080066

    .line 52
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/UserAgreementActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 55
    new-instance v1, Lcom/etralab/appstoreforandroid/UserAgreementActivity$1;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/UserAgreementActivity$1;-><init>(Lcom/etralab/appstoreforandroid/UserAgreementActivity;)V

    invoke-virtual {p1, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 72
    new-instance p1, Lcom/etralab/appstoreforandroid/UserAgreementActivity$2;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/UserAgreementActivity$2;-><init>(Lcom/etralab/appstoreforandroid/UserAgreementActivity;)V

    invoke-virtual {v0, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 3

    .line 89
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/UserAgreementActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "isUserAgreementAgree4"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 90
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 92
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/UserAgreementActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 93
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/UserAgreementActivity;->startActivity(Landroid/content/Intent;)V

    .line 95
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method
