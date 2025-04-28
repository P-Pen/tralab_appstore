.class Lcom/arialyy/aria/http/download/HttpDGLoader$1;
.super Ljava/lang/Object;
.source "HttpDGLoader.java"

# interfaces
.implements Lcom/arialyy/aria/core/loader/IInfoTask$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/arialyy/aria/http/download/HttpDGLoader;->addComponent(Lcom/arialyy/aria/core/loader/IInfoTask;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/arialyy/aria/http/download/HttpDGLoader;


# direct methods
.method constructor <init>(Lcom/arialyy/aria/http/download/HttpDGLoader;)V
    .locals 0

    .line 67
    iput-object p1, p0, Lcom/arialyy/aria/http/download/HttpDGLoader$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGLoader;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFail(Lcom/arialyy/aria/core/common/AbsEntity;Lcom/arialyy/aria/exception/AriaException;Z)V
    .locals 0

    .line 73
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDGLoader$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGLoader;

    invoke-static {p1, p2, p3}, Lcom/arialyy/aria/http/download/HttpDGLoader;->access$100(Lcom/arialyy/aria/http/download/HttpDGLoader;Lcom/arialyy/aria/exception/AriaException;Z)V

    return-void
.end method

.method public onSucceed(Ljava/lang/String;Lcom/arialyy/aria/core/common/CompleteInfo;)V
    .locals 0

    .line 69
    iget-object p1, p0, Lcom/arialyy/aria/http/download/HttpDGLoader$1;->this$0:Lcom/arialyy/aria/http/download/HttpDGLoader;

    invoke-static {p1}, Lcom/arialyy/aria/http/download/HttpDGLoader;->access$000(Lcom/arialyy/aria/http/download/HttpDGLoader;)V

    return-void
.end method
