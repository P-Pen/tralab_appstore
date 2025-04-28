.class Lcom/etralab/appstoreforandroid/InstallApkActivity$2;
.super Ljava/lang/Object;
.source "InstallApkActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/InstallApkActivity;->onCreate(Landroid/os/Bundle;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

.field final synthetic val$apk:Ljava/io/File;

.field final synthetic val$apk2:Ljava/io/File;

.field final synthetic val$apkPath:Ljava/lang/String;

.field final synthetic val$file:Ljava/io/File;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/InstallApkActivity;Ljava/io/File;Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 123
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$file:Ljava/io/File;

    iput-object p3, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apk:Ljava/io/File;

    iput-object p4, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apk2:Ljava/io/File;

    iput-object p5, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apkPath:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    const-string v0, "\n"

    .line 129
    :try_start_0
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    new-instance v2, Ljava/net/Socket;

    const-string v3, "127.0.0.1"

    const/16 v4, 0x15b3

    invoke-direct {v2, v3, v4}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    iput-object v2, v1, Lcom/etralab/appstoreforandroid/InstallApkActivity;->sock:Ljava/net/Socket;
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_d
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_c

    .line 145
    :try_start_1
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v2, v1, Lcom/etralab/appstoreforandroid/InstallApkActivity;->sock:Ljava/net/Socket;

    iget-object v3, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v3, v3, Lcom/etralab/appstoreforandroid/InstallApkActivity;->crypto:Lcom/etralab/appstoreforandroid/AdbCrypto;

    invoke-static {v2, v3}, Lcom/etralab/appstoreforandroid/AdbConnection;->create(Ljava/net/Socket;Lcom/etralab/appstoreforandroid/AdbCrypto;)Lcom/etralab/appstoreforandroid/AdbConnection;

    move-result-object v2

    iput-object v2, v1, Lcom/etralab/appstoreforandroid/InstallApkActivity;->adb:Lcom/etralab/appstoreforandroid/AdbConnection;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_b

    .line 154
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "ADB connecting..."

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 155
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->debug(Ljava/lang/Object;)V

    .line 158
    :try_start_2
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/InstallApkActivity;->adb:Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-virtual {v1}, Lcom/etralab/appstoreforandroid/AdbConnection;->connect()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_a
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_9

    .line 170
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string v2, "ADB connected"

    invoke-virtual {v1, v2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    .line 172
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v1, v2}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->debug(Ljava/lang/Object;)V

    const-wide/16 v1, 0x3e8

    .line 178
    :try_start_3
    invoke-static {v1, v2}, Ljava/lang/Thread;->sleep(J)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    .line 184
    :catch_0
    :try_start_4
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v2, v1, Lcom/etralab/appstoreforandroid/InstallApkActivity;->adb:Lcom/etralab/appstoreforandroid/AdbConnection;

    const-string v3, "shell:"

    invoke-virtual {v2, v3}, Lcom/etralab/appstoreforandroid/AdbConnection;->open(Ljava/lang/String;)Lcom/etralab/appstoreforandroid/AdbStream;

    move-result-object v2

    iput-object v2, v1, Lcom/etralab/appstoreforandroid/InstallApkActivity;->stream:Lcom/etralab/appstoreforandroid/AdbStream;
    :try_end_4
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_4 .. :try_end_4} :catch_8
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_7
    .catch Ljava/lang/InterruptedException; {:try_start_4 .. :try_end_4} :catch_6

    const/16 v1, 0xa

    .line 205
    :try_start_5
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$file:Ljava/io/File;

    iget-object v3, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apk:Ljava/io/File;

    invoke-virtual {v2, v3}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_5 .. :try_end_5} :catch_1

    const-string v3, " "

    const-string v4, " cp "

    if-nez v2, :cond_0

    .line 208
    :try_start_6
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/InstallApkActivity;->stream:Lcom/etralab/appstoreforandroid/AdbStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$file:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apk2:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/etralab/appstoreforandroid/AdbStream;->write(Ljava/lang/String;)V

    goto :goto_0

    .line 212
    :cond_0
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v2, v2, Lcom/etralab/appstoreforandroid/InstallApkActivity;->stream:Lcom/etralab/appstoreforandroid/AdbStream;

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v4, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apk:Ljava/io/File;

    invoke-virtual {v4}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v4

    invoke-virtual {v4}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v3, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apk2:Ljava/io/File;

    invoke-virtual {v3}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v3}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/etralab/appstoreforandroid/AdbStream;->write(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_1

    goto :goto_0

    :catch_1
    move-exception v2

    .line 218
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v2}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    goto :goto_0

    :catch_2
    move-exception v2

    .line 216
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v2}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    :goto_0
    const-string v2, ""

    const/4 v3, 0x0

    move-object v4, v2

    move v5, v3

    .line 221
    :cond_1
    :goto_1
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/InstallApkActivity;->stream:Lcom/etralab/appstoreforandroid/AdbStream;

    invoke-virtual {v6}, Lcom/etralab/appstoreforandroid/AdbStream;->isClosed()Z

    move-result v6

    if-nez v6, :cond_9

    .line 226
    :try_start_7
    new-instance v6, Ljava/lang/String;

    iget-object v7, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/InstallApkActivity;->stream:Lcom/etralab/appstoreforandroid/AdbStream;

    invoke-virtual {v7}, Lcom/etralab/appstoreforandroid/AdbStream;->read()[B

    move-result-object v7

    const-string v8, "US-ASCII"

    invoke-direct {v6, v7, v8}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    .line 227
    invoke-virtual {v6, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    const/4 v8, 0x1

    if-eqz v7, :cond_4

    .line 229
    invoke-virtual {v6, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    move v9, v3

    .line 231
    :goto_2
    array-length v10, v7

    if-ge v9, v10, :cond_5

    if-nez v9, :cond_2

    .line 235
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v4, v7, v3

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    .line 236
    iget-object v10, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v10, v4}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->debug(Ljava/lang/Object;)V

    goto :goto_3

    .line 239
    :cond_2
    array-length v10, v7

    sub-int/2addr v10, v8

    if-ne v9, v10, :cond_3

    .line 241
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    aget-object v4, v7, v9

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_4

    .line 245
    :cond_3
    iget-object v4, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    aget-object v10, v7, v9

    invoke-virtual {v4, v10}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->debug(Ljava/lang/Object;)V

    :goto_3
    move-object v4, v2

    :goto_4
    add-int/lit8 v9, v9, 0x1

    goto :goto_2

    .line 252
    :cond_4
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    :cond_5
    const-string v7, "cp"

    .line 256
    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_7

    if-nez v5, :cond_6

    move v5, v8

    goto :goto_5

    .line 264
    :cond_6
    iget-object v7, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/InstallApkActivity;->stream:Lcom/etralab/appstoreforandroid/AdbStream;

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " pm install -r "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apk2:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/etralab/appstoreforandroid/AdbStream;->write(Ljava/lang/String;)V

    :cond_7
    :goto_5
    const-string v7, "Success"

    .line 268
    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7
    :try_end_7
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_7 .. :try_end_7} :catch_5
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_3

    const-string v8, " exit\n"

    if-eqz v7, :cond_8

    .line 270
    :try_start_8
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/InstallApkActivity;->handler:Landroid/os/Handler;

    const/16 v7, 0x7d0

    invoke-virtual {v6, v7}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    .line 271
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apk:Ljava/io/File;

    new-instance v7, Ljava/io/File;

    iget-object v9, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apkPath:Ljava/lang/String;

    invoke-direct {v7, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v6, v7}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 272
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/InstallApkActivity;->stream:Lcom/etralab/appstoreforandroid/AdbStream;

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, " rm -rf "

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apk2:Ljava/io/File;

    invoke-virtual {v9}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lcom/etralab/appstoreforandroid/AdbStream;->write(Ljava/lang/String;)V

    .line 273
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v6, v6, Lcom/etralab/appstoreforandroid/InstallApkActivity;->stream:Lcom/etralab/appstoreforandroid/AdbStream;

    invoke-virtual {v6, v8}, Lcom/etralab/appstoreforandroid/AdbStream;->write(Ljava/lang/String;)V

    .line 274
    iget-object v6, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apk2:Ljava/io/File;

    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    goto/16 :goto_1

    :cond_8
    const-string v7, "Error"

    .line 276
    invoke-virtual {v6, v7}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    const-string v9, "error"

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    or-int/2addr v7, v9

    const-string v9, "fail"

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    or-int/2addr v7, v9

    const-string v9, "Fail"

    invoke-virtual {v6, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v9

    or-int/2addr v7, v9

    if-eqz v7, :cond_1

    .line 278
    iget-object v7, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apk:Ljava/io/File;

    new-instance v9, Ljava/io/File;

    iget-object v10, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apkPath:Ljava/lang/String;

    invoke-direct {v9, v10}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v7, v9}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 279
    iget-object v7, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/InstallApkActivity;->stream:Lcom/etralab/appstoreforandroid/AdbStream;

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, " rm -rf"

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->val$apk2:Ljava/io/File;

    invoke-virtual {v10}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v9}, Lcom/etralab/appstoreforandroid/AdbStream;->write(Ljava/lang/String;)V

    .line 280
    iget-object v7, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    iget-object v7, v7, Lcom/etralab/appstoreforandroid/InstallApkActivity;->stream:Lcom/etralab/appstoreforandroid/AdbStream;

    invoke-virtual {v7, v8}, Lcom/etralab/appstoreforandroid/AdbStream;->write(Ljava/lang/String;)V

    .line 281
    iget-object v7, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v7, v6}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V
    :try_end_8
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_8 .. :try_end_8} :catch_5
    .catch Ljava/lang/InterruptedException; {:try_start_8 .. :try_end_8} :catch_4
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_3

    goto/16 :goto_1

    :catch_3
    return-void

    :catch_4
    move-exception v0

    .line 292
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    return-void

    :catch_5
    move-exception v0

    .line 287
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    :cond_9
    return-void

    :catch_6
    move-exception v0

    .line 198
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    return-void

    :catch_7
    move-exception v0

    .line 193
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    return-void

    :catch_8
    move-exception v0

    .line 188
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v0}, Ljava/io/UnsupportedEncodingException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    return-void

    :catch_9
    move-exception v0

    .line 167
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v0}, Ljava/lang/InterruptedException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->debug(Ljava/lang/Object;)V

    return-void

    :catch_a
    move-exception v0

    .line 162
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    return-void

    :catch_b
    move-exception v0

    .line 149
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    return-void

    :catch_c
    move-exception v0

    .line 138
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v0}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    return-void

    :catch_d
    move-exception v0

    .line 133
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;->this$0:Lcom/etralab/appstoreforandroid/InstallApkActivity;

    invoke-virtual {v0}, Ljava/net/UnknownHostException;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    return-void
.end method
