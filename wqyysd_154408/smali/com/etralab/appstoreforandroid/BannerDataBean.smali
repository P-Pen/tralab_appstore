.class public Lcom/etralab/appstoreforandroid/BannerDataBean;
.super Ljava/lang/Object;
.source "BannerDataBean.java"


# instance fields
.field private final bannerId:Ljava/lang/String;

.field private final bannerImgUrl:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/BannerDataBean;->bannerId:Ljava/lang/String;

    .line 9
    iput-object p2, p0, Lcom/etralab/appstoreforandroid/BannerDataBean;->bannerImgUrl:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getBannerId()Ljava/lang/String;
    .locals 1

    .line 13
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/BannerDataBean;->bannerId:Ljava/lang/String;

    return-object v0
.end method

.method public getBannerImgUrl()Ljava/lang/String;
    .locals 1

    .line 17
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/BannerDataBean;->bannerImgUrl:Ljava/lang/String;

    return-object v0
.end method
