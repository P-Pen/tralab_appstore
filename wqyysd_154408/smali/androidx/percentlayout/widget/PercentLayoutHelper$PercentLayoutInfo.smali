.class public Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;
.super Ljava/lang/Object;
.source "PercentLayoutHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/percentlayout/widget/PercentLayoutHelper;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PercentLayoutInfo"
.end annotation

.annotation runtime Ljava/lang/Deprecated;
.end annotation


# instance fields
.field public aspectRatio:F

.field public bottomMarginPercent:F

.field public endMarginPercent:F

.field public heightPercent:F

.field public leftMarginPercent:F

.field final mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

.field public rightMarginPercent:F

.field public startMarginPercent:F

.field public topMarginPercent:F

.field public widthPercent:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 435
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/high16 v0, -0x40800000    # -1.0f

    .line 436
    iput v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->widthPercent:F

    .line 437
    iput v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->heightPercent:F

    .line 438
    iput v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->leftMarginPercent:F

    .line 439
    iput v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->topMarginPercent:F

    .line 440
    iput v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->rightMarginPercent:F

    .line 441
    iput v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->bottomMarginPercent:F

    .line 442
    iput v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->startMarginPercent:F

    .line 443
    iput v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->endMarginPercent:F

    .line 444
    new-instance v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;-><init>(II)V

    iput-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    return-void
.end method


# virtual methods
.method public fillLayoutParams(Landroid/view/ViewGroup$LayoutParams;II)V
    .locals 6

    .line 455
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    iput v1, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->width:I

    .line 456
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v1, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    iput v1, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->height:I

    .line 462
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget-boolean v0, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->mIsWidthComputedFromAspectRatio:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v0, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->width:I

    if-nez v0, :cond_1

    :cond_0
    iget v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->widthPercent:F

    cmpg-float v0, v0, v3

    if-gez v0, :cond_1

    move v0, v2

    goto :goto_0

    :cond_1
    move v0, v1

    .line 465
    :goto_0
    iget-object v4, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget-boolean v4, v4, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->mIsHeightComputedFromAspectRatio:Z

    if-nez v4, :cond_2

    iget-object v4, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v4, v4, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->height:I

    if-nez v4, :cond_3

    :cond_2
    iget v4, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->heightPercent:F

    cmpg-float v4, v4, v3

    if-gez v4, :cond_3

    move v1, v2

    .line 469
    :cond_3
    iget v4, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->widthPercent:F

    cmpl-float v5, v4, v3

    if-ltz v5, :cond_4

    int-to-float p2, p2

    mul-float/2addr p2, v4

    .line 470
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 473
    :cond_4
    iget p2, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->heightPercent:F

    cmpl-float v4, p2, v3

    if-ltz v4, :cond_5

    int-to-float p3, p3

    mul-float/2addr p3, p2

    .line 474
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 477
    :cond_5
    iget p2, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->aspectRatio:F

    cmpl-float p2, p2, v3

    if-ltz p2, :cond_7

    if-eqz v0, :cond_6

    .line 479
    iget p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    int-to-float p2, p2

    iget p3, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->aspectRatio:F

    mul-float/2addr p2, p3

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 481
    iget-object p2, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iput-boolean v2, p2, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->mIsWidthComputedFromAspectRatio:Z

    :cond_6
    if-eqz v1, :cond_7

    .line 484
    iget p2, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    int-to-float p2, p2

    iget p3, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->aspectRatio:F

    div-float/2addr p2, p3

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    iput p2, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 486
    iget-object p1, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iput-boolean v2, p1, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->mIsHeightComputedFromAspectRatio:Z

    :cond_7
    return-void
.end method

.method public fillMarginLayoutParams(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;II)V
    .locals 4

    .line 513
    invoke-virtual {p0, p2, p3, p4}, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->fillLayoutParams(Landroid/view/ViewGroup$LayoutParams;II)V

    .line 516
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v1, p2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    iput v1, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->leftMargin:I

    .line 517
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v1, p2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    iput v1, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->topMargin:I

    .line 518
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v1, p2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    iput v1, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->rightMargin:I

    .line 519
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v1, p2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    iput v1, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->bottomMargin:I

    .line 520
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    .line 521
    invoke-static {p2}, Landroidx/core/view/MarginLayoutParamsCompat;->getMarginStart(Landroid/view/ViewGroup$MarginLayoutParams;)I

    move-result v1

    .line 520
    invoke-static {v0, v1}, Landroidx/core/view/MarginLayoutParamsCompat;->setMarginStart(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 522
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    .line 523
    invoke-static {p2}, Landroidx/core/view/MarginLayoutParamsCompat;->getMarginEnd(Landroid/view/ViewGroup$MarginLayoutParams;)I

    move-result v1

    .line 522
    invoke-static {v0, v1}, Landroidx/core/view/MarginLayoutParamsCompat;->setMarginEnd(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 525
    iget v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->leftMarginPercent:F

    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-ltz v2, :cond_0

    int-to-float v2, p3

    mul-float/2addr v2, v0

    .line 526
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 528
    :cond_0
    iget v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->topMarginPercent:F

    cmpl-float v2, v0, v1

    if-ltz v2, :cond_1

    int-to-float v2, p4

    mul-float/2addr v2, v0

    .line 529
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 531
    :cond_1
    iget v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->rightMarginPercent:F

    cmpl-float v2, v0, v1

    if-ltz v2, :cond_2

    int-to-float v2, p3

    mul-float/2addr v2, v0

    .line 532
    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v0

    iput v0, p2, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 534
    :cond_2
    iget v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->bottomMarginPercent:F

    cmpl-float v2, v0, v1

    if-ltz v2, :cond_3

    int-to-float p4, p4

    mul-float/2addr p4, v0

    .line 535
    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p4

    iput p4, p2, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    :cond_3
    const/4 p4, 0x0

    .line 538
    iget v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->startMarginPercent:F

    cmpl-float v2, v0, v1

    const/4 v3, 0x1

    if-ltz v2, :cond_4

    int-to-float p4, p3

    mul-float/2addr p4, v0

    .line 540
    invoke-static {p4}, Ljava/lang/Math;->round(F)I

    move-result p4

    .line 539
    invoke-static {p2, p4}, Landroidx/core/view/MarginLayoutParamsCompat;->setMarginStart(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    move p4, v3

    .line 543
    :cond_4
    iget v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->endMarginPercent:F

    cmpl-float v1, v0, v1

    if-ltz v1, :cond_5

    int-to-float p3, p3

    mul-float/2addr p3, v0

    .line 545
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p3

    .line 544
    invoke-static {p2, p3}, Landroidx/core/view/MarginLayoutParamsCompat;->setMarginEnd(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    goto :goto_0

    :cond_5
    move v3, p4

    :goto_0
    if-eqz v3, :cond_6

    if-eqz p1, :cond_6

    .line 552
    invoke-static {p1}, Landroidx/core/view/ViewCompat;->getLayoutDirection(Landroid/view/View;)I

    move-result p1

    .line 551
    invoke-static {p2, p1}, Landroidx/core/view/MarginLayoutParamsCompat;->resolveLayoutDirection(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    :cond_6
    return-void
.end method

.method public fillMarginLayoutParams(Landroid/view/ViewGroup$MarginLayoutParams;II)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    const/4 v0, 0x0

    .line 503
    invoke-virtual {p0, v0, p1, p2, p3}, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->fillMarginLayoutParams(Landroid/view/View;Landroid/view/ViewGroup$MarginLayoutParams;II)V

    return-void
.end method

.method public restoreLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V
    .locals 1

    .line 592
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget-boolean v0, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->mIsWidthComputedFromAspectRatio:Z

    if-nez v0, :cond_0

    .line 595
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v0, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->width:I

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 597
    :cond_0
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget-boolean v0, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->mIsHeightComputedFromAspectRatio:Z

    if-nez v0, :cond_1

    .line 600
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v0, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->height:I

    iput v0, p1, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 604
    :cond_1
    iget-object p1, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    const/4 v0, 0x0

    iput-boolean v0, p1, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->mIsWidthComputedFromAspectRatio:Z

    .line 605
    iget-object p1, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iput-boolean v0, p1, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->mIsHeightComputedFromAspectRatio:Z

    return-void
.end method

.method public restoreMarginLayoutParams(Landroid/view/ViewGroup$MarginLayoutParams;)V
    .locals 1

    .line 575
    invoke-virtual {p0, p1}, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->restoreLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 576
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v0, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->leftMargin:I

    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 577
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v0, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->topMargin:I

    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 578
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v0, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->rightMargin:I

    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    .line 579
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    iget v0, v0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;->bottomMargin:I

    iput v0, p1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 580
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    .line 581
    invoke-static {v0}, Landroidx/core/view/MarginLayoutParamsCompat;->getMarginStart(Landroid/view/ViewGroup$MarginLayoutParams;)I

    move-result v0

    .line 580
    invoke-static {p1, v0}, Landroidx/core/view/MarginLayoutParamsCompat;->setMarginStart(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    .line 582
    iget-object v0, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->mPreservedParams:Landroidx/percentlayout/widget/PercentLayoutHelper$PercentMarginLayoutParams;

    .line 583
    invoke-static {v0}, Landroidx/core/view/MarginLayoutParamsCompat;->getMarginEnd(Landroid/view/ViewGroup$MarginLayoutParams;)I

    move-result v0

    .line 582
    invoke-static {p1, v0}, Landroidx/core/view/MarginLayoutParamsCompat;->setMarginEnd(Landroid/view/ViewGroup$MarginLayoutParams;I)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    const/16 v0, 0x8

    new-array v0, v0, [Ljava/lang/Object;

    .line 562
    iget v1, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->widthPercent:F

    .line 563
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    iget v1, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->heightPercent:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v0, v2

    iget v1, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->leftMarginPercent:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v0, v2

    iget v1, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->topMarginPercent:F

    .line 564
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x3

    aput-object v1, v0, v2

    iget v1, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->rightMarginPercent:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x4

    aput-object v1, v0, v2

    iget v1, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->bottomMarginPercent:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x5

    aput-object v1, v0, v2

    iget v1, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->startMarginPercent:F

    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x6

    aput-object v1, v0, v2

    iget v1, p0, Landroidx/percentlayout/widget/PercentLayoutHelper$PercentLayoutInfo;->endMarginPercent:F

    .line 565
    invoke-static {v1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v1

    const/4 v2, 0x7

    aput-object v1, v0, v2

    const-string v1, "PercentLayoutInformation width: %f height %f, margins (%f, %f,  %f, %f, %f, %f)"

    .line 562
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
