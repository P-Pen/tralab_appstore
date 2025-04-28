.class public Lcom/etralab/appstoreforandroid/LauncherActivity;
.super Landroid/app/Activity;
.source "LauncherActivity.java"


# instance fields
.field private context:Landroid/content/Context;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 13
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 14
    iput-object p0, p0, Lcom/etralab/appstoreforandroid/LauncherActivity;->context:Landroid/content/Context;

    return-void
.end method

.method static synthetic access$000(Lcom/etralab/appstoreforandroid/LauncherActivity;)Landroid/content/Context;
    .locals 0

    .line 13
    iget-object p0, p0, Lcom/etralab/appstoreforandroid/LauncherActivity;->context:Landroid/content/Context;

    return-object p0
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 35
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 39
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 18
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 20
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/LauncherActivity;->requestWindowFeature(I)Z

    const p1, 0x7f0b0032

    .line 21
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/LauncherActivity;->setContentView(I)V

    .line 23
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    new-instance v0, Lcom/etralab/appstoreforandroid/LauncherActivity$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/LauncherActivity$1;-><init>(Lcom/etralab/appstoreforandroid/LauncherActivity;)V

    const-wide/16 v1, 0x5dc

    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
