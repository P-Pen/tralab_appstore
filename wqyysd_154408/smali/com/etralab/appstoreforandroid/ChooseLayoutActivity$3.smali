.class Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;
.super Ljava/lang/Object;
.source "ChooseLayoutActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;)V
    .locals 0

    .line 60
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3

    .line 63
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "SquareLayout.txt"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 64
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 65
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 67
    :cond_0
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v2, "CircleLayout.txt"

    invoke-direct {p1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 68
    invoke-virtual {p1}, Ljava/io/File;->isFile()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 69
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 72
    :cond_1
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    iget p1, p1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->layoutId:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_2

    .line 73
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 74
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_5

    .line 76
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 78
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 82
    :goto_0
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    const-class v1, Lcom/etralab/appstoreforandroid/RestartMainActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 83
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-virtual {v0, p1}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->startActivity(Landroid/content/Intent;)V

    .line 84
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->finish()V

    goto :goto_2

    .line 86
    :cond_2
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    iget p1, p1, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->layoutId:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_4

    .line 87
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-direct {p1, v0, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 88
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_3

    .line 90
    :try_start_1
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_1

    :catch_1
    move-exception p1

    .line 92
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 97
    :cond_3
    :goto_1
    new-instance p1, Landroid/content/Intent;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    const-class v1, Lcom/etralab/appstoreforandroid/RestartMainActivity;

    invoke-direct {p1, v0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 98
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-virtual {v0, p1}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->startActivity(Landroid/content/Intent;)V

    .line 99
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;->finish()V

    goto :goto_2

    .line 101
    :cond_4
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ChooseLayoutActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ChooseLayoutActivity;

    const/4 v0, 0x0

    const-string v1, "\u8bf7\u5148\u9009\u62e9\u5e03\u5c40"

    invoke-static {p1, v1, v0}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object p1

    .line 102
    invoke-virtual {p1}, Landroid/widget/Toast;->show()V

    :cond_5
    :goto_2
    return-void
.end method
