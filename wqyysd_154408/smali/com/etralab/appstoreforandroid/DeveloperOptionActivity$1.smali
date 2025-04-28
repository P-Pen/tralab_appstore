.class Lcom/etralab/appstoreforandroid/DeveloperOptionActivity$1;
.super Ljava/lang/Object;
.source "DeveloperOptionActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/DeveloperOptionActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/DeveloperOptionActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/DeveloperOptionActivity;)V
    .locals 0

    .line 20
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/DeveloperOptionActivity$1;->this$0:Lcom/etralab/appstoreforandroid/DeveloperOptionActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 23
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperOptionActivity$1;->this$0:Lcom/etralab/appstoreforandroid/DeveloperOptionActivity;

    const-class v1, Lcom/etralab/appstoreforandroid/ConnectCheckActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 24
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/DeveloperOptionActivity$1;->this$0:Lcom/etralab/appstoreforandroid/DeveloperOptionActivity;

    invoke-virtual {v0, p1}, Lcom/etralab/appstoreforandroid/DeveloperOptionActivity;->startActivity(Landroid/content/Intent;)V

    return-void
.end method
