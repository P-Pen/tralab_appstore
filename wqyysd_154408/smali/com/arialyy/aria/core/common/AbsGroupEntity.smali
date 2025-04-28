.class public abstract Lcom/arialyy/aria/core/common/AbsGroupEntity;
.super Lcom/arialyy/aria/core/common/AbsEntity;
.source "AbsGroupEntity.java"

# interfaces
.implements Landroid/os/Parcelable;


# instance fields
.field private alias:Ljava/lang/String;

.field private dirPath:Ljava/lang/String;
    .annotation runtime Lcom/arialyy/aria/orm/annotation/Unique;
    .end annotation
.end field

.field protected groupHash:Ljava/lang/String;
    .annotation runtime Lcom/arialyy/aria/orm/annotation/Unique;
    .end annotation
.end field

.field private urls:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 85
    invoke-direct {p0}, Lcom/arialyy/aria/core/common/AbsEntity;-><init>()V

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->urls:Ljava/util/List;

    return-void
.end method

.method protected constructor <init>(Landroid/os/Parcel;)V
    .locals 1

    .line 99
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/common/AbsEntity;-><init>(Landroid/os/Parcel;)V

    .line 47
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->urls:Ljava/util/List;

    .line 100
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->groupHash:Ljava/lang/String;

    .line 101
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->alias:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public describeContents()I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method

.method public getAlias()Ljava/lang/String;
    .locals 1

    .line 74
    iget-object v0, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->alias:Ljava/lang/String;

    return-object v0
.end method

.method public getDirPath()Ljava/lang/String;
    .locals 1

    .line 50
    iget-object v0, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->dirPath:Ljava/lang/String;

    return-object v0
.end method

.method public getGroupHash()Ljava/lang/String;
    .locals 1

    .line 70
    iget-object v0, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->groupHash:Ljava/lang/String;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .line 78
    iget-object v0, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->groupHash:Ljava/lang/String;

    return-object v0
.end method

.method public getUrls()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 58
    iget-object v0, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->urls:Ljava/util/List;

    return-object v0
.end method

.method public setAlias(Ljava/lang/String;)V
    .locals 0

    .line 82
    iput-object p1, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->alias:Ljava/lang/String;

    return-void
.end method

.method public setDirPath(Ljava/lang/String;)V
    .locals 0

    .line 54
    iput-object p1, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->dirPath:Ljava/lang/String;

    return-void
.end method

.method public setUrls(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 62
    iput-object p1, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->urls:Ljava/util/List;

    return-void
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 0

    .line 93
    invoke-super {p0, p1, p2}, Lcom/arialyy/aria/core/common/AbsEntity;->writeToParcel(Landroid/os/Parcel;I)V

    .line 94
    iget-object p2, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->groupHash:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 95
    iget-object p2, p0, Lcom/arialyy/aria/core/common/AbsGroupEntity;->alias:Ljava/lang/String;

    invoke-virtual {p1, p2}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    return-void
.end method
