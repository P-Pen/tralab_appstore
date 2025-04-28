.class public Lcom/arialyy/aria/core/event/PeerIndexEvent;
.super Ljava/lang/Object;
.source "PeerIndexEvent.java"


# instance fields
.field public createTime:J

.field public key:Ljava/lang/String;

.field public peerIndex:I


# direct methods
.method public constructor <init>(Ljava/lang/String;I)V
    .locals 0

    .line 24
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 25
    iput p2, p0, Lcom/arialyy/aria/core/event/PeerIndexEvent;->peerIndex:I

    .line 26
    iput-object p1, p0, Lcom/arialyy/aria/core/event/PeerIndexEvent;->key:Ljava/lang/String;

    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p1

    iput-wide p1, p0, Lcom/arialyy/aria/core/event/PeerIndexEvent;->createTime:J

    return-void
.end method
