.class Lcom/etralab/appstoreforandroid/HomeFragment$5;
.super Ljava/lang/Object;
.source "HomeFragment.java"

# interfaces
.implements Lcom/youth/banner/listener/OnBannerListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/HomeFragment;->initBanner()V
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

    .line 663
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$5;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public OnBannerClick(Ljava/lang/Object;I)V
    .locals 2

    .line 666
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$5;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/HomeFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 667
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 668
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$5;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/HomeFragment;->access$400(Lcom/etralab/appstoreforandroid/HomeFragment;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/etralab/appstoreforandroid/BannerDataBean;

    invoke-virtual {p2}, Lcom/etralab/appstoreforandroid/BannerDataBean;->getBannerId()Ljava/lang/String;

    move-result-object p2

    const-string v1, "noticeId"

    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 669
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
