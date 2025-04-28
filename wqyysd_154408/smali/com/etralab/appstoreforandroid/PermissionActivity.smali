.class public Lcom/etralab/appstoreforandroid/PermissionActivity;
.super Landroid/app/Activity;
.source "PermissionActivity.java"


# instance fields
.field isOW3:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 16
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    const/4 v0, 0x0

    .line 18
    iput-boolean v0, p0, Lcom/etralab/appstoreforandroid/PermissionActivity;->isOW3:Z

    return-void
.end method


# virtual methods
.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .locals 2

    .line 97
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 p1, 0x1

    return p1

    .line 101
    :cond_0
    invoke-super {p0, p1}, Landroid/app/Activity;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 3

    .line 22
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 24
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/PermissionActivity;->requestWindowFeature(I)Z

    const v0, 0x7f0b0037

    .line 25
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/PermissionActivity;->setContentView(I)V

    .line 27
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "OWW211"

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    const-string v1, "OWW212"

    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 28
    :cond_0
    iput-boolean p1, p0, Lcom/etralab/appstoreforandroid/PermissionActivity;->isOW3:Z

    :cond_1
    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 32
    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_2

    .line 35
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p1}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    :cond_2
    const-string v0, "com.android.permission.GET_INSTALLED_APPS"

    .line 39
    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    .line 40
    iget-boolean v2, p0, Lcom/etralab/appstoreforandroid/PermissionActivity;->isOW3:Z

    if-eqz v2, :cond_3

    if-eqz v1, :cond_3

    .line 42
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, p1}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    :cond_3
    return-void
.end method

.method protected onResume()V
    .locals 5

    .line 58
    invoke-super {p0}, Landroid/app/Activity;->onResume()V

    const-string v0, "android.permission.WRITE_EXTERNAL_STORAGE"

    .line 61
    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    .line 64
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v2}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    :cond_0
    const-string v0, "com.android.permission.GET_INSTALLED_APPS"

    .line 68
    invoke-static {p0, v0}, Landroidx/core/content/ContextCompat;->checkSelfPermission(Landroid/content/Context;Ljava/lang/String;)I

    move-result v3

    .line 69
    iget-boolean v4, p0, Lcom/etralab/appstoreforandroid/PermissionActivity;->isOW3:Z

    if-eqz v4, :cond_1

    if-eqz v3, :cond_1

    .line 71
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0, v2}, Landroidx/core/app/ActivityCompat;->requestPermissions(Landroid/app/Activity;[Ljava/lang/String;I)V

    .line 84
    :cond_1
    iget-boolean v0, p0, Lcom/etralab/appstoreforandroid/PermissionActivity;->isOW3:Z

    if-eqz v0, :cond_2

    if-nez v1, :cond_3

    if-nez v3, :cond_3

    .line 86
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/PermissionActivity;->finish()V

    goto :goto_0

    :cond_2
    if-nez v1, :cond_3

    .line 90
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/PermissionActivity;->finish()V

    :cond_3
    :goto_0
    return-void
.end method
