.class Lcom/etralab/appstoreforandroid/HomeFragment$3;
.super Ljava/lang/Object;
.source "HomeFragment.java"

# interfaces
.implements Lcom/youth/banner/listener/OnPageChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/HomeFragment;->initBanner()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

.field final synthetic val$fl_indicator_background:Landroid/widget/FrameLayout;

.field final synthetic val$tv_indicator_selected:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/HomeFragment;Landroid/widget/FrameLayout;Landroid/widget/TextView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 634
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$3;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/HomeFragment$3;->val$fl_indicator_background:Landroid/widget/FrameLayout;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/HomeFragment$3;->val$tv_indicator_selected:Landroid/widget/TextView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPageScrollStateChanged(I)V
    .locals 0

    return-void
.end method

.method public onPageScrolled(IFI)V
    .locals 0

    .line 638
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$3;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const p2, 0x7f0801f5

    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ScrollView;

    .line 639
    invoke-virtual {p1}, Landroid/widget/ScrollView;->requestFocus()Z

    return-void
.end method

.method public onPageSelected(I)V
    .locals 3

    .line 644
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/HomeFragment$3;->val$fl_indicator_background:Landroid/widget/FrameLayout;

    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iget v0, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 645
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$3;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/HomeFragment;->bn_banner:Lcom/youth/banner/Banner;

    invoke-virtual {v1}, Lcom/youth/banner/Banner;->getRealCount()I

    move-result v1

    .line 647
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/HomeFragment$3;->val$tv_indicator_selected:Landroid/widget/TextView;

    .line 648
    invoke-virtual {v2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout$LayoutParams;

    mul-int/2addr v0, p1

    .line 649
    div-int/2addr v0, v1

    iput v0, v2, Landroid/widget/FrameLayout$LayoutParams;->leftMargin:I

    .line 650
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$3;->val$tv_indicator_selected:Landroid/widget/TextView;

    invoke-virtual {p1, v2}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 653
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/HomeFragment$3;->this$0:Lcom/etralab/appstoreforandroid/HomeFragment;

    invoke-virtual {p1}, Lcom/etralab/appstoreforandroid/HomeFragment;->getActivity()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    const v0, 0x7f0801f5

    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentActivity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ScrollView;

    .line 654
    invoke-virtual {p1}, Landroid/widget/ScrollView;->requestFocus()Z

    return-void
.end method
