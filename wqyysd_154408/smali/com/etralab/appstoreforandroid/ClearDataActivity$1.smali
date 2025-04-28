.class Lcom/etralab/appstoreforandroid/ClearDataActivity$1;
.super Ljava/lang/Object;
.source "ClearDataActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ClearDataActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

.field final synthetic val$iv_application_data:Landroid/widget/ImageView;

.field final synthetic val$iv_cache_data:Landroid/widget/ImageView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ClearDataActivity;Landroid/widget/ImageView;Landroid/widget/ImageView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 46
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->val$iv_cache_data:Landroid/widget/ImageView;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->val$iv_application_data:Landroid/widget/ImageView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5

    .line 50
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iget-boolean p1, p1, Lcom/etralab/appstoreforandroid/ClearDataActivity;->isCheckBoxCacheDataFull:Z

    const v0, 0x7f07010a

    const/4 v1, 0x0

    if-eqz p1, :cond_2

    .line 51
    new-instance p1, Ljava/io/File;

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    invoke-virtual {v2}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getCacheDir()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 52
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    invoke-virtual {v3}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getExternalCacheDir()Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 53
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 54
    invoke-static {p1}, Lcom/etralab/appstoreforandroid/DeleteFile;->DeleteDirWithFile(Ljava/io/File;)V

    .line 56
    :cond_0
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_1

    .line 57
    invoke-static {v2}, Lcom/etralab/appstoreforandroid/DeleteFile;->DeleteDirWithFile(Ljava/io/File;)V

    .line 59
    :cond_1
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    const-string v2, "\u7f13\u5b58\u6570\u636e\u5df2\u6e05\u9664\uff01"

    invoke-static {p1, v2, v1}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 60
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 62
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iput-boolean v1, p1, Lcom/etralab/appstoreforandroid/ClearDataActivity;->isCheckBoxCacheDataFull:Z

    .line 63
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->val$iv_cache_data:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 65
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    invoke-static {p1}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->access$000(Lcom/etralab/appstoreforandroid/ClearDataActivity;)V

    .line 68
    :cond_2
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iget-boolean p1, p1, Lcom/etralab/appstoreforandroid/ClearDataActivity;->isCheckBoxApplicationDataFull:Z

    if-eqz p1, :cond_5

    .line 69
    new-instance p1, Ljava/io/File;

    iget-object v2, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    invoke-virtual {v2}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getFilesDir()Ljava/io/File;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p1, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 70
    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v3

    invoke-static {v3}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 71
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v3

    if-eqz v3, :cond_3

    .line 72
    invoke-static {p1}, Lcom/etralab/appstoreforandroid/DeleteFile;->DeleteDirWithFile(Ljava/io/File;)V

    .line 74
    :cond_3
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result p1

    if-eqz p1, :cond_4

    .line 75
    invoke-static {v2}, Lcom/etralab/appstoreforandroid/DeleteFile;->DeleteDirWithFile(Ljava/io/File;)V

    .line 77
    :cond_4
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    const/4 v2, 0x1

    const-string v3, "\u5e94\u7528\u6570\u636e\u5df2\u6e05\u9664\uff0c\u552f\u8da3\u5e94\u7528\u5546\u5e97\u5373\u5c06\u9000\u51fa\u3002"

    invoke-static {p1, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 78
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    .line 80
    new-instance p1, Lcom/etralab/appstoreforandroid/ClearDataActivity$1$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/ClearDataActivity$1$1;-><init>(Lcom/etralab/appstoreforandroid/ClearDataActivity$1;)V

    .line 93
    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ClearDataActivity$1$1;->start()V

    .line 95
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    iput-boolean v1, p1, Lcom/etralab/appstoreforandroid/ClearDataActivity;->isCheckBoxApplicationDataFull:Z

    .line 96
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->val$iv_application_data:Landroid/widget/ImageView;

    invoke-virtual {p1, v0}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 98
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    invoke-static {p1}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->access$100(Lcom/etralab/appstoreforandroid/ClearDataActivity;)V

    :cond_5
    return-void
.end method
