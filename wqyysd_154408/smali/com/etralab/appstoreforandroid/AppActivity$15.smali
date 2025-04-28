.class Lcom/etralab/appstoreforandroid/AppActivity$15;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity;->ScreenshotImageViewOnClick()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/AppActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 1000
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$15;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 1003
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$15;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    .line 1004
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    invoke-direct {v0, p1, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1005
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$15;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->appScreenshotUrlList:Ljava/util/List;

    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/String;

    invoke-interface {v1, v2}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Ljava/lang/String;

    const-string v2, "appScreenshotUrlList"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;[Ljava/lang/String;)Landroid/content/Intent;

    const-string v1, "appScreenshotUrlIndex"

    const/4 v2, 0x1

    .line 1006
    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 1007
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
