.class Lcom/etralab/appstoreforandroid/UserAgreementActivity$2;
.super Ljava/lang/Object;
.source "UserAgreementActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/UserAgreementActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/UserAgreementActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/UserAgreementActivity;)V
    .locals 0

    .line 72
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/UserAgreementActivity$2;->this$0:Lcom/etralab/appstoreforandroid/UserAgreementActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 76
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/UserAgreementActivity$2;->this$0:Lcom/etralab/appstoreforandroid/UserAgreementActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/UserAgreementActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "isUserAgreementAgree4"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 77
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 78
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 81
    :cond_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result p1

    invoke-static {p1}, Landroid/os/Process;->killProcess(I)V

    const/4 p1, 0x0

    .line 82
    invoke-static {p1}, Ljava/lang/System;->exit(I)V

    return-void
.end method
