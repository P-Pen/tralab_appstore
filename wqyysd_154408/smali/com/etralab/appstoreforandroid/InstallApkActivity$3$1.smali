.class Lcom/etralab/appstoreforandroid/InstallApkActivity$3$1;
.super Ljava/lang/Object;
.source "InstallApkActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/InstallApkActivity$3;->handleMessage(Landroid/os/Message;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/InstallApkActivity$3;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/InstallApkActivity$3;)V
    .locals 0

    .line 355
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/InstallApkActivity$3;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    const-wide/16 v0, 0x1388

    .line 363
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V

    .line 364
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$3$1;->this$1:Lcom/etralab/appstoreforandroid/InstallApkActivity$3;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/InstallApkActivity$3;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->finish()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method
