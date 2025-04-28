.class Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "ScreenshotActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etralab/appstoreforandroid/ScreenshotActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewData"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;


# direct methods
.method public constructor <init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity;Landroid/view/View;)V
    .locals 0

    .line 102
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    .line 103
    invoke-direct {p0, p2}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public findViewHolderById(I)Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .line 133
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;->itemView:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public setScreenshotDownloadUrl(ILjava/lang/String;)V
    .locals 2

    .line 107
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;->findViewHolderById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    .line 110
    new-instance v0, Lcom/bumptech/glide/request/RequestOptions;

    invoke-direct {v0}, Lcom/bumptech/glide/request/RequestOptions;-><init>()V

    const v1, 0x7f0700f3

    .line 111
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->placeholder(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 112
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->fallback(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 113
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->error(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    const/high16 v1, -0x80000000

    .line 114
    invoke-virtual {v0, v1, v1}, Lcom/bumptech/glide/request/RequestOptions;->override(II)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    sget-object v1, Lcom/bumptech/glide/load/DecodeFormat;->PREFER_RGB_565:Lcom/bumptech/glide/load/DecodeFormat;

    .line 115
    invoke-virtual {v0, v1}, Lcom/bumptech/glide/request/RequestOptions;->format(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object v0

    .line 118
    invoke-static {p1}, Lcom/bumptech/glide/Glide;->with(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;

    move-result-object v1

    .line 119
    invoke-virtual {v1, p2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p2

    .line 120
    invoke-virtual {p2, v0}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p2

    .line 121
    invoke-virtual {p2, p1}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    .line 124
    new-instance p2, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData$1;

    invoke-direct {p2, p0}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData$1;-><init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;)V

    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
