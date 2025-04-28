.class Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;
.super Ljava/lang/Thread;
.source "ForceUpdateActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;)V
    .locals 0

    .line 113
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 116
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 119
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/ForceUpdateActivity;->access$100(Lcom/etralab/appstoreforandroid/ForceUpdateActivity;)V

    .line 121
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

    const v1, 0x7f0800b6

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/ForceUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/FrameLayout;

    .line 122
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

    const v2, 0x7f08006a

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/ForceUpdateActivity;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/Button;

    .line 124
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

    new-instance v3, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1$1;

    invoke-direct {v3, p0, v1, v0}, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1$1;-><init>(Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;Landroid/widget/Button;Landroid/widget/FrameLayout;)V

    invoke-virtual {v2, v3}, Lcom/etralab/appstoreforandroid/ForceUpdateActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    .line 135
    invoke-static {p0}, Lcom/arialyy/aria/core/Aria;->download(Ljava/lang/Object;)Lcom/arialyy/aria/core/download/DownloadReceiver;

    move-result-object v0

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/ForceUpdateActivity;->app_download_url:Ljava/lang/String;

    .line 136
    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/download/DownloadReceiver;->load(Ljava/lang/String;)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

    .line 137
    invoke-virtual {v2}, Lcom/etralab/appstoreforandroid/ForceUpdateActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/ForceUpdateActivity;->app_name_en:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ".apk"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->setFilePath(Ljava/lang/String;Z)Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;

    move-result-object v0

    .line 138
    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/target/HttpBuilderTarget;->create()J

    return-void
.end method
