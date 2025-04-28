.class final Lcom/arialyy/aria/core/group/SimpleSubQueue;
.super Ljava/lang/Object;
.source "SimpleSubQueue.java"

# interfaces
.implements Lcom/arialyy/aria/core/group/ISubQueue;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/arialyy/aria/core/group/ISubQueue<",
        "Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;",
        ">;"
    }
.end annotation


# instance fields
.field private final TAG:Ljava/lang/String;

.field private isStopAll:Z

.field private mCache:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;",
            ">;"
        }
    .end annotation
.end field

.field private mExec:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;",
            ">;"
        }
    .end annotation
.end field

.field private mExecSize:I


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getClassName(Ljava/lang/Class;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->TAG:Ljava/lang/String;

    .line 37
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mCache:Ljava/util/Map;

    .line 41
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    const/4 v0, 0x0

    .line 51
    iput-boolean v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->isStopAll:Z

    .line 54
    invoke-static {}, Lcom/arialyy/aria/core/config/Configuration;->getInstance()Lcom/arialyy/aria/core/config/Configuration;

    move-result-object v0

    iget-object v0, v0, Lcom/arialyy/aria/core/config/Configuration;->dGroupCfg:Lcom/arialyy/aria/core/config/DGroupConfig;

    invoke-virtual {v0}, Lcom/arialyy/aria/core/config/DGroupConfig;->getSubMaxTaskNum()I

    move-result v0

    iput v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExecSize:I

    return-void
.end method

.method static newInstance()Lcom/arialyy/aria/core/group/SimpleSubQueue;
    .locals 1

    .line 58
    new-instance v0, Lcom/arialyy/aria/core/group/SimpleSubQueue;

    invoke-direct {v0}, Lcom/arialyy/aria/core/group/SimpleSubQueue;-><init>()V

    return-object v0
.end method


# virtual methods
.method public addTask(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V
    .locals 2

    .line 81
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mCache:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public bridge synthetic addTask(Lcom/arialyy/aria/core/inf/IUtil;)V
    .locals 0

    .line 32
    check-cast p1, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->addTask(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    return-void
.end method

.method public clear()V
    .locals 1

    .line 193
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mCache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 194
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void
.end method

.method getCacheSize()I
    .locals 1

    .line 73
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mCache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    return v0
.end method

.method declared-synchronized getLoaderUtil(Ljava/lang/String;)Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;
    .locals 1

    monitor-enter p0

    .line 62
    :try_start_0
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    .line 64
    monitor-exit p0

    return-object v0

    .line 66
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mCache:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method public getNextTask()Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;
    .locals 2

    .line 185
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mCache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 186
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 187
    iget-object v1, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mCache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {v1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public bridge synthetic getNextTask()Lcom/arialyy/aria/core/inf/IUtil;
    .locals 1

    .line 32
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->getNextTask()Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    move-result-object v0

    return-object v0
.end method

.method isStopAll()Z
    .locals 1

    .line 77
    iget-boolean v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->isStopAll:Z

    return v0
.end method

.method public modifyMaxExecNum(I)V
    .locals 5

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ge p1, v1, :cond_0

    .line 117
    iget-object v2, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->TAG:Ljava/lang/String;

    new-array v1, v1, [Ljava/lang/Object;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v1, v0

    const-string p1, "\u4fee\u6539\u7ec4\u5408\u4efb\u52a1\u5b50\u4efb\u52a1\u961f\u5217\u6570\u5931\u8d25\uff0cnum: %s"

    invoke-static {p1, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 120
    :cond_0
    iget v2, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExecSize:I

    if-ne p1, v2, :cond_1

    .line 121
    iget-object v3, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->TAG:Ljava/lang/String;

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    aput-object v2, v4, v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v4, v1

    const-string p1, "\u5ffd\u7565\u6b64\u6b21\u4fee\u6539\uff0coldSize: %s, num: %s"

    invoke-static {p1, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {v3, p1}, Lcom/arialyy/aria/util/ALog;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    .line 125
    :cond_1
    iput p1, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExecSize:I

    sub-int v1, v2, p1

    .line 126
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    if-ge v2, p1, :cond_6

    .line 129
    iget-object v1, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->size()I

    move-result v1

    if-le v1, p1, :cond_5

    .line 130
    iget-object v1, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 131
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 133
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-le v0, p1, :cond_2

    .line 135
    iget-object v4, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 139
    :cond_3
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mCache:Ljava/util/Map;

    invoke-interface {p1}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p1

    .line 140
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mCache:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 141
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    .line 142
    invoke-virtual {p0, v1}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->addTask(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    goto :goto_1

    .line 144
    :cond_4
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    .line 145
    invoke-virtual {p0, v0}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->addTask(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    goto :goto_2

    :cond_5
    return-void

    .line 151
    :cond_6
    iget-object v2, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-interface {v2}, Ljava/util/Map;->size()I

    move-result v2

    if-ge v2, p1, :cond_8

    :goto_3
    if-ge v0, v1, :cond_8

    .line 153
    invoke-virtual {p0}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->getNextTask()Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    move-result-object p1

    if-eqz p1, :cond_7

    .line 155
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->startTask(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    goto :goto_4

    .line 157
    :cond_7
    iget-object p1, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->TAG:Ljava/lang/String;

    const-string v2, "\u5b50\u4efb\u52a1\u4e2d\u6ca1\u6709\u7f13\u5b58\u4efb\u52a1"

    invoke-static {p1, v2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    :goto_4
    add-int/lit8 v0, v0, 0x1

    goto :goto_3

    :cond_8
    return-void
.end method

.method public removeAllTask()V
    .locals 6

    .line 173
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->TAG:Ljava/lang/String;

    const-string v1, "\u5220\u9664\u7ec4\u5408\u4efb\u52a1"

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 174
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 175
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 176
    iget-object v2, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    if-eqz v1, :cond_0

    .line 178
    iget-object v2, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->TAG:Ljava/lang/String;

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Object;

    const/4 v4, 0x0

    invoke-virtual {v1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v5

    invoke-virtual {v5}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFileName()Ljava/lang/String;

    move-result-object v5

    aput-object v5, v3, v4

    const-string v4, "\u505c\u6b62\u5b50\u4efb\u52a1\uff1a%s"

    invoke-static {v4, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 179
    invoke-virtual {v1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->cancel()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public removeTask(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V
    .locals 1

    .line 168
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->removeTaskFromExecQ(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    .line 169
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mCache:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public bridge synthetic removeTask(Lcom/arialyy/aria/core/inf/IUtil;)V
    .locals 0

    .line 32
    check-cast p1, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->removeTask(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    return-void
.end method

.method public removeTaskFromExecQ(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V
    .locals 1

    .line 164
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public bridge synthetic removeTaskFromExecQ(Lcom/arialyy/aria/core/inf/IUtil;)V
    .locals 0

    .line 32
    check-cast p1, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->removeTaskFromExecQ(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    return-void
.end method

.method public startTask(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V
    .locals 5

    .line 85
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    iget v1, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExecSize:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ge v0, v1, :cond_0

    .line 86
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mCache:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 87
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->TAG:Ljava/lang/String;

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/Object;

    .line 89
    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v4

    invoke-virtual {v4}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFileName()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getKey()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v3

    const-string v2, "\u5f00\u59cb\u6267\u884c\u5b50\u4efb\u52a1\uff1a%s\uff0ckey: %s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 88
    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->run()V

    return-void

    .line 93
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->TAG:Ljava/lang/String;

    new-array v1, v3, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getKey()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "\u6267\u884c\u961f\u5217\u5df2\u6ee1\uff0c\u4efb\u52a1\u8fdb\u5165\u7f13\u5b58\u5668\u4e2d\uff0ckey: %s"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 94
    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->addTask(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    return-void
.end method

.method public bridge synthetic startTask(Lcom/arialyy/aria/core/inf/IUtil;)V
    .locals 0

    .line 32
    check-cast p1, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->startTask(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    return-void
.end method

.method public stopAllTask()V
    .locals 7

    const/4 v0, 0x1

    .line 103
    iput-boolean v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->isStopAll:Z

    .line 104
    iget-object v1, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->TAG:Ljava/lang/String;

    const-string v2, "\u505c\u6b62\u7ec4\u5408\u4efb\u52a1"

    invoke-static {v1, v2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 105
    iget-object v1, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v1

    .line 106
    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 107
    iget-object v3, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-interface {v3, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    if-eqz v2, :cond_0

    .line 109
    iget-object v3, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->TAG:Ljava/lang/String;

    new-array v4, v0, [Ljava/lang/Object;

    const/4 v5, 0x0

    invoke-virtual {v2}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getEntity()Lcom/arialyy/aria/core/download/DownloadEntity;

    move-result-object v6

    invoke-virtual {v6}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFileName()Ljava/lang/String;

    move-result-object v6

    aput-object v6, v4, v5

    const-string v5, "\u505c\u6b62\u5b50\u4efb\u52a1\uff1a%s"

    invoke-static {v5, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 110
    invoke-virtual {v2}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->stop()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public stopTask(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V
    .locals 1

    .line 98
    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->stop()V

    .line 99
    iget-object v0, p0, Lcom/arialyy/aria/core/group/SimpleSubQueue;->mExec:Ljava/util/Map;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;->getKey()Ljava/lang/String;

    move-result-object p1

    invoke-interface {v0, p1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public bridge synthetic stopTask(Lcom/arialyy/aria/core/inf/IUtil;)V
    .locals 0

    .line 32
    check-cast p1, Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;

    invoke-virtual {p0, p1}, Lcom/arialyy/aria/core/group/SimpleSubQueue;->stopTask(Lcom/arialyy/aria/core/group/AbsSubDLoadUtil;)V

    return-void
.end method
