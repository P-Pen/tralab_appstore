.class public Lcom/etralab/appstoreforandroid/HelpActivity;
.super Landroid/app/Activity;
.source "HelpActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 7
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 0

    .line 11
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 13
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/HelpActivity;->requestWindowFeature(I)Z

    const p1, 0x7f0b002f

    .line 14
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/HelpActivity;->setContentView(I)V

    return-void
.end method
