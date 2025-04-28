.class Lcom/etralab/appstoreforandroid/SearchActivity$3;
.super Ljava/lang/Object;
.source "SearchActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/SearchActivity;->ClickToBackLastActivity()V
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

    .line 95
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SearchActivity$3;->this$0:Lcom/etralab/appstoreforandroid/SearchActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 98
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/SearchActivity$3;->this$0:Lcom/etralab/appstoreforandroid/SearchActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/SearchActivity;->finish()V

    return-void
.end method
