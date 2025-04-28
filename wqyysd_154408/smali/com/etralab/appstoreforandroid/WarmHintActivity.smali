.class public Lcom/etralab/appstoreforandroid/WarmHintActivity;
.super Landroid/app/Activity;
.source "WarmHintActivity.java"


# instance fields
.field isCheckBoxClicked:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 15
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    .line 17
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/WarmHintActivity;->isCheckBoxClicked:Z

    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 67
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 71
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 21
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 23
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/WarmHintActivity;->requestWindowFeature(I)Z

    const p1, 0x7f0b0047

    .line 24
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/WarmHintActivity;->setContentView(I)V

    const p1, 0x7f080068

    .line 48
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/WarmHintActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/Button;

    .line 49
    new-instance v0, Lcom/etralab/appstoreforandroid/WarmHintActivity$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/WarmHintActivity$1;-><init>(Lcom/etralab/appstoreforandroid/WarmHintActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
