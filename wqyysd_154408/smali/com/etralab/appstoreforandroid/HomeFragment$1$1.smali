.class Lcom/etralab/appstoreforandroid/HomeFragment$1$1;
.super Ljava/lang/Object;
.source "HomeFragment.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/HomeFragment$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/HomeFragment$1;)V
    .locals 0

    .line 126
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 12

    .line 130
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_new_arrival:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 131
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_new_arrival:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 133
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_recommendation:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 134
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_recommendation:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 136
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_download_ranking:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->setHasFixedSize(Z)V

    .line 137
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_download_ranking:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    .line 140
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v3, 0x7f08014c

    invoke-virtual {v0, v3}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 141
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v3, v3, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v3}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v3

    const v4, 0x7f080141

    invoke-virtual {v3, v4}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    .line 144
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v4}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v4

    const v5, 0x7f0800e5

    invoke-virtual {v4, v5}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Landroid/widget/ImageView;

    if-eqz v7, :cond_0

    .line 147
    invoke-virtual {v7}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    check-cast v4, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v4}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    :cond_0
    if-eqz v0, :cond_2

    .line 150
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_new_arrival:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_recommendation:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v4, :cond_2

    iget-object v4, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_download_ranking:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v4, :cond_2

    .line 151
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v4}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$000(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    const/16 v5, 0x8

    if-lez v4, :cond_1

    iget-object v4, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v4}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$100(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_1

    iget-object v4, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v4}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$200(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->size()I

    move-result v4

    if-lez v4, :cond_1

    .line 153
    new-instance v4, Lcom/etralab/appstoreforandroid/AppAdapter;

    iget-object v6, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v6}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v6

    iget-object v7, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v7}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$000(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v4, v6, v7}, Lcom/etralab/appstoreforandroid/AppAdapter;-><init>(Landroidx/fragment/app/FragmentActivity;Ljava/util/List;)V

    .line 154
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_new_arrival:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v7, Landroidx/recyclerview/widget/LinearLayoutManager;

    iget-object v8, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v8, v8, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v8}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v8

    invoke-direct {v7, v8, v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v6, v7}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 155
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_new_arrival:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v7, Landroidx/recyclerview/widget/DefaultItemAnimator;

    invoke-direct {v7}, Landroidx/recyclerview/widget/DefaultItemAnimator;-><init>()V

    invoke-virtual {v6, v7}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 156
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_new_arrival:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v6, v4}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 157
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_new_arrival:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v6, Landroidx/recyclerview/widget/DividerItemDecoration;

    iget-object v7, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v7}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Landroidx/recyclerview/widget/DividerItemDecoration;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v4, v6}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 159
    new-instance v4, Lcom/etralab/appstoreforandroid/AppAdapter;

    iget-object v6, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v6}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v6

    iget-object v7, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v7}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$100(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v4, v6, v7}, Lcom/etralab/appstoreforandroid/AppAdapter;-><init>(Landroidx/fragment/app/FragmentActivity;Ljava/util/List;)V

    .line 160
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_recommendation:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v7, Landroidx/recyclerview/widget/LinearLayoutManager;

    iget-object v8, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v8, v8, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v8}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v8

    invoke-direct {v7, v8, v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v6, v7}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 161
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_recommendation:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v7, Landroidx/recyclerview/widget/DefaultItemAnimator;

    invoke-direct {v7}, Landroidx/recyclerview/widget/DefaultItemAnimator;-><init>()V

    invoke-virtual {v6, v7}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 162
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_recommendation:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v6, v4}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 163
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_recommendation:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v6, Landroidx/recyclerview/widget/DividerItemDecoration;

    iget-object v7, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v7}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Landroidx/recyclerview/widget/DividerItemDecoration;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v4, v6}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 165
    new-instance v4, Lcom/etralab/appstoreforandroid/AppAdapter;

    iget-object v6, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v6}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v6

    iget-object v7, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v7}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$200(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;

    move-result-object v7

    invoke-direct {v4, v6, v7}, Lcom/etralab/appstoreforandroid/AppAdapter;-><init>(Landroidx/fragment/app/FragmentActivity;Ljava/util/List;)V

    .line 166
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_download_ranking:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v7, Landroidx/recyclerview/widget/LinearLayoutManager;

    iget-object v8, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v8, v8, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v8}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v8

    invoke-direct {v7, v8, v1, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v6, v7}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 167
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_download_ranking:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v7, Landroidx/recyclerview/widget/DefaultItemAnimator;

    invoke-direct {v7}, Landroidx/recyclerview/widget/DefaultItemAnimator;-><init>()V

    invoke-virtual {v6, v7}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 168
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_download_ranking:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v6, v4}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 169
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment;->rv_download_ranking:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v6, Landroidx/recyclerview/widget/DividerItemDecoration;

    iget-object v7, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v7}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v7

    invoke-direct {v6, v7, v1}, Landroidx/recyclerview/widget/DividerItemDecoration;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v4, v6}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 171
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iput-boolean v1, v4, Lcom/etralab/appstoreforandroid/HomeFragment;->isPrepareData:Z

    .line 172
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iput-boolean v1, v4, Lcom/etralab/appstoreforandroid/HomeFragment;->isShowData:Z

    .line 174
    invoke-virtual {v0, v5}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 175
    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 178
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->initBanner()V

    .line 180
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f08015c

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 182
    new-instance v1, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$1;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$1;-><init>(Lcom/etralab/appstoreforandroid/HomeFragment$1$1;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 193
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f080147

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 194
    new-instance v1, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$2;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$2;-><init>(Lcom/etralab/appstoreforandroid/HomeFragment$1$1;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 206
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f080148

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 207
    new-instance v1, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$3;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$3;-><init>(Lcom/etralab/appstoreforandroid/HomeFragment$1$1;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 219
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f080146

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 220
    new-instance v1, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$4;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$4;-><init>(Lcom/etralab/appstoreforandroid/HomeFragment$1$1;)V

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    goto :goto_0

    .line 231
    :cond_1
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f080241

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Landroid/widget/TextView;

    .line 233
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f0800e4

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Landroid/widget/ImageView;

    .line 234
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f08026c

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Landroid/widget/TextView;

    .line 235
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;->this$1:Lcom/etralab/appstoreforandroid/HomeFragment$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    const v1, 0x7f080069

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 237
    invoke-virtual {v7, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 238
    invoke-virtual {v8, v5}, Landroid/widget/TextView;->setVisibility(I)V

    .line 240
    invoke-virtual {v9, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 241
    invoke-virtual {v10, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 242
    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 245
    new-instance v1, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$5;

    move-object v5, v1

    move-object v6, p0

    move-object v11, v0

    invoke-direct/range {v5 .. v11}, Lcom/etralab/appstoreforandroid/HomeFragment$1$1$5;-><init>(Lcom/etralab/appstoreforandroid/HomeFragment$1$1;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/Button;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_2
    :goto_0
    return-void
.end method
