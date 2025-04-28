.class public Lcom/etralab/appstoreforandroid/AboutActivity;
.super Landroid/app/Activity;
.source "AboutActivity.java"


# instance fields
.field tv_buildCode_clickNumber:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 10
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    .line 12
    iput v0, p0, Lcom/etralab/appstoreforandroid/AboutActivity;->tv_buildCode_clickNumber:I

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 16
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 18
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AboutActivity;->requestWindowFeature(I)Z

    const p1, 0x7f0b001c

    .line 19
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AboutActivity;->setContentView(I)V

    const p1, 0x7f080236

    .line 21
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/AboutActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    .line 23
    new-instance v0, Lcom/etralab/appstoreforandroid/AboutActivity$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/AboutActivity$1;-><init>(Lcom/etralab/appstoreforandroid/AboutActivity;)V

    invoke-virtual {p1, v0}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
