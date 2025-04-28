.class public Lcom/etralab/appstoreforandroid/InstallApkActivity;
.super Landroid/app/Activity;
.source "InstallApkActivity.java"


# instance fields
.field adb:Lcom/etralab/appstoreforandroid/AdbConnection;

.field crypto:Lcom/etralab/appstoreforandroid/AdbCrypto;

.field debug:Landroid/widget/TextView;

.field handler:Landroid/os/Handler;

.field in:Ljava/util/Scanner;

.field iv_loading_anim:Landroid/widget/ImageView;

.field sock:Ljava/net/Socket;

.field state:Landroid/widget/TextView;

.field stream:Lcom/etralab/appstoreforandroid/AdbStream;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 29
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 31
    new-instance v0, Ljava/util/Scanner;

    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    invoke-direct {v0, v1}, Ljava/util/Scanner;-><init>(Ljava/io/InputStream;)V

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity;->in:Ljava/util/Scanner;

    .line 323
    new-instance v0, Lcom/etralab/appstoreforandroid/InstallApkActivity$3;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/InstallApkActivity$3;-><init>(Lcom/etralab/appstoreforandroid/InstallApkActivity;)V

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity;->handler:Landroid/os/Handler;

    return-void
.end method

.method static close(Ljava/io/FileInputStream;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 513
    :try_start_0
    invoke-virtual {p0}, Ljava/io/FileInputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method static close(Ljava/io/FileOutputStream;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 527
    :try_start_0
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method static close(Ljava/nio/channels/FileChannel;)V
    .locals 0

    if-eqz p0, :cond_0

    .line 500
    :try_start_0
    invoke-virtual {p0}, Ljava/nio/channels/FileChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method public static getBase64Impl()Lcom/etralab/appstoreforandroid/AdbBase64;
    .locals 1

    .line 417
    new-instance v0, Lcom/etralab/appstoreforandroid/InstallApkActivity$4;

    invoke-direct {v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity$4;-><init>()V

    return-object v0
.end method

.method private static setupCrypto(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/etralab/appstoreforandroid/AdbCrypto;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/security/NoSuchAlgorithmException;,
            Ljava/security/spec/InvalidKeySpecException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 433
    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 434
    new-instance p0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 465
    invoke-static {}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->getBase64Impl()Lcom/etralab/appstoreforandroid/AdbBase64;

    move-result-object p1

    invoke-static {p1}, Lcom/etralab/appstoreforandroid/AdbCrypto;->generateAdbKeyPair(Lcom/etralab/appstoreforandroid/AdbBase64;)Lcom/etralab/appstoreforandroid/AdbCrypto;

    move-result-object p1

    .line 468
    invoke-virtual {p1, p0, v0}, Lcom/etralab/appstoreforandroid/AdbCrypto;->saveAdbKeyPair(Ljava/io/File;Ljava/io/File;)V

    .line 469
    sget-object p0, Ljava/lang/System;->out:Ljava/io/PrintStream;

    const-string p2, "Generated new keypair"

    invoke-virtual {p0, p2}, Ljava/io/PrintStream;->println(Ljava/lang/String;)V

    return-object p1
.end method


# virtual methods
.method debug(Ljava/lang/Object;)V
    .locals 1

    .line 481
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 482
    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 483
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity;->handler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method fail(Ljava/lang/Object;)V
    .locals 1

    .line 488
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 489
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    const/16 p1, 0xbb8

    .line 490
    iput p1, v0, Landroid/os/Message;->what:I

    .line 491
    iget-object p1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity;->handler:Landroid/os/Handler;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    return-void
.end method

.method protected onCreate(Landroid/os/Bundle;)V
    .locals 7

    .line 41
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    const/4 p1, 0x1

    .line 43
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->requestWindowFeature(I)Z

    const p1, 0x7f0b0031

    .line 44
    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->setContentView(I)V

    .line 47
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->getWindow()Landroid/view/Window;

    move-result-object p1

    const/16 v0, 0x80

    invoke-virtual {p1, v0, v0}, Landroid/view/Window;->setFlags(II)V

    .line 49
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->getIntent()Landroid/content/Intent;

    move-result-object p1

    if-nez p1, :cond_0

    .line 52
    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->finish()V

    return-void

    :cond_0
    const v0, 0x7f080089

    .line 55
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity;->debug:Landroid/widget/TextView;

    const v0, 0x7f0801ed

    .line 56
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity;->state:Landroid/widget/TextView;

    const v0, 0x7f0800e5

    .line 57
    invoke-virtual {p0, v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity;->iv_loading_anim:Landroid/widget/ImageView;

    .line 59
    new-instance v0, Lcom/etralab/appstoreforandroid/InstallApkActivity$1;

    invoke-direct {v0, p0}, Lcom/etralab/appstoreforandroid/InstallApkActivity$1;-><init>(Lcom/etralab/appstoreforandroid/InstallApkActivity;)V

    .line 69
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/InstallApkActivity$1;->start()V

    const-string v0, "apkPath"

    .line 74
    invoke-virtual {p1, v0}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 90
    new-instance v3, Ljava/io/File;

    invoke-direct {v3, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 92
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ".apk"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 93
    new-instance v4, Ljava/io/File;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 95
    new-instance v5, Ljava/io/File;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "/data/local/tmp/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v5, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 102
    :try_start_0
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "pub.key"

    const-string v1, "priv.key"

    .line 103
    invoke-static {v0, v1, p1}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->setupCrypto(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lcom/etralab/appstoreforandroid/AdbCrypto;

    move-result-object p1

    iput-object p1, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity;->crypto:Lcom/etralab/appstoreforandroid/AdbCrypto;
    :try_end_0
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/security/spec/InvalidKeySpecException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 123
    new-instance p1, Ljava/lang/Thread;

    new-instance v0, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;

    move-object v1, v0

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/etralab/appstoreforandroid/InstallApkActivity$2;-><init>(Lcom/etralab/appstoreforandroid/InstallApkActivity;Ljava/io/File;Ljava/io/File;Ljava/io/File;Ljava/lang/String;)V

    invoke-direct {p1, v0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 304
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    return-void

    :catch_0
    move-exception p1

    .line 117
    invoke-virtual {p1}, Ljava/io/IOException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    return-void

    :catch_1
    move-exception p1

    .line 112
    invoke-virtual {p1}, Ljava/security/spec/InvalidKeySpecException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    return-void

    :catch_2
    move-exception p1

    .line 107
    invoke-virtual {p1}, Ljava/security/NoSuchAlgorithmException;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/etralab/appstoreforandroid/InstallApkActivity;->fail(Ljava/lang/Object;)V

    return-void
.end method

.method protected onDestroy()V
    .locals 1

    .line 311
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 314
    :try_start_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/InstallApkActivity;->adb:Lcom/etralab/appstoreforandroid/AdbConnection;

    if-eqz v0, :cond_0

    .line 315
    invoke-virtual {v0}, Lcom/etralab/appstoreforandroid/AdbConnection;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method regular(Ljava/lang/String;)Ljava/lang/String;
    .locals 3

    if-nez p1, :cond_0

    return-object p1

    :cond_0
    const-string v0, "^@"

    .line 379
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 p1, 0x0

    return-object p1

    .line 384
    :cond_1
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const-string v2, ""

    if-eqz v1, :cond_2

    .line 386
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_2
    const-string v0, "\n"

    .line 389
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 391
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_3
    const-string v0, "$"

    .line 394
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_4

    const-string v0, "^.*?\\$"

    .line 396
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_4
    const-string v0, " "

    .line 399
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_5

    const-string v0, "^ *"

    .line 401
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    :cond_5
    const-string v0, "<"

    .line 404
    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, " *<*"

    .line 406
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 407
    invoke-virtual {p1, v2, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object p1

    .line 411
    :cond_6
    invoke-virtual {p1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method
