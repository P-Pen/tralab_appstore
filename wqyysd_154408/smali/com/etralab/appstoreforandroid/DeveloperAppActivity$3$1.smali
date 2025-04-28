.class Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;
.super Ljava/lang/Object;
.source "DeveloperAppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;)V
    .locals 0

    .line 101
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 9

    .line 105
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    const v1, 0x7f08014c

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 108
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    const v2, 0x7f0800e5

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/ImageView;

    .line 109
    invoke-virtual {v4}, Landroid/widget/ImageView;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    check-cast v1, Landroid/graphics/drawable/AnimationDrawable;

    invoke-virtual {v1}, Landroid/graphics/drawable/AnimationDrawable;->stop()V

    if-eqz v0, :cond_1

    .line 111
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->val$rv_developer_app:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v1, :cond_1

    .line 112
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->access$100(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/16 v2, 0x8

    const/4 v3, 0x0

    if-lez v1, :cond_0

    .line 114
    new-instance v1, Lcom/etralab/appstoreforandroid/AppAdapterForActivity;

    iget-object v4, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    iget-object v5, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v5, v5, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    invoke-static {v5}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->access$100(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)Ljava/util/List;

    move-result-object v5

    invoke-direct {v1, v4, v5}, Lcom/etralab/appstoreforandroid/AppAdapterForActivity;-><init>(Landroid/app/Activity;Ljava/util/List;)V

    .line 115
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->val$rv_developer_app:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v5, Landroidx/recyclerview/widget/LinearLayoutManager;

    iget-object v6, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    const/4 v7, 0x1

    invoke-direct {v5, v6, v7, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(Landroid/content/Context;IZ)V

    invoke-virtual {v4, v5}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    .line 116
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->val$rv_developer_app:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v5, Landroidx/recyclerview/widget/DefaultItemAnimator;

    invoke-direct {v5}, Landroidx/recyclerview/widget/DefaultItemAnimator;-><init>()V

    invoke-virtual {v4, v5}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    .line 117
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->val$rv_developer_app:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v4, v1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    .line 118
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->val$rv_developer_app:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v4, Landroidx/recyclerview/widget/DividerItemDecoration;

    iget-object v5, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v5, v5, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    invoke-direct {v4, v5, v7}, Landroidx/recyclerview/widget/DividerItemDecoration;-><init>(Landroid/content/Context;I)V

    invoke-virtual {v1, v4}, Landroidx/recyclerview/widget/RecyclerView;->addItemDecoration(Landroidx/recyclerview/widget/RecyclerView$ItemDecoration;)V

    .line 119
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    iput-boolean v7, v1, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->isPrepareData:Z

    .line 121
    invoke-virtual {v0, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 122
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->val$rv_developer_app:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setVisibility(I)V

    goto :goto_0

    .line 125
    :cond_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    const v1, 0x7f080241

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Landroid/widget/TextView;

    .line 127
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    const v1, 0x7f0800e4

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Landroid/widget/ImageView;

    .line 128
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    const v1, 0x7f08026c

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Landroid/widget/TextView;

    .line 129
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    const v1, 0x7f080069

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/Button;

    .line 131
    invoke-virtual {v4, v2}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 132
    invoke-virtual {v5, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 134
    invoke-virtual {v6, v3}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 135
    invoke-virtual {v7, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 136
    invoke-virtual {v0, v3}, Landroid/widget/Button;->setVisibility(I)V

    .line 139
    new-instance v1, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1$1;

    move-object v2, v1

    move-object v3, p0

    move-object v8, v0

    invoke-direct/range {v2 .. v8}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1$1;-><init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/ImageView;Landroid/widget/TextView;Landroid/widget/Button;)V

    invoke-virtual {v0, v1}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_1
    :goto_0
    return-void
.end method
