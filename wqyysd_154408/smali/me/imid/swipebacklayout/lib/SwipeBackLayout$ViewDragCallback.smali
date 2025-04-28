.class Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;
.super Lme/imid/swipebacklayout/lib/ViewDragHelper$Callback;
.source "SwipeBackLayout.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lme/imid/swipebacklayout/lib/SwipeBackLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ViewDragCallback"
.end annotation


# instance fields
.field private mIsScrollOverValid:Z

.field final synthetic this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;


# direct methods
.method private constructor <init>(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)V
    .locals 0

    .line 485
    iput-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-direct {p0}, Lme/imid/swipebacklayout/lib/ViewDragHelper$Callback;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lme/imid/swipebacklayout/lib/SwipeBackLayout;Lme/imid/swipebacklayout/lib/SwipeBackLayout$1;)V
    .locals 0

    .line 485
    invoke-direct {p0, p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;-><init>(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)V

    return-void
.end method


# virtual methods
.method public clampViewPositionHorizontal(Landroid/view/View;II)I
    .locals 1

    .line 598
    iget-object p3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p3}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$300(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result p3

    and-int/lit8 p3, p3, 0x1

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    .line 599
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    invoke-static {p2, v0}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result v0

    goto :goto_0

    .line 600
    :cond_0
    iget-object p3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p3}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$300(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result p3

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    .line 601
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result p1

    neg-int p1, p1

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_1
    :goto_0
    return v0
.end method

.method public clampViewPositionVertical(Landroid/view/View;II)I
    .locals 1

    .line 609
    iget-object p3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p3}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$300(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result p3

    and-int/lit8 p3, p3, 0x8

    const/4 v0, 0x0

    if-eqz p3, :cond_0

    .line 610
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    neg-int p1, p1

    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->min(II)I

    move-result v0

    :cond_0
    return v0
.end method

.method public getViewHorizontalDragRange(Landroid/view/View;)I
    .locals 0

    .line 520
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$100(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result p1

    and-int/lit8 p1, p1, 0x3

    return p1
.end method

.method public getViewVerticalDragRange(Landroid/view/View;)I
    .locals 0

    .line 525
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$100(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result p1

    and-int/lit8 p1, p1, 0x8

    return p1
.end method

.method public onViewDragStateChanged(I)V
    .locals 3

    .line 617
    invoke-super {p0, p1}, Lme/imid/swipebacklayout/lib/ViewDragHelper$Callback;->onViewDragStateChanged(I)V

    .line 618
    iget-object v0, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v0}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v0}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 619
    iget-object v0, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v0}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lme/imid/swipebacklayout/lib/SwipeBackLayout$SwipeListener;

    .line 620
    iget-object v2, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$500(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)F

    move-result v2

    invoke-interface {v1, p1, v2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout$SwipeListener;->onScrollStateChange(IF)V

    goto :goto_0

    :cond_0
    return-void
.end method

.method public onViewPositionChanged(Landroid/view/View;IIII)V
    .locals 2

    .line 530
    invoke-super/range {p0 .. p5}, Lme/imid/swipebacklayout/lib/ViewDragHelper$Callback;->onViewPositionChanged(Landroid/view/View;IIII)V

    .line 531
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$300(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result p1

    const/4 p4, 0x1

    and-int/2addr p1, p4

    if-eqz p1, :cond_0

    .line 532
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    int-to-float p5, p2

    .line 533
    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$600(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iget-object v1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$700(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    add-int/2addr v0, v1

    int-to-float v0, v0

    div-float/2addr p5, v0

    .line 532
    invoke-static {p5}, Ljava/lang/Math;->abs(F)F

    move-result p5

    invoke-static {p1, p5}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$502(Lme/imid/swipebacklayout/lib/SwipeBackLayout;F)F

    goto :goto_0

    .line 534
    :cond_0
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$300(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result p1

    and-int/lit8 p1, p1, 0x2

    if-eqz p1, :cond_1

    .line 535
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    int-to-float p5, p2

    .line 536
    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$600(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    iget-object v1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$800(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    add-int/2addr v0, v1

    int-to-float v0, v0

    div-float/2addr p5, v0

    .line 535
    invoke-static {p5}, Ljava/lang/Math;->abs(F)F

    move-result p5

    invoke-static {p1, p5}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$502(Lme/imid/swipebacklayout/lib/SwipeBackLayout;F)F

    goto :goto_0

    .line 537
    :cond_1
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$300(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result p1

    and-int/lit8 p1, p1, 0x8

    if-eqz p1, :cond_2

    .line 538
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    int-to-float p5, p3

    .line 539
    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$600(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    iget-object v1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$900(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v1

    add-int/2addr v0, v1

    int-to-float v0, v0

    div-float/2addr p5, v0

    .line 538
    invoke-static {p5}, Ljava/lang/Math;->abs(F)F

    move-result p5

    invoke-static {p1, p5}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$502(Lme/imid/swipebacklayout/lib/SwipeBackLayout;F)F

    .line 541
    :cond_2
    :goto_0
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1, p2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$1002(Lme/imid/swipebacklayout/lib/SwipeBackLayout;I)I

    .line 542
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1, p3}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$1102(Lme/imid/swipebacklayout/lib/SwipeBackLayout;I)I

    .line 543
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-virtual {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->invalidate()V

    .line 544
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$500(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)F

    move-result p1

    iget-object p2, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$1200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)F

    move-result p2

    cmpg-float p1, p1, p2

    if-gez p1, :cond_3

    iget-boolean p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->mIsScrollOverValid:Z

    if-nez p1, :cond_3

    .line 545
    iput-boolean p4, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->mIsScrollOverValid:Z

    .line 548
    :cond_3
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_4

    .line 549
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lme/imid/swipebacklayout/lib/SwipeBackLayout$SwipeListener;

    .line 550
    iget-object p3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p3}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Lme/imid/swipebacklayout/lib/ViewDragHelper;

    move-result-object p3

    invoke-virtual {p3}, Lme/imid/swipebacklayout/lib/ViewDragHelper;->getViewDragState()I

    move-result p3

    iget-object p5, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p5}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$500(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)F

    move-result p5

    invoke-interface {p2, p3, p5}, Lme/imid/swipebacklayout/lib/SwipeBackLayout$SwipeListener;->onScrollStateChange(IF)V

    goto :goto_1

    .line 554
    :cond_4
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_5

    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_5

    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    .line 555
    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Lme/imid/swipebacklayout/lib/ViewDragHelper;

    move-result-object p1

    invoke-virtual {p1}, Lme/imid/swipebacklayout/lib/ViewDragHelper;->getViewDragState()I

    move-result p1

    if-ne p1, p4, :cond_5

    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    .line 556
    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$500(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)F

    move-result p1

    iget-object p2, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$1200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)F

    move-result p2

    cmpl-float p1, p1, p2

    if-ltz p1, :cond_5

    iget-boolean p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->mIsScrollOverValid:Z

    if-eqz p1, :cond_5

    const/4 p1, 0x0

    .line 557
    iput-boolean p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->mIsScrollOverValid:Z

    .line 558
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lme/imid/swipebacklayout/lib/SwipeBackLayout$SwipeListener;

    .line 559
    invoke-interface {p2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout$SwipeListener;->onScrollOverThreshold()V

    goto :goto_2

    .line 563
    :cond_5
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$500(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)F

    move-result p1

    const/high16 p2, 0x3f800000    # 1.0f

    cmpl-float p1, p1, p2

    if-ltz p1, :cond_7

    .line 564
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object p1

    if-eqz p1, :cond_7

    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_7

    .line 565
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_6
    :goto_3
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_7

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lme/imid/swipebacklayout/lib/SwipeBackLayout$SwipeListener;

    .line 566
    instance-of p3, p2, Lme/imid/swipebacklayout/lib/SwipeBackLayout$SwipeListenerEx;

    if-eqz p3, :cond_6

    .line 567
    check-cast p2, Lme/imid/swipebacklayout/lib/SwipeBackLayout$SwipeListenerEx;

    invoke-interface {p2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout$SwipeListenerEx;->onContentViewSwipedBack()V

    goto :goto_3

    :cond_7
    return-void
.end method

.method public onViewReleased(Landroid/view/View;FF)V
    .locals 5

    .line 576
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    move-result v0

    .line 577
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    move-result p1

    .line 580
    iget-object v1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$300(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result v1

    and-int/lit8 v1, v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_2

    cmpl-float p1, p2, v2

    if-gtz p1, :cond_1

    if-nez p1, :cond_0

    .line 581
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$500(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)F

    move-result p1

    iget-object p2, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$1200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)F

    move-result p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_0

    goto :goto_0

    :cond_0
    move v0, v3

    goto :goto_1

    :cond_1
    :goto_0
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    .line 582
    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$700(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    add-int/2addr v0, p1

    add-int/lit8 v0, v0, 0xa

    :goto_1
    move p1, v3

    move v3, v0

    goto/16 :goto_4

    .line 583
    :cond_2
    iget-object v1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$300(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result v1

    and-int/lit8 v1, v1, 0x2

    if-eqz v1, :cond_5

    cmpg-float p1, p2, v2

    if-ltz p1, :cond_4

    cmpl-float p1, p2, v2

    if-nez p1, :cond_3

    .line 584
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$500(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)F

    move-result p1

    iget-object p2, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$1200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)F

    move-result p2

    cmpl-float p1, p1, p2

    if-lez p1, :cond_3

    goto :goto_2

    :cond_3
    move p1, v3

    goto :goto_3

    :cond_4
    :goto_2
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    .line 585
    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$700(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p1

    add-int/2addr v0, p1

    add-int/lit8 v0, v0, 0xa

    neg-int p1, v0

    :goto_3
    move v4, v3

    move v3, p1

    move p1, v4

    goto :goto_4

    .line 586
    :cond_5
    iget-object p2, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$300(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result p2

    and-int/lit8 p2, p2, 0x8

    if-eqz p2, :cond_7

    cmpg-float p2, p3, v2

    if-ltz p2, :cond_6

    cmpl-float p2, p3, v2

    if-nez p2, :cond_7

    .line 587
    iget-object p2, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$500(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)F

    move-result p2

    iget-object p3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p3}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$1200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)F

    move-result p3

    cmpl-float p2, p2, p3

    if-lez p2, :cond_7

    :cond_6
    iget-object p2, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    .line 588
    invoke-static {p2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$900(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p2

    add-int/2addr p1, p2

    add-int/lit8 p1, p1, 0xa

    neg-int p1, p1

    goto :goto_4

    :cond_7
    move p1, v3

    .line 591
    :goto_4
    iget-object p2, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Lme/imid/swipebacklayout/lib/ViewDragHelper;

    move-result-object p2

    invoke-virtual {p2, v3, p1}, Lme/imid/swipebacklayout/lib/ViewDragHelper;->settleCapturedViewAt(II)Z

    .line 592
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-virtual {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->invalidate()V

    return-void
.end method

.method public tryCaptureView(Landroid/view/View;I)Z
    .locals 6

    .line 490
    iget-object p1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Lme/imid/swipebacklayout/lib/ViewDragHelper;

    move-result-object p1

    iget-object v0, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v0}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$100(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result v0

    invoke-virtual {p1, v0, p2}, Lme/imid/swipebacklayout/lib/ViewDragHelper;->isEdgeTouched(II)Z

    move-result p1

    const/16 v0, 0x8

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz p1, :cond_4

    .line 492
    iget-object v3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v3}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Lme/imid/swipebacklayout/lib/ViewDragHelper;

    move-result-object v3

    invoke-virtual {v3, v2, p2}, Lme/imid/swipebacklayout/lib/ViewDragHelper;->isEdgeTouched(II)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 493
    iget-object v3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v3, v2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$302(Lme/imid/swipebacklayout/lib/SwipeBackLayout;I)I

    goto :goto_0

    .line 494
    :cond_0
    iget-object v3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v3}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Lme/imid/swipebacklayout/lib/ViewDragHelper;

    move-result-object v3

    invoke-virtual {v3, v1, p2}, Lme/imid/swipebacklayout/lib/ViewDragHelper;->isEdgeTouched(II)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 495
    iget-object v3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v3, v1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$302(Lme/imid/swipebacklayout/lib/SwipeBackLayout;I)I

    goto :goto_0

    .line 496
    :cond_1
    iget-object v3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v3}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Lme/imid/swipebacklayout/lib/ViewDragHelper;

    move-result-object v3

    invoke-virtual {v3, v0, p2}, Lme/imid/swipebacklayout/lib/ViewDragHelper;->isEdgeTouched(II)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 497
    iget-object v3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v3, v0}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$302(Lme/imid/swipebacklayout/lib/SwipeBackLayout;I)I

    .line 499
    :cond_2
    :goto_0
    iget-object v3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v3}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object v3

    if-eqz v3, :cond_3

    iget-object v3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v3}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_3

    .line 500
    iget-object v3, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v3}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$400(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_1
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lme/imid/swipebacklayout/lib/SwipeBackLayout$SwipeListener;

    .line 501
    iget-object v5, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v5}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$300(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result v5

    invoke-interface {v4, v5}, Lme/imid/swipebacklayout/lib/SwipeBackLayout$SwipeListener;->onEdgeTouch(I)V

    goto :goto_1

    .line 504
    :cond_3
    iput-boolean v2, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->mIsScrollOverValid:Z

    :cond_4
    const/4 v3, 0x0

    .line 507
    iget-object v4, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v4}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$100(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result v4

    if-eq v4, v2, :cond_8

    iget-object v4, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v4}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$100(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result v4

    if-ne v4, v1, :cond_5

    goto :goto_2

    .line 509
    :cond_5
    iget-object v1, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v1}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$100(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result v1

    if-ne v1, v0, :cond_6

    .line 510
    iget-object v0, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v0}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Lme/imid/swipebacklayout/lib/ViewDragHelper;

    move-result-object v0

    .line 511
    invoke-virtual {v0, v2, p2}, Lme/imid/swipebacklayout/lib/ViewDragHelper;->checkTouchSlop(II)Z

    move-result p2

    goto :goto_3

    .line 512
    :cond_6
    iget-object p2, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {p2}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$100(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)I

    move-result p2

    const/16 v0, 0xb

    if-ne p2, v0, :cond_7

    goto :goto_4

    :cond_7
    move v2, v3

    goto :goto_4

    .line 508
    :cond_8
    :goto_2
    iget-object v0, p0, Lme/imid/swipebacklayout/lib/SwipeBackLayout$ViewDragCallback;->this$0:Lme/imid/swipebacklayout/lib/SwipeBackLayout;

    invoke-static {v0}, Lme/imid/swipebacklayout/lib/SwipeBackLayout;->access$200(Lme/imid/swipebacklayout/lib/SwipeBackLayout;)Lme/imid/swipebacklayout/lib/ViewDragHelper;

    move-result-object v0

    invoke-virtual {v0, v1, p2}, Lme/imid/swipebacklayout/lib/ViewDragHelper;->checkTouchSlop(II)Z

    move-result p2

    :goto_3
    xor-int/2addr v2, p2

    :goto_4
    and-int/2addr p1, v2

    return p1
.end method
