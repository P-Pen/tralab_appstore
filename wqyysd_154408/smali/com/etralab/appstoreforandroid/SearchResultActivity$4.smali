.class Lcom/etralab/appstoreforandroid/SearchResultActivity$4;
.super Ljava/lang/Object;
.source "SearchResultActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/SearchResultActivity;->ClickToBackLastActivity()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/SearchResultActivity;)V
    .locals 0

    .line 293
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$4;->this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 296
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/SearchResultActivity$4;->this$0:Lcom/etralab/appstoreforandroid/SearchResultActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/SearchResultActivity;->finish()V

    return-void
.end method
