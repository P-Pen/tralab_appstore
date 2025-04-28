.class Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity$1;
.super Ljava/lang/Object;
.source "SupportUsWithAlipayActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->ClickToBackLastActivity()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity$1;->this$0:Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 54
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity$1;->this$0:Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/SupportUsWithAlipayActivity;->finish()V

    return-void
.end method
