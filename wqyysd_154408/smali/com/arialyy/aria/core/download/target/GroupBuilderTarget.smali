.class public Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;
.super Lcom/arialyy/aria/core/common/AbsBuilderTarget;
.source "GroupBuilderTarget.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/arialyy/aria/core/common/AbsBuilderTarget<",
        "Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;",
        ">;"
    }
.end annotation


# instance fields
.field private mConfigHandler:Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler<",
            "Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 34
    invoke-direct {p0}, Lcom/arialyy/aria/core/common/AbsBuilderTarget;-><init>()V

    .line 35
    new-instance v0, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;

    const-wide/16 v1, -0x1

    invoke-direct {v0, p0, v1, v2}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;-><init>(Lcom/arialyy/aria/core/inf/AbsTarget;J)V

    iput-object v0, p0, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;

    .line 36
    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->setGroupUrl(Ljava/util/List;)V

    .line 37
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 v0, 0x2

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setRequestType(I)V

    .line 38
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object p1

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->setNewTask(Z)V

    return-void
.end method


# virtual methods
.method public getSubTaskManager()Lcom/arialyy/aria/core/manager/SubTaskManager;
    .locals 1

    .line 89
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->getSubTaskManager()Lcom/arialyy/aria/core/manager/SubTaskManager;

    move-result-object v0

    return-object v0
.end method

.method public ignoreTaskOccupy()Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;
    .locals 2

    .line 113
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/AbsGroupTaskWrapper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/download/AbsGroupTaskWrapper;->setIgnoreTaskOccupy(Z)V

    return-object p0
.end method

.method public option(Lcom/arialyy/aria/core/common/HttpOption;)Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;
    .locals 1

    const-string v0, "\u4efb\u52a1\u914d\u7f6e\u4e3a\u7a7a"

    .line 46
    invoke-static {p1, v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 48
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getOptionParams()Lcom/arialyy/aria/core/TaskOptionParams;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Lcom/arialyy/aria/core/common/BaseOption;)V

    return-object p0
.end method

.method public setDirPath(Ljava/lang/String;)Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;
    .locals 1

    .line 137
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->setDirPath(Ljava/lang/String;)Lcom/arialyy/aria/core/inf/AbsTarget;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;

    return-object p1
.end method

.method public setFileSize(J)Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;
    .locals 4

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-gtz v0, :cond_0

    .line 62
    iget-object p1, p0, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->TAG:Ljava/lang/String;

    const-string p2, "\u6587\u4ef6\u5927\u5c0f\u4e0d\u80fd\u5c0f\u4e8e 0"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-object p0

    .line 65
    :cond_0
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v0

    const-wide/16 v2, 0x1

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFileSize()J

    move-result-wide v0

    cmp-long v0, v0, p1

    if-eqz v0, :cond_2

    .line 66
    :cond_1
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    invoke-virtual {v0, p1, p2}, Lcom/arialyy/aria/core/common/AbsEntity;->setFileSize(J)V

    :cond_2
    return-object p0
.end method

.method public setGroupAlias(Ljava/lang/String;)Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->setGroupAlias(Ljava/lang/String;)V

    return-object p0
.end method

.method public setSubFileName(Ljava/util/List;)Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;"
        }
    .end annotation

    .line 144
    iget-object v0, p0, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->mConfigHandler:Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/download/target/HttpGroupConfigHandler;->setSubFileName(Ljava/util/List;)Lcom/arialyy/aria/core/inf/AbsTarget;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;

    return-object p1
.end method

.method public setSubTaskFileName(Ljava/util/List;)Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)",
            "Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 98
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->setSubFileName(Ljava/util/List;)Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;

    move-result-object p1

    return-object p1
.end method

.method public unknownSize()Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;
    .locals 2

    .line 79
    invoke-virtual {p0}, Lcom/arialyy/aria/core/download/target/GroupBuilderTarget;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/download/DGTaskWrapper;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->setUnknownSize(Z)V

    return-object p0
.end method
