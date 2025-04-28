.class public Lcom/etralab/appstoreforandroid/DeleteFile;
.super Ljava/lang/Object;
.source "DeleteFile.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static DeleteDir(Ljava/lang/String;)V
    .locals 1

    .line 8
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 9
    invoke-static {v0}, Lcom/etralab/appstoreforandroid/DeleteFile;->DeleteDirWithFile(Ljava/io/File;)V

    return-void
.end method

.method public static DeleteDirWithFile(Ljava/io/File;)V
    .locals 5

    if-eqz p0, :cond_4

    .line 13
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_2

    .line 15
    :cond_0
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_3

    aget-object v3, v0, v2

    .line 16
    invoke-virtual {v3}, Ljava/io/File;->isFile()Z

    move-result v4

    if-eqz v4, :cond_1

    .line 17
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    goto :goto_1

    .line 18
    :cond_1
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    move-result v4

    if-eqz v4, :cond_2

    .line 19
    invoke-static {v3}, Lcom/etralab/appstoreforandroid/DeleteFile;->DeleteDirWithFile(Ljava/io/File;)V

    :cond_2
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 21
    :cond_3
    invoke-virtual {p0}, Ljava/io/File;->delete()Z

    :cond_4
    :goto_2
    return-void
.end method
