.class Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$4;
.super Ljava/lang/Object;
.source "ChooseAppInstallMethodActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;)V
    .locals 0

    .line 77
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$4;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 80
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$4;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "UsePackageInstaller.txt"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 81
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 82
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 84
    :cond_0
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$4;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v2, "UseWlanAdb.txt"

    invoke-direct {p1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 85
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 86
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 89
    :cond_1
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$4;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    iget p1, p1, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->apkInstallMethodId:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 90
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$4;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 91
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_4

    .line 93
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 95
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 97
    :goto_0
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$4;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->finish()V

    goto :goto_2

    .line 99
    :cond_2
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$4;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    iget p1, p1, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->apkInstallMethodId:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_3

    .line 100
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$4;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-direct {p1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 101
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_4

    .line 103
    :try_start_1
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 105
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 107
    :goto_1
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$4;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;->finish()V

    goto :goto_2

    .line 111
    :cond_3
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity$4;->this$0:Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    const/4 v0, 0x0

    const-string v1, "\u8bf7\u5148\u9009\u62e9\u5e94\u7528\u5b89\u88c5\u65b9\u5f0f"

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 112
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_4
    :goto_2
    return-void
.end method
