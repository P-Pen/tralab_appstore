.class Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;
.super Ljava/lang/Thread;
.source "DeveloperAppActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->ShowAppsData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

.field final synthetic val$rv_developer_app:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 98
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->val$rv_developer_app:Landroidx/recyclerview/widget/RecyclerView;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 101
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    new-instance v1, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3$1;-><init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity$3;)V

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
