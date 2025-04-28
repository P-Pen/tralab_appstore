.class Lcom/etralab/appstoreforandroid/ClearDataActivity$6;
.super Ljava/lang/Object;
.source "ClearDataActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ClearDataActivity;->ClickToBackLastActivity()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ClearDataActivity;)V
    .locals 0

    .line 251
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$6;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 254
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$6;->this$0:Lcom/etralab/appstoreforandroid/ClearDataActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ClearDataActivity;->finish()V

    return-void
.end method
