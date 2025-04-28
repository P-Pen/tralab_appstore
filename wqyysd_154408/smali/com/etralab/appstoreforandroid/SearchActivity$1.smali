.class Lcom/etralab/appstoreforandroid/SearchActivity$1;
.super Ljava/lang/Object;
.source "SearchActivity.java"

# interfaces
.implements Landroid/view/View$OnKeyListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/SearchActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/SearchActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/SearchActivity;)V
    .locals 0

    .line 31
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SearchActivity$1;->this$0:Lcom/etralab/appstoreforandroid/SearchActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onKey(Landroid/view/View;ILandroid/view/KeyEvent;)Z
    .locals 0

    .line 36
    invoke-virtual {p3}, Landroid/view/KeyEvent;->getAction()I

    move-result p1

    const/4 p3, 0x1

    if-ne p1, p3, :cond_0

    const/16 p1, 0x42

    if-ne p2, p1, :cond_0

    .line 38
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/SearchActivity$1;->this$0:Lcom/etralab/appstoreforandroid/SearchActivity;

    invoke-static {p1}, Lcom/etralab/appstoreforandroid/SearchActivity;->access$000(Lcom/etralab/appstoreforandroid/SearchActivity;)V

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
