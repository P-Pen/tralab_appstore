.class Lcom/etralab/appstoreforandroid/ScreenshotActivity$1;
.super Ljava/lang/Thread;
.source "ScreenshotActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ScreenshotActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity;)V
    .locals 0

    .line 51
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 54
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 56
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$1;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->access$000(Lcom/etralab/appstoreforandroid/ScreenshotActivity;)V

    return-void
.end method
