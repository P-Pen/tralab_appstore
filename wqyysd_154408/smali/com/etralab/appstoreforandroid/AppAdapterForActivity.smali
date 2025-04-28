.class public Lcom/etralab/appstoreforandroid/AppAdapterForActivity;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "AppAdapterForActivity.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;",
        ">;"
    }
.end annotation


# instance fields
.field private mAppList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/etralab/appstoreforandroid/App;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/app/Activity;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Lcom/etralab/appstoreforandroid/App;",
            ">;)V"
        }
    .end annotation

    .line 47
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 48
    iput-object p2, p0, Lcom/etralab/appstoreforandroid/AppAdapterForActivity;->mAppList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 106
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppAdapterForActivity;->mAppList:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 23
    check-cast p1, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;

    invoke-virtual {p0, p1, p2}, Lcom/etralab/appstoreforandroid/AppAdapterForActivity;->onBindViewHolder(Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;I)V
    .locals 3

    .line 75
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppAdapterForActivity;->mAppList:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/etralab/appstoreforandroid/App;

    .line 78
    new-instance v0, Lcom/bumptech/glide/request/RequestOptions;

    invoke-direct {v0}, Lcom/bumptech/glide/request/RequestOptions;-><init>()V

    const v1, 0x7f0700f2

    .line 79
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->placeholder(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 80
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->fallback(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 81
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->error(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    const/high16 v1, -0x80000000

    .line 82
    invoke-virtual {v0, v1, v1}, Lcom/bumptech/glide/request/RequestOptions;->override(II)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/load/DecodeFormat;->PREFER_RGB_565:Lcom/bumptech/glide/load/DecodeFormat;

    .line 83
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->format(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 85
    iget-object v1, p1, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;->appLogo:Lcom/etralab/appstoreforandroid/MyImageView;

    invoke-static {v1}, Lcom/bumptech/glide/Glide;->with(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    .line 86
    invoke-virtual {p2}, Lcom/etralab/appstoreforandroid/App;->getAppLogoUrl()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v1

    .line 87
    invoke-virtual {v1, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object v0

    iget-object v1, p1, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;->appLogo:Lcom/etralab/appstoreforandroid/MyImageView;

    .line 88
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    .line 90
    iget-object v0, p1, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;->appId:Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/etralab/appstoreforandroid/App;->getAppId()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 91
    iget-object v0, p1, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;->appName:Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/etralab/appstoreforandroid/App;->getAppName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 92
    iget-object v0, p1, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;->appDownloadNumber:Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/etralab/appstoreforandroid/App;->getAppDownloadNumber()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/NumUnitConversionUtil;->NumUnitConversion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 93
    iget-object v0, p1, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;->appLikeNumber:Landroid/widget/TextView;

    invoke-virtual {p2}, Lcom/etralab/appstoreforandroid/App;->getAppLikeNumber()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/NumUnitConversionUtil;->NumUnitConversion(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 95
    invoke-virtual {p2}, Lcom/etralab/appstoreforandroid/App;->getAppOsType()Ljava/lang/String;

    move-result-object v0

    const-string v1, "0"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 96
    iget-object p1, p1, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;->appOsType:Landroid/widget/ImageView;

    const p2, 0x7f07017d

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 97
    :cond_0
    invoke-virtual {p2}, Lcom/etralab/appstoreforandroid/App;->getAppOsType()Ljava/lang/String;

    move-result-object p2

    const-string v0, "1"

    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 98
    iget-object p1, p1, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;->appOsType:Landroid/widget/ImageView;

    const p2, 0x7f0700f1

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    goto :goto_0

    .line 100
    :cond_1
    iget-object p1, p1, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;->appOsType:Landroid/widget/ImageView;

    const p2, 0x7f0700f0

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    :goto_0
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 23
    invoke-virtual {p0, p1, p2}, Lcom/etralab/appstoreforandroid/AppAdapterForActivity;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;
    .locals 2

    .line 54
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b005f

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 55
    new-instance v0, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;

    invoke-direct {v0, p2}, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;-><init>(Landroid/view/View;)V

    .line 57
    iget-object p2, v0, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;->itemView:Landroid/view/View;

    new-instance v1, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$1;

    invoke-direct {v1, p0, p1, v0}, Lcom/etralab/appstoreforandroid/AppAdapterForActivity$1;-><init>(Lcom/etralab/appstoreforandroid/AppAdapterForActivity;Landroid/view/ViewGroup;Lcom/etralab/appstoreforandroid/AppAdapterForActivity$ViewHolder;)V

    invoke-virtual {p2, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object v0
.end method
