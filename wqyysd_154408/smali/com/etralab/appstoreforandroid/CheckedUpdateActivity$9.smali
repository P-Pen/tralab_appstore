.class Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$9;
.super Ljava/lang/Object;
.source "CheckedUpdateActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->ClickToBackLastActivity()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;)V
    .locals 0

    .line 484
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$9;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 487
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity$9;->this$0:Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/CheckedUpdateActivity;->finish()V

    return-void
.end method
