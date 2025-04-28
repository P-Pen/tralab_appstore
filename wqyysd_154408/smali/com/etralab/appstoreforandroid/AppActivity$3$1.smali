.class Lcom/etralab/appstoreforandroid/AppActivity$3$1;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity$3;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/AppActivity$3;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AppActivity$3;)V
    .locals 0

    .line 127
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 130
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    .line 131
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    invoke-direct {v1, v0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 132
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/AppActivity$3;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity$3;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity;->app_developer:Ljava/lang/String;

    const-string v3, "appDeveloperName"

    invoke-virtual {v1, v3, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 133
    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
