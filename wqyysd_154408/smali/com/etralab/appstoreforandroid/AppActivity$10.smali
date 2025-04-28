.class Lcom/etralab/appstoreforandroid/AppActivity$10;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity;->ShowAppInformation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/AppActivity;

.field final synthetic val$ll_loading_app_information:Landroid/widget/LinearLayout;

.field final synthetic val$sv_layout_body:Landroid/widget/ScrollView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AppActivity;Landroid/widget/LinearLayout;Landroid/widget/ScrollView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 775
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->val$ll_loading_app_information:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->val$sv_layout_body:Landroid/widget/ScrollView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 778
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->val$ll_loading_app_information:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 779
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->val$sv_layout_body:Landroid/widget/ScrollView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/widget/ScrollView;->setVisibility(I)V

    .line 781
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v3, v0, Lcom/etralab/appstoreforandroid/AppActivity;->app_pkg_name:Ljava/lang/String;

    invoke-static {v0, v0, v3}, Lcom/etralab/appstoreforandroid/AppActivity;->access$900(Lcom/etralab/appstoreforandroid/AppActivity;Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 782
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v3, 0x7f080135

    invoke-virtual {v0, v3}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    .line 783
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v4, 0x7f080145

    invoke-virtual {v3, v4}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    .line 784
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v5, 0x7f080166

    invoke-virtual {v4, v5}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    .line 788
    :try_start_0
    iget-object v5, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v5, v5, Lcom/etralab/appstoreforandroid/AppActivity;->app_version_code:Ljava/lang/String;

    invoke-static {v5}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v5
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v5

    .line 790
    invoke-virtual {v5}, Ljava/lang/NumberFormatException;->printStackTrace()V

    move v5, v2

    :goto_0
    if-eqz v5, :cond_0

    .line 792
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v6, v6}, Lcom/etralab/appstoreforandroid/AppActivity;->getAppVersionCode(Landroid/content/Context;)I

    move-result v6

    if-eqz v6, :cond_0

    iget-object v6, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    .line 793
    invoke-virtual {v6, v6}, Lcom/etralab/appstoreforandroid/AppActivity;->getAppVersionCode(Landroid/content/Context;)I

    move-result v6

    if-le v5, v6, :cond_0

    .line 795
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 796
    invoke-virtual {v4, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 799
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AppActivity;->access$400(Lcom/etralab/appstoreforandroid/AppActivity;)V

    goto :goto_1

    .line 801
    :cond_0
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 802
    invoke-virtual {v3, v2}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 805
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AppActivity;->access$500(Lcom/etralab/appstoreforandroid/AppActivity;)V

    .line 811
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$10;->val$sv_layout_body:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->requestFocus()Z

    return-void
.end method
