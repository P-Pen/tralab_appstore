.class Lcom/etralab/appstoreforandroid/InstallApkActivity$4;
.super Ljava/lang/Object;
.source "InstallApkActivity.java"

# interfaces
.implements Lcom/etralab/appstoreforandroid/AdbBase64;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/InstallApkActivity;->getBase64Impl()Lcom/etralab/appstoreforandroid/AdbBase64;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .line 417
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public encodeToString([B)Ljava/lang/String;
    .locals 0

    .line 421
    invoke-static {p1}, Lorg/apache/commons/codec/binary/Base64;->encodeBase64([B)[B

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
