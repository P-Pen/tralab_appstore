.class public Lcom/etralab/appstoreforandroid/RestartMainActivity;
.super Landroid/app/Activity;
.source "RestartMainActivity.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 8
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    return-void
.end method


# virtual methods
.method protected onCreate(Landroid/os/Bundle;)V
    .locals 1

    .line 12
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 14
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/RestartMainActivity;->requestWindowFeature(I)Z

    const p1, 0x7f0b0038

    .line 15
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/RestartMainActivity;->setContentView(I)V

    .line 18
    sget-object p1, Lcom/etralab/appstoreforandroid/MainActivity;->instance:Lcom/etralab/appstoreforandroid/MainActivity;

    if-eqz p1, :cond_0

    .line 19
    sget-object p1, Lcom/etralab/appstoreforandroid/MainActivity;->instance:Lcom/etralab/appstoreforandroid/MainActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/MainActivity;->finish()V

    .line 23
    :cond_0
    new-instance p1, Landroid/content/Intent;

    const-class v0, Lcom/etralab/appstoreforandroid/MainActivity;

    invoke-direct {p1, p0, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 24
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/RestartMainActivity;->startActivity(Landroid/content/Intent;)V

    .line 27
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/RestartMainActivity;->finish()V

    return-void
.end method
