.class Lcom/etralab/appstoreforandroid/CheckUpdateActivity$3;
.super Ljava/lang/Object;
.source "CheckUpdateActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->ClickToBackLastActivity()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/CheckUpdateActivity;)V
    .locals 0

    .line 204
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 207
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/CheckUpdateActivity$3;->this$0:Lcom/etralab/appstoreforandroid/CheckUpdateActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/CheckUpdateActivity;->finish()V

    return-void
.end method
