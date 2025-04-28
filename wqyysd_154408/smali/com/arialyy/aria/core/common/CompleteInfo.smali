.class public Lcom/arialyy/aria/core/common/CompleteInfo;
.super Ljava/lang/Object;
.source "CompleteInfo.java"


# instance fields
.field public code:I

.field public obj:Ljava/lang/Object;

.field public wrapper:Lcom/arialyy/aria/core/wrapper/ITaskWrapper;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(ILcom/arialyy/aria/core/wrapper/ITaskWrapper;)V
    .locals 0

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 39
    iput p1, p0, Lcom/arialyy/aria/core/common/CompleteInfo;->code:I

    .line 40
    iput-object p2, p0, Lcom/arialyy/aria/core/common/CompleteInfo;->wrapper:Lcom/arialyy/aria/core/wrapper/ITaskWrapper;

    return-void
.end method
