.class Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;
.super Ljava/lang/Object;
.source "FailureTaskHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;->retryTask(Lcom/arialyy/aria/core/task/ITask;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

.field final synthetic val$num:I

.field final synthetic val$queue:Lcom/arialyy/aria/core/queue/ITaskQueue;

.field final synthetic val$task:Lcom/arialyy/aria/core/task/ITask;


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;Lcom/arialyy/aria/core/task/ITask;ILcom/arialyy/aria/core/queue/ITaskQueue;)V
    .locals 0

    .line 87
    iput-object p1, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    iput-object p2, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$task:Lcom/arialyy/aria/core/task/ITask;

    iput p3, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$num:I

    iput-object p4, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$queue:Lcom/arialyy/aria/core/queue/ITaskQueue;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 89
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$task:Lcom/arialyy/aria/core/task/ITask;

    invoke-interface {v0}, Lcom/arialyy/aria/core/task/ITask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v0

    .line 90
    invoke-virtual {v0}, Lcom/arialyy/aria/core/common/AbsEntity;->getFailNum()I

    move-result v0

    iget v1, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$num:I

    if-gt v0, v1, :cond_0

    .line 91
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    invoke-static {v0}, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;->access$500(Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x1

    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$task:Lcom/arialyy/aria/core/task/ITask;

    invoke-interface {v3}, Lcom/arialyy/aria/core/task/ITask;->getTaskName()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const-string v2, "\u4efb\u52a1\u3010%s\u3011\u5f00\u59cb\u91cd\u8bd5"

    invoke-static {v2, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 92
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$queue:Lcom/arialyy/aria/core/queue/ITaskQueue;

    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$task:Lcom/arialyy/aria/core/task/ITask;

    invoke-interface {v0, v1}, Lcom/arialyy/aria/core/queue/ITaskQueue;->reTryStart(Lcom/arialyy/aria/core/task/ITask;)V

    goto :goto_0

    .line 94
    :cond_0
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$queue:Lcom/arialyy/aria/core/queue/ITaskQueue;

    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$task:Lcom/arialyy/aria/core/task/ITask;

    invoke-interface {v1}, Lcom/arialyy/aria/core/task/ITask;->getKey()Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Lcom/arialyy/aria/core/queue/ITaskQueue;->removeTaskFormQueue(Ljava/lang/String;)V

    .line 95
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    invoke-static {v0}, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;->access$600(Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;)Lcom/arialyy/aria/core/scheduler/TaskSchedulers;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$queue:Lcom/arialyy/aria/core/queue/ITaskQueue;

    iget-object v2, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$task:Lcom/arialyy/aria/core/task/ITask;

    invoke-interface {v2}, Lcom/arialyy/aria/core/task/ITask;->getSchedulerType()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/arialyy/aria/core/scheduler/TaskSchedulers;->startNextTask(Lcom/arialyy/aria/core/queue/ITaskQueue;I)V

    .line 96
    invoke-static {}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->getInstance()Lcom/arialyy/aria/core/manager/TaskWrapperManager;

    move-result-object v0

    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$task:Lcom/arialyy/aria/core/task/ITask;

    invoke-interface {v1}, Lcom/arialyy/aria/core/task/ITask;->getTaskWrapper()Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/arialyy/aria/core/manager/TaskWrapperManager;->removeTaskWrapper(Lcom/arialyy/aria/core/wrapper/AbsTaskWrapper;)V

    .line 98
    :goto_0
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$2;->val$task:Lcom/arialyy/aria/core/task/ITask;

    invoke-static {v0, v1}, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;->access$700(Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;Lcom/arialyy/aria/core/task/ITask;)V

    return-void
.end method
