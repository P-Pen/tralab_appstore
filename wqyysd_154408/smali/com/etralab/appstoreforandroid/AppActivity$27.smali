.class Lcom/etralab/appstoreforandroid/AppActivity$27;
.super Ljava/lang/Thread;
.source "AppActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity;->DownloadApp()V
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

    .line 1260
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 1263
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 1266
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AppActivity;->access$1000(Lcom/etralab/appstoreforandroid/AppActivity;)V

    .line 1268
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AppActivity;->access$1100(Lcom/etralab/appstoreforandroid/AppActivity;)V

    .line 1270
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v1, 0x7f0800b6

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 1271
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v2, 0x7f0800b7

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Landroid/widget/FrameLayout;

    .line 1272
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v2, 0x7f080135

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Landroid/widget/LinearLayout;

    .line 1273
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v2, 0x7f080166

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v4, v1

    check-cast v4, Landroid/widget/LinearLayout;

    .line 1275
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const v2, 0x7f080225

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Landroid/widget/TextView;

    .line 1277
    iget-object v8, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v9, Lcom/etralab/appstoreforandroid/AppActivity$27$1;

    move-object v1, v9

    move-object v2, p0

    move-object v5, v0

    invoke-direct/range {v1 .. v6}, Lcom/etralab/appstoreforandroid/AppActivity$27$1;-><init>(Lcom/etralab/appstoreforandroid/AppActivity$27;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Landroid/widget/FrameLayout;Landroid/widget/TextView;)V

    invoke-virtual {v8, v9}, Lcom/etralab/appstoreforandroid/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1292
    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v3}, Lcom/etralab/appstoreforandroid/AppActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v4, v4, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, ".apk"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 1293
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    .line 1294
    invoke-static {p0}, Lcom/arialyy/aria/core/Aria;->download(Ljava/lang/Object;)Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v0

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AppActivity;->app_download_url:Ljava/lang/String;

    .line 1295
    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/download/DownloadReceiver;->load(Ljava/lang/String;)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    .line 1296
    invoke-virtual {v2}, Lcom/etralab/appstoreforandroid/AppActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->setFilePath(Ljava/lang/String;Z)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;

    move-result-object v0

    .line 1297
    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->create()J

    goto/16 :goto_0

    .line 1299
    :cond_0
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v2, Lcom/etralab/appstoreforandroid/AppActivity$27$2;

    invoke-direct {v2, p0, v0, v7}, Lcom/etralab/appstoreforandroid/AppActivity$27$2;-><init>(Lcom/etralab/appstoreforandroid/AppActivity$27;Landroid/widget/FrameLayout;Landroid/widget/FrameLayout;)V

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/AppActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 1309
    new-instance v0, Ljava/io/File;

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v1}, Lcom/etralab/appstoreforandroid/AppActivity;->getFilesDir()Ljava/io/File;

    move-result-object v1

    const-string v2, "UsePackageInstaller.txt"

    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1310
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v2}, Lcom/etralab/appstoreforandroid/AppActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    const-string v5, "UseWlanAdb.txt"

    invoke-direct {v1, v2, v5}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 1311
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1312
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const-class v2, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1313
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->startActivity(Landroid/content/Intent;)V

    .line 1314
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/AppActivity;->finish()V

    goto :goto_0

    .line 1315
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 1316
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v2}, Lcom/etralab/appstoreforandroid/AppActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->InstallAppWithPackageInstaller(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_0

    .line 1317
    :cond_2
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 1318
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v2}, Lcom/etralab/appstoreforandroid/AppActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/AppActivity;->app_name_en:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/AppActivity;->InstallAppWithWlanAdb(Ljava/lang/String;)V

    goto :goto_0

    .line 1320
    :cond_3
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    const-class v2, Lcom/etralab/appstoreforandroid/ChooseAppInstallMethodActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 1321
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/AppActivity;->startActivity(Landroid/content/Intent;)V

    .line 1322
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AppActivity$27;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/AppActivity;->finish()V

    :goto_0
    return-void
.end method
