.class public Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;
.super Landroid/app/Activity;
.source "SupportUsWithAlipayActivity.java"


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

    .line 50
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 51
    new-instance v1, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity$1;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity$1;-><init>(Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 16
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 18
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->requestWindowFeature(I)Z

    .line 20
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->setLayout()V

    .line 23
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->ClickToBackLastActivity()V

    return-void
.end method

.method setLayout()V
    .locals 4

    .line 29
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "CircleLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 30
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "SquareLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 31
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    const v3, 0x7f0b0042

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 32
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->setContentView(I)V

    .line 33
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 34
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->startActivity(Landroid/content/Intent;)V

    .line 35
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->finish()V

    goto :goto_0

    .line 36
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 37
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->setContentView(I)V

    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0b0043

    .line 39
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->setContentView(I)V

    goto :goto_0

    .line 41
    :cond_2
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->setContentView(I)V

    .line 42
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 43
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->startActivity(Landroid/content/Intent;)V

    .line 44
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->finish()V

    :goto_0
    return-void
.end method
