.class public Lcom/arialyy/aria/core/TaskOptionParams;
.super Ljava/lang/Object;
.source "TaskOptionParams.java"


# static fields
.field private static PROCESSORES:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Class;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private handler:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/arialyy/aria/core/inf/IEventHandler;",
            ">;"
        }
    .end annotation
.end field

.field private params:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 46
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    sput-object v0, Lcom/arialyy/aria/core/TaskOptionParams;->PROCESSORES:Ljava/util/List;

    .line 59
    const-class v1, Lcom/arialyy/aria/core/processor/FtpInterceptHandler;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    sget-object v0, Lcom/arialyy/aria/core/TaskOptionParams;->PROCESSORES:Ljava/util/List;

    const-class v1, Lcom/arialyy/aria/core/processor/IBandWidthUrlConverter;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    sget-object v0, Lcom/arialyy/aria/core/TaskOptionParams;->PROCESSORES:Ljava/util/List;

    const-class v1, Lcom/arialyy/aria/core/processor/IFtpUploadInterceptor;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    sget-object v0, Lcom/arialyy/aria/core/TaskOptionParams;->PROCESSORES:Ljava/util/List;

    const-class v1, Lcom/arialyy/aria/core/processor/IHttpFileLenAdapter;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    sget-object v0, Lcom/arialyy/aria/core/TaskOptionParams;->PROCESSORES:Ljava/util/List;

    const-class v1, Lcom/arialyy/aria/core/processor/IHttpFileNameAdapter;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 64
    sget-object v0, Lcom/arialyy/aria/core/TaskOptionParams;->PROCESSORES:Ljava/util/List;

    const-class v1, Lcom/arialyy/aria/core/processor/ILiveTsUrlConverter;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 65
    sget-object v0, Lcom/arialyy/aria/core/TaskOptionParams;->PROCESSORES:Ljava/util/List;

    const-class v1, Lcom/arialyy/aria/core/processor/ITsMergeHandler;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    sget-object v0, Lcom/arialyy/aria/core/TaskOptionParams;->PROCESSORES:Ljava/util/List;

    const-class v1, Lcom/arialyy/aria/core/processor/IVodTsUrlConverter;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 67
    sget-object v0, Lcom/arialyy/aria/core/TaskOptionParams;->PROCESSORES:Ljava/util/List;

    const-class v1, Lcom/arialyy/aria/core/processor/IKeyUrlConverter;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 44
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 51
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/TaskOptionParams;->params:Ljava/util/Map;

    .line 56
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/arialyy/aria/core/TaskOptionParams;->handler:Ljava/util/Map;

    return-void
.end method


# virtual methods
.method public getHandler(Ljava/lang/String;)Lcom/arialyy/aria/core/inf/IEventHandler;
    .locals 1

    .line 126
    iget-object v0, p0, Lcom/arialyy/aria/core/TaskOptionParams;->handler:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/arialyy/aria/core/inf/IEventHandler;

    return-object p1
.end method

.method public getHandler()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/arialyy/aria/core/inf/IEventHandler;",
            ">;"
        }
    .end annotation

    .line 130
    iget-object v0, p0, Lcom/arialyy/aria/core/TaskOptionParams;->handler:Ljava/util/Map;

    return-object v0
.end method

.method public getParam(Ljava/lang/String;)Ljava/lang/Object;
    .locals 1

    .line 122
    iget-object v0, p0, Lcom/arialyy/aria/core/TaskOptionParams;->params:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public getParams()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 118
    iget-object v0, p0, Lcom/arialyy/aria/core/TaskOptionParams;->params:Ljava/util/Map;

    return-object v0
.end method

.method public setObjs(Ljava/lang/String;Lcom/arialyy/aria/core/inf/IEventHandler;)Lcom/arialyy/aria/core/TaskOptionParams;
    .locals 1

    .line 113
    iget-object v0, p0, Lcom/arialyy/aria/core/TaskOptionParams;->handler:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public setParams(Ljava/lang/String;Ljava/lang/Object;)Lcom/arialyy/aria/core/TaskOptionParams;
    .locals 1

    .line 105
    iget-object v0, p0, Lcom/arialyy/aria/core/TaskOptionParams;->params:Ljava/util/Map;

    invoke-interface {v0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public setParams(Lcom/arialyy/aria/core/common/BaseOption;)V
    .locals 4

    .line 76
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-static {v0}, Lcom/arialyy/aria/util/CommonUtil;->getAllFields(Ljava/lang/Class;)Ljava/util/List;

    move-result-object v0

    .line 78
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/reflect/Field;

    const/4 v2, 0x1

    .line 79
    invoke-virtual {v1, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 82
    :try_start_0
    sget-object v2, Lcom/arialyy/aria/core/TaskOptionParams;->PROCESSORES:Ljava/util/List;

    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getType()Ljava/lang/Class;

    move-result-object v3

    invoke-interface {v2, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 83
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 85
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    check-cast v2, Lcom/arialyy/aria/core/inf/IEventHandler;

    invoke-virtual {p0, v1, v2}, Lcom/arialyy/aria/core/TaskOptionParams;->setObjs(Ljava/lang/String;Lcom/arialyy/aria/core/inf/IEventHandler;)Lcom/arialyy/aria/core/TaskOptionParams;

    goto :goto_0

    .line 88
    :cond_1
    invoke-virtual {v1, p1}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 90
    invoke-virtual {v1}, Ljava/lang/reflect/Field;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1, v2}, Lcom/arialyy/aria/core/TaskOptionParams;->setParams(Ljava/lang/String;Ljava/lang/Object;)Lcom/arialyy/aria/core/TaskOptionParams;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v1

    .line 94
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_0

    :cond_2
    return-void
.end method
