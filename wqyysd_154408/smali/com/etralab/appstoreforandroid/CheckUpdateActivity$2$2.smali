.class Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;
.super Ljava/lang/Object;
.source "CheckUpdateActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;

.field final synthetic val$ll_checking_update:Landroid/widget/LinearLayout;

.field final synthetic val$ll_no_update:Landroid/widget/LinearLayout;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 136
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;->this$1:Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;->val$ll_checking_update:Landroid/widget/LinearLayout;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;->val$ll_no_update:Landroid/widget/LinearLayout;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 139
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;->val$ll_checking_update:Landroid/widget/LinearLayout;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 140
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;->val$ll_no_update:Landroid/widget/LinearLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 142
    new-instance v0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2$1;-><init>(Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2;)V

    .line 153
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$2$2$1;->start()V

    return-void
.end method
