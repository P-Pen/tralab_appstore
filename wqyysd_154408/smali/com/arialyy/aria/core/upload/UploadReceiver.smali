.class public Lcom/arialyy/aria/core/upload/UploadReceiver;
.super Lcom/arialyy/aria/core/inf/AbsReceiver;
.source "UploadReceiver.java"


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .locals 0

    .line 53
    invoke-direct {p0, p1}, Lcom/arialyy/aria/core/inf/AbsReceiver;-><init>(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public getAllCompleteTask()Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/upload/UploadEntity;",
            ">;"
        }
    .end annotation

    .line 211
    const-class v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    const-string v1, "isGroupChild=? and isComplete=?"

    const-string v2, "false"

    const-string v3, "true"

    filled-new-array {v1, v2, v3}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->findDatas(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAllCompleteTask(II)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/upload/UploadEntity;",
            ">;"
        }
    .end annotation

    .line 223
    invoke-static {p1, p2}, Lcom/arialyy/aria/util/CheckUtil;->checkPageParams(II)V

    .line 224
    const-class p1, Lcom/arialyy/aria/core/upload/UploadEntity;

    const-string p2, "isGroupChild=? and downloadPath!=\'\' and isComplete=?"

    const-string v0, "false"

    const-string v1, "true"

    filled-new-array {p2, v0, v1}, [Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arialyy/aria/orm/DbEntity;->findDatas(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getAllNotCompleteTask()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/upload/UploadEntity;",
            ">;"
        }
    .end annotation

    .line 190
    const-class v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    const-string v1, "isGroupChild=? and isComplete=?"

    const-string v2, "false"

    filled-new-array {v1, v2, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->findDatas(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getAllNotCompleteTask(II)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/upload/UploadEntity;",
            ">;"
        }
    .end annotation

    .line 202
    invoke-static {p1, p2}, Lcom/arialyy/aria/util/CheckUtil;->checkPageParams(II)V

    .line 203
    const-class v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    const-string v1, "isGroupChild=? and downloadPath!=\'\' and isComplete=?"

    const-string v2, "false"

    filled-new-array {v1, v2, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p1, p2, v1}, Lcom/arialyy/aria/orm/DbEntity;->findDatas(Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getFirstUploadEntity(Ljava/lang/String;)Lcom/arialyy/aria/core/upload/UploadEntity;
    .locals 4

    .line 136
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 139
    :cond_0
    const-class v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "filePath=?"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->findFirst(Ljava/lang/Class;[Ljava/lang/String;)Lcom/arialyy/aria/orm/DbEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/upload/UploadEntity;

    return-object p1
.end method

.method public getTaskList()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/upload/UploadEntity;",
            ">;"
        }
    .end annotation

    .line 168
    const-class v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    invoke-static {v0}, Lcom/arialyy/aria/orm/DbEntity;->findAllData(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getTaskList(II)Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/upload/UploadEntity;",
            ">;"
        }
    .end annotation

    .line 181
    invoke-static {p1, p2}, Lcom/arialyy/aria/util/CheckUtil;->checkPageParams(II)V

    .line 182
    const-class v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    const-string v1, "isGroupChild=? and downloadPath!=\'\'"

    const-string v2, "false"

    filled-new-array {v1, v2}, [Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, p1, p2, v1}, Lcom/arialyy/aria/orm/DbEntity;->findDatas(Ljava/lang/Class;II[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getType()Lcom/arialyy/aria/core/inf/ReceiverType;
    .locals 1

    .line 305
    sget-object v0, Lcom/arialyy/aria/core/inf/ReceiverType;->UPLOAD:Lcom/arialyy/aria/core/inf/ReceiverType;

    return-object v0
.end method

.method public getURunningTask()Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/upload/UploadEntity;",
            ">;"
        }
    .end annotation

    .line 243
    invoke-static {}, Lcom/arialyy/aria/core/queue/UTaskQueue;->getInstance()Lcom/arialyy/aria/core/queue/UTaskQueue;

    move-result-object v0

    const-class v1, Lcom/arialyy/aria/core/upload/UploadEntity;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/queue/UTaskQueue;->getRunningTask(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getUploadEntity(J)Lcom/arialyy/aria/core/upload/UploadEntity;
    .locals 4

    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-nez v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 128
    :cond_0
    const-class v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "rowid=?"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    invoke-static {p1, p2}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->findFirst(Ljava/lang/Class;[Ljava/lang/String;)Lcom/arialyy/aria/orm/DbEntity;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/upload/UploadEntity;

    return-object p1
.end method

.method public getUploadEntity(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/arialyy/aria/core/upload/UploadEntity;",
            ">;"
        }
    .end annotation

    .line 147
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    return-object p1

    .line 150
    :cond_0
    const-class v0, Lcom/arialyy/aria/core/upload/UploadEntity;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "filePath=?"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->findDatas(Ljava/lang/Class;[Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public load(Ljava/lang/String;)Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;
    .locals 2

    .line 75
    invoke-static {}, Lcom/arialyy/aria/util/ComponentUtil;->getInstance()Lcom/arialyy/aria/util/ComponentUtil;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/util/ComponentUtil;->checkComponentExist(I)Z

    .line 76
    invoke-static {p1}, Lcom/arialyy/aria/util/CheckUtil;->checkUploadPathIsEmpty(Ljava/lang/String;)V

    .line 77
    invoke-static {}, Lcom/arialyy/aria/core/upload/target/UTargetFactory;->getInstance()Lcom/arialyy/aria/core/upload/target/UTargetFactory;

    move-result-object v0

    const-class v1, Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;

    .line 78
    invoke-virtual {v0, v1, p1}, Lcom/arialyy/aria/core/upload/target/UTargetFactory;->generateBuilderTarget(Ljava/lang/Class;Ljava/lang/String;)Lcom/arialyy/aria/core/common/AbsBuilderTarget;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/upload/target/HttpBuilderTarget;

    return-object p1
.end method

.method public load(J)Lcom/arialyy/aria/core/upload/target/HttpNormalTarget;
    .locals 2

    .line 89
    invoke-static {}, Lcom/arialyy/aria/util/ComponentUtil;->getInstance()Lcom/arialyy/aria/util/ComponentUtil;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/util/ComponentUtil;->checkComponentExist(I)Z

    .line 90
    invoke-static {}, Lcom/arialyy/aria/core/upload/target/UTargetFactory;->getInstance()Lcom/arialyy/aria/core/upload/target/UTargetFactory;

    move-result-object v0

    const-class v1, Lcom/arialyy/aria/core/upload/target/HttpNormalTarget;

    .line 91
    invoke-virtual {v0, v1, p1, p2}, Lcom/arialyy/aria/core/upload/target/UTargetFactory;->generateNormalTarget(Ljava/lang/Class;J)Lcom/arialyy/aria/core/common/AbsNormalTarget;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/upload/target/HttpNormalTarget;

    return-object p1
.end method

.method public loadFtp(Ljava/lang/String;)Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;
    .locals 2

    .line 101
    invoke-static {}, Lcom/arialyy/aria/util/ComponentUtil;->getInstance()Lcom/arialyy/aria/util/ComponentUtil;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/util/ComponentUtil;->checkComponentExist(I)Z

    .line 102
    invoke-static {p1}, Lcom/arialyy/aria/util/CheckUtil;->checkUploadPathIsEmpty(Ljava/lang/String;)V

    .line 103
    invoke-static {}, Lcom/arialyy/aria/core/upload/target/UTargetFactory;->getInstance()Lcom/arialyy/aria/core/upload/target/UTargetFactory;

    move-result-object v0

    const-class v1, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;

    .line 104
    invoke-virtual {v0, v1, p1}, Lcom/arialyy/aria/core/upload/target/UTargetFactory;->generateBuilderTarget(Ljava/lang/Class;Ljava/lang/String;)Lcom/arialyy/aria/core/common/AbsBuilderTarget;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/upload/target/FtpBuilderTarget;

    return-object p1
.end method

.method public loadFtp(J)Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;
    .locals 2

    .line 115
    invoke-static {}, Lcom/arialyy/aria/util/ComponentUtil;->getInstance()Lcom/arialyy/aria/util/ComponentUtil;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/util/ComponentUtil;->checkComponentExist(I)Z

    .line 116
    invoke-static {}, Lcom/arialyy/aria/core/upload/target/UTargetFactory;->getInstance()Lcom/arialyy/aria/core/upload/target/UTargetFactory;

    move-result-object v0

    const-class v1, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;

    .line 117
    invoke-virtual {v0, v1, p1, p2}, Lcom/arialyy/aria/core/upload/target/UTargetFactory;->generateNormalTarget(Ljava/lang/Class;J)Lcom/arialyy/aria/core/common/AbsNormalTarget;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/upload/target/FtpNormalTarget;

    return-object p1
.end method

.method public register()V
    .locals 4

    .line 270
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/UploadReceiver;->obj:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 271
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/UploadReceiver;->TAG:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/UploadReceiver;->getTargetName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "\u3010%s\u3011\u89c2\u5bdf\u8005\u4e3a\u7a7a"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 274
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/UploadReceiver;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/arialyy/aria/core/scheduler/TaskInternalListenerInterface;

    if-eqz v0, :cond_2

    .line 275
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/UploadReceiver;->obj:Ljava/lang/Object;

    instance-of v0, v0, Lcom/arialyy/aria/core/upload/UploadTaskListener;

    if-eqz v0, :cond_1

    .line 276
    invoke-static {}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->getInstance()Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/upload/UploadReceiver;->obj:Ljava/lang/Object;

    sget-object v2, Lcom/arialyy/annotations/TaskEnum;->UPLOAD:Lcom/arialyy/annotations/TaskEnum;

    invoke-virtual {v0, v1, v2}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->register(Ljava/lang/Object;Lcom/arialyy/annotations/TaskEnum;)V

    :cond_1
    return-void

    .line 281
    :cond_2
    invoke-static {}, Lcom/arialyy/aria/core/common/ProxyHelper;->getInstance()Lcom/arialyy/aria/core/common/ProxyHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/upload/UploadReceiver;->obj:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/common/ProxyHelper;->checkProxyType(Ljava/lang/Class;)Ljava/util/Set;

    move-result-object v0

    if-eqz v0, :cond_4

    .line 282
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_4

    .line 283
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_3
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_5

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 284
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sget v2, Lcom/arialyy/aria/core/common/ProxyHelper;->PROXY_TYPE_UPLOAD:I

    if-ne v1, v2, :cond_3

    .line 285
    invoke-static {}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->getInstance()Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

    move-result-object v1

    iget-object v2, p0, Lcom/arialyy/aria/core/upload/UploadReceiver;->obj:Ljava/lang/Object;

    sget-object v3, Lcom/arialyy/annotations/TaskEnum;->UPLOAD:Lcom/arialyy/annotations/TaskEnum;

    invoke-virtual {v1, v2, v3}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->register(Ljava/lang/Object;Lcom/arialyy/annotations/TaskEnum;)V

    goto :goto_0

    .line 289
    :cond_4
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/UploadReceiver;->TAG:Ljava/lang/String;

    const-string v1, "\u6ca1\u6709Aria\u7684\u6ce8\u89e3\u65b9\u6cd5\uff0c\u8be6\u60c5\u89c1\uff1ahttps://aria.laoyuyu.me/aria_doc/other/annotaion_invalid.html"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_5
    return-void
.end method

.method public removeAllTask(Z)V
    .locals 4

    .line 253
    invoke-static {}, Lcom/arialyy/aria/core/AriaManager;->getInstance()Lcom/arialyy/aria/core/AriaManager;

    move-result-object v0

    .line 254
    new-instance v1, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    const/4 v2, 0x0

    invoke-direct {v1, v2}, Lcom/arialyy/aria/core/upload/UTaskWrapper;-><init>(Lcom/arialyy/aria/core/upload/UploadEntity;)V

    const/16 v2, 0xb9

    const/4 v3, 0x2

    .line 255
    invoke-static {v1, v2, v3}, Lcom/arialyy/aria/core/command/CmdHelper;->createNormalCmd(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;II)Lcom/arialyy/aria/core/command/AbsNormalCmd;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/command/CancelAllCmd;

    .line 257
    iput-boolean p1, v1, Lcom/arialyy/aria/core/command/CancelAllCmd;->removeFile:Z

    .line 259
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object p1

    invoke-virtual {p1, v1}, Lcom/arialyy/aria/core/event/EventMsgUtil;->post(Ljava/lang/Object;)V

    .line 260
    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaManager;->getReceiver()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object p1

    .line 261
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 262
    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaManager;->getReceiver()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v2, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public setMaxSpeed(I)Lcom/arialyy/aria/core/upload/UploadReceiver;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 64
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/AriaConfig;->getUConfig()Lcom/arialyy/aria/core/config/UploadConfig;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/config/UploadConfig;->setMaxSpeed(I)Lcom/arialyy/aria/core/config/UploadConfig;

    return-object p0
.end method

.method public stopAllTask()V
    .locals 5

    .line 232
    invoke-static {}, Lcom/arialyy/aria/core/event/EventMsgUtil;->getDefault()Lcom/arialyy/aria/core/event/EventMsgUtil;

    move-result-object v0

    invoke-static {}, Lcom/arialyy/aria/core/command/NormalCmdFactory;->getInstance()Lcom/arialyy/aria/core/command/NormalCmdFactory;

    move-result-object v1

    new-instance v2, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lcom/arialyy/aria/core/upload/UTaskWrapper;-><init>(Lcom/arialyy/aria/core/upload/UploadEntity;)V

    const/16 v3, 0xb7

    const/4 v4, 0x2

    .line 233
    invoke-virtual {v1, v2, v3, v4}, Lcom/arialyy/aria/core/command/NormalCmdFactory;->createCmd(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;II)Lcom/arialyy/aria/core/command/AbsNormalCmd;

    move-result-object v1

    .line 232
    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/event/EventMsgUtil;->post(Ljava/lang/Object;)V

    return-void
.end method

.method public taskExists(Ljava/lang/String;)Z
    .locals 4

    .line 159
    const-class v0, Lcom/arialyy/aria/core/upload/UTaskWrapper;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    const-string v3, "key=?"

    aput-object v3, v1, v2

    const/4 v2, 0x1

    aput-object p1, v1, v2

    invoke-static {v0, v1}, Lcom/arialyy/aria/orm/DbEntity;->checkDataExist(Ljava/lang/Class;[Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public unRegister()V
    .locals 2

    .line 298
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/UploadReceiver;->isNeedRmListener()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 299
    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/UploadReceiver;->unRegisterListener()V

    .line 301
    :cond_0
    invoke-static {}, Lcom/arialyy/aria/core/AriaManager;->getInstance()Lcom/arialyy/aria/core/AriaManager;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/upload/UploadReceiver;->obj:Ljava/lang/Object;

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/AriaManager;->removeReceiver(Ljava/lang/Object;)V

    return-void
.end method

.method protected unRegisterListener()V
    .locals 4

    .line 309
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/UploadReceiver;->obj:Ljava/lang/Object;

    if-nez v0, :cond_0

    .line 310
    iget-object v0, p0, Lcom/arialyy/aria/core/upload/UploadReceiver;->TAG:Ljava/lang/String;

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    invoke-virtual {p0}, Lcom/arialyy/aria/core/upload/UploadReceiver;->getTargetName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "\u3010%s\u3011\u89c2\u5bdf\u8005\u4e3a\u7a7a"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 314
    :cond_0
    invoke-static {}, Lcom/arialyy/aria/core/common/ProxyHelper;->getInstance()Lcom/arialyy/aria/core/common/ProxyHelper;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/common/ProxyHelper;->mProxyCache:Ljava/util/Map;

    iget-object v1, p0, Lcom/arialyy/aria/core/upload/UploadReceiver;->obj:Ljava/lang/Object;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Set;

    if-eqz v0, :cond_2

    .line 316
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    .line 317
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    sget v2, Lcom/arialyy/aria/core/common/ProxyHelper;->PROXY_TYPE_UPLOAD:I

    if-ne v1, v2, :cond_1

    .line 318
    invoke-static {}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->getInstance()Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

    move-result-object v1

    iget-object v2, p0, Lcom/arialyy/aria/core/upload/UploadReceiver;->obj:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->unRegister(Ljava/lang/Object;)V

    goto :goto_0

    :cond_2
    return-void
.end method
