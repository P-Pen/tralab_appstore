.class public abstract Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;
.super Ljava/lang/Object;
.source "DebugFloatBase.java"


# static fields
.field static final FULLSCREEN_NOT_TOUCHABLE:I = 0x2

.field static final FULLSCREEN_TOUCHABLE:I = 0x1

.field public static final TAG:Ljava/lang/String; = "AbsFloatBase"

.field static final WRAP_CONTENT_NOT_TOUCHABLE:I = 0x4

.field static final WRAP_CONTENT_TOUCHABLE:I = 0x3

.field static mInflate:Landroid/view/View;


# instance fields
.field protected mAddX:I

.field protected mAddY:I

.field private mAdded:Z

.field mContext:Landroid/content/Context;

.field mGravity:I

.field mHandler:Landroid/os/Handler;

.field private mInvisibleNeed:Z

.field mLayoutParams:Landroid/view/WindowManager$LayoutParams;

.field private mRequestFocus:Z

.field mViewMode:I

.field mWindowManager:Landroid/view/WindowManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 36
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInvisibleNeed:Z

    .line 37
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mRequestFocus:Z

    const/16 v1, 0x11

    .line 38
    iput v1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mGravity:I

    const/4 v1, 0x4

    .line 39
    iput v1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mViewMode:I

    .line 40
    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mHandler:Landroid/os/Handler;

    .line 41
    iput v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mAddX:I

    .line 42
    iput v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mAddY:I

    .line 45
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mContext:Landroid/content/Context;

    .line 47
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->create()V

    return-void
.end method

.method protected static findView(I)Landroid/view/View;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Landroid/view/View;",
            ">(I)TT;"
        }
    .end annotation

    .line 138
    sget-object v0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInflate:Landroid/view/View;

    if-eqz v0, :cond_0

    .line 139
    invoke-virtual {v0, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method


# virtual methods
.method public create()V
    .locals 2

    .line 71
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mContext:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    const-string v1, "window"

    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mWindowManager:Landroid/view/WindowManager;

    return-void
.end method

.method protected getLayoutParam(I)V
    .locals 3

    const/4 v0, 0x1

    if-eq p1, v0, :cond_3

    const/4 v1, 0x2

    const/4 v2, 0x0

    if-eq p1, v1, :cond_2

    const/4 v1, 0x3

    if-eq p1, v1, :cond_1

    const/4 v0, 0x4

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 161
    :cond_0
    invoke-static {v2, v2}, Lcom/etralab/appstoreforandroid/basefloat/FloatWindowParamManager;->getFloatLayoutParam(ZZ)Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    goto :goto_0

    .line 165
    :cond_1
    invoke-static {v2, v0}, Lcom/etralab/appstoreforandroid/basefloat/FloatWindowParamManager;->getFloatLayoutParam(ZZ)Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    goto :goto_0

    .line 157
    :cond_2
    invoke-static {v0, v2}, Lcom/etralab/appstoreforandroid/basefloat/FloatWindowParamManager;->getFloatLayoutParam(ZZ)Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    goto :goto_0

    .line 153
    :cond_3
    invoke-static {v0, v0}, Lcom/etralab/appstoreforandroid/basefloat/FloatWindowParamManager;->getFloatLayoutParam(ZZ)Landroid/view/WindowManager$LayoutParams;

    move-result-object p1

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    .line 169
    :goto_0
    iget-boolean p1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mRequestFocus:Z

    if-eqz p1, :cond_4

    .line 170
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    iget v0, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    and-int/lit8 v0, v0, -0x9

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->flags:I

    .line 173
    :cond_4
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    iget v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mGravity:I

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->gravity:I

    return-void
.end method

.method public getVisibility()Z
    .locals 1

    .line 182
    sget-object v0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInflate:Landroid/view/View;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public gone()V
    .locals 2

    .line 109
    sget-object v0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInflate:Landroid/view/View;

    if-eqz v0, :cond_0

    const/16 v1, 0x8

    .line 110
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method public hide()V
    .locals 2

    .line 102
    sget-object v0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInflate:Landroid/view/View;

    if-eqz v0, :cond_0

    const/4 v1, 0x4

    .line 103
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    :cond_0
    return-void
.end method

.method protected inflate(I)Landroid/view/View;
    .locals 2

    .line 130
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mContext:Landroid/content/Context;

    const/4 v1, 0x0

    invoke-static {v0, p1, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object p1

    sput-object p1, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInflate:Landroid/view/View;

    return-object p1
.end method

.method protected abstract onAddWindowFailed(Ljava/lang/Exception;)V
.end method

.method public remove()V
    .locals 2

    .line 116
    sget-object v0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInflate:Landroid/view/View;

    if-eqz v0, :cond_1

    iget-object v1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mWindowManager:Landroid/view/WindowManager;

    if-eqz v1, :cond_1

    .line 117
    invoke-virtual {v0}, Landroid/view/View;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 118
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mWindowManager:Landroid/view/WindowManager;

    sget-object v1, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInflate:Landroid/view/View;

    invoke-interface {v0, v1}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V

    :cond_0
    const/4 v0, 0x0

    .line 120
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mAdded:Z

    .line 123
    :cond_1
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mHandler:Landroid/os/Handler;

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    .line 124
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    :cond_2
    return-void
.end method

.method public requestFocus(Z)V
    .locals 0

    .line 66
    iput-boolean p1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mRequestFocus:Z

    return-void
.end method

.method public setInvisibleNeed(Z)V
    .locals 0

    .line 56
    iput-boolean p1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInvisibleNeed:Z

    return-void
.end method

.method public declared-synchronized show()V
    .locals 4

    monitor-enter p0

    .line 77
    :try_start_0
    sget-object v0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInflate:Landroid/view/View;

    if-eqz v0, :cond_1

    .line 80
    iget-boolean v1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mAdded:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    .line 81
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 82
    monitor-exit p0

    return-void

    .line 85
    :cond_0
    :try_start_1
    iget v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mViewMode:I

    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->getLayoutParam(I)V

    .line 87
    sget-object v0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInflate:Landroid/view/View;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 90
    :try_start_2
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    iget v1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mAddX:I

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    .line 91
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    iget v1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mAddY:I

    iput v1, v0, Landroid/view/WindowManager$LayoutParams;->y:I

    .line 92
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mWindowManager:Landroid/view/WindowManager;

    sget-object v1, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInflate:Landroid/view/View;

    iget-object v3, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mLayoutParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v0, v1, v3}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    const/4 v0, 0x1

    .line 93
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mAdded:Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 95
    :try_start_3
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mContext:Landroid/content/Context;

    const-string v3, "\u8bf7\u68c0\u67e5\u60ac\u6d6e\u7a97\u6743\u9650"

    invoke-static {v1, v3, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 96
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->onAddWindowFailed(Ljava/lang/Exception;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 98
    :goto_0
    monitor-exit p0

    return-void

    .line 78
    :cond_1
    :try_start_4
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "FloatView can not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public toggleVisibility()V
    .locals 1

    .line 193
    sget-object v0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInflate:Landroid/view/View;

    if-eqz v0, :cond_2

    .line 194
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->getVisibility()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 195
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->mInvisibleNeed:Z

    if-eqz v0, :cond_0

    .line 196
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->hide()V

    goto :goto_0

    .line 198
    :cond_0
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->gone()V

    goto :goto_0

    .line 201
    :cond_1
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/basefloat/DebugFloatBase;->show()V

    :cond_2
    :goto_0
    return-void
.end method
