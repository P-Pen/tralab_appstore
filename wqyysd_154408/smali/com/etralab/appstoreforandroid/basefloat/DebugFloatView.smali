.class public Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView;
.super Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;
.source "DebugFloatView.java"


# static fields
.field private static debugInfo:Ljava/lang/String; = ""

.field private static debugInfoId:I = 0x1


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 15
    invoke-direct {p0, p1}, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public static AddDebugMsg(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    return-void
.end method


# virtual methods
.method public create()V
    .locals 2

    .line 20
    invoke-super {p0}, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->create()V

    const/4 v0, 0x2

    .line 22
    iput v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView;->mViewMode:I

    const/16 v0, 0x11

    .line 23
    iput v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView;->mGravity:I

    const v0, 0x7f0b00a0

    .line 25
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView;->inflate(I)Landroid/view/View;

    const v0, 0x7f080131

    .line 27
    invoke-static {v0}, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView;->findView(I)Landroid/view/View;

    move-result-object v0

    new-instance v1, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView$1;

    invoke-direct {v1, p0}, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView$1;-><init>(Lcom/etralab/appstoreforandroid/basefloat/DebugFloatView;)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method protected onAddWindowFailed(Ljava/lang/Exception;)V
    .locals 0

    return-void
.end method
