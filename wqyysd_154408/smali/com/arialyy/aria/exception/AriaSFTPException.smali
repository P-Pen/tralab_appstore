.class public Lcom/arialyy/aria/exception/AriaSFTPException;
.super Lcom/arialyy/aria/exception/AriaException;
.source "AriaSFTPException.java"


# static fields
.field private static final SFTP_EXCEPTION:Ljava/lang/String; = "Aria SFTP Exception:"


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 3

    const/4 v0, 0x2

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string v2, "Aria SFTP Exception:"

    aput-object v2, v0, v1

    const/4 v1, 0x1

    aput-object p1, v0, v1

    const-string p1, "%s\n%s"

    .line 22
    invoke-static {p1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lcom/arialyy/aria/exception/AriaException;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/Exception;)V
    .locals 0

    .line 26
    invoke-direct {p0, p1, p2}, Lcom/arialyy/aria/exception/AriaException;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    return-void
.end method
