.class Lcom/etralab/appstoreforandroid/NoticeActivity$6;
.super Ljava/lang/Object;
.source "NoticeActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


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

.field final synthetic val$sv_layout_body:Landroid/widget/ScrollView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/NoticeActivity;Landroid/widget/ScrollView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 227
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$6;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$6;->val$sv_layout_body:Landroid/widget/ScrollView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 231
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$6;->val$sv_layout_body:Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/widget/ScrollView;->requestFocus()Z

    return-void
.end method
