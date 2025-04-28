.class Lcom/etralab/appstoreforandroid/SupportUsWithWechatActivity$1;
.super Ljava/lang/Object;
.source "SupportUsWithWechatActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/SupportUsWithWechatActivity;->ClickToBackLastActivity()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/SupportUsWithWechatActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/SupportUsWithWechatActivity;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SupportUsWithWechatActivity$1;->this$0:Lcom/etralab/appstoreforandroid/SupportUsWithWechatActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 54
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/SupportUsWithWechatActivity$1;->this$0:Lcom/etralab/appstoreforandroid/SupportUsWithWechatActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/SupportUsWithWechatActivity;->finish()V

    return-void
.end method
