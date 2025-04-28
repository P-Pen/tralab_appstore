.class Lcom/arialyy/aria/core/download/M3U8Entity$1;
.super Ljava/lang/Object;
.source "M3U8Entity.java"

# interfaces
.implements Ljava/io/FilenameFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arialyy/aria/core/download/M3U8Entity;->getCompletedPeer()Ljava/util/List;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/arialyy/aria/core/download/M3U8Entity;


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/download/M3U8Entity;)V
    .locals 0

    .line 172
    iput-object p1, p0, Lcom/arialyy/aria/core/download/M3U8Entity$1;->this$0:Lcom/arialyy/aria/core/download/M3U8Entity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;Ljava/lang/String;)Z
    .locals 0

    const-string p1, ".ts"

    .line 174
    invoke-virtual {p2, p1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method
