.class public final Lcom/arialyy/aria/core/common/controller/NormalController;
.super Lcom/arialyy/aria/core/common/controller/FeatureController;
.source "NormalController.java"

# interfaces
.implements Lcom/arialyy/aria/core/common/controller/INormalFeature;


# instance fields
.field private TAG:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V
    .locals 0

    .line 33
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/common/controller/FeatureController;-><init>(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    const-string p1, "NormalController"

    .line 30
    iput-object p1, p0, Lcom/arialyy/aria/core/common/controller/NormalController;->TAG:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public cancel()V
    .locals 1

    const/4 v0, 0x0

    .line 80
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/common/controller/NormalController;->cancel(Z)V

    return-void
.end method

.method public cancel(Z)V
    .locals 3

    const/4 v0, 0x4

    .line 107
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/common/controller/NormalController;->setAction(I)V

    .line 108
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->checkConfig()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 110
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    const/16 v1, 0xb4

    .line 111
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->checkTaskType()I

    move-result v2

    .line 110
    invoke-static {v0, v1, v2}, Lcom/arialyy/aria/core/command/CmdHelper;->createNormalCmd(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;II)Lcom/arialyy/aria/core/command/AbsNormalCmd;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/command/CancelCmd;

    .line 112
    iput-boolean p1, v0, Lcom/arialyy/aria/core/command/CancelCmd;->removeFile:Z

    .line 113
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object p1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/event/EventMsgUtil;->post(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public reStart()J
    .locals 4

    const/16 v0, 0x8

    .line 122
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/common/controller/NormalController;->setAction(I)V

    .line 123
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->checkConfig()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 124
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object v0

    .line 125
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    const/16 v2, 0xba

    .line 126
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->checkTaskType()I

    move-result v3

    .line 125
    invoke-static {v1, v2, v3}, Lcom/arialyy/aria/core/command/CmdHelper;->createNormalCmd(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;II)Lcom/arialyy/aria/core/command/AbsNormalCmd;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/event/EventMsgUtil;->post(Ljava/lang/Object;)V

    .line 127
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getId()J

    move-result-wide v0

    return-wide v0

    :cond_0
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public reTry()V
    .locals 4

    const/4 v0, 0x7

    .line 88
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/common/controller/NormalController;->setAction(I)V

    .line 89
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->checkConfig()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 90
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->checkTaskType()I

    move-result v0

    .line 91
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object v1

    .line 92
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v2

    const/16 v3, 0xb5

    invoke-static {v2, v3, v0}, Lcom/arialyy/aria/core/command/CmdHelper;->createNormalCmd(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;II)Lcom/arialyy/aria/core/command/AbsNormalCmd;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/event/EventMsgUtil;->post(Ljava/lang/Object;)V

    .line 93
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object v1

    .line 95
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v2

    const/16 v3, 0xb2

    invoke-static {v2, v3, v0}, Lcom/arialyy/aria/core/command/CmdHelper;->createNormalCmd(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;II)Lcom/arialyy/aria/core/command/AbsNormalCmd;

    move-result-object v0

    .line 94
    invoke-virtual {v1, v0}, Lcom/arialyy/aria/core/event/EventMsgUtil;->post(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public resume()V
    .locals 1

    const/4 v0, 0x0

    .line 54
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/common/controller/NormalController;->resume(Z)V

    return-void
.end method

.method public resume(Z)V
    .locals 3

    const/4 v0, 0x2

    .line 64
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/common/controller/NormalController;->setAction(I)V

    .line 65
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->checkConfig()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 67
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    const/16 v1, 0xb2

    .line 68
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->checkTaskType()I

    move-result v2

    .line 67
    invoke-static {v0, v1, v2}, Lcom/arialyy/aria/core/command/CmdHelper;->createNormalCmd(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;II)Lcom/arialyy/aria/core/command/AbsNormalCmd;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/command/StartCmd;

    .line 69
    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/command/StartCmd;->setNowStart(Z)V

    .line 70
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object p1

    .line 71
    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/event/EventMsgUtil;->post(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method public save()V
    .locals 2

    const/16 v0, 0x9

    .line 133
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/common/controller/NormalController;->setAction(I)V

    .line 134
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->checkConfig()Z

    move-result v0

    if-nez v0, :cond_0

    .line 135
    iget-object v0, p0, Lcom/arialyy/aria/core/common/controller/NormalController;->TAG:Ljava/lang/String;

    const-string v1, "\u4fdd\u5b58\u4fee\u6539\u5931\u8d25"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_0

    .line 137
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/common/controller/NormalController;->TAG:Ljava/lang/String;

    const-string v1, "\u4fdd\u5b58\u6210\u529f"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    :goto_0
    return-void
.end method

.method public stop()V
    .locals 4

    const/4 v0, 0x3

    .line 41
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/common/controller/NormalController;->setAction(I)V

    .line 42
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->checkConfig()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 43
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object v0

    .line 44
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    const/16 v2, 0xb5

    .line 45
    invoke-virtual {p0}, Lcom/arialyy/aria/core/common/controller/NormalController;->checkTaskType()I

    move-result v3

    .line 44
    invoke-static {v1, v2, v3}, Lcom/arialyy/aria/core/command/CmdHelper;->createNormalCmd(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;II)Lcom/arialyy/aria/core/command/AbsNormalCmd;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/event/EventMsgUtil;->post(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method
