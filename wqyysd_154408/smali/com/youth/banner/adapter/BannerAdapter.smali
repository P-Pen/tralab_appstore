.class public abstract Lcom/youth/banner/adapter/BannerAdapter;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;
.source "BannerAdapter.java"

# interfaces
.implements Lcom/youth/banner/holder/IViewHolder;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "VH:",
        "Landroidx/recyclerview/widget/RecyclerView$ViewHolder;",
        ">",
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "TVH;>;",
        "Lcom/youth/banner/holder/IViewHolder<",
        "TT;TVH;>;"
    }
.end annotation


# instance fields
.field protected mDatas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field

.field private mIncreaseCount:I

.field private mOnBannerListener:Lcom/youth/banner/listener/OnBannerListener;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/youth/banner/listener/OnBannerListener<",
            "TT;>;"
        }
    .end annotation
.end field

.field private mViewHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TVH;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 27
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    .line 22
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/youth/banner/adapter/BannerAdapter;->mDatas:Ljava/util/List;

    const/4 v0, 0x2

    .line 25
    iput v0, p0, Lcom/youth/banner/adapter/BannerAdapter;->mIncreaseCount:I

    .line 28
    invoke-virtual {p0, p1}, Lcom/youth/banner/adapter/BannerAdapter;->setDatas(Ljava/util/List;)V

    return-void
.end method


# virtual methods
.method public getData(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 51
    iget-object v0, p0, Lcom/youth/banner/adapter/BannerAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getItemCount()I
    .locals 2

    .line 95
    invoke-virtual {p0}, Lcom/youth/banner/adapter/BannerAdapter;->getRealCount()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    invoke-virtual {p0}, Lcom/youth/banner/adapter/BannerAdapter;->getRealCount()I

    move-result v0

    iget v1, p0, Lcom/youth/banner/adapter/BannerAdapter;->mIncreaseCount:I

    add-int/2addr v0, v1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Lcom/youth/banner/adapter/BannerAdapter;->getRealCount()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getRealCount()I
    .locals 1

    .line 99
    iget-object v0, p0, Lcom/youth/banner/adapter/BannerAdapter;->mDatas:Ljava/util/List;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    :goto_0
    return v0
.end method

.method public getRealData(I)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 61
    iget-object v0, p0, Lcom/youth/banner/adapter/BannerAdapter;->mDatas:Ljava/util/List;

    invoke-virtual {p0, p1}, Lcom/youth/banner/adapter/BannerAdapter;->getRealPosition(I)I

    move-result p1

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getRealPosition(I)I
    .locals 2

    .line 103
    iget v0, p0, Lcom/youth/banner/adapter/BannerAdapter;->mIncreaseCount:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0}, Lcom/youth/banner/adapter/BannerAdapter;->getRealCount()I

    move-result v1

    invoke-static {v0, p1, v1}, Lcom/youth/banner/util/BannerUtils;->getRealPosition(ZII)I

    move-result p1

    return p1
.end method

.method public getViewHolder()Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TVH;"
        }
    .end annotation

    .line 111
    iget-object v0, p0, Lcom/youth/banner/adapter/BannerAdapter;->mViewHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    return-object v0
.end method

.method synthetic lambda$onBindViewHolder$0$com-youth-banner-adapter-BannerAdapter(Ljava/lang/Object;ILandroid/view/View;)V
    .locals 0

    .line 74
    iget-object p3, p0, Lcom/youth/banner/adapter/BannerAdapter;->mOnBannerListener:Lcom/youth/banner/listener/OnBannerListener;

    invoke-interface {p3, p1, p2}, Lcom/youth/banner/listener/OnBannerListener;->OnBannerClick(Ljava/lang/Object;I)V

    return-void
.end method

.method synthetic lambda$onCreateViewHolder$1$com-youth-banner-adapter-BannerAdapter(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;Landroid/view/View;)V
    .locals 1

    .line 84
    iget-object p2, p0, Lcom/youth/banner/adapter/BannerAdapter;->mOnBannerListener:Lcom/youth/banner/listener/OnBannerListener;

    if-eqz p2, :cond_0

    .line 85
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v0, Lcom/youth/banner/R$id;->banner_data_key:I

    invoke-virtual {p2, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p2

    .line 86
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v0, Lcom/youth/banner/R$id;->banner_pos_key:I

    invoke-virtual {p1, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    .line 87
    iget-object v0, p0, Lcom/youth/banner/adapter/BannerAdapter;->mOnBannerListener:Lcom/youth/banner/listener/OnBannerListener;

    invoke-interface {v0, p2, p1}, Lcom/youth/banner/listener/OnBannerListener;->OnBannerClick(Ljava/lang/Object;I)V

    :cond_0
    return-void
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TVH;I)V"
        }
    .end annotation

    .line 67
    iput-object p1, p0, Lcom/youth/banner/adapter/BannerAdapter;->mViewHolder:Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 68
    invoke-virtual {p0, p2}, Lcom/youth/banner/adapter/BannerAdapter;->getRealPosition(I)I

    move-result p2

    .line 69
    iget-object v0, p0, Lcom/youth/banner/adapter/BannerAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    .line 70
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v2, Lcom/youth/banner/R$id;->banner_data_key:I

    invoke-virtual {v1, v2, v0}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 71
    iget-object v1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    sget v2, Lcom/youth/banner/R$id;->banner_pos_key:I

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    .line 72
    iget-object v1, p0, Lcom/youth/banner/adapter/BannerAdapter;->mDatas:Ljava/util/List;

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0}, Lcom/youth/banner/adapter/BannerAdapter;->getRealCount()I

    move-result v2

    invoke-virtual {p0, p1, v1, p2, v2}, Lcom/youth/banner/adapter/BannerAdapter;->onBindView(Ljava/lang/Object;Ljava/lang/Object;II)V

    .line 73
    iget-object v1, p0, Lcom/youth/banner/adapter/BannerAdapter;->mOnBannerListener:Lcom/youth/banner/listener/OnBannerListener;

    if-eqz v1, :cond_0

    .line 74
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    new-instance v1, Lcom/youth/banner/adapter/BannerAdapter$$ExternalSyntheticLambda1;

    invoke-direct {v1, p0, v0, p2}, Lcom/youth/banner/adapter/BannerAdapter$$ExternalSyntheticLambda1;-><init>(Lcom/youth/banner/adapter/BannerAdapter;Ljava/lang/Object;I)V

    invoke-virtual {p1, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_0
    return-void
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/view/ViewGroup;",
            "I)TVH;"
        }
    .end annotation

    .line 82
    invoke-virtual {p0, p1, p2}, Lcom/youth/banner/adapter/BannerAdapter;->onCreateHolder(Landroid/view/ViewGroup;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;

    .line 83
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    new-instance v0, Lcom/youth/banner/adapter/BannerAdapter$$ExternalSyntheticLambda0;

    invoke-direct {v0, p0, p1}, Lcom/youth/banner/adapter/BannerAdapter$$ExternalSyntheticLambda0;-><init>(Lcom/youth/banner/adapter/BannerAdapter;Landroidx/recyclerview/widget/RecyclerView$ViewHolder;)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1
.end method

.method public setDatas(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 38
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 40
    :cond_0
    iput-object p1, p0, Lcom/youth/banner/adapter/BannerAdapter;->mDatas:Ljava/util/List;

    .line 41
    invoke-virtual {p0}, Lcom/youth/banner/adapter/BannerAdapter;->notifyDataSetChanged()V

    return-void
.end method

.method public setIncreaseCount(I)V
    .locals 0

    .line 115
    iput p1, p0, Lcom/youth/banner/adapter/BannerAdapter;->mIncreaseCount:I

    return-void
.end method

.method public setOnBannerListener(Lcom/youth/banner/listener/OnBannerListener;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/youth/banner/listener/OnBannerListener<",
            "TT;>;)V"
        }
    .end annotation

    .line 107
    iput-object p1, p0, Lcom/youth/banner/adapter/BannerAdapter;->mOnBannerListener:Lcom/youth/banner/listener/OnBannerListener;

    return-void
.end method
