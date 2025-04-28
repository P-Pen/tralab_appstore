.class Lcom/etralab/appstoreforandroid/NoticeActivity$10;
.super Ljava/lang/Object;
.source "NoticeActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/NoticeActivity;->ClickToBackLastActivity()V
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

    .line 932
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$10;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 935
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/NoticeActivity$10;->this$0:Lcom/etralab/appstoreforandroid/NoticeActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/NoticeActivity;->finish()V

    return-void
.end method
