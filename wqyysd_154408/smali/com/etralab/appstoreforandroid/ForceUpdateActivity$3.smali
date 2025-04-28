.class Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;
.super Ljava/lang/Object;
.source "ForceUpdateActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ForceUpdateActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ForceUpdateActivity;)V
    .locals 0

    .line 109
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 112
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/ForceUpdateActivity;->app_name_en:Ljava/lang/String;

    if-eqz p1, :cond_0

    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/ForceUpdateActivity;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/ForceUpdateActivity;->app_download_url:Ljava/lang/String;

    if-eqz p1, :cond_0

    .line 113
    new-instance p1, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;-><init>(Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3;)V

    .line 140
    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ForceUpdateActivity$3$1;->start()V

    :cond_0
    return-void
.end method
