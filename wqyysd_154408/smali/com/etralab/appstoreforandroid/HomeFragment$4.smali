.class Lcom/etralab/appstoreforandroid/HomeFragment$4;
.super Lcom/youth/banner/adapter/BannerImageAdapter;
.source "HomeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/HomeFragment;->initBanner()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/youth/banner/adapter/BannerImageAdapter<",
        "Lcom/etralab/appstoreforandroid/BannerDataBean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/HomeFragment;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/HomeFragment;Ljava/util/List;)V
    .locals 0

    .line 615
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$4;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-direct {p0, p2}, Lcom/youth/banner/adapter/BannerImageAdapter;-><init>(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public onBindView(Lcom/youth/banner/holder/BannerImageHolder;Lcom/etralab/appstoreforandroid/BannerDataBean;II)V
    .locals 0

    .line 620
    new-instance p3, Lcom/bumptech/glide/request/RequestOptions;

    invoke-direct {p3}, Lcom/bumptech/glide/request/RequestOptions;-><init>()V

    const p4, 0x7f070100

    .line 621
    invoke-virtual {p3, p4}, Lcom/bumptech/glide/request/RequestOptions;->placeholder(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p3

    .line 622
    invoke-virtual {p3, p4}, Lcom/bumptech/glide/request/RequestOptions;->fallback(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p3

    .line 623
    invoke-virtual {p3, p4}, Lcom/bumptech/glide/request/RequestOptions;->error(I)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p3

    const/high16 p4, -0x80000000

    .line 624
    invoke-virtual {p3, p4, p4}, Lcom/bumptech/glide/request/RequestOptions;->override(II)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p3

    sget-object p4, Lcom/bumptech/glide/load/DecodeFormat;->PREFER_RGB_565:Lcom/bumptech/glide/load/DecodeFormat;

    .line 625
    invoke-virtual {p3, p4}, Lcom/bumptech/glide/request/RequestOptions;->format(Lcom/bumptech/glide/load/DecodeFormat;)Lcom/bumptech/glide/request/RequestOptions;

    move-result-object p3

    .line 627
    iget-object p4, p1, Lcom/youth/banner/holder/BannerImageHolder;->itemView:Landroid/view/View;

    invoke-static {p4}, Lcom/bumptech/glide/Glide;->with(Landroid/view/View;)Lcom/bumptech/glide/RequestManager;

    move-result-object p4

    .line 628
    invoke-virtual {p2}, Lcom/etralab/appstoreforandroid/BannerDataBean;->getBannerImgUrl()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p4, p2}, Lcom/bumptech/glide/RequestManager;->load(Ljava/lang/String;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p2

    .line 629
    invoke-virtual {p2, p3}, Lcom/bumptech/glide/RequestBuilder;->apply(Lcom/bumptech/glide/request/RequestOptions;)Lcom/bumptech/glide/RequestBuilder;

    move-result-object p2

    iget-object p1, p1, Lcom/youth/banner/holder/BannerImageHolder;->imageView:Landroid/widget/ImageView;

    .line 630
    invoke-virtual {p2, p1}, Lcom/bumptech/glide/RequestBuilder;->into(Landroid/widget/ImageView;)Lcom/bumptech/glide/request/target/ViewTarget;

    return-void
.end method

.method public bridge synthetic onBindView(Ljava/lang/Object;Ljava/lang/Object;II)V
    .locals 0

    .line 615
    check-cast p1, Lcom/youth/banner/holder/BannerImageHolder;

    check-cast p2, Lcom/etralab/appstoreforandroid/BannerDataBean;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/etralab/appstoreforandroid/HomeFragment$4;->onBindView(Lcom/youth/banner/holder/BannerImageHolder;Lcom/etralab/appstoreforandroid/BannerDataBean;II)V

    return-void
.end method
