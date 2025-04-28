.class public Lcom/arialyy/aria/core/queue/pool/UploadExecutePool;
.super Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;
.source "UploadExecutePool.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TASK:",
        "Lcom/arialyy/aria/core/task/AbsTask;",
        ">",
        "Lcom/arialyy/aria/core/queue/pool/BaseExecutePool<",
        "TTASK;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 24
    invoke-direct {p0}, Lcom/arialyy/aria/core/queue/pool/BaseExecutePool;-><init>()V

    return-void
.end method


# virtual methods
.method protected getMaxSize()I
    .locals 1

    .line 26
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getUConfig()Lcom/arialyy/aria/core/config/UploadConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/UploadConfig;->getMaxTaskNum()I

    move-result v0

    return v0
.end method
