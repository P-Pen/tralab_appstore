.class Lcom/etralab/appstoreforandroid/ScreenshotActivity$2;
.super Landroidx/viewpager2/widget/ViewPager2$OnPageChangeCallback;
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

    .line 75
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/ScreenshotActivity$2;->this$0:Lcom/etralab/appstoreforandroid/ScreenshotActivity;

    invoke-direct {p0}, Landroidx/viewpager2/widget/ViewPager2$OnPageChangeCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 0

    .line 78
    invoke-super {p0, p1}, Landroidx/viewpager2/widget/ViewPager2$OnPageChangeCallback;->onPageSelected(I)V

    .line 79
    new-instance p1, Lcom/etralab/appstoreforandroid/ScreenshotActivity$2$1;

    invoke-direct {p1, p0}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$2$1;-><init>(Lcom/etralab/appstoreforandroid/ScreenshotActivity$2;)V

    .line 86
    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/ScreenshotActivity$2$1;->start()V

    return-void
.end method
