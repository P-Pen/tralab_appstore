.class Lcom/etralab/appstoreforandroid/NoticeActivity$3;
.super Ljava/lang/Object;
.source "NoticeActivity.java"

# interfaces
.implements Lcom/etralab/appstoreforandroid/OnDoubleClickListener$DoubleClickCallback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/NoticeActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/NoticeActivity;)V
    .locals 0

    .line 93
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$3;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onDoubleClick()V
    .locals 2

    .line 97
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$3;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    new-instance v1, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;-><init>(Lcom/etralab/appstoreforandroid/NoticeActivity$3;)V

    invoke-virtual {v0, v1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->runOnUiThread(Ljava/lang/Runnable;)V

    return-void
.end method
