.class Lcom/etralab/appstoreforandroid/RankingFragment$1;
.super Lcom/etralab/appstoreforandroid/AppAdapter;
.source "RankingFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/RankingFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/RankingFragment;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/RankingFragment;Landroidx/fragment/app/FragmentActivity;Ljava/util/List;)V
    .locals 0

    .line 35
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/RankingFragment$1;->this$0:Lcom/etralab/appstoreforandroid/RankingFragment;

    invoke-direct {p0, p2, p3}, Lcom/etralab/appstoreforandroid/AppAdapter;-><init>(Landroidx/fragment/app/FragmentActivity;Ljava/util/List;)V

    return-void
.end method
