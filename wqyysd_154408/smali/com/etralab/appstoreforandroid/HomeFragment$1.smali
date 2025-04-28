.class Lcom/etralab/appstoreforandroid/HomeFragment$1;
.super Ljava/lang/Thread;
.source "HomeFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/HomeFragment;->ShowAppsData()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/HomeFragment;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/HomeFragment;)V
    .locals 0

    .line 122
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 125
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 126
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$1;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    new-instance v1, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/HomeFragment$1$1;-><init>(Lcom/etralab/appstoreforandroid/HomeFragment$1;)V

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
