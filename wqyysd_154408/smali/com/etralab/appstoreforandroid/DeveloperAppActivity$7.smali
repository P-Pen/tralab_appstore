.class Lcom/etralab/appstoreforandroid/DeveloperAppActivity$7;
.super Ljava/lang/Object;
.source "DeveloperAppActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->ClickToBackLastActivity()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)V
    .locals 0

    .line 296
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$7;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 299
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$7;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->finish()V

    return-void
.end method
