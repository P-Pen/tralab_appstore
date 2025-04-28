.class public Lcom/etralab/appstoreforandroid/SearchActivity;
.super Landroid/app/Activity;
.source "SearchActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 16
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method

.method private ClickToBackLastActivity()V
    .locals 2

    const v0, 0x7f080127

    .line 94
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 95
    new-instance v1, Lcom/etralab/appstoreforandroid/SearchActivity$3;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/SearchActivity$3;-><init>(Lcom/etralab/appstoreforandroid/SearchActivity;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method private Search()V
    .locals 3

    const v0, 0x7f0800aa

    .line 57
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/EditText;

    .line 58
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, ""

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 60
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/etralab/appstoreforandroid/SearchResultActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 61
    invoke-virtual {v0}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "searchText"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 62
    invoke-virtual {p0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 64
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchActivity;->finish()V

    goto :goto_0

    .line 66
    :cond_0
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchActivity;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "\u8bf7\u5148\u8f93\u5165\u641c\u7d22\u5185\u5bb9"

    invoke-static {v0, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    :goto_0
    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/SearchActivity;)V
    .locals 0

    .line 16
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/SearchActivity;->Search()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 20
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 22
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SearchActivity;->requestWindowFeature(I)Z

    .line 24
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchActivity;->setLayout()V

    .line 27
    invoke-direct {p0}, Lcom/etralab/appstoreforandroid/SearchActivity;->ClickToBackLastActivity()V

    const p1, 0x7f0800aa

    .line 29
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/EditText;

    .line 31
    new-instance v0, Lcom/etralab/appstoreforandroid/SearchActivity$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SearchActivity$1;-><init>(Lcom/etralab/appstoreforandroid/SearchActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/EditText;->setOnKeyListener(Landroid/view/View$OnKeyListener;)V

    const p1, 0x7f08015b

    .line 45
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/SearchActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/LinearLayout;

    .line 46
    new-instance v0, Lcom/etralab/appstoreforandroid/SearchActivity$2;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/SearchActivity$2;-><init>(Lcom/etralab/appstoreforandroid/SearchActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method setLayout()V
    .locals 4

    .line 73
    new-instance v0, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "CircleLayout.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 74
    new-instance v1, Ljava/io/File;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v3, "SquareLayout.txt"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 75
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    const v3, 0x7f0b003a

    if-eqz v2, :cond_0

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 76
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SearchActivity;->setContentView(I)V

    .line 77
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 78
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SearchActivity;->startActivity(Landroid/content/Intent;)V

    .line 79
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchActivity;->finish()V

    goto :goto_0

    .line 80
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 81
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SearchActivity;->setContentView(I)V

    goto :goto_0

    .line 82
    :cond_1
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    const v0, 0x7f0b003d

    .line 83
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SearchActivity;->setContentView(I)V

    goto :goto_0

    .line 85
    :cond_2
    invoke-virtual {p0, v3}, Lcom/etralab/appstoreforandroid/SearchActivity;->setContentView(I)V

    .line 86
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 87
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/SearchActivity;->startActivity(Landroid/content/Intent;)V

    .line 88
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/SearchActivity;->finish()V

    :goto_0
    return-void
.end method
