.class public Lcom/etralab/appstoreforandroid/App;
.super Ljava/lang/Object;
.source "App.java"


# instance fields
.field private final appDownloadNumber:Ljava/lang/String;

.field private final appId:Ljava/lang/String;

.field private final appLikeNumber:Ljava/lang/String;

.field private final appLogoUrl:Ljava/lang/String;

.field private final appName:Ljava/lang/String;

.field private final appOsType:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/App;->appId:Ljava/lang/String;

    .line 13
    iput-object p2, p0, Lcom/etralab/appstoreforandroid/App;->appName:Ljava/lang/String;

    .line 14
    iput-object p3, p0, Lcom/etralab/appstoreforandroid/App;->appLogoUrl:Ljava/lang/String;

    .line 15
    iput-object p4, p0, Lcom/etralab/appstoreforandroid/App;->appDownloadNumber:Ljava/lang/String;

    .line 16
    iput-object p5, p0, Lcom/etralab/appstoreforandroid/App;->appLikeNumber:Ljava/lang/String;

    .line 17
    iput-object p6, p0, Lcom/etralab/appstoreforandroid/App;->appOsType:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public getAppDownloadNumber()Ljava/lang/String;
    .locals 1

    .line 33
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/App;->appDownloadNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getAppId()Ljava/lang/String;
    .locals 1

    .line 21
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/App;->appId:Ljava/lang/String;

    return-object v0
.end method

.method public getAppLikeNumber()Ljava/lang/String;
    .locals 1

    .line 37
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/App;->appLikeNumber:Ljava/lang/String;

    return-object v0
.end method

.method public getAppLogoUrl()Ljava/lang/String;
    .locals 1

    .line 29
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/App;->appLogoUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getAppName()Ljava/lang/String;
    .locals 1

    .line 25
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/App;->appName:Ljava/lang/String;

    return-object v0
.end method

.method public getAppOsType()Ljava/lang/String;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/App;->appOsType:Ljava/lang/String;

    return-object v0
.end method
