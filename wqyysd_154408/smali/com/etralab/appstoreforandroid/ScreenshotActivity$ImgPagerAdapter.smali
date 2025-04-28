.class Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "ScreenshotActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etralab/appstoreforandroid/ScreenshotActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ImgPagerAdapter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;


# direct methods
.method private constructor <init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity;)V
    .locals 0

    .line 137
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity;Lcom/etralab/appstoreforandroid/ScreenshotActivity$1;)V
    .locals 0

    .line 137
    invoke-direct {p0, p1}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;-><init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity;)V

    return-void
.end method


# virtual methods
.method public getItemCount()I
    .locals 1

    .line 169
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->viewList:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0

    .line 137
    check-cast p1, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;

    invoke-virtual {p0, p1, p2}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;->onBindViewHolder(Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;I)V

    return-void
.end method

.method public onBindViewHolder(Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;I)V
    .locals 2

    const v0, 0x7f080110

    if-nez p2, :cond_0

    .line 149
    iget-object p2, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    iget-object p2, p2, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->appScreenshotUrlList:[Ljava/lang/String;

    const/4 v1, 0x0

    aget-object p2, p2, v1

    invoke-virtual {p1, v0, p2}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;->setScreenshotDownloadUrl(ILjava/lang/String;)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    if-ne p2, v1, :cond_1

    .line 151
    iget-object p2, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    iget-object p2, p2, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->appScreenshotUrlList:[Ljava/lang/String;

    aget-object p2, p2, v1

    invoke-virtual {p1, v0, p2}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;->setScreenshotDownloadUrl(ILjava/lang/String;)V

    goto :goto_0

    :cond_1
    const/4 v1, 0x2

    if-ne p2, v1, :cond_2

    .line 153
    iget-object p2, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    iget-object p2, p2, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->appScreenshotUrlList:[Ljava/lang/String;

    aget-object p2, p2, v1

    invoke-virtual {p1, v0, p2}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;->setScreenshotDownloadUrl(ILjava/lang/String;)V

    goto :goto_0

    :cond_2
    const/4 v1, 0x3

    if-ne p2, v1, :cond_3

    .line 155
    iget-object p2, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    iget-object p2, p2, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->appScreenshotUrlList:[Ljava/lang/String;

    aget-object p2, p2, v1

    invoke-virtual {p1, v0, p2}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;->setScreenshotDownloadUrl(ILjava/lang/String;)V

    goto :goto_0

    :cond_3
    const/4 v1, 0x4

    if-ne p2, v1, :cond_4

    .line 157
    iget-object p2, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    iget-object p2, p2, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->appScreenshotUrlList:[Ljava/lang/String;

    aget-object p2, p2, v1

    invoke-virtual {p1, v0, p2}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;->setScreenshotDownloadUrl(ILjava/lang/String;)V

    goto :goto_0

    :cond_4
    const/4 v1, 0x5

    if-ne p2, v1, :cond_5

    .line 159
    iget-object p2, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    iget-object p2, p2, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->appScreenshotUrlList:[Ljava/lang/String;

    aget-object p2, p2, v1

    invoke-virtual {p1, v0, p2}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;->setScreenshotDownloadUrl(ILjava/lang/String;)V

    goto :goto_0

    :cond_5
    const/4 v1, 0x6

    if-ne p2, v1, :cond_6

    .line 161
    iget-object p2, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    iget-object p2, p2, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->appScreenshotUrlList:[Ljava/lang/String;

    aget-object p2, p2, v1

    invoke-virtual {p1, v0, p2}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;->setScreenshotDownloadUrl(ILjava/lang/String;)V

    goto :goto_0

    :cond_6
    const/4 v1, 0x7

    if-ne p2, v1, :cond_7

    .line 163
    iget-object p2, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    iget-object p2, p2, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->appScreenshotUrlList:[Ljava/lang/String;

    aget-object p2, p2, v1

    invoke-virtual {p1, v0, p2}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;->setScreenshotDownloadUrl(ILjava/lang/String;)V

    :cond_7
    :goto_0
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0

    .line 137
    invoke-virtual {p0, p1, p2}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;

    move-result-object p1

    return-object p1
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;
    .locals 2

    .line 142
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v0, 0x7f0b0061

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    .line 143
    new-instance p2, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ImgPagerAdapter;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    invoke-direct {p2, v0, p1}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;-><init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity;Landroid/view/View;)V

    return-object p2
.end method
