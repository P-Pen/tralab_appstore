.class Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData$1;
.super Ljava/lang/Object;
.source "ScreenshotActivity.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;->setScreenshotDownloadUrl(ILjava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;)V
    .locals 0

    .line 124
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData$1;->this$1:Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 127
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData$1;->this$1:Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;

    iget-object p1, p1, Lcom/etralab/appstoreforandroid/ScreenshotActivity$ViewData;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ScreenshotActivity;->finish()V

    return-void
.end method
