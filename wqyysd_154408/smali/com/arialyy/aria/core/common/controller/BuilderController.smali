.class public final Lcom/arialyy/aria/core/common/controller/BuilderController;
.super Lcom/arialyy/aria/core/common/controller/FeatureController;
.source "BuilderController.java"

# interfaces
.implements Lcom/arialyy/aria/core/common/controller/IStartFeature;


# direct methods
.method public constructor <init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V
    .locals 0

    .line 29
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/common/controller/FeatureController;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    return-void
.end method


# virtual methods
.method public add()J
    .locals 4

    const/4 v0, 0x5

    .line 38
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->setAction(I)V

    .line 39
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->checkConfig()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object v0

    .line 41
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    const/16 v2, 0xb1

    .line 42
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->checkTaskType()I

    move-result v3

    .line 41
    invoke-static {v1, v2, v3}, Lcom/arialyy/aria/core/command/CmdHelper;->createNormalCmd(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;II)Lcom/arialyy/aria/core/command/AbsNormalCmd;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/event/EventMsgUtil;->post(Ljava/lang/Object;)V

    .line 43
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getId()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public create()J
    .locals 4

    const/4 v0, 0x1

    .line 54
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->setAction(I)V

    .line 55
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->checkConfig()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 56
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object v0

    .line 57
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    const/16 v2, 0xb2

    .line 58
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->checkTaskType()I

    move-result v3

    .line 57
    invoke-static {v1, v2, v3}, Lcom/arialyy/aria/core/command/CmdHelper;->createNormalCmd(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;II)Lcom/arialyy/aria/core/command/AbsNormalCmd;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/event/EventMsgUtil;->post(Ljava/lang/Object;)V

    .line 59
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getId()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public setHighestPriority()J
    .locals 4

    const/4 v0, 0x6

    .line 65
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->setAction(I)V

    .line 66
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->checkConfig()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object v0

    .line 68
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    const/16 v2, 0xb6

    .line 69
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->checkTaskType()I

    move-result v3

    .line 68
    invoke-static {v1, v2, v3}, Lcom/arialyy/aria/core/command/CmdHelper;->createNormalCmd(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;II)Lcom/arialyy/aria/core/command/AbsNormalCmd;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/event/EventMsgUtil;->post(Ljava/lang/Object;)V

    .line 70
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/BuilderController;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getId()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method
