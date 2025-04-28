.class public Lcom/arialyy/aria/exception/AriaException;
.super Ljava/lang/Exception;
.source "AriaException.java"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 0

    .line 21
    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const-string v1, ""

    if-nez p1, :cond_0

    move-object p1, v1

    :cond_0
    const/4 v2, 0x0

    aput-object p1, v0, v2

    const/4 p1, 0x1

    if-nez p2, :cond_1

    goto :goto_0

    .line 26
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Exception;->getMessage()Ljava/lang/String;

    move-result-object v1

    :goto_0
    aput-object v1, v0, p1

    const-string p1, "%s\n%s"

    .line 25
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    return-void
.end method
