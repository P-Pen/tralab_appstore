.class public Lcom/etralab/appstoreforandroid/SupportUsActivity;
.super Landroid/app/Activity;
.source "SupportUsActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 12
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private ClickToBackLastActivity()V
    .locals 2

    const v0, 0x7f080127

    .line 70
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 71
    new-instance v1, Lcom/etralab/appstoreforandroid/SupportUsActivity$3;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/SupportUsActivity$3;-><init>(Lcom/etralab/appstoreforandroid/SupportUsActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 16
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 18
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->requestWindowFeature(I)Z

    .line 20
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->setLayout()V

    .line 23
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->ClickToBackLastActivity()V

    const p1, 0x7f080162

    .line 26
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 27
    new-instance v0, Lcom/etralab/appstoreforandroid/SupportUsActivity$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SupportUsActivity$1;-><init>(Lcom/etralab/appstoreforandroid/SupportUsActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f080161

    .line 35
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 36
    new-instance v0, Lcom/etralab/appstoreforandroid/SupportUsActivity$2;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SupportUsActivity$2;-><init>(Lcom/etralab/appstoreforandroid/SupportUsActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method setLayout()V
    .locals 4

    .line 49
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "CircleLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 50
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "SquareLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 51
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    const v3, 0x7f0b0040

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 52
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->setContentView(I)V

    .line 53
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 54
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->startActivity(Landroid/content/Intent;)V

    .line 55
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->finish()V

    goto :goto_0

    .line 56
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 57
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->setContentView(I)V

    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0b0041

    .line 59
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->setContentView(I)V

    goto :goto_0

    .line 61
    :cond_2
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->setContentView(I)V

    .line 62
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 63
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->startActivity(Landroid/content/Intent;)V

    .line 64
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->finish()V

    :goto_0
    return-void
.end method
