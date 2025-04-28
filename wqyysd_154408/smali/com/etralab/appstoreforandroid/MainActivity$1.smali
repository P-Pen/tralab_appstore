.class Lcom/etralab/appstoreforandroid/MainActivity$1;
.super Landroidx/viewpager2/adapter/FragmentStateAdapter;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/MainActivity;->InitViewPager()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/MainActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/MainActivity;Landroidx/fragment/app/FragmentActivity;)V
    .locals 0

    .line 239
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/MainActivity$1;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    invoke-direct {p0, p2}, Landroidx/viewpager2/adapter/FragmentStateAdapter;-><init>(Landroidx/fragment/app/FragmentActivity;)V

    return-void
.end method


# virtual methods
.method public createFragment(I)Landroidx/fragment/app/Fragment;
    .locals 1

    .line 243
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity$1;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/MainActivity;->list:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroidx/fragment/app/Fragment;

    return-object p1
.end method

.method public getItemCount()I
    .locals 1

    .line 248
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity$1;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/MainActivity;->list:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
