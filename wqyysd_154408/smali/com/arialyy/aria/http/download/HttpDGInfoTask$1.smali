.class Lcom/arialyy/aria/http/download/HttpDGInfoTask$1;
.super Ljava/lang/Object;
.source "HttpDGInfoTask.java"

# interfaces
.implements Lcom/arialyy/aria/core/loader/IInfoTask$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/arialyy/aria/http/download/HttpDGInfoTask;
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

    .line 52
    iput-object p1, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFail(Lcom/arialyy/aria/core/common/AbsEntity;Lcom/arialyy/aria/exception/AriaException;Z)V
    .locals 3

    .line 60
    iget-object p2, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {p2}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$300(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Ljava/lang/String;

    move-result-object p2

    const/4 p3, 0x1

    new-array v0, p3, [Ljava/lang/Object;

    check-cast p1, Lcom/arialyy/aria/core/download/DownloadEntity;

    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v0, v2

    const-string v1, "\u83b7\u53d6\u6587\u4ef6\u4fe1\u606f\u5931\u8d25\uff0curl\uff1a%s"

    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p2, v0}, Lcom/arialyy/aria/util/ALog;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 61
    iget-object p2, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {p2}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$000(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 62
    iget-object p2, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {p2}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$100(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 63
    iget-object p2, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {p2}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$400(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Lcom/arialyy/aria/core/listener/DownloadGroupListener;

    move-result-object p2

    new-instance v0, Lcom/arialyy/aria/exception/AriaHTTPException;

    new-array p3, p3, [Ljava/lang/Object;

    .line 64
    invoke-virtual {p1}, Lcom/arialyy/aria/core/download/DownloadEntity;->getUrl()Ljava/lang/String;

    move-result-object v1

    aput-object v1, p3, v2

    const-string v1, "\u5b50\u4efb\u52a1\u83b7\u53d6\u6587\u4ef6\u957f\u5ea6\u5931\u8d25\uff0curl\uff1a%s"

    invoke-static {v1, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p3

    invoke-direct {v0, p3}, Lcom/arialyy/aria/exception/AriaHTTPException;-><init>(Ljava/lang/String;)V

    .line 63
    invoke-virtual {p2, p1, v0}, Lcom/arialyy/aria/core/listener/DownloadGroupListener;->onSubFail(Lcom/arialyy/aria/core/download/DownloadEntity;Lcom/arialyy/aria/exception/AriaException;)V

    .line 65
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {p1}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$000(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p2

    iget-object p3, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {p3}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$100(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object p3

    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p3

    invoke-static {p1, p2, p3}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$200(Lcom/arialyy/aria/http/download/HttpDGInfoTask;II)V

    return-void
.end method

.method public onSucceed(Ljava/lang/String;Lcom/arialyy/aria/core/common/CompleteInfo;)V
    .locals 1

    .line 54
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {p1}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$000(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 55
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {p1}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$000(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p2

    iget-object v0, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {v0}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$100(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Ljava/util/concurrent/atomic/AtomicInteger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v0

    invoke-static {p1, p2, v0}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$200(Lcom/arialyy/aria/http/download/HttpDGInfoTask;II)V

    .line 56
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDGInfoTask$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGInfoTask;

    invoke-static {p1}, Lcom/arialyy/aria/http/download/HttpDGInfoTask;->access$300(Lcom/arialyy/aria/http/download/HttpDGInfoTask;)Ljava/lang/String;

    move-result-object p1

    const-string p2, "\u83b7\u53d6\u5b50\u4efb\u52a1\u4fe1\u606f\u5b8c\u6210"

    invoke-static {p1, p2}, Lcom/arialyy/aria/util/ALog;->d(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method
