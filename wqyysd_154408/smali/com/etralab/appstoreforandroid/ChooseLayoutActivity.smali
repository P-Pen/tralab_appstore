.class public Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;
.super Landroid/app/Activity;
.source "ChooseLayoutActivity.java"


# instance fields
.field layoutId:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 121
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 125
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 21
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 23
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->requestWindowFeature(I)Z

    const p1, 0x7f0b0024

    .line 24
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->setContentView(I)V

    const p1, 0x7f080112

    .line 26
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    const v0, 0x7f0800da

    .line 27
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f080063

    .line 29
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 32
    new-instance v2, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1;

    invoke-direct {v2, p0, p1, v0}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$1;-><init>(Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;Landroid/widget/ImageView;Landroid/widget/ImageView;)V

    invoke-virtual {p1, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 46
    new-instance v2, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$2;

    invoke-direct {v2, p0, p1, v0}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$2;-><init>(Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;Landroid/widget/ImageView;Landroid/widget/ImageView;)V

    invoke-virtual {v0, v2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 60
    new-instance p1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;-><init>(Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;)V

    invoke-virtual {v1, p1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 4

    .line 110
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "SquareLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 111
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "CircleLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 112
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 113
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 114
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->startActivity(Landroid/content/Intent;)V

    .line 116
    :cond_0
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    return-void
.end method
