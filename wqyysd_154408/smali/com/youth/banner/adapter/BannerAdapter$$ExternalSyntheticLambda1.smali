.class public final synthetic Lcom/youth/banner/adapter/BannerAdapter$$ExternalSyntheticLambda1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic f$0:Lcom/youth/banner/adapter/BannerAdapter;

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lcom/youth/banner/adapter/BannerAdapter;Ljava/lang/Object;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/youth/banner/adapter/BannerAdapter$$ExternalSyntheticLambda1;->f$0:Lcom/youth/banner/adapter/BannerAdapter;

    iput-object p2, p0, Lcom/youth/banner/adapter/BannerAdapter$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    iput p3, p0, Lcom/youth/banner/adapter/BannerAdapter$$ExternalSyntheticLambda1;->f$2:I

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .locals 3

    iget-object v0, p0, Lcom/youth/banner/adapter/BannerAdapter$$ExternalSyntheticLambda1;->f$0:Lcom/youth/banner/adapter/BannerAdapter;

    iget-object v1, p0, Lcom/youth/banner/adapter/BannerAdapter$$ExternalSyntheticLambda1;->f$1:Ljava/lang/Object;

    iget v2, p0, Lcom/youth/banner/adapter/BannerAdapter$$ExternalSyntheticLambda1;->f$2:I

    invoke-virtual {v0, v1, v2, p1}, Lcom/youth/banner/adapter/BannerAdapter;->lambda$onBindViewHolder$0$com-youth-banner-adapter-BannerAdapter(Ljava/lang/Object;ILandroid/view/View;)V

    return-void
.end method
