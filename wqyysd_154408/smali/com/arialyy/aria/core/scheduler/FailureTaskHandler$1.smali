.class Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$1;
.super Ljava/lang/Object;
.source "FailureTaskHandler.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;-><init>(Lcom/arialyy/aria/core/scheduler/TaskSchedulers;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;


# direct methods
.method constructor <init>(Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;)V
    .locals 0

    .line 59
    iput-object p1, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$1;->this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .line 63
    :goto_0
    :try_start_0
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$1;->this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    invoke-static {v0}, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;->access$000(Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;)Ljava/util/concurrent/ArrayBlockingQueue;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/ArrayBlockingQueue;->take()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/arialyy/aria/core/task/ITask;

    .line 64
    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$1;->this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    invoke-static {v1}, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;->access$100(Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v2, 0x5

    if-lt v1, v2, :cond_0

    .line 66
    :try_start_1
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$1;->this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    invoke-static {v0}, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;->access$200(Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    .line 67
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$1;->this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    invoke-static {v0}, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;->access$300(Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;)Ljava/util/concurrent/locks/Condition;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->await()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    :try_start_2
    iget-object v0, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$1;->this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    invoke-static {v0}, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;->access$200(Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    goto :goto_0

    :catchall_0
    move-exception v0

    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$1;->this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    invoke-static {v1}, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;->access$200(Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;)Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    .line 70
    throw v0

    .line 72
    :cond_0
    iget-object v1, p0, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler$1;->this$0:Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;

    invoke-static {v1, v0}, Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;->access$400(Lcom/arialyy/aria/core/scheduler/FailureTaskHandler;Lcom/arialyy/aria/core/task/ITask;)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 75
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0
.end method
