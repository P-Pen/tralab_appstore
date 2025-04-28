.class Lcom/arialyy/aria/http/download/HttpDGInfoTask$2;
.super Ljava/lang/Object;
.source "HttpDGInfoTask.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arialyy/aria/http/download/HttpDGInfoTask;->getGroupSize()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;


# direct methods
.method constructor <init>(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)V
    .locals 0

    .line 108
    iput-object p1, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$2;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 7

    .line 110
    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$2;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {v0}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$500(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Lcom/arialyy/aria/core/download/DGTaskWrapper;

    move-result-object v0

    invoke-virtual {v0}, Lcom/arialyy/aria/core/download/DGTaskWrapper;->getSubTaskWrapper()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/arialyy/aria/core/download/DTaskWrapper;

    .line 111
    invoke-virtual {v1}, Lcom/arialyy/aria/core/download/DTaskWrapper;->getEntity()Lcom/arialyy/aria/core/common/AbsEntity;

    move-result-object v2

    check-cast v2, Lcom/arialyy/aria/core/download/DownloadEntity;

    .line 112
    invoke-virtual {v2}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFileSize()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v3, v3, v5

    if-lez v3, :cond_1

    .line 113
    iget-object v3, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$2;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {v3}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$000(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 114
    invoke-virtual {v2}, Lcom/arialyy/aria/core/download/DownloadEntity;->getCurrentProgress()J

    move-result-wide v3

    invoke-virtual {v2}, Lcom/arialyy/aria/core/download/DownloadEntity;->getFileSize()J

    move-result-wide v5

    cmp-long v2, v3, v5

    if-gez v2, :cond_0

    .line 116
    iget-object v2, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$2;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {v2, v1}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$600(Lcom/arialyy/aria/http/download/HttpDGInfoTask;Lcom/arialyy/aria/core/download/DTaskWrapper;)V

    .line 118
    :cond_0
    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$2;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {v1}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$000(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    iget-object v3, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$2;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {v3}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$100(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    invoke-static {v1, v2, v3}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$200(Lcom/arialyy/aria/http/download/HttpDGInfoTask;II)V

    goto :goto_0

    .line 121
    :cond_1
    iget-object v2, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$2;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {v2, v1}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$600(Lcom/arialyy/aria/http/download/HttpDGInfoTask;Lcom/arialyy/aria/core/download/DTaskWrapper;)V

    .line 122
    new-instance v2, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;

    invoke-direct {v2, v1}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;-><init>(Lcom/arialyy/aria/core/download/DTaskWrapper;)V

    .line 123
    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$2;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {v1}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$700(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Lcom/arialyy/aria/core/loader/IInfoTask$Callback;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/arialyy/aria/http/download/HttpDFileInfoTask;->setCallback(Lcom/arialyy/aria/core/loader/IInfoTask$Callback;)V

    .line 124
    iget-object v1, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$2;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {v1}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$800(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    goto :goto_0

    :cond_2
    return-void
.end method
