.class public Lcom/arialyy/aria/core/upload/UploadEntity;
.super Lcom/arialyy/aria/core/common/AbsNormalEntity;
.source "UploadEntity.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator<",
            "Lcom/arialyy/aria/core/upload/UploadEntity;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private filePath:Ljava/lang/String;
    .annotation runtime Lcom/arialyy/aria/orm/annotation/Primary;
    .end annotation
.end field

.field private responseStr:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 85
    new-instance v0, Lcom/arialyy/aria/core/upload/UploadEntity$1;

    invoke-direct {v0}, Lcom/arialyy/aria/core/upload/UploadEntity$1;-><init>()V

    sput-object v0, Lcom/arialyy/aria/core/upload/UploadEntity;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 68
    invoke-direct {p0}, Lcom/arialyy/aria/core/common/AbsNormalEntity;-><init>()V

    const-string v0, ""

    .line 38
    iput-object v0, p0, Lcom/arialyy/aria/core/upload/UploadEntity;->responseStr:Ljava/lang/String;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 81
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/common/AbsNormalEntity;-><init>(Landroid/os/Parcel;)V

    const-string v0, ""

    .line 38
    iput-object v0, p0, Lcom/arialyy/aria/core/upload/UploadEntity;->responseStr:Ljava/lang/String;

    .line 82
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/upload/UploadEntity;->filePath:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getFilePath()Ljava/lang/String;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/UploadEntity;->filePath:Ljava/lang/String;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 58
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/UploadEntity;->filePath:Ljava/lang/String;

    return-object v0
.end method

.method public getResponseStr()Ljava/lang/String;
    .locals 1

    .line 41
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/UploadEntity;->responseStr:Ljava/lang/String;

    return-object v0
.end method

.method public getTaskType()I
    .locals 2

    .line 62
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/UploadEntity;->getUrl()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    .line 65
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/UploadEntity;->getUrl()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ftp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x6

    goto :goto_0

    :cond_1
    const/4 v0, 0x5

    :goto_0
    return v0
.end method

.method public setFilePath(Ljava/lang/String;)V
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/arialyy/aria/core/upload/UploadEntity;->filePath:Ljava/lang/String;

    return-void
.end method

.method public setResponseStr(Ljava/lang/String;)V
    .locals 0

    .line 45
    iput-object p1, p0, Lcom/arialyy/aria/core/upload/UploadEntity;->responseStr:Ljava/lang/String;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 76
    invoke-super {p0, p1, p2}, Lcom/arialyy/aria/core/common/AbsNormalEntity;->writeToParcel(Landroid/os/Parcel;I)V

    .line 77
    iget-object p2, p0, Lcom/arialyy/aria/core/upload/UploadEntity;->filePath:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
