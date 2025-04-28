.class public Lcom/etralab/appstoreforandroid/RankingFragment;
.super Landroidx/fragment/app/Fragment;
.source "RankingFragment.java"


# instance fields
.field private appList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/etralab/appstoreforandroid/App;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 18
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    .line 21
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/RankingFragment;->appList:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public InitApps()V
    .locals 2

    const/4 v0, 0x0

    :goto_0
    const/16 v1, 0x40

    if-ge v0, v1, :cond_0

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0

    .line 52
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onActivityCreated(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 25
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4

    .line 31
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/RankingFragment;->InitApps()V

    const p3, 0x7f0b005e

    const/4 v0, 0x0

    .line 33
    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0801b2

    .line 34
    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Landroidx/recyclerview/widget/RecyclerView;

    .line 35
    new-instance p3, Lcom/etralab/appstoreforandroid/RankingFragment$1;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/RankingFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v1

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/RankingFragment;->appList:Ljava/util/List;

    invoke-direct {p3, p0, v1, v2}, Lcom/etralab/appstoreforandroid/RankingFragment$1;-><init>(Lcom/etralab/appstoreforandroid/RankingFragment;Landroidx/fragment/app/FragmentActivity;Ljava/util/List;)V

    .line 38
    new-instance v1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/RankingFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v2

    const/4 v3, 0x1

    invoke-direct {v1, v2, v3, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {p2, v1}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 39
    new-instance v0, Landroidx/recyclerview/widget/DefaultItemAnimator;

    invoke-direct {v0}, Landroidx/recyclerview/widget/DefaultItemAnimator;-><init>()V

    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 40
    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 41
    new-instance p3, Landroidx/recyclerview/widget/DividerItemDecoration;

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/RankingFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    invoke-direct {p3, v0, v3}, Landroidx/recyclerview/widget/DividerItemDecoration;-><init>(Landroid/content/Context;I)V

    invoke-virtual {p2, p3}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    return-object p1
.end method
