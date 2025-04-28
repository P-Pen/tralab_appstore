.class Lcom/etralab/appstoreforandroid/AppActivity$6;
.super Ljava/lang/Object;
.source "AppActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AppActivity;->onCreate(Landroid/os/Bundle;)V
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

    .line 199
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppActivity$6;->this$0:Lcom/etralab/appstoreforandroid/AppActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 202
    new-instance p1, Lcom/etralab/appstoreforandroid/AppActivity$6$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/AppActivity$6$1;-><init>(Lcom/etralab/appstoreforandroid/AppActivity$6;)V

    .line 242
    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/AppActivity$6$1;->start()V

    return-void
.end method
