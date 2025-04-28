.class Lcom/etralab/appstoreforandroid/NoticeActivity$3$1$1;
.super Ljava/lang/Thread;
.source "NoticeActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$2:Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;)V
    .locals 0

    .line 110
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1$1;->this$2:Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 113
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 115
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1$1;->this$2:Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/NoticeActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/NoticeActivity$3;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/NoticeActivity;->access$100(Lcom/etralab/appstoreforandroid/NoticeActivity;)V

    return-void
.end method
