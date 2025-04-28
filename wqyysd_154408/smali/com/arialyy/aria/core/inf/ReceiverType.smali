.class public final enum Lcom/arialyy/aria/core/inf/ReceiverType;
.super Ljava/lang/Enum;
.source "ReceiverType.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/arialyy/aria/core/inf/ReceiverType;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/arialyy/aria/core/inf/ReceiverType;

.field public static final enum DOWNLOAD:Lcom/arialyy/aria/core/inf/ReceiverType;

.field public static final enum UPLOAD:Lcom/arialyy/aria/core/inf/ReceiverType;


# instance fields
.field name:Ljava/lang/String;

.field type:I


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 22
    new-instance v0, Lcom/arialyy/aria/core/inf/ReceiverType;

    const-string v1, "DOWNLOAD"

    const/4 v2, 0x0

    const/4 v3, 0x1

    const-string v4, "download"

    invoke-direct {v0, v1, v2, v3, v4}, Lcom/arialyy/aria/core/inf/ReceiverType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v0, Lcom/arialyy/aria/core/inf/ReceiverType;->DOWNLOAD:Lcom/arialyy/aria/core/inf/ReceiverType;

    .line 23
    new-instance v1, Lcom/arialyy/aria/core/inf/ReceiverType;

    const-string v4, "UPLOAD"

    const/4 v5, 0x2

    const-string v6, "upload"

    invoke-direct {v1, v4, v3, v5, v6}, Lcom/arialyy/aria/core/inf/ReceiverType;-><init>(Ljava/lang/String;IILjava/lang/String;)V

    sput-object v1, Lcom/arialyy/aria/core/inf/ReceiverType;->UPLOAD:Lcom/arialyy/aria/core/inf/ReceiverType;

    new-array v4, v5, [Lcom/arialyy/aria/core/inf/ReceiverType;

    aput-object v0, v4, v2

    aput-object v1, v4, v3

    .line 21
    sput-object v4, Lcom/arialyy/aria/core/inf/ReceiverType;->$VALUES:[Lcom/arialyy/aria/core/inf/ReceiverType;

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

    .line 28
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 29
    iput p3, p0, Lcom/arialyy/aria/core/inf/ReceiverType;->type:I

    .line 30
    iput-object p4, p0, Lcom/arialyy/aria/core/inf/ReceiverType;->name:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/arialyy/aria/core/inf/ReceiverType;
    .locals 1

    .line 21
    const-class v0, Lcom/arialyy/aria/core/inf/ReceiverType;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/core/inf/ReceiverType;

    return-object p0
.end method

.method public static values()[Lcom/arialyy/aria/core/inf/ReceiverType;
    .locals 1

    .line 21
    sget-object v0, Lcom/arialyy/aria/core/inf/ReceiverType;->$VALUES:[Lcom/arialyy/aria/core/inf/ReceiverType;

    invoke-virtual {v0}, [Lcom/arialyy/aria/core/inf/ReceiverType;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/arialyy/aria/core/inf/ReceiverType;

    return-object v0
.end method
