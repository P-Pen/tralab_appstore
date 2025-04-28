.class final Lcom/arialyy/aria/core/command/StopAllCmd;
.super Lcom/arialyy/aria/core/command/AbsNormalCmd;
.source "StopAllCmd.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;",
        ">",
        "Lcom/arialyy/aria/core/command/AbsNormalCmd<",
        "TT;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;I)V"
        }
    .end annotation

    .line 11
    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/core/command/AbsNormalCmd;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;I)V

    return-void
.end method


# virtual methods
.method public executeCmd()V
    .locals 0

    .line 15
    invoke-virtual {p0}, Lcom/arialyy/aria/core/command/StopAllCmd;->stopAll()V

    return-void
.end method
