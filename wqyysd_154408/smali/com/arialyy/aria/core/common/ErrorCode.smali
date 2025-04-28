.class public final enum Lcom/arialyy/aria/core/common/ErrorCode;
.super Ljava/lang/Enum;
.source "ErrorCode.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/arialyy/aria/core/common/ErrorCode;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/arialyy/aria/core/common/ErrorCode;

.field public static final enum ERROR_CODE_GROUP_URL_NULL:Lcom/arialyy/aria/core/common/ErrorCode;

.field public static final enum ERROR_CODE_MEMBER_WARNING:Lcom/arialyy/aria/core/common/ErrorCode;

.field public static final enum ERROR_CODE_NORMAL:Lcom/arialyy/aria/core/common/ErrorCode;

.field public static final enum ERROR_CODE_PAGE_NUM:Lcom/arialyy/aria/core/common/ErrorCode;

.field public static final enum ERROR_CODE_TASK_ID_NULL:Lcom/arialyy/aria/core/common/ErrorCode;

.field public static final enum ERROR_CODE_TASK_NOT_EXIST:Lcom/arialyy/aria/core/common/ErrorCode;

.field public static final enum ERROR_CODE_UPLOAD_FILE_NULL:Lcom/arialyy/aria/core/common/ErrorCode;

.field public static final enum ERROR_CODE_URL_INVALID:Lcom/arialyy/aria/core/common/ErrorCode;

.field public static final enum ERROR_CODE_URL_NULL:Lcom/arialyy/aria/core/common/ErrorCode;


# instance fields
.field public code:I

.field public msg:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 16

    .line 19
    new-instance v0, Lcom/arialyy/aria/core/common/ErrorCode;

    const-string v1, "ERROR_CODE_NORMAL"

    const/4 v2, 0x0

    const-string v3, "\u6b63\u5e38"

    invoke-direct {v0, v1, v2, v2, v3}, Lcom/arialyy/aria/core/common/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/arialyy/aria/core/common/ErrorCode;->ERROR_CODE_NORMAL:Lcom/arialyy/aria/core/common/ErrorCode;

    new-instance v1, Lcom/arialyy/aria/core/common/ErrorCode;

    const-string v3, "ERROR_CODE_TASK_ID_NULL"

    const/4 v4, 0x1

    const-string v5, "\u4efb\u52a1id\u4e3a\u7a7a\u7684\u9519\u8bef\u7801"

    invoke-direct {v1, v3, v4, v4, v5}, Lcom/arialyy/aria/core/common/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v1, Lcom/arialyy/aria/core/common/ErrorCode;->ERROR_CODE_TASK_ID_NULL:Lcom/arialyy/aria/core/common/ErrorCode;

    .line 20
    new-instance v3, Lcom/arialyy/aria/core/common/ErrorCode;

    const-string v5, "ERROR_CODE_URL_NULL"

    const/4 v6, 0x2

    const-string v7, "url \u4e3a\u7a7a"

    invoke-direct {v3, v5, v6, v6, v7}, Lcom/arialyy/aria/core/common/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v3, Lcom/arialyy/aria/core/common/ErrorCode;->ERROR_CODE_URL_NULL:Lcom/arialyy/aria/core/common/ErrorCode;

    new-instance v5, Lcom/arialyy/aria/core/common/ErrorCode;

    const-string v7, "ERROR_CODE_URL_INVALID"

    const/4 v8, 0x3

    const-string v9, "url \u65e0\u6548"

    invoke-direct {v5, v7, v8, v8, v9}, Lcom/arialyy/aria/core/common/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v5, Lcom/arialyy/aria/core/common/ErrorCode;->ERROR_CODE_URL_INVALID:Lcom/arialyy/aria/core/common/ErrorCode;

    .line 21
    new-instance v7, Lcom/arialyy/aria/core/common/ErrorCode;

    const-string v9, "ERROR_CODE_PAGE_NUM"

    const/4 v10, 0x4

    const-string v11, "page\u548cnum\u4e0d\u80fd\u5c0f\u4e8e1"

    invoke-direct {v7, v9, v10, v10, v11}, Lcom/arialyy/aria/core/common/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v7, Lcom/arialyy/aria/core/common/ErrorCode;->ERROR_CODE_PAGE_NUM:Lcom/arialyy/aria/core/common/ErrorCode;

    new-instance v9, Lcom/arialyy/aria/core/common/ErrorCode;

    const-string v11, "ERROR_CODE_GROUP_URL_NULL"

    const/4 v12, 0x5

    const-string v13, "\u7ec4\u5408\u4efb\u52a1url\u5217\u8868\u4e3a\u7a7a"

    invoke-direct {v9, v11, v12, v12, v13}, Lcom/arialyy/aria/core/common/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v9, Lcom/arialyy/aria/core/common/ErrorCode;->ERROR_CODE_GROUP_URL_NULL:Lcom/arialyy/aria/core/common/ErrorCode;

    .line 22
    new-instance v11, Lcom/arialyy/aria/core/common/ErrorCode;

    const-string v13, "ERROR_CODE_UPLOAD_FILE_NULL"

    const/4 v14, 0x6

    const/4 v15, 0x7

    const-string v12, "\u4e0a\u4f20\u6587\u4ef6\u4e0d\u5b58\u5728"

    invoke-direct {v11, v13, v14, v15, v12}, Lcom/arialyy/aria/core/common/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v11, Lcom/arialyy/aria/core/common/ErrorCode;->ERROR_CODE_UPLOAD_FILE_NULL:Lcom/arialyy/aria/core/common/ErrorCode;

    .line 23
    new-instance v12, Lcom/arialyy/aria/core/common/ErrorCode;

    const-string v13, "ERROR_CODE_MEMBER_WARNING"

    const/16 v14, 0x8

    const-string v10, "\u4e3a\u4e86\u9632\u6b62\u5185\u5b58\u6cc4\u6f0f\uff0c\u8bf7\u4f7f\u7528\u9759\u6001\u7684\u6210\u5458\u7c7b(public static class xxx)\u6216\u6587\u4ef6\u7c7b(A.java)"

    invoke-direct {v12, v13, v15, v14, v10}, Lcom/arialyy/aria/core/common/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v12, Lcom/arialyy/aria/core/common/ErrorCode;->ERROR_CODE_MEMBER_WARNING:Lcom/arialyy/aria/core/common/ErrorCode;

    .line 24
    new-instance v10, Lcom/arialyy/aria/core/common/ErrorCode;

    const-string v13, "ERROR_CODE_TASK_NOT_EXIST"

    const/16 v15, 0x9

    const-string v8, "\u4efb\u52a1\u4fe1\u606f\u4e0d\u5b58\u5728"

    invoke-direct {v10, v13, v14, v15, v8}, Lcom/arialyy/aria/core/common/ErrorCode;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v10, Lcom/arialyy/aria/core/common/ErrorCode;->ERROR_CODE_TASK_NOT_EXIST:Lcom/arialyy/aria/core/common/ErrorCode;

    new-array v8, v15, [Lcom/arialyy/aria/core/common/ErrorCode;

    aput-object v0, v8, v2

    aput-object v1, v8, v4

    aput-object v3, v8, v6

    const/4 v0, 0x3

    aput-object v5, v8, v0

    const/4 v0, 0x4

    aput-object v7, v8, v0

    const/4 v0, 0x5

    aput-object v9, v8, v0

    const/4 v0, 0x6

    aput-object v11, v8, v0

    const/4 v0, 0x7

    aput-object v12, v8, v0

    aput-object v10, v8, v14

    .line 18
    sput-object v8, Lcom/arialyy/aria/core/common/ErrorCode;->$VALUES:[Lcom/arialyy/aria/core/common/ErrorCode;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;IILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 29
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 30
    iput p3, p0, Lcom/arialyy/aria/core/common/ErrorCode;->code:I

    .line 31
    iput-object p4, p0, Lcom/arialyy/aria/core/common/ErrorCode;->msg:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/arialyy/aria/core/common/ErrorCode;
    .locals 1

    .line 18
    const-class v0, Lcom/arialyy/aria/core/common/ErrorCode;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/core/common/ErrorCode;

    return-object p0
.end method

.method public static values()[Lcom/arialyy/aria/core/common/ErrorCode;
    .locals 1

    .line 18
    sget-object v0, Lcom/arialyy/aria/core/common/ErrorCode;->$VALUES:[Lcom/arialyy/aria/core/common/ErrorCode;

    invoke-virtual {v0}, [Lcom/arialyy/aria/core/common/ErrorCode;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/arialyy/aria/core/common/ErrorCode;

    return-object v0
.end method
