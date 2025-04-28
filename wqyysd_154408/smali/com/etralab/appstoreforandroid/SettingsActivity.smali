.class public Lcom/etralab/appstoreforandroid/SettingsActivity;
.super Landroid/app/Activity;
.source "SettingsActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 25
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private CheckForUpdatesByVersionCode()V
    .locals 1

    .line 130
    new-instance v0, Lcom/etralab/appstoreforandroid/SettingsActivity$9;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SettingsActivity$9;-><init>(Lcom/etralab/appstoreforandroid/SettingsActivity;)V

    .line 187
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/SettingsActivity$9;->start()V

    return-void
.end method

.method private ClickToBackLastActivity()V
    .locals 2

    const v0, 0x7f080127

    .line 231
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 232
    new-instance v1, Lcom/etralab/appstoreforandroid/SettingsActivity$10;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/SettingsActivity$10;-><init>(Lcom/etralab/appstoreforandroid/SettingsActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public static getAppVersionCode(Landroid/content/Context;)J
    .locals 2

    .line 193
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    .line 194
    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 195
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    invoke-virtual {v0, p0, v1}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object p0

    .line 196
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_0

    .line 197
    invoke-virtual {p0}, Landroid/content/pm/PackageInfo;->getLongVersionCode()J

    move-result-wide v0

    goto :goto_0

    .line 199
    :cond_0
    iget p0, p0, Landroid/content/pm/PackageInfo;->versionCode:I
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    int-to-long v0, p0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 202
    invoke-virtual {p0}, Landroid/content/pm/PackageManager$NameNotFoundException;->getMessage()Ljava/lang/String;

    move-result-object p0

    const-string v0, ""

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 29
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 31
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SettingsActivity;->requestWindowFeature(I)Z

    .line 33
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SettingsActivity;->setLayout()V

    .line 36
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/SettingsActivity;->ClickToBackLastActivity()V

    .line 39
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/SettingsActivity;->CheckForUpdatesByVersionCode()V

    const p1, 0x7f08013e

    .line 42
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 43
    new-instance v0, Lcom/etralab/appstoreforandroid/SettingsActivity$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SettingsActivity$1;-><init>(Lcom/etralab/appstoreforandroid/SettingsActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f08012e

    .line 55
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 56
    new-instance v0, Lcom/etralab/appstoreforandroid/SettingsActivity$2;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SettingsActivity$2;-><init>(Lcom/etralab/appstoreforandroid/SettingsActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f08012f

    .line 65
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 66
    new-instance v0, Lcom/etralab/appstoreforandroid/SettingsActivity$3;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SettingsActivity$3;-><init>(Lcom/etralab/appstoreforandroid/SettingsActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f080130

    .line 76
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 77
    new-instance v0, Lcom/etralab/appstoreforandroid/SettingsActivity$4;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SettingsActivity$4;-><init>(Lcom/etralab/appstoreforandroid/SettingsActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f08016a

    .line 86
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 87
    new-instance v0, Lcom/etralab/appstoreforandroid/SettingsActivity$5;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SettingsActivity$5;-><init>(Lcom/etralab/appstoreforandroid/SettingsActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f080160

    .line 96
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 97
    new-instance v0, Lcom/etralab/appstoreforandroid/SettingsActivity$6;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SettingsActivity$6;-><init>(Lcom/etralab/appstoreforandroid/SettingsActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f08012c

    .line 106
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 107
    new-instance v0, Lcom/etralab/appstoreforandroid/SettingsActivity$7;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SettingsActivity$7;-><init>(Lcom/etralab/appstoreforandroid/SettingsActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f080124

    .line 116
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 117
    new-instance v0, Lcom/etralab/appstoreforandroid/SettingsActivity$8;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SettingsActivity$8;-><init>(Lcom/etralab/appstoreforandroid/SettingsActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const p1, 0x7f080200

    .line 126
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SettingsActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextClock;

    return-void
.end method

.method setLayout()V
    .locals 4

    .line 210
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SettingsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "CircleLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 211
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SettingsActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "SquareLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 212
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    const v3, 0x7f0b003e

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 213
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SettingsActivity;->setContentView(I)V

    .line 214
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 215
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SettingsActivity;->startActivity(Landroid/content/Intent;)V

    .line 216
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SettingsActivity;->finish()V

    goto :goto_0

    .line 217
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 218
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SettingsActivity;->setContentView(I)V

    goto :goto_0

    .line 219
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0b003f

    .line 220
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SettingsActivity;->setContentView(I)V

    goto :goto_0

    .line 222
    :cond_2
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SettingsActivity;->setContentView(I)V

    .line 223
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 224
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SettingsActivity;->startActivity(Landroid/content/Intent;)V

    .line 225
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SettingsActivity;->finish()V

    :goto_0
    return-void
.end method
