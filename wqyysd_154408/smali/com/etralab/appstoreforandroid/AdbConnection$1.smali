.class Lcom/etralab/appstoreforandroid/AdbConnection$1;
.super Ljava/lang/Object;
.source "AdbConnection.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/etralab/appstoreforandroid/AdbConnection;->createConnectionThread()Ljava/lang/Thread;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/etralab/appstoreforandroid/AdbConnection;

.field final synthetic val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;


# direct methods
.method constructor <init>(Lcom/etralab/appstoreforandroid/AdbConnection;Lcom/etralab/appstoreforandroid/AdbConnection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 119
    iput-object p1, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->this$0:Lcom/etralab/appstoreforandroid/AdbConnection;

    iput-object p2, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .line 122
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->this$0:Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AdbConnection;->access$000(Lcom/etralab/appstoreforandroid/AdbConnection;)Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_8

    .line 126
    :try_start_0
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->this$0:Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AdbConnection;->access$100(Lcom/etralab/appstoreforandroid/AdbConnection;)Ljava/io/InputStream;

    move-result-object v0

    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;->parseAdbMessage(Ljava/io/InputStream;)Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;

    move-result-object v0

    .line 129
    invoke-static {v0}, Lcom/etralab/appstoreforandroid/AdbProtocol;->validateMessage(Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;)Z

    move-result v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 132
    :cond_1
    iget v1, v0, Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;->command:I

    const/4 v2, 0x1

    sparse-switch v1, :sswitch_data_0

    goto :goto_0

    .line 205
    :sswitch_0
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 207
    :try_start_1
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    iget v0, v0, Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;->arg1:I

    invoke-static {v3, v0}, Lcom/etralab/appstoreforandroid/AdbConnection;->access$602(Lcom/etralab/appstoreforandroid/AdbConnection;I)I

    .line 210
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-static {v0, v2}, Lcom/etralab/appstoreforandroid/AdbConnection;->access$202(Lcom/etralab/appstoreforandroid/AdbConnection;Z)Z

    .line 211
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 212
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0

    .line 181
    :sswitch_1
    iget v1, v0, Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;->arg0:I

    if-ne v1, v2, :cond_0

    .line 184
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/AdbConnection;->access$400(Lcom/etralab/appstoreforandroid/AdbConnection;)Z

    move-result v1

    if-eqz v1, :cond_2

    const/4 v0, 0x3

    .line 187
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    .line 188
    invoke-static {v1}, Lcom/etralab/appstoreforandroid/AdbConnection;->access$500(Lcom/etralab/appstoreforandroid/AdbConnection;)Lcom/etralab/appstoreforandroid/AdbCrypto;

    move-result-object v1

    invoke-virtual {v1}, Lcom/etralab/appstoreforandroid/AdbCrypto;->getAdbPublicKeyPayload()[B

    move-result-object v1

    .line 187
    invoke-static {v0, v1}, Lcom/etralab/appstoreforandroid/AdbProtocol;->generateAuth(I[B)[B

    move-result-object v0

    goto :goto_1

    :cond_2
    const/4 v1, 0x2

    .line 193
    iget-object v3, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    .line 194
    invoke-static {v3}, Lcom/etralab/appstoreforandroid/AdbConnection;->access$500(Lcom/etralab/appstoreforandroid/AdbConnection;)Lcom/etralab/appstoreforandroid/AdbCrypto;

    move-result-object v3

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;->payload:[B

    invoke-virtual {v3, v0}, Lcom/etralab/appstoreforandroid/AdbCrypto;->signAdbTokenPayload([B)[B

    move-result-object v0

    .line 193
    invoke-static {v1, v0}, Lcom/etralab/appstoreforandroid/AdbProtocol;->generateAuth(I[B)[B

    move-result-object v0

    .line 195
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-static {v1, v2}, Lcom/etralab/appstoreforandroid/AdbConnection;->access$402(Lcom/etralab/appstoreforandroid/AdbConnection;Z)Z

    .line 199
    :goto_1
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    iget-object v1, v1, Lcom/etralab/appstoreforandroid/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v1, v0}, Ljava/io/OutputStream;->write([B)V

    .line 200
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AdbConnection;->outputStream:Ljava/io/OutputStream;

    invoke-virtual {v0}, Ljava/io/OutputStream;->flush()V

    goto :goto_0

    .line 139
    :sswitch_2
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/AdbConnection;->access$200(Lcom/etralab/appstoreforandroid/AdbConnection;)Z

    move-result v1

    if-nez v1, :cond_3

    goto/16 :goto_0

    .line 143
    :cond_3
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->this$0:Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/AdbConnection;->access$300(Lcom/etralab/appstoreforandroid/AdbConnection;)Ljava/util/HashMap;

    move-result-object v1

    iget v2, v0, Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;->arg1:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/etralab/appstoreforandroid/AdbStream;

    if-nez v1, :cond_4

    goto/16 :goto_0

    .line 147
    :cond_4
    monitor-enter v1
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 148
    :try_start_3
    iget v2, v0, Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;->command:I

    const v3, 0x59414b4f

    if-ne v2, v3, :cond_5

    .line 151
    iget v0, v0, Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;->arg0:I

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/AdbStream;->updateRemoteId(I)V

    .line 152
    invoke-virtual {v1}, Lcom/etralab/appstoreforandroid/AdbStream;->readyForWrite()V

    .line 155
    invoke-virtual {v1}, Ljava/lang/Object;->notify()V

    goto :goto_2

    .line 157
    :cond_5
    iget v2, v0, Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;->command:I

    const v3, 0x45545257

    if-ne v2, v3, :cond_6

    .line 160
    iget-object v0, v0, Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;->payload:[B

    invoke-virtual {v1, v0}, Lcom/etralab/appstoreforandroid/AdbStream;->addPayload([B)V

    .line 163
    invoke-virtual {v1}, Lcom/etralab/appstoreforandroid/AdbStream;->sendReady()V

    goto :goto_2

    .line 165
    :cond_6
    iget v2, v0, Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;->command:I

    const v3, 0x45534c43

    if-ne v2, v3, :cond_7

    .line 168
    iget-object v2, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-static {v2}, Lcom/etralab/appstoreforandroid/AdbConnection;->access$300(Lcom/etralab/appstoreforandroid/AdbConnection;)Ljava/util/HashMap;

    move-result-object v2

    iget v0, v0, Lcom/etralab/appstoreforandroid/AdbProtocol$AdbMessage;->arg1:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    invoke-virtual {v1}, Lcom/etralab/appstoreforandroid/AdbStream;->notifyClose()V

    .line 173
    :cond_7
    :goto_2
    monitor-exit v1

    goto/16 :goto_0

    :catchall_1
    move-exception v0

    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :try_start_4
    throw v0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 227
    :catch_0
    :cond_8
    iget-object v0, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    monitor-enter v0

    .line 228
    :try_start_5
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->this$0:Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-static {v1}, Lcom/etralab/appstoreforandroid/AdbConnection;->access$700(Lcom/etralab/appstoreforandroid/AdbConnection;)V

    .line 229
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 230
    iget-object v1, p0, Lcom/etralab/appstoreforandroid/AdbConnection$1;->val$conn:Lcom/etralab/appstoreforandroid/AdbConnection;

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/etralab/appstoreforandroid/AdbConnection;->access$802(Lcom/etralab/appstoreforandroid/AdbConnection;Z)Z

    .line 231
    monitor-exit v0

    return-void

    :catchall_2
    move-exception v1

    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    throw v1

    nop

    :sswitch_data_0
    .sparse-switch
        0x45534c43 -> :sswitch_2
        0x45545257 -> :sswitch_2
        0x48545541 -> :sswitch_1
        0x4e584e43 -> :sswitch_0
        0x59414b4f -> :sswitch_2
    .end sparse-switch
.end method
