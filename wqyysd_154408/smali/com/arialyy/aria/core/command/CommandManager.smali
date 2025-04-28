.class public Lcom/arialyy/aria/core/command/CommandManager;
.super Ljava/lang/Object;
.source "CommandManager.java"


# static fields
.field private static instance:Lcom/arialyy/aria/core/command/CommandManager;


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/arialyy/aria/core/event/EventMsgUtil;->register(Ljava/lang/Object;)V

    return-void
.end method

.method public static init()V
    .locals 2

    .line 34
    sget-object v0, Lcom/arialyy/aria/core/command/CommandManager;->instance:Lcom/arialyy/aria/core/command/CommandManager;

    if-nez v0, :cond_1

    .line 35
    const-class v0, Lcom/arialyy/aria/core/command/CommandManager;

    monitor-enter v0

    .line 36
    :try_start_0
    sget-object v1, Lcom/arialyy/aria/core/command/CommandManager;->instance:Lcom/arialyy/aria/core/command/CommandManager;

    if-nez v1, :cond_0

    .line 37
    new-instance v1, Lcom/arialyy/aria/core/command/CommandManager;

    invoke-direct {v1}, Lcom/arialyy/aria/core/command/CommandManager;-><init>()V

    sput-object v1, Lcom/arialyy/aria/core/command/CommandManager;->instance:Lcom/arialyy/aria/core/command/CommandManager;

    .line 39
    :cond_0
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :cond_1
    :goto_0
    return-void
.end method


# virtual methods
.method public add(Lcom/arialyy/aria/core/command/AddCmd;)V
    .locals 1
    .annotation runtime Lcom/arialyy/aria/core/event/Event;
    .end annotation

    .line 45
    invoke-static {}, Lcom/arialyy/aria/util/CommonUtil;->isFastDoubleClick()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 48
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/command/AddCmd;->executeCmd()V

    return-void
.end method

.method public cancel(Lcom/arialyy/aria/core/command/CancelCmd;)V
    .locals 0
    .annotation runtime Lcom/arialyy/aria/core/event/Event;
    .end annotation

    .line 63
    invoke-virtual {p1}, Lcom/arialyy/aria/core/command/CancelCmd;->executeCmd()V

    return-void
.end method

.method public cancelAll(Lcom/arialyy/aria/core/command/CancelAllCmd;)V
    .locals 1
    .annotation runtime Lcom/arialyy/aria/core/event/Event;
    .end annotation

    .line 76
    invoke-static {}, Lcom/arialyy/aria/util/CommonUtil;->isFastDoubleClick()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 79
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/command/CancelAllCmd;->executeCmd()V

    return-void
.end method

.method public highestPriority(Lcom/arialyy/aria/core/command/HighestPriorityCmd;)V
    .locals 1
    .annotation runtime Lcom/arialyy/aria/core/event/Event;
    .end annotation

    .line 92
    invoke-static {}, Lcom/arialyy/aria/util/CommonUtil;->isFastDoubleClick()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 95
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/command/HighestPriorityCmd;->executeCmd()V

    return-void
.end method

.method public reStart(Lcom/arialyy/aria/core/command/ReStartCmd;)V
    .locals 1
    .annotation runtime Lcom/arialyy/aria/core/event/Event;
    .end annotation

    .line 84
    invoke-static {}, Lcom/arialyy/aria/util/CommonUtil;->isFastDoubleClick()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 87
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/command/ReStartCmd;->executeCmd()V

    return-void
.end method

.method public resumeAll(Lcom/arialyy/aria/core/command/ResumeAllCmd;)V
    .locals 1
    .annotation runtime Lcom/arialyy/aria/core/event/Event;
    .end annotation

    .line 100
    invoke-static {}, Lcom/arialyy/aria/util/CommonUtil;->isFastDoubleClick()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 103
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/command/ResumeAllCmd;->executeCmd()V

    return-void
.end method

.method public start(Lcom/arialyy/aria/core/command/StartCmd;)V
    .locals 0
    .annotation runtime Lcom/arialyy/aria/core/event/Event;
    .end annotation

    .line 53
    invoke-virtual {p1}, Lcom/arialyy/aria/core/command/StartCmd;->executeCmd()V

    return-void
.end method

.method public stop(Lcom/arialyy/aria/core/command/StopCmd;)V
    .locals 0
    .annotation runtime Lcom/arialyy/aria/core/event/Event;
    .end annotation

    .line 58
    invoke-virtual {p1}, Lcom/arialyy/aria/core/command/StopCmd;->executeCmd()V

    return-void
.end method

.method public stopAll(Lcom/arialyy/aria/core/command/StopAllCmd;)V
    .locals 1
    .annotation runtime Lcom/arialyy/aria/core/event/Event;
    .end annotation

    .line 68
    invoke-static {}, Lcom/arialyy/aria/util/CommonUtil;->isFastDoubleClick()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 71
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/command/StopAllCmd;->executeCmd()V

    return-void
.end method

.method public subStart(Lcom/arialyy/aria/core/command/DGSubStartCmd;)V
    .locals 1
    .annotation runtime Lcom/arialyy/aria/core/event/Event;
    .end annotation

    .line 108
    invoke-static {}, Lcom/arialyy/aria/util/CommonUtil;->isFastDoubleClick()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 111
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/command/DGSubStartCmd;->executeCmd()V

    return-void
.end method

.method public subStop(Lcom/arialyy/aria/core/command/DGSubStopCmd;)V
    .locals 0
    .annotation runtime Lcom/arialyy/aria/core/event/Event;
    .end annotation

    .line 116
    invoke-virtual {p1}, Lcom/arialyy/aria/core/command/DGSubStopCmd;->executeCmd()V

    return-void
.end method
