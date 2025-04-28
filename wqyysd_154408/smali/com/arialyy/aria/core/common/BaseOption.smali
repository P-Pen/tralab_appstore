.class public abstract Lcom/arialyy/aria/core/common/BaseOption;
.super Ljava/lang/Object;
.source "BaseOption.java"


# instance fields
.field protected final TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 23
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/common/BaseOption;->TAG:Ljava/lang/String;

    return-void
.end method
