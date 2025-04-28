.class Lcom/etralab/appstoreforandroid/ScreenshotActivity$2$1;
.super Ljava/lang/Thread;
.source "ScreenshotActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ScreenshotActivity$2;->onPageSelected(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/ScreenshotActivity$2;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity$2;)V
    .locals 0

    .line 79
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$2$1;->this$1:Lcom/etralab/appstoreforandroid/ScreenshotActivity$2;

    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 82
    invoke-super {p0}, Ljava/lang/Thread;->run()V

    .line 84
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$2$1;->this$1:Lcom/etralab/appstoreforandroid/ScreenshotActivity$2;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->access$000(Lcom/etralab/appstoreforandroid/ScreenshotActivity;)V

    return-void
.end method
