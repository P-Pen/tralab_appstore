.class Lcom/etralab/appstoreforandroid/NameChangeHintActivity$1;
.super Ljava/lang/Object;
.source "NameChangeHintActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/NameChangeHintActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/NameChangeHintActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/NameChangeHintActivity;)V
    .locals 0

    .line 27
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NameChangeHintActivity$1;->this$0:Lcom/etralab/appstoreforandroid/NameChangeHintActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 2

    .line 30
    new-instance p1, Ljava/io/File;

    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NameChangeHintActivity$1;->this$0:Lcom/etralab/appstoreforandroid/NameChangeHintActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/NameChangeHintActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    const-string v1, "isNameChangeHintAgree"

    invoke-direct {p1, v0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 31
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_0

    .line 33
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 35
    invoke-virtual {p1}, Ljava/io/IOException;->printStackTrace()V

    .line 38
    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/NameChangeHintActivity$1;->this$0:Lcom/etralab/appstoreforandroid/NameChangeHintActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/NameChangeHintActivity;->finish()V

    return-void
.end method
