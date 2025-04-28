.class public Lcom/etralab/appstoreforandroid/MineFragment;
.super Landroidx/fragment/app/Fragment;
.source "MineFragment.java"


# instance fields
.field currentVersionCode:J

.field latestVersionCode:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 28
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    const-wide/16 v0, 0x0

    .line 30
    iput-wide v0, p0, Lcom/etralab/appstoreforandroid/MineFragment;->latestVersionCode:J

    .line 31
    iput-wide v0, p0, Lcom/etralab/appstoreforandroid/MineFragment;->currentVersionCode:J

    return-void
.end method

.method private CheckForUpdatesByVersionCode()V
    .locals 1

    .line 114
    new-instance v0, Lcom/etralab/appstoreforandroid/MineFragment$6;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/MineFragment$6;-><init>(Lcom/etralab/appstoreforandroid/MineFragment;)V

    .line 159
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/MineFragment$6;->start()V

    return-void
.end method

.method public static getAppVersionCode(Landroid/content/Context;)J
    .locals 2

    .line 165
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 166
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 167
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    .line 168
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 169
    invoke-virtual {p0}, Landroid/content/pm/PackageInfo;->getLongVersionCode()J

    move-result-wide v0

    goto :goto_0

    .line 171
    :cond_0
    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    int-to-long v0, p0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 174
    invoke-virtual {p0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object p0

    const-string v0, ""

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method


# virtual methods
.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 1

    .line 68
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 71
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/MineFragment;->CheckForUpdatesByVersionCode()V

    .line 74
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MineFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f080136

    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 75
    new-instance v0, Lcom/etralab/appstoreforandroid/MineFragment$2;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/MineFragment$2;-><init>(Lcom/etralab/appstoreforandroid/MineFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 84
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MineFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f08015e

    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 85
    new-instance v0, Lcom/etralab/appstoreforandroid/MineFragment$3;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/MineFragment$3;-><init>(Lcom/etralab/appstoreforandroid/MineFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 94
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MineFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f080139

    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 95
    new-instance v0, Lcom/etralab/appstoreforandroid/MineFragment$4;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/MineFragment$4;-><init>(Lcom/etralab/appstoreforandroid/MineFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 102
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MineFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f08015d

    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 103
    new-instance v0, Lcom/etralab/appstoreforandroid/MineFragment$5;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/MineFragment$5;-><init>(Lcom/etralab/appstoreforandroid/MineFragment;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 3

    .line 37
    new-instance p3, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MineFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "CircleLayout.txt"

    invoke-direct {p3, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 38
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MineFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "SquareLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 39
    invoke-virtual {p3}, Ljava/io/File;->exists()Z

    move-result p3

    const v1, 0x7f0b005c

    const/4 v2, 0x0

    if-eqz p3, :cond_0

    .line 40
    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1

    .line 41
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result p3

    if-eqz p3, :cond_1

    const p3, 0x7f0b005d

    .line 42
    invoke-virtual {p1, p3, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1

    .line 44
    :cond_1
    invoke-virtual {p1, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public onResume()V
    .locals 6

    .line 50
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    .line 52
    iget-wide v0, p0, Lcom/etralab/appstoreforandroid/MineFragment;->latestVersionCode:J

    const-wide/16 v2, 0x0

    cmp-long v4, v0, v2

    if-eqz v4, :cond_0

    iget-wide v4, p0, Lcom/etralab/appstoreforandroid/MineFragment;->currentVersionCode:J

    cmp-long v2, v4, v2

    if-eqz v2, :cond_0

    cmp-long v0, v4, v0

    if-gez v0, :cond_0

    .line 54
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/MineFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Lcom/etralab/appstoreforandroid/MineFragment$1;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/MineFragment$1;-><init>(Lcom/etralab/appstoreforandroid/MineFragment;)V

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    :cond_0
    return-void
.end method
