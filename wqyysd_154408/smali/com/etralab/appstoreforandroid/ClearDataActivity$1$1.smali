.class Lcom/etralab/appstoreforandroid/ClearDataActivity$1$1;
.super Ljava/lang/Thread;
.source "ClearDataActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ClearDataActivity$1;->onClick(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/ClearDataActivity$1;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ClearDataActivity$1;)V
    .locals 0

    .line 80
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ClearDataActivity$1$1;->this$1:Lcom/etralab/appstoreforandroid/ClearDataActivity$1;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 83
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    const-wide/16 v0, 0xdac

    .line 85
    :try_start_0
    invoke-static {v0, v1}, Lcom/etralab/appstoreforandroid/ClearDataActivity$1$1;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 87
    invoke-virtual {v0}, Ljava/lang/InterruptedException;->printStackTrace()V

    .line 90
    :goto_0
    invoke-static {}, Landroid/os/Process;->myPid()I

    move-result v0

    invoke-static {v0}, Landroid/os/Process;->killProcess(I)V

    const/4 v0, 0x0

    .line 91
    invoke-static {v0}, Ljava/lang/System;->exit(I)V

    return-void
.end method
