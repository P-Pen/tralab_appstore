.class public Lcom/etralab/appstoreforandroid/basefloat/FloatWindowParamManager;
.super Ljava/lang/Object;
.source "FloatWindowParamManager.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getFloatLayoutParam(ZZ)Landroid/view/WindowManager$LayoutParams;
    .locals 3

    .line 17
    new-instance v0, Landroid/view/WindowManager$LayoutParams;

    invoke-direct {v0}, Landroid/view/WindowManager$LayoutParams;-><init>()V

    .line 18
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1a

    if-lt v1, v2, :cond_0

    const/16 v1, 0x7f6

    .line 19
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 21
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1c

    if-lt v1, v2, :cond_2

    const/4 v1, 0x1

    .line 22
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->layoutInDisplayCutoutMode:I

    goto :goto_0

    .line 24
    :cond_0
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x13

    if-lt v1, v2, :cond_1

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x17

    if-ge v1, v2, :cond_1

    const/16 v1, 0x7d5

    .line 26
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    goto :goto_0

    :cond_1
    const/16 v1, 0x7d2

    .line 28
    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->type:I

    .line 31
    :cond_2
    :goto_0
    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/high16 v2, 0x1000000

    or-int/2addr v1, v2

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    if-eqz p1, :cond_3

    .line 35
    iget p1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit8 p1, p1, 0x28

    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    goto :goto_1

    .line 38
    :cond_3
    iget p1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    or-int/lit8 p1, p1, 0x18

    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    :goto_1
    const/4 p1, -0x2

    if-eqz p0, :cond_4

    .line 43
    iget p0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const v1, 0x10500

    or-int/2addr p0, v1

    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const/4 p0, -0x1

    .line 46
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 47
    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    goto :goto_2

    .line 49
    :cond_4
    iget p0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    const v1, 0x10100

    or-int/2addr p0, v1

    iput p0, v0, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 51
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    .line 52
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->height:I

    .line 55
    :goto_2
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->format:I

    return-object v0
.end method
