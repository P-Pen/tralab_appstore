.class final Lcom/arialyy/aria/core/group/SimpleSchedulers;
.super Ljava/lang/Object;
.source "SimpleSchedulers.java"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field private final TAG:Ljava/lang/String;

.field private mGState:Lcom/arialyy/aria/core/group/GroupRunState;

.field private mKey:Ljava/lang/String;

.field private mQueue:Lcom/arialyy/aria/core/group/SimpleSubQueue;


# direct methods
.method private constructor <init>(Lcom/arialyy/aria/core/group/GroupRunState;Ljava/lang/String;)V
    .locals 1

    .line 45
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 40
    invoke-static {p0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->TAG:Ljava/lang/String;

    .line 46
    iget-object v0, p1, Lcom/arialyy/aria/core/group/GroupRunState;->queue:Lcom/arialyy/aria/core/group/SimpleSubQueue;

    iput-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mQueue:Lcom/arialyy/aria/core/group/SimpleSubQueue;

    .line 47
    iput-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 48
    iput-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mKey:Ljava/lang/String;

    return-void
.end method

.method private declared-synchronized handleComplete(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V
    .locals 8

    monitor-enter p0

    .line 181
    :try_start_0
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->TAG:Ljava/lang/String;

    const-string v1, "\u5b50\u4efb\u52a1\u3010%s\u3011\u5b8c\u6210"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFileName()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 182
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->TAG:Ljava/lang/String;

    const-string v1, "handleComplete, size = %s, completeNum = %s, failNum = %s, stopNum = %s"

    const/4 v3, 0x4

    new-array v3, v3, [Ljava/lang/Object;

    iget-object v4, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 184
    invoke-virtual {v4}, Lcom/arialyy/aria/core/group/GroupRunState;->getSubSize()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v5

    iget-object v4, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {v4}, Lcom/arialyy/aria/core/group/GroupRunState;->getCompleteNum()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v2

    iget-object v4, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {v4}, Lcom/arialyy/aria/core/group/GroupRunState;->getFailNum()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    const/4 v6, 0x2

    aput-object v4, v3, v6

    const/4 v4, 0x3

    iget-object v7, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 185
    invoke-virtual {v7}, Lcom/arialyy/aria/core/group/GroupRunState;->getSubSize()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v3, v4

    .line 183
    invoke-static {v1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 182
    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 187
    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getRecord()Lcom/arialyy/aria/core/TaskRecord;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 188
    iget-boolean v1, v0, Lcom/arialyy/aria/core/TaskRecord;->isBlock:Z

    if-eqz v1, :cond_0

    .line 189
    new-instance v1, Ljava/io/File;

    const-string v3, "%s.%s.part"

    new-array v4, v6, [Ljava/lang/Object;

    iget-object v6, v0, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    aput-object v6, v4, v5

    .line 190
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v4, v2

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 191
    new-instance v3, Ljava/io/File;

    iget-object v0, v0, Lcom/arialyy/aria/core/TaskRecord;->filePath:Ljava/lang/String;

    invoke-direct {v3, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 193
    :cond_0
    invoke-static {}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->getInstance()Lcom/arialyy/aria/core/manager/ThreadTaskManager;

    move-result-object v0

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->removeTaskThread(Ljava/lang/String;)V

    .line 194
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object v0, v0, Lcom/arialyy/aria/core/group/GroupRunState;->listener:Lcom/arialyy/aria/core/listener/IDGroupListener;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/arialyy/aria/core/listener/IDGroupListener;->onSubComplete(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    .line 195
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mQueue:Lcom/arialyy/aria/core/group/SimpleSubQueue;

    invoke-virtual {v0, p1}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->removeTaskFromExecQ(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    .line 196
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/GroupRunState;->updateCompleteNum()V

    .line 197
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/GroupRunState;->getCompleteNum()I

    move-result p1

    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/group/GroupRunState;->getFailNum()I

    move-result v0

    add-int/2addr p1, v0

    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/group/GroupRunState;->getStopNum()I

    move-result v0

    add-int/2addr p1, v0

    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 198
    invoke-virtual {v0}, Lcom/arialyy/aria/core/group/GroupRunState;->getSubSize()I

    move-result v0

    if-ne p1, v0, :cond_3

    .line 199
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/GroupRunState;->getStopNum()I

    move-result p1

    if-nez p1, :cond_1

    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/GroupRunState;->getFailNum()I

    move-result p1

    if-nez p1, :cond_1

    .line 200
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object p1, p1, Lcom/arialyy/aria/core/group/GroupRunState;->listener:Lcom/arialyy/aria/core/listener/IDGroupListener;

    invoke-interface {p1}, Lcom/arialyy/aria/core/listener/IDGroupListener;->onComplete()V

    goto :goto_0

    .line 201
    :cond_1
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/GroupRunState;->getStopNum()I

    move-result p1

    if-nez p1, :cond_2

    .line 202
    invoke-static {}, Lcom/arialyy/aria/core/config/Configuration;->getInstance()Lcom/arialyy/aria/core/config/Configuration;

    move-result-object p1

    iget-object p1, p1, Lcom/arialyy/aria/core/config/Configuration;->dGroupCfg:Lcom/arialyy/aria/core/config/DGroupConfig;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/config/DGroupConfig;->isSubFailAsStop()Z

    move-result p1

    if-nez p1, :cond_2

    .line 203
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object p1, p1, Lcom/arialyy/aria/core/group/GroupRunState;->listener:Lcom/arialyy/aria/core/listener/IDGroupListener;

    const/4 v0, 0x5

    const-string v1, "\u4efb\u52a1\u7ec4\u3010%s\u3011\u4e0b\u8f7d\u5931\u8d25"

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 205
    invoke-virtual {v3}, Lcom/arialyy/aria/core/group/GroupRunState;->getGroupHash()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    .line 204
    invoke-static {v0, v1, v2}, Lcom/arialyy/aria/exception/ExceptionFactory;->getException(ILjava/lang/String;Ljava/lang/Exception;)Lcom/arialyy/aria/exception/AriaException;

    move-result-object v0

    .line 203
    invoke-interface {p1, v5, v0}, Lcom/arialyy/aria/core/listener/IDGroupListener;->onFail(ZLcom/arialyy/aria/exception/AriaException;)V

    goto :goto_0

    .line 207
    :cond_2
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object p1, p1, Lcom/arialyy/aria/core/group/GroupRunState;->listener:Lcom/arialyy/aria/core/listener/IDGroupListener;

    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/group/GroupRunState;->getProgress()J

    move-result-wide v0

    invoke-interface {p1, v0, v1}, Lcom/arialyy/aria/core/listener/IDGroupListener;->onStop(J)V

    .line 209
    :goto_0
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object p1, p1, Lcom/arialyy/aria/core/group/GroupRunState;->isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v5}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 210
    monitor-exit p0

    return-void

    .line 212
    :cond_3
    :try_start_1
    invoke-direct {p0}, Lcom/arialyy/aria/core/group/SimpleSchedulers;->startNext()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 213
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized handleFail(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;Z)V
    .locals 8

    monitor-enter p0

    .line 108
    :try_start_0
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->TAG:Ljava/lang/String;

    const-string v1, "handleFail, size = %s, completeNum = %s, failNum = %s, stopNum = %s"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 109
    invoke-virtual {v3}, Lcom/arialyy/aria/core/group/GroupRunState;->getSubSize()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    iget-object v3, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/group/GroupRunState;->getCompleteNum()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v5, 0x1

    aput-object v3, v2, v5

    iget-object v3, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/group/GroupRunState;->getFailNum()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v6, 0x2

    aput-object v3, v2, v6

    const/4 v3, 0x3

    iget-object v7, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 110
    invoke-virtual {v7}, Lcom/arialyy/aria/core/group/GroupRunState;->getSubSize()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v2, v3

    .line 108
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 112
    invoke-static {}, Lcom/arialyy/aria/core/config/Configuration;->getInstance()Lcom/arialyy/aria/core/config/Configuration;

    move-result-object v0

    .line 113
    iget-object v1, v0, Lcom/arialyy/aria/core/config/Configuration;->dGroupCfg:Lcom/arialyy/aria/core/config/DGroupConfig;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/config/DGroupConfig;->getSubReTryNum()I

    move-result v1

    .line 114
    iget-object v0, v0, Lcom/arialyy/aria/core/config/Configuration;->appCfg:Lcom/arialyy/aria/core/config/AppConfig;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/AppConfig;->isNotNetRetry()Z

    move-result v0

    if-eqz p2, :cond_2

    .line 117
    invoke-static {}, Lcom/arialyy/aria/core/AriaConfig;->getInstance()Lcom/arialyy/aria/core/AriaConfig;

    move-result-object p2

    invoke-virtual {p2}, Lcom/arialyy/aria/core/AriaConfig;->getAPP()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lcom/arialyy/aria/util/NetUtils;->isConnected(Landroid/content/Context;)Z

    move-result p2

    if-nez p2, :cond_0

    if-eqz v0, :cond_2

    .line 118
    :cond_0
    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getLoader()Lcom/arialyy/aria/core/loader/SubLoader;

    move-result-object p2

    if-eqz p2, :cond_2

    .line 119
    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object p2

    invoke-virtual {p2}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFailNum()I

    move-result p2

    if-le p2, v1, :cond_1

    goto :goto_0

    .line 144
    :cond_1
    invoke-static {}, Lcom/arialyy/aria/core/group/SimpleSubRetryQueue;->getInstance()Lcom/arialyy/aria/core/group/SimpleSubRetryQueue;

    move-result-object p2

    invoke-virtual {p2, p1}, Lcom/arialyy/aria/core/group/SimpleSubRetryQueue;->offer(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 145
    monitor-exit p0

    return-void

    .line 120
    :cond_2
    :goto_0
    :try_start_1
    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mQueue:Lcom/arialyy/aria/core/group/SimpleSubQueue;

    invoke-virtual {p2, p1}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->removeTaskFromExecQ(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    .line 121
    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object p2, p2, Lcom/arialyy/aria/core/group/GroupRunState;->listener:Lcom/arialyy/aria/core/listener/IDGroupListener;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v0

    const-string v1, "\u4efb\u52a1\u7ec4\u5b50\u4efb\u52a1\u3010%s\u3011\u4e0b\u8f7d\u5931\u8d25\uff0c\u4e0b\u8f7d\u5730\u5740\u3010%s\u3011"

    new-array v2, v6, [Ljava/lang/Object;

    .line 123
    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFileName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v4

    .line 124
    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v3

    invoke-virtual {v3}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    .line 123
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x5

    .line 122
    invoke-static {v3, v1, v2}, Lcom/arialyy/aria/exception/ExceptionFactory;->getException(ILjava/lang/String;Ljava/lang/Exception;)Lcom/arialyy/aria/exception/AriaException;

    move-result-object v1

    .line 121
    invoke-interface {p2, v0, v1}, Lcom/arialyy/aria/core/listener/IDGroupListener;->onSubFail(Lcom/arialyy/aria/core/download/DownloadEntity;Lcom/arialyy/aria/exception/AriaException;)V

    .line 125
    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/arialyy/aria/core/group/GroupRunState;->countFailNum(Ljava/lang/String;)V

    .line 126
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/GroupRunState;->getFailNum()I

    move-result p1

    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p2}, Lcom/arialyy/aria/core/group/GroupRunState;->getSubSize()I

    move-result p2

    if-eq p1, p2, :cond_4

    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 127
    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/GroupRunState;->getStopNum()I

    move-result p1

    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p2}, Lcom/arialyy/aria/core/group/GroupRunState;->getFailNum()I

    move-result p2

    add-int/2addr p1, p2

    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p2}, Lcom/arialyy/aria/core/group/GroupRunState;->getCompleteNum()I

    move-result p2

    add-int/2addr p1, p2

    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 128
    invoke-virtual {p2}, Lcom/arialyy/aria/core/group/GroupRunState;->getSubSize()I

    move-result p2

    if-ne p1, p2, :cond_3

    goto :goto_1

    .line 141
    :cond_3
    invoke-direct {p0}, Lcom/arialyy/aria/core/group/SimpleSchedulers;->startNext()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 142
    monitor-exit p0

    return-void

    .line 129
    :cond_4
    :goto_1
    :try_start_2
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object p1, p1, Lcom/arialyy/aria/core/group/GroupRunState;->isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 130
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/GroupRunState;->getCompleteNum()I

    move-result p1

    if-lez p1, :cond_5

    .line 131
    invoke-static {}, Lcom/arialyy/aria/core/config/Configuration;->getInstance()Lcom/arialyy/aria/core/config/Configuration;

    move-result-object p1

    iget-object p1, p1, Lcom/arialyy/aria/core/config/Configuration;->dGroupCfg:Lcom/arialyy/aria/core/config/DGroupConfig;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/config/DGroupConfig;->isSubFailAsStop()Z

    move-result p1

    if-eqz p1, :cond_5

    .line 132
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->TAG:Ljava/lang/String;

    const-string p2, "\u4efb\u52a1\u7ec4\u3010%s\u3011\u505c\u6b62"

    new-array v0, v5, [Ljava/lang/Object;

    iget-object v1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {v1}, Lcom/arialyy/aria/core/group/GroupRunState;->getGroupHash()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 133
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object p1, p1, Lcom/arialyy/aria/core/group/GroupRunState;->listener:Lcom/arialyy/aria/core/listener/IDGroupListener;

    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p2}, Lcom/arialyy/aria/core/group/GroupRunState;->getProgress()J

    move-result-wide v0

    invoke-interface {p1, v0, v1}, Lcom/arialyy/aria/core/listener/IDGroupListener;->onStop(J)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 134
    monitor-exit p0

    return-void

    .line 136
    :cond_5
    :try_start_3
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object p1, p1, Lcom/arialyy/aria/core/group/GroupRunState;->listener:Lcom/arialyy/aria/core/listener/IDGroupListener;

    const-string p2, "\u4efb\u52a1\u7ec4\u3010%s\u3011\u4e0b\u8f7d\u5931\u8d25"

    new-array v0, v5, [Ljava/lang/Object;

    iget-object v1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 138
    invoke-virtual {v1}, Lcom/arialyy/aria/core/group/GroupRunState;->getGroupHash()Ljava/lang/String;

    move-result-object v1

    aput-object v1, v0, v4

    invoke-static {p2, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 137
    invoke-static {v3, p2, v2}, Lcom/arialyy/aria/exception/ExceptionFactory;->getException(ILjava/lang/String;Ljava/lang/Exception;)Lcom/arialyy/aria/exception/AriaException;

    move-result-object p2

    .line 136
    invoke-interface {p1, v4, p2}, Lcom/arialyy/aria/core/listener/IDGroupListener;->onFail(ZLcom/arialyy/aria/exception/AriaException;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 139
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method private declared-synchronized handleStop(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;J)V
    .locals 6

    monitor-enter p0

    .line 153
    :try_start_0
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->TAG:Ljava/lang/String;

    const-string v1, "handleStop, size = %s, completeNum = %s, failNum = %s, stopNum = %s"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    iget-object v3, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 154
    invoke-virtual {v3}, Lcom/arialyy/aria/core/group/GroupRunState;->getSubSize()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const/4 v3, 0x1

    iget-object v5, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {v5}, Lcom/arialyy/aria/core/group/GroupRunState;->getCompleteNum()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x2

    iget-object v5, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {v5}, Lcom/arialyy/aria/core/group/GroupRunState;->getFailNum()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    const/4 v3, 0x3

    iget-object v5, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 155
    invoke-virtual {v5}, Lcom/arialyy/aria/core/group/GroupRunState;->getSubSize()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v2, v3

    .line 153
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 157
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object v0, v0, Lcom/arialyy/aria/core/group/GroupRunState;->listener:Lcom/arialyy/aria/core/listener/IDGroupListener;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v1

    invoke-interface {v0, v1, p2, p3}, Lcom/arialyy/aria/core/listener/IDGroupListener;->onSubStop(Lcom/arialyy/aria/core/download/DownloadEntity;J)V

    .line 158
    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/arialyy/aria/core/group/GroupRunState;->countStopNum(Ljava/lang/String;)V

    .line 159
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/GroupRunState;->getStopNum()I

    move-result p1

    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p2}, Lcom/arialyy/aria/core/group/GroupRunState;->getSubSize()I

    move-result p2

    if-eq p1, p2, :cond_1

    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 160
    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/GroupRunState;->getStopNum()I

    move-result p1

    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 161
    invoke-virtual {p2}, Lcom/arialyy/aria/core/group/GroupRunState;->getCompleteNum()I

    move-result p2

    add-int/2addr p1, p2

    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 162
    invoke-virtual {p2}, Lcom/arialyy/aria/core/group/GroupRunState;->getFailNum()I

    move-result p2

    add-int/2addr p1, p2

    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mQueue:Lcom/arialyy/aria/core/group/SimpleSubQueue;

    .line 163
    invoke-virtual {p2}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->getCacheSize()I

    move-result p2

    add-int/2addr p1, p2

    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    .line 164
    invoke-virtual {p2}, Lcom/arialyy/aria/core/group/GroupRunState;->getSubSize()I

    move-result p2

    if-ne p1, p2, :cond_0

    goto :goto_0

    .line 169
    :cond_0
    invoke-direct {p0}, Lcom/arialyy/aria/core/group/SimpleSchedulers;->startNext()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 170
    monitor-exit p0

    return-void

    .line 165
    :cond_1
    :goto_0
    :try_start_1
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object p1, p1, Lcom/arialyy/aria/core/group/GroupRunState;->isRunning:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {p1, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 166
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object p1, p1, Lcom/arialyy/aria/core/group/GroupRunState;->listener:Lcom/arialyy/aria/core/listener/IDGroupListener;

    iget-object p2, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {p2}, Lcom/arialyy/aria/core/group/GroupRunState;->getProgress()J

    move-result-wide p2

    invoke-interface {p1, p2, p3}, Lcom/arialyy/aria/core/listener/IDGroupListener;->onStop(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 167
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method static newInstance(Lcom/arialyy/aria/core/group/GroupRunState;Ljava/lang/String;)Lcom/arialyy/aria/core/group/SimpleSchedulers;
    .locals 1

    .line 52
    new-instance v0, Lcom/arialyy/aria/core/group/SimpleSchedulers;

    invoke-direct {v0, p0, p1}, Lcom/arialyy/aria/core/group/SimpleSchedulers;-><init>(Lcom/arialyy/aria/core/group/GroupRunState;Ljava/lang/String;)V

    return-object v0
.end method

.method private startNext()V
    .locals 5

    .line 219
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mQueue:Lcom/arialyy/aria/core/group/SimpleSubQueue;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->isStopAll()Z

    move-result v0

    if-eqz v0, :cond_0

    return-void

    .line 222
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mQueue:Lcom/arialyy/aria/core/group/SimpleSubQueue;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->getNextTask()Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 224
    iget-object v1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->TAG:Ljava/lang/String;

    const/4 v2, 0x1

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFileName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    const-string v3, "\u542f\u52a8\u4efb\u52a1\uff1a%s"

    invoke-static {v3, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 225
    iget-object v1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mQueue:Lcom/arialyy/aria/core/group/SimpleSubQueue;

    invoke-virtual {v1, v0}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->startTask(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    return-void

    .line 228
    :cond_1
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->TAG:Ljava/lang/String;

    const-string v1, "\u6ca1\u6709\u4e0b\u4e00\u5b50\u4efb\u52a1"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method


# virtual methods
.method public handleMessage(Landroid/os/Message;)Z
    .locals 9

    .line 56
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 58
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->TAG:Ljava/lang/String;

    const-string v0, "\u7ec4\u5408\u4efb\u52a1\u5b50\u4efb\u52a1\u8c03\u5ea6\u6570\u636e\u4e3a\u7a7a"

    invoke-static {p1, v0}, Lcom/arialyy/aria/util/ALog;->w(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    :cond_0
    const-string v2, "DATA_THREAD_NAME"

    .line 61
    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 62
    iget-object v3, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mQueue:Lcom/arialyy/aria/core/group/SimpleSubQueue;

    invoke-virtual {v3, v2}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->getLoaderUtil(Ljava/lang/String;)Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x2

    if-nez v3, :cond_1

    .line 64
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->TAG:Ljava/lang/String;

    new-array v3, v5, [Ljava/lang/Object;

    iget p1, p1, Landroid/os/Message;->what:I

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v3, v4

    aput-object v2, v3, v1

    const-string p1, "\u5b50\u4efb\u52a1loader\u4e0d\u5b58\u5728\uff0cstate\uff1a%s\uff0ckey\uff1a%s"

    invoke-static {p1, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v0, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return v1

    .line 68
    :cond_1
    invoke-virtual {v3}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getLoader()Lcom/arialyy/aria/core/loader/SubLoader;

    move-result-object v6

    invoke-virtual {v6}, Lcom/arialyy/aria/core/loader/SubLoader;->getWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v6

    invoke-virtual {v6}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/arialyy/aria/core/common/AbsEntity;->getCurrentProgress()J

    move-result-wide v6

    const-string v8, "DATA_THREAD_LOCATION"

    .line 67
    invoke-virtual {v0, v8, v6, v7}, Landroid/os/Bundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    .line 70
    iget v8, p1, Landroid/os/Message;->what:I

    if-eq v8, v1, :cond_7

    if-eq v8, v5, :cond_6

    const/4 v0, 0x4

    if-eq v8, v0, :cond_5

    const/4 v0, 0x5

    if-eq v8, v0, :cond_4

    const/4 p1, 0x7

    if-eq v8, p1, :cond_3

    const/16 p1, 0x8

    if-eq v8, p1, :cond_2

    goto :goto_0

    .line 80
    :cond_2
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object p1, p1, Lcom/arialyy/aria/core/group/GroupRunState;->listener:Lcom/arialyy/aria/core/listener/IDGroupListener;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/arialyy/aria/core/listener/IDGroupListener;->onSubStart(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    goto :goto_0

    .line 76
    :cond_3
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object p1, p1, Lcom/arialyy/aria/core/group/GroupRunState;->listener:Lcom/arialyy/aria/core/listener/IDGroupListener;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v0

    invoke-interface {p1, v0}, Lcom/arialyy/aria/core/listener/IDGroupListener;->onSubPre(Lcom/arialyy/aria/core/download/DownloadEntity;)V

    .line 77
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getKey()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/arialyy/aria/core/group/GroupRunState;->updateCount(Ljava/lang/String;)V

    goto :goto_0

    .line 72
    :cond_4
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    .line 73
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mGState:Lcom/arialyy/aria/core/group/GroupRunState;

    iget-object p1, p1, Lcom/arialyy/aria/core/group/GroupRunState;->listener:Lcom/arialyy/aria/core/listener/IDGroupListener;

    invoke-virtual {v3}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v0

    invoke-interface {p1, v0, v4, v5}, Lcom/arialyy/aria/core/listener/IDGroupListener;->onSubRunning(Lcom/arialyy/aria/core/download/DownloadEntity;J)V

    goto :goto_0

    .line 87
    :cond_5
    invoke-direct {p0, v3}, Lcom/arialyy/aria/core/group/SimpleSchedulers;->handleComplete(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    .line 88
    invoke-static {}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->getInstance()Lcom/arialyy/aria/core/manager/ThreadTaskManager;

    move-result-object p1

    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mKey:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->removeSingleTaskThread(Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    :cond_6
    const-string p1, "DATA_RETRY"

    .line 91
    invoke-virtual {v0, p1, v4}, Landroid/os/Bundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    .line 92
    invoke-direct {p0, v3, p1}, Lcom/arialyy/aria/core/group/SimpleSchedulers;->handleFail(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;Z)V

    .line 93
    invoke-static {}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->getInstance()Lcom/arialyy/aria/core/manager/ThreadTaskManager;

    move-result-object p1

    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mKey:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->removeSingleTaskThread(Ljava/lang/String;Ljava/lang/String;)Z

    goto :goto_0

    .line 83
    :cond_7
    invoke-direct {p0, v3, v6, v7}, Lcom/arialyy/aria/core/group/SimpleSchedulers;->handleStop(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;J)V

    .line 84
    invoke-static {}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->getInstance()Lcom/arialyy/aria/core/manager/ThreadTaskManager;

    move-result-object p1

    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSchedulers;->mKey:Ljava/lang/String;

    invoke-virtual {p1, v0, v2}, Lcom/arialyy/aria/core/manager/ThreadTaskManager;->removeSingleTaskThread(Ljava/lang/String;Ljava/lang/String;)Z

    :goto_0
    return v1
.end method
