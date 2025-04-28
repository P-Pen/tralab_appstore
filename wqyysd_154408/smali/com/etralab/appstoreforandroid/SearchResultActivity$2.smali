.class Lcom/etralab/appstoreforandroid/SearchResultActivity$2;
.super Ljava/lang/Thread;
.source "SearchResultActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/SearchResultActivity;->ShowAppsData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;

.field final synthetic val$rv_search_result:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/SearchResultActivity;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 85
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$2;->this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$2;->val$rv_search_result:Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 88
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$2;->this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;

    new-instance v1, Lcom/etralab/appstoreforandroid/SearchResultActivity$2$1;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/SearchResultActivity$2$1;-><init>(Lcom/etralab/appstoreforandroid/SearchResultActivity$2;)V

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
