.class Lcom/etralab/appstoreforandroid/DeveloperAppActivity$6;
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

.field final synthetic val$mtv_title:Lcom/etralab/appstoreforandroid/MarqueeTextView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;Lcom/etralab/appstoreforandroid/MarqueeTextView;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 262
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$6;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$6;->val$mtv_title:Lcom/etralab/appstoreforandroid/MarqueeTextView;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$6;->val$appDeveloperName:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 265
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$6;->val$mtv_title:Lcom/etralab/appstoreforandroid/MarqueeTextView;

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$6;->val$appDeveloperName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/MarqueeTextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method
