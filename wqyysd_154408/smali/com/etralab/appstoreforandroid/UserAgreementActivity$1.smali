.class Lcom/etralab/appstoreforandroid/UserAgreementActivity$1;
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

    .line 55
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/UserAgreementActivity$1;->this$0:Lcom/etralab/appstoreforandroid/UserAgreementActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 58
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/UserAgreementActivity$1;->this$0:Lcom/etralab/appstoreforandroid/UserAgreementActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/UserAgreementActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "isUserAgreementAgree4"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 59
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 61
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 63
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 66
    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/UserAgreementActivity$1;->this$0:Lcom/etralab/appstoreforandroid/UserAgreementActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/UserAgreementActivity;->finish()V

    return-void
.end method
