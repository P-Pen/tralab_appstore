.class public final enum Lcom/arialyy/aria/orm/ActionPolicy;
.super Ljava/lang/Enum;
.source "ActionPolicy.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/arialyy/aria/orm/ActionPolicy;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/arialyy/aria/orm/ActionPolicy;

.field public static final enum CASCADE:Lcom/arialyy/aria/orm/ActionPolicy;

.field public static final enum NO_ACTION:Lcom/arialyy/aria/orm/ActionPolicy;

.field public static final enum RESTRICT:Lcom/arialyy/aria/orm/ActionPolicy;

.field public static final enum SET_DEFAULT:Lcom/arialyy/aria/orm/ActionPolicy;

.field public static final enum SET_NULL:Lcom/arialyy/aria/orm/ActionPolicy;


# instance fields
.field function:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 11

    .line 32
    new-instance v0, Lcom/arialyy/aria/orm/ActionPolicy;

    const-string v1, "NO_ACTION"

    const/4 v2, 0x0

    const-string v3, "NO ACTION"

    invoke-direct {v0, v1, v2, v3}, Lcom/arialyy/aria/orm/ActionPolicy;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v0, Lcom/arialyy/aria/orm/ActionPolicy;->NO_ACTION:Lcom/arialyy/aria/orm/ActionPolicy;

    .line 39
    new-instance v1, Lcom/arialyy/aria/orm/ActionPolicy;

    const-string v3, "RESTRICT"

    const/4 v4, 0x1

    invoke-direct {v1, v3, v4, v3}, Lcom/arialyy/aria/orm/ActionPolicy;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v1, Lcom/arialyy/aria/orm/ActionPolicy;->RESTRICT:Lcom/arialyy/aria/orm/ActionPolicy;

    .line 44
    new-instance v3, Lcom/arialyy/aria/orm/ActionPolicy;

    const-string v5, "SET_NULL"

    const/4 v6, 0x2

    const-string v7, "SET NULL"

    invoke-direct {v3, v5, v6, v7}, Lcom/arialyy/aria/orm/ActionPolicy;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v3, Lcom/arialyy/aria/orm/ActionPolicy;->SET_NULL:Lcom/arialyy/aria/orm/ActionPolicy;

    .line 49
    new-instance v5, Lcom/arialyy/aria/orm/ActionPolicy;

    const-string v7, "SET_DEFAULT"

    const/4 v8, 0x3

    const-string v9, "SET ERROR"

    invoke-direct {v5, v7, v8, v9}, Lcom/arialyy/aria/orm/ActionPolicy;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v5, Lcom/arialyy/aria/orm/ActionPolicy;->SET_DEFAULT:Lcom/arialyy/aria/orm/ActionPolicy;

    .line 54
    new-instance v7, Lcom/arialyy/aria/orm/ActionPolicy;

    const-string v9, "CASCADE"

    const/4 v10, 0x4

    invoke-direct {v7, v9, v10, v9}, Lcom/arialyy/aria/orm/ActionPolicy;-><init>(Ljava/lang/String;ILjava/lang/String;)V

    sput-object v7, Lcom/arialyy/aria/orm/ActionPolicy;->CASCADE:Lcom/arialyy/aria/orm/ActionPolicy;

    const/4 v9, 0x5

    new-array v9, v9, [Lcom/arialyy/aria/orm/ActionPolicy;

    aput-object v0, v9, v2

    aput-object v1, v9, v4

    aput-object v3, v9, v6

    aput-object v5, v9, v8

    aput-object v7, v9, v10

    .line 27
    sput-object v9, Lcom/arialyy/aria/orm/ActionPolicy;->$VALUES:[Lcom/arialyy/aria/orm/ActionPolicy;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 58
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 59
    iput-object p3, p0, Lcom/arialyy/aria/orm/ActionPolicy;->function:Ljava/lang/String;

    return-void
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/arialyy/aria/orm/ActionPolicy;
    .locals 1

    .line 27
    const-class v0, Lcom/arialyy/aria/orm/ActionPolicy;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object p0

    check-cast p0, Lcom/arialyy/aria/orm/ActionPolicy;

    return-object p0
.end method

.method public static values()[Lcom/arialyy/aria/orm/ActionPolicy;
    .locals 1

    .line 27
    sget-object v0, Lcom/arialyy/aria/orm/ActionPolicy;->$VALUES:[Lcom/arialyy/aria/orm/ActionPolicy;

    invoke-virtual {v0}, [Lcom/arialyy/aria/orm/ActionPolicy;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lcom/arialyy/aria/orm/ActionPolicy;

    return-object v0
.end method
