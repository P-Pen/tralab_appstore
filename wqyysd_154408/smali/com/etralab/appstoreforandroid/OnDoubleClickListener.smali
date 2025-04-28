.class public Lcom/etralab/appstoreforandroid/OnDoubleClickListener;
.super Ljava/lang/Object;
.source "OnDoubleClickListener.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/etralab/appstoreforandroid/OnDoubleClickListener$DoubleClickCallback;
    }
.end annotation


# instance fields
.field private count:I

.field private firstClick:J

.field private mCallback:Lcom/etralab/appstoreforandroid/OnDoubleClickListener$DoubleClickCallback;

.field private secondClick:J

.field private final totalTime:I


# direct methods
.method public constructor <init>(Lcom/etralab/appstoreforandroid/OnDoubleClickListener$DoubleClickCallback;)V
    .locals 2

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->count:I

    const-wide/16 v0, 0x0

    .line 9
    iput-wide v0, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->firstClick:J

    .line 10
    iput-wide v0, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->secondClick:J

    const/16 v0, 0xfa

    .line 14
    iput v0, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->totalTime:I

    .line 25
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->mCallback:Lcom/etralab/appstoreforandroid/OnDoubleClickListener$DoubleClickCallback;

    return-void
.end method


# virtual methods
.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6

    .line 36
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 p2, 0x1

    if-nez p1, :cond_3

    .line 37
    iget p1, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->count:I

    add-int/2addr p1, p2

    iput p1, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->count:I

    if-ne p2, p1, :cond_0

    .line 39
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->firstClick:J

    goto :goto_1

    :cond_0
    const/4 v0, 0x2

    if-ne v0, p1, :cond_3

    .line 41
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->secondClick:J

    .line 42
    iget-wide v2, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->firstClick:J

    sub-long v2, v0, v2

    const-wide/16 v4, 0xfa

    cmp-long p1, v2, v4

    const-wide/16 v2, 0x0

    if-gez p1, :cond_2

    .line 43
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->mCallback:Lcom/etralab/appstoreforandroid/OnDoubleClickListener$DoubleClickCallback;

    if-eqz p1, :cond_1

    .line 44
    invoke-interface {p1}, Lcom/etralab/appstoreforandroid/OnDoubleClickListener$DoubleClickCallback;->onDoubleClick()V

    :cond_1
    const/4 p1, 0x0

    .line 46
    iput p1, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->count:I

    .line 47
    iput-wide v2, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->firstClick:J

    goto :goto_0

    .line 49
    :cond_2
    iput-wide v0, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->firstClick:J

    .line 50
    iput p2, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->count:I

    .line 52
    :goto_0
    iput-wide v2, p0, Lcom/etralab/appstoreforandroid/OnDoubleClickListener;->secondClick:J

    :cond_3
    :goto_1
    return p2
.end method
