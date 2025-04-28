.class public Lcom/etralab/appstoreforandroid/ClearDataActivity;
.super Landroid/app/Activity;
.source "ClearDataActivity.java"


# instance fields
.field isCheckBoxApplicationDataFull:Z

.field isCheckBoxCacheDataFull:Z


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private OnClickCheckBox()V
    .locals 5

    const v0, 0x7f08012a

    .line 128
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    const v1, 0x7f080126

    .line 129
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/LinearLayout;

    const v2, 0x7f0800d9

    .line 131
    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ImageView;

    const v3, 0x7f0800d7

    .line 132
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/ImageView;

    .line 135
    new-instance v4, Lcom/etralab/appstoreforandroid/ClearDataActivity$2;

    invoke-direct {v4, p0, v2}, Lcom/etralab/appstoreforandroid/ClearDataActivity$2;-><init>(Lcom/etralab/appstoreforandroid/ClearDataActivity;Landroid/widget/ImageView;)V

    invoke-virtual {v0, v4}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 162
    new-instance v0, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;

    invoke-direct {v0, p0, v2, v3}, Lcom/etralab/appstoreforandroid/ClearDataActivity$3;-><init>(Lcom/etralab/appstoreforandroid/ClearDataActivity;Landroid/widget/ImageView;Landroid/widget/ImageView;)V

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private ShowCacheDirSize()V
    .locals 6

    const v0, 0x7f080237

    .line 194
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 196
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 197
    new-instance v2, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 199
    invoke-direct {p0, v1}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getDirSize(Ljava/io/File;)J

    move-result-wide v3

    .line 200
    invoke-direct {p0, v2}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getDirSize(Ljava/io/File;)J

    move-result-wide v1

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    add-long/2addr v3, v1

    long-to-float v1, v3

    const/high16 v2, 0x44800000    # 1024.0f

    div-float/2addr v1, v2

    div-float/2addr v1, v2

    .line 202
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v5, v2

    const-string v1, "%.1f"

    invoke-static {v1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 204
    new-instance v2, Lcom/etralab/appstoreforandroid/ClearDataActivity$4;

    invoke-direct {v2, p0, v0, v1}, Lcom/etralab/appstoreforandroid/ClearDataActivity$4;-><init>(Lcom/etralab/appstoreforandroid/ClearDataActivity;Landroid/widget/TextView;Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method private ShowFilesDirSize()V
    .locals 6

    const v0, 0x7f080232

    .line 214
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    .line 216
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 217
    new-instance v2, Ljava/io/File;

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 219
    invoke-direct {p0, v1}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getDirSize(Ljava/io/File;)J

    move-result-wide v3

    .line 220
    invoke-direct {p0, v2}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getDirSize(Ljava/io/File;)J

    move-result-wide v1

    const/4 v5, 0x1

    new-array v5, v5, [Ljava/lang/Object;

    add-long/2addr v3, v1

    long-to-float v1, v3

    const/high16 v2, 0x44800000    # 1024.0f

    div-float/2addr v1, v2

    .line 222
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v5, v2

    const-string v1, "%.1f"

    invoke-static {v1, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 224
    new-instance v2, Lcom/etralab/appstoreforandroid/ClearDataActivity$5;

    invoke-direct {v2, p0, v0, v1}, Lcom/etralab/appstoreforandroid/ClearDataActivity$5;-><init>(Lcom/etralab/appstoreforandroid/ClearDataActivity;Landroid/widget/TextView;Ljava/lang/String;)V

    invoke-virtual {p0, v2}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/ClearDataActivity;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->ShowCacheDirSize()V

    return-void
.end method

.method static synthetic access$100(Lcom/etralab/appstoreforandroid/ClearDataActivity;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->ShowFilesDirSize()V

    return-void
.end method

.method private getDirSize(Ljava/io/File;)J
    .locals 5

    const-wide/16 v0, 0x0

    .line 235
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p1

    const/4 v2, 0x0

    .line 236
    :goto_0
    array-length v3, p1

    if-ge v2, v3, :cond_1

    .line 237
    aget-object v3, p1, v2

    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v3

    if-eqz v3, :cond_0

    aget-object v3, p1, v2

    invoke-direct {p0, v3}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getDirSize(Ljava/io/File;)J

    move-result-wide v3

    goto :goto_1

    .line 238
    :cond_0
    aget-object v3, p1, v2

    invoke-virtual {v3}, Ljava/io/File;->length()J

    move-result-wide v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_1
    add-long/2addr v0, v3

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :catch_0
    move-exception p1

    .line 241
    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V

    :cond_1
    return-wide v0
.end method


# virtual methods
.method ClickToBackLastActivity()V
    .locals 2

    const v0, 0x7f080127

    .line 250
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 251
    new-instance v1, Lcom/etralab/appstoreforandroid/ClearDataActivity$6;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity$6;-><init>(Lcom/etralab/appstoreforandroid/ClearDataActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 23
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 25
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->requestWindowFeature(I)Z

    .line 27
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->setLayout()V

    .line 30
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->ClickToBackLastActivity()V

    .line 33
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->ShowCacheDirSize()V

    .line 35
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->ShowFilesDirSize()V

    .line 38
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->OnClickCheckBox()V

    const p1, 0x7f0800d9

    .line 41
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    const v0, 0x7f0800d7

    .line 42
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    const v1, 0x7f080064

    .line 44
    invoke-virtual {p0, v1}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 46
    new-instance v2, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;

    invoke-direct {v2, p0, p1, v0}, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;-><init>(Lcom/etralab/appstoreforandroid/ClearDataActivity;Landroid/widget/ImageView;Landroid/widget/ImageView;)V

    invoke-virtual {v1, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method setLayout()V
    .locals 4

    .line 107
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "CircleLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 108
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "SquareLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 109
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    const v3, 0x7f0b0027

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 110
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->setContentView(I)V

    .line 111
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 112
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->startActivity(Landroid/content/Intent;)V

    .line 113
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->finish()V

    goto :goto_0

    .line 114
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 115
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->setContentView(I)V

    goto :goto_0

    .line 116
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0b0028

    .line 117
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->setContentView(I)V

    goto :goto_0

    .line 119
    :cond_2
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->setContentView(I)V

    .line 120
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 121
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->startActivity(Landroid/content/Intent;)V

    .line 122
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->finish()V

    :goto_0
    return-void
.end method
