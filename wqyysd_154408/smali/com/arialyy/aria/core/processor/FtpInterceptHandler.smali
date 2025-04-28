.class public Lcom/arialyy/aria/core/processor/FtpInterceptHandler;
.super Ljava/lang/Object;
.source "FtpInterceptHandler.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/arialyy/aria/core/processor/FtpInterceptHandler$Builder;
    }
.end annotation


# instance fields
.field private coverServerFile:Z

.field private newFileName:Ljava/lang/String;


# direct methods
.method private constructor <init>()V
    .locals 0

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/arialyy/aria/core/processor/FtpInterceptHandler$1;)V
    .locals 0

    .line 26
    invoke-direct {p0}, Lcom/arialyy/aria/core/processor/FtpInterceptHandler;-><init>()V

    return-void
.end method

.method static synthetic access$102(Lcom/arialyy/aria/core/processor/FtpInterceptHandler;Z)Z
    .locals 0

    .line 26
    iput-boolean p1, p0, Lcom/arialyy/aria/core/processor/FtpInterceptHandler;->coverServerFile:Z

    return p1
.end method

.method static synthetic access$202(Lcom/arialyy/aria/core/processor/FtpInterceptHandler;Ljava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 26
    iput-object p1, p0, Lcom/arialyy/aria/core/processor/FtpInterceptHandler;->newFileName:Ljava/lang/String;

    return-object p1
.end method


# virtual methods
.method public getNewFileName()Ljava/lang/String;
    .locals 1

    .line 40
    iget-object v0, p0, Lcom/arialyy/aria/core/processor/FtpInterceptHandler;->newFileName:Ljava/lang/String;

    return-object v0
.end method

.method public isCoverServerFile()Z
    .locals 1

    .line 36
    iget-boolean v0, p0, Lcom/arialyy/aria/core/processor/FtpInterceptHandler;->coverServerFile:Z

    return v0
.end method
