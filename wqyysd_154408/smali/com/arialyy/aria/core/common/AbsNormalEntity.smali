.class public abstract Lcom/arialyy/aria/core/common/AbsNormalEntity;
.super Lcom/arialyy/aria/core/common/AbsEntity;
.source "AbsNormalEntity.java"

# interfaces
.implements Landroid/os/Parcelable;


# instance fields
.field private fileName:Ljava/lang/String;

.field private isGroupChild:Z
    .annotation runtime Lcom/arialyy/aria/orm/annotation/Default;
        value = "false"
    .end annotation
.end field

.field private isRedirect:Z
    .annotation runtime Lcom/arialyy/aria/orm/annotation/Default;
        value = "false"
    .end annotation
.end field

.field private redirectUrl:Ljava/lang/String;

.field private taskType:I

.field private url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 101
    invoke-direct {p0}, Lcom/arialyy/aria/core/common/AbsEntity;-><init>()V

    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->isGroupChild:Z

    .line 44
    iput-boolean v0, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->isRedirect:Z

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 3

    .line 118
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/common/AbsEntity;-><init>(Landroid/os/Parcel;)V

    const/4 v0, 0x0

    .line 41
    iput-boolean v0, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->isGroupChild:Z

    .line 44
    iput-boolean v0, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->isRedirect:Z

    .line 119
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->url:Ljava/lang/String;

    .line 120
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->fileName:Ljava/lang/String;

    .line 121
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_0

    move v1, v2

    goto :goto_0

    :cond_0
    move v1, v0

    :goto_0
    iput-boolean v1, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->isGroupChild:Z

    .line 122
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v1

    if-eqz v1, :cond_1

    move v0, v2

    :cond_1
    iput-boolean v0, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->isRedirect:Z

    .line 123
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->redirectUrl:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getFileName()Ljava/lang/String;
    .locals 1

    .line 76
    iget-object v0, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->fileName:Ljava/lang/String;

    return-object v0
.end method

.method public abstract getFilePath()Ljava/lang/String;
.end method

.method public getRedirectUrl()Ljava/lang/String;
    .locals 1

    .line 92
    iget-object v0, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->redirectUrl:Ljava/lang/String;

    return-object v0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 1

    .line 60
    iget-object v0, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->url:Ljava/lang/String;

    return-object v0
.end method

.method public isGroupChild()Z
    .locals 1

    .line 68
    iget-boolean v0, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->isGroupChild:Z

    return v0
.end method

.method public isRedirect()Z
    .locals 1

    .line 84
    iget-boolean v0, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->isRedirect:Z

    return v0
.end method

.method public setFileName(Ljava/lang/String;)V
    .locals 0

    .line 80
    iput-object p1, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->fileName:Ljava/lang/String;

    return-void
.end method

.method public setGroupChild(Z)V
    .locals 0

    .line 72
    iput-boolean p1, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->isGroupChild:Z

    return-void
.end method

.method public setRedirect(Z)V
    .locals 0

    .line 88
    iput-boolean p1, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->isRedirect:Z

    return-void
.end method

.method public setRedirectUrl(Ljava/lang/String;)V
    .locals 0

    .line 96
    iput-object p1, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->redirectUrl:Ljava/lang/String;

    return-void
.end method

.method public setTaskType(I)V
    .locals 0

    .line 56
    iput p1, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->taskType:I

    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    .line 64
    iput-object p1, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->url:Ljava/lang/String;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 109
    invoke-super {p0, p1, p2}, Lcom/arialyy/aria/core/common/AbsEntity;->writeToParcel(Landroid/os/Parcel;I)V

    .line 110
    iget-object p2, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->url:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 111
    iget-object p2, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->fileName:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 112
    iget-boolean p2, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->isGroupChild:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 113
    iget-boolean p2, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->isRedirect:Z

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeByte(B)V

    .line 114
    iget-object p2, p0, Lcom/arialyy/aria/core/common/AbsNormalEntity;->redirectUrl:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
