.class Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView$1;
.super Ljava/lang/Object;
.source "DebugFloatView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView;->create()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView;)V
    .locals 0

    .line 27
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView$1;->this$0:Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 30
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView$1;->this$0:Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView;->remove()V

    return-void
.end method
