.class Lcom/etralab/appstoreforandroid/SupportUsActivity$3;
.super Ljava/lang/Object;
.source "SupportUsActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/SupportUsActivity;->ClickToBackLastActivity()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/SupportUsActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/SupportUsActivity;)V
    .locals 0

    .line 71
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/SupportUsActivity$3;->this$0:Lcom/etralab/appstoreforandroid/SupportUsActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 74
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/SupportUsActivity$3;->this$0:Lcom/etralab/appstoreforandroid/SupportUsActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/SupportUsActivity;->finish()V

    return-void
.end method
