.class Lcom/etralab/appstoreforandroid/AppAdapter$ViewHolder;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
.source "AppAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/etralab/appstoreforandroid/AppAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "ViewHolder"
.end annotation


# instance fields
.field appDownloadNumber:Landroid/widget/TextView;

.field appId:Landroid/widget/TextView;

.field appLikeNumber:Landroid/widget/TextView;

.field appLogo:Lcom/etralab/appstoreforandroid/MyImageView;

.field appName:Landroid/widget/TextView;

.field appOsType:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 37
    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f0800d2

    .line 38
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/etralab/appstoreforandroid/MyImageView;

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/AppAdapter$ViewHolder;->appLogo:Lcom/etralab/appstoreforandroid/MyImageView;

    const v0, 0x7f080229

    .line 39
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/AppAdapter$ViewHolder;->appId:Landroid/widget/TextView;

    const v0, 0x7f080224

    .line 40
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/AppAdapter$ViewHolder;->appName:Landroid/widget/TextView;

    const v0, 0x7f080225

    .line 41
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/AppAdapter$ViewHolder;->appDownloadNumber:Landroid/widget/TextView;

    const v0, 0x7f080226

    .line 42
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/AppAdapter$ViewHolder;->appLikeNumber:Landroid/widget/TextView;

    const v0, 0x7f0800d5

    .line 43
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/ImageView;

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AppAdapter$ViewHolder;->appOsType:Landroid/widget/ImageView;

    return-void
.end method
