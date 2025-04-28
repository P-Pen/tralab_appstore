.class Lcom/etralab/appstoreforandroid/DeveloperAppActivity$1;
.super Ljava/lang/Thread;
.source "DeveloperAppActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->onCreate(Landroid/os/Bundle;)V
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

    .line 63
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$1;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 66
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 68
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperAppActivity$1;->this$0:Lcom/etralab/appstoreforandroid/DeveloperAppActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/DeveloperAppActivity;->access$000(Lcom/etralab/appstoreforandroid/DeveloperAppActivity;)V

    return-void
.end method
