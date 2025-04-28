.class Lcom/etralab/appstoreforandroid/LauncherActivity$1;
.super Ljava/lang/Object;
.source "LauncherActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/LauncherActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/LauncherActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/LauncherActivity;)V
    .locals 0

    .line 23
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/LauncherActivity$1;->this$0:Lcom/etralab/appstoreforandroid/LauncherActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 26
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/LauncherActivity$1;->this$0:Lcom/etralab/appstoreforandroid/LauncherActivity;

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/LauncherActivity;->access$000(Lcom/etralab/appstoreforandroid/LauncherActivity;)Landroid/content/Context;

    move-result-object v1

    const-class v2, Lcom/etralab/appstoreforandroid/MainActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 27
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/LauncherActivity$1;->this$0:Lcom/etralab/appstoreforandroid/LauncherActivity;

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/LauncherActivity;->startActivity(Landroid/content/Intent;)V

    .line 28
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/LauncherActivity$1;->this$0:Lcom/etralab/appstoreforandroid/LauncherActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/LauncherActivity;->finish()V

    return-void
.end method
