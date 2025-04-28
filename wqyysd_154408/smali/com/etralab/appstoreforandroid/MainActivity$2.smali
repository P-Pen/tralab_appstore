.class Lcom/etralab/appstoreforandroid/MainActivity$2;
.super Landroidx/viewpager2/widget/ViewPager2$OnPageChangeCallback;
.source "MainActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/MainActivity;->SetDots()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/MainActivity;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/MainActivity;)V
    .locals 0

    .line 257
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/MainActivity$2;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    invoke-direct {p0}, Landroidx/viewpager2/widget/ViewPager2$OnPageChangeCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageSelected(I)V
    .locals 3

    .line 260
    invoke-super {p0, p1}, Landroidx/viewpager2/widget/ViewPager2$OnPageChangeCallback;->onPageSelected(I)V

    const/4 v0, 0x0

    .line 261
    :goto_0
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/MainActivity$2;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/MainActivity;->dots:Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 263
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/MainActivity$2;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/MainActivity;->dots:Landroid/widget/LinearLayout;

    invoke-virtual {v1, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    const v2, 0x7f070177

    invoke-virtual {v1, v2}, Landroid/view/View;->setBackgroundResource(I)V

    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_0
    if-nez p1, :cond_1

    .line 267
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity$2;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/MainActivity;->dots:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f070126

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_1

    :cond_1
    const/4 v0, 0x1

    if-ne p1, v0, :cond_2

    .line 269
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity$2;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/MainActivity;->dots:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f070111

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_1

    :cond_2
    const/4 v0, 0x2

    if-ne p1, v0, :cond_3

    .line 271
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity$2;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/MainActivity;->dots:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f07015b

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    goto :goto_1

    .line 273
    :cond_3
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/MainActivity$2;->this$0:Lcom/etralab/appstoreforandroid/MainActivity;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/MainActivity;->dots:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p1}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f07016f

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundResource(I)V

    :goto_1
    return-void
.end method
