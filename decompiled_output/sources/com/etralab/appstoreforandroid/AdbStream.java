package com.etralab.appstoreforandroid;

import java.io.Closeable;
import java.io.IOException;
import java.util.Queue;
import java.util.concurrent.ConcurrentLinkedQueue;
import java.util.concurrent.atomic.AtomicBoolean;
/* loaded from: classes.dex */
public class AdbStream implements Closeable {
    private AdbConnection adbConn;
    private int localId;
    private int remoteId;
    private Queue<byte[]> readQueue = new ConcurrentLinkedQueue();
    private AtomicBoolean writeReady = new AtomicBoolean(false);
    private boolean isClosed = false;

    public AdbStream(AdbConnection adbConnection, int i) {
        this.adbConn = adbConnection;
        this.localId = i;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void addPayload(byte[] bArr) {
        synchronized (this.readQueue) {
            this.readQueue.add(bArr);
            this.readQueue.notifyAll();
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void sendReady() throws IOException {
        this.adbConn.outputStream.write(AdbProtocol.generateReady(this.localId, this.remoteId));
        this.adbConn.outputStream.flush();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void updateRemoteId(int i) {
        this.remoteId = i;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void readyForWrite() {
        this.writeReady.set(true);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void notifyClose() {
        this.isClosed = true;
        synchronized (this) {
            notifyAll();
        }
        synchronized (this.readQueue) {
            this.readQueue.notifyAll();
        }
    }

    public byte[] read() throws InterruptedException, IOException {
        byte[] bArr;
        synchronized (this.readQueue) {
            bArr = null;
            while (!this.isClosed && (bArr = this.readQueue.poll()) == null) {
                this.readQueue.wait();
            }
            if (this.isClosed) {
                throw new IOException("Stream closed");
            }
        }
        return bArr;
    }

    public void write(String str) throws IOException, InterruptedException {
        write(str.getBytes("UTF-8"), false);
        write(new byte[]{0}, true);
    }

    public void write(byte[] bArr) throws IOException, InterruptedException {
        write(bArr, true);
    }

    public void write(byte[] bArr, boolean z) throws IOException, InterruptedException {
        synchronized (this) {
            while (!this.isClosed && !this.writeReady.compareAndSet(true, false)) {
                wait();
            }
            if (this.isClosed) {
                throw new IOException("Stream closed");
            }
        }
        this.adbConn.outputStream.write(AdbProtocol.generateWrite(this.localId, this.remoteId, bArr));
        if (z) {
            this.adbConn.outputStream.flush();
        }
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        synchronized (this) {
            if (this.isClosed) {
                return;
            }
            notifyClose();
            this.adbConn.outputStream.write(AdbProtocol.generateClose(this.localId, this.remoteId));
            this.adbConn.outputStream.flush();
        }
    }

    public boolean isClosed() {
        return this.isClosed;
    }
}
