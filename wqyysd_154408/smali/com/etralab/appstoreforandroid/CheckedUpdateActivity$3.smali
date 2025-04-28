.class Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$3;
.super Ljava/lang/Object;
.source "CheckedUpdateActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V
    .locals 0

    .line 100
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 103
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->app_name_en:Ljava/lang/String;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->app_download_url:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 104
    new-instance p1, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$3$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$3$1;-><init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$3;)V

    .line 131
    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$3$1;->start()V

    :cond_0
    return-void
.end method
