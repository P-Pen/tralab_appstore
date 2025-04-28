.class public Lcom/youth/banner/indicator/DrawableIndicator;
.super Lcom/youth/banner/indicator/BaseIndicator;
.source "DrawableIndicator.java"


# instance fields
.field private normalBitmap:Landroid/graphics/Bitmap;

.field private selectedBitmap:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, p1, v0}, Lcom/youth/banner/indicator/DrawableIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;II)V
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lcom/youth/banner/indicator/BaseIndicator;-><init>(Landroid/content/Context;)V

    .line 34
    invoke-virtual {p0}, Lcom/youth/banner/indicator/DrawableIndicator;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p1, p2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/youth/banner/indicator/DrawableIndicator;->normalBitmap:Landroid/graphics/Bitmap;

    .line 35
    invoke-virtual {p0}, Lcom/youth/banner/indicator/DrawableIndicator;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-static {p1, p3}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/youth/banner/indicator/DrawableIndicator;->selectedBitmap:Landroid/graphics/Bitmap;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 43
    invoke-direct {p0, p1, p2, v0}, Lcom/youth/banner/indicator/DrawableIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 47
    invoke-direct {p0, p1, p2, p3}, Lcom/youth/banner/indicator/BaseIndicator;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 48
    sget-object p3, Lcom/youth/banner/R$styleable;->DrawableIndicator:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 50
    sget p2, Lcom/youth/banner/R$styleable;->DrawableIndicator_normal_drawable:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    check-cast p2, Landroid/graphics/drawable/BitmapDrawable;

    .line 51
    sget p3, Lcom/youth/banner/R$styleable;->DrawableIndicator_selected_drawable:I

    invoke-virtual {p1, p3}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 52
    invoke-virtual {p2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p2

    iput-object p2, p0, Lcom/youth/banner/indicator/DrawableIndicator;->normalBitmap:Landroid/graphics/Bitmap;

    .line 53
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lcom/youth/banner/indicator/DrawableIndicator;->selectedBitmap:Landroid/graphics/Bitmap;

    :cond_0
    return-void
.end method


# virtual methods
.method protected onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 70
    invoke-super {p0, p1}, Lcom/youth/banner/indicator/BaseIndicator;->onDraw(Landroid/graphics/Canvas;)V

    .line 71
    iget-object v0, p0, Lcom/youth/banner/indicator/DrawableIndicator;->config:Lcom/youth/banner/config/IndicatorConfig;

    invoke-virtual {v0}, Lcom/youth/banner/config/IndicatorConfig;->getIndicatorSize()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_2

    .line 72
    iget-object v1, p0, Lcom/youth/banner/indicator/DrawableIndicator;->normalBitmap:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/youth/banner/indicator/DrawableIndicator;->selectedBitmap:Landroid/graphics/Bitmap;

    if-nez v1, :cond_0

    goto :goto_2

    :cond_0
    const/4 v1, 0x0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v1, v0, :cond_2

    .line 78
    iget-object v4, p0, Lcom/youth/banner/indicator/DrawableIndicator;->config:Lcom/youth/banner/config/IndicatorConfig;

    invoke-virtual {v4}, Lcom/youth/banner/config/IndicatorConfig;->getCurrentPosition()I

    move-result v4

    if-ne v4, v1, :cond_1

    iget-object v4, p0, Lcom/youth/banner/indicator/DrawableIndicator;->selectedBitmap:Landroid/graphics/Bitmap;

    goto :goto_1

    :cond_1
    iget-object v4, p0, Lcom/youth/banner/indicator/DrawableIndicator;->normalBitmap:Landroid/graphics/Bitmap;

    :goto_1
    iget-object v5, p0, Lcom/youth/banner/indicator/DrawableIndicator;->mPaint:Landroid/graphics/Paint;

    invoke-virtual {p1, v4, v3, v2, v5}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 79
    iget-object v4, p0, Lcom/youth/banner/indicator/DrawableIndicator;->normalBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    iget-object v5, p0, Lcom/youth/banner/indicator/DrawableIndicator;->config:Lcom/youth/banner/config/IndicatorConfig;

    invoke-virtual {v5}, Lcom/youth/banner/config/IndicatorConfig;->getIndicatorSpace()I

    move-result v5

    add-int/2addr v4, v5

    int-to-float v4, v4

    add-float/2addr v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_2
    :goto_2
    return-void
.end method

.method protected onMeasure(II)V
    .locals 1

    .line 59
    invoke-super {p0, p1, p2}, Lcom/youth/banner/indicator/BaseIndicator;->onMeasure(II)V

    .line 60
    iget-object p1, p0, Lcom/youth/banner/indicator/DrawableIndicator;->config:Lcom/youth/banner/config/IndicatorConfig;

    invoke-virtual {p1}, Lcom/youth/banner/config/IndicatorConfig;->getIndicatorSize()I

    move-result p1

    const/4 p2, 0x1

    if-gt p1, p2, :cond_0

    return-void

    .line 64
    :cond_0
    iget-object v0, p0, Lcom/youth/banner/indicator/DrawableIndicator;->selectedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    sub-int/2addr p1, p2

    mul-int/2addr v0, p1

    iget-object p2, p0, Lcom/youth/banner/indicator/DrawableIndicator;->selectedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p2

    add-int/2addr v0, p2

    iget-object p2, p0, Lcom/youth/banner/indicator/DrawableIndicator;->config:Lcom/youth/banner/config/IndicatorConfig;

    invoke-virtual {p2}, Lcom/youth/banner/config/IndicatorConfig;->getIndicatorSpace()I

    move-result p2

    mul-int/2addr p2, p1

    add-int/2addr v0, p2

    iget-object p1, p0, Lcom/youth/banner/indicator/DrawableIndicator;->normalBitmap:Landroid/graphics/Bitmap;

    .line 65
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p1

    iget-object p2, p0, Lcom/youth/banner/indicator/DrawableIndicator;->selectedBitmap:Landroid/graphics/Bitmap;

    invoke-virtual {p2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->max(II)I

    move-result p1

    .line 64
    invoke-virtual {p0, v0, p1}, Lcom/youth/banner/indicator/DrawableIndicator;->setMeasuredDimension(II)V

    return-void
.end method
