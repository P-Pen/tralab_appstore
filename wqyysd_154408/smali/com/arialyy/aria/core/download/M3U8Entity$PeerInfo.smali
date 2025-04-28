.class public Lcom/arialyy/aria/core/download/M3U8Entity$PeerInfo;
.super Ljava/lang/Object;
.source "M3U8Entity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arialyy/aria/core/download/M3U8Entity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PeerInfo"
.end annotation


# instance fields
.field public peerId:I

.field public peerPath:Ljava/lang/String;


# direct methods
.method public constructor <init>(ILjava/lang/String;)V
    .locals 0

    .line 249
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 250
    iput p1, p0, Lcom/arialyy/aria/core/download/M3U8Entity$PeerInfo;->peerId:I

    .line 251
    iput-object p2, p0, Lcom/arialyy/aria/core/download/M3U8Entity$PeerInfo;->peerPath:Ljava/lang/String;

    return-void
.end method
