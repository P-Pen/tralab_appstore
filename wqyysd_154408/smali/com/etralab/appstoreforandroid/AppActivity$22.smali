.class Lcom/etralab/appstoreforandroid/AppActivity$22;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity;->ClickToBackLastActivity()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/AppActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AppActivity;)V
    .locals 0

    .line 1081
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$22;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1084
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$22;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/AppActivity;->finish()V

    return-void
.end method
