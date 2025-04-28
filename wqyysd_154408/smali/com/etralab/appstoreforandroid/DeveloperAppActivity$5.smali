.class Lcom/etralab/appstoreforandroid/DeveloperAppActivity$5;
.super Ljava/lang/Object;
.source "DeveloperAppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->setTitle()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

.field final synthetic val$appDeveloperName:Ljava/lang/String;

.field final synthetic val$tv_title:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;Landroid/widget/TextView;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 253
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$5;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$5;->val$tv_title:Landroid/widget/TextView;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$5;->val$appDeveloperName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 256
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$5;->val$tv_title:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$5;->val$appDeveloperName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
