.class Lcom/etralab/appstoreforandroid/ClassificationActivity$2;
.super Ljava/lang/Thread;
.source "ClassificationActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ClassificationActivity;->ShowAppsData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ClassificationActivity;

.field final synthetic val$recyclerView_home:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ClassificationActivity;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 90
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ClassificationActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2;->val$recyclerView_home:Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 93
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ClassificationActivity;

    new-instance v1, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/ClassificationActivity$2$1;-><init>(Lcom/etralab/appstoreforandroid/ClassificationActivity$2;)V

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
