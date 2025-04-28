.class Lcom/etralab/appstoreforandroid/ForceUpdateActivity$5;
.super Ljava/lang/Object;
.source "ForceUpdateActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ForceUpdateActivity;->ShowUpdateInformation()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

.field final synthetic val$ll_loading_update_content:Landroid/widget/LinearLayout;

.field final synthetic val$sv_layout_body:Landroid/widget/ScrollView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ForceUpdateActivity;Landroid/widget/LinearLayout;Landroid/widget/ScrollView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 289
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$5;->this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$5;->val$ll_loading_update_content:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$5;->val$sv_layout_body:Landroid/widget/ScrollView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 292
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$5;->val$ll_loading_update_content:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 293
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$5;->val$sv_layout_body:Landroid/widget/ScrollView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ScrollView;->setVisibility(I)V

    .line 296
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$5;->val$sv_layout_body:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->requestFocus()Z

    return-void
.end method
