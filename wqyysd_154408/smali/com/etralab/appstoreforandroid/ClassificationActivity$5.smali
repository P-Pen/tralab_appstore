.class Lcom/etralab/appstoreforandroid/ClassificationActivity$5;
.super Ljava/lang/Object;
.source "ClassificationActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ClassificationActivity;->ClickToBackLastActivity()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ClassificationActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ClassificationActivity;)V
    .locals 0

    .line 443
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$5;->this$0:Lcom/etralab/appstoreforandroid/ClassificationActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 446
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClassificationActivity$5;->this$0:Lcom/etralab/appstoreforandroid/ClassificationActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ClassificationActivity;->finish()V

    return-void
.end method
