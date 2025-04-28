.class Lcom/arialyy/aria/core/queue/pool/DGLoadExecutePool;
.super Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;
.source "DGLoadExecutePool.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<TASK:",
        "Lcom/arialyy/aria/core/task/AbsTask;",
        ">",
        "Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool<",
        "TTASK;>;"
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;


# direct methods
.method constructor <init>()V
    .locals 1

    .line 27
    invoke-direct {p0}, Lcom/arialyy/aria/core/queue/pool/DLoadExecutePool;-><init>()V

    .line 28
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/queue/pool/DGLoadExecutePool;->TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method protected getMaxSize()I
    .locals 1

    .line 31
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getDGConfig()Lcom/arialyy/aria/core/config/DGroupConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/DGroupConfig;->getMaxTaskNum()I

    move-result v0

    return v0
.end method
