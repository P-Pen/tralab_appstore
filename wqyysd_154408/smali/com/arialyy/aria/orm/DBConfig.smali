.class Lcom/arialyy/aria/orm/DBConfig;
.super Ljava/lang/Object;
.source "DBConfig.java"


# static fields
.field static DB_NAME:Ljava/lang/String; = null

.field static DEBUG:Z = false

.field static final SAVE_IN_SDCARD:Z = false

.field static VERSION:I

.field static mapping:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Class<",
            "+",
            "Lcom/arialyy/aria/orm/DbEntity;",
            ">;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 35
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Lcom/arialyy/aria/orm/DBConfig;->mapping:Ljava/util/Map;

    const/16 v0, 0x3a

    .line 37
    sput v0, Lcom/arialyy/aria/orm/DBConfig;->VERSION:I

    .line 45
    sget-object v0, Lcom/arialyy/aria/orm/DBConfig;->DB_NAME:Ljava/lang/String;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "AndroidAria.db"

    .line 46
    sput-object v0, Lcom/arialyy/aria/orm/DBConfig;->DB_NAME:Ljava/lang/String;

    .line 48
    :cond_0
    sget v0, Lcom/arialyy/aria/orm/DBConfig;->VERSION:I

    const/4 v1, -0x1

    if-ne v0, v1, :cond_1

    const/4 v0, 0x1

    .line 49
    sput v0, Lcom/arialyy/aria/orm/DBConfig;->VERSION:I

    .line 54
    :cond_1
    sget-object v0, Lcom/arialyy/aria/orm/DBConfig;->mapping:Ljava/util/Map;

    const-class v1, Lcom/arialyy/aria/core/download/DownloadEntity;

    const-string v2, "DownloadEntity"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    sget-object v0, Lcom/arialyy/aria/orm/DBConfig;->mapping:Ljava/util/Map;

    const-class v1, Lcom/arialyy/aria/core/download/DownloadGroupEntity;

    const-string v2, "DownloadGroupEntity"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    sget-object v0, Lcom/arialyy/aria/orm/DBConfig;->mapping:Ljava/util/Map;

    const-class v1, Lcom/arialyy/aria/core/upload/UploadEntity;

    const-string v2, "UploadEntity"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    sget-object v0, Lcom/arialyy/aria/orm/DBConfig;->mapping:Ljava/util/Map;

    const-class v1, Lcom/arialyy/aria/core/ThreadRecord;

    const-string v2, "ThreadRecord"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    sget-object v0, Lcom/arialyy/aria/orm/DBConfig;->mapping:Ljava/util/Map;

    const-class v1, Lcom/arialyy/aria/core/TaskRecord;

    const-string v2, "TaskRecord"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    sget-object v0, Lcom/arialyy/aria/orm/DBConfig;->mapping:Ljava/util/Map;

    const-class v1, Lcom/arialyy/aria/core/download/M3U8Entity;

    const-string v2, "M3U8Entity"

    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method
