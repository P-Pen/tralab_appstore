package com.etralab.appstoreforandroid;

import com.etralab.appstoreforandroid.AdbProtocol;
import java.io.Closeable;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.ConnectException;
import java.net.Socket;
import java.util.HashMap;
/* loaded from: classes.dex */
public class AdbConnection implements Closeable {
    private boolean connectAttempted;
    private boolean connected;
    private AdbCrypto crypto;
    private InputStream inputStream;
    private int maxData;
    OutputStream outputStream;
    private boolean sentSignature;
    private Socket socket;
    private HashMap<Integer, AdbStream> openStreams = new HashMap<>();
    private int lastLocalId = 0;
    private Thread connectionThread = createConnectionThread();

    private AdbConnection() {
    }

    public static AdbConnection create(Socket socket, AdbCrypto adbCrypto) throws IOException {
        AdbConnection adbConnection = new AdbConnection();
        adbConnection.crypto = adbCrypto;
        adbConnection.socket = socket;
        adbConnection.inputStream = socket.getInputStream();
        adbConnection.outputStream = socket.getOutputStream();
        socket.setTcpNoDelay(true);
        return adbConnection;
    }

    private Thread createConnectionThread() {
        return new Thread(new Runnable() { // from class: com.etralab.appstoreforandroid.AdbConnection.1
            @Override // java.lang.Runnable
            public void run() {
                AdbStream adbStream;
                byte[] generateAuth;
                while (!AdbConnection.this.connectionThread.isInterrupted()) {
                    try {
                        AdbProtocol.AdbMessage parseAdbMessage = AdbProtocol.AdbMessage.parseAdbMessage(AdbConnection.this.inputStream);
                        if (AdbProtocol.validateMessage(parseAdbMessage)) {
                            switch (parseAdbMessage.command) {
                                case AdbProtocol.CMD_CLSE /* 1163086915 */:
                                case AdbProtocol.CMD_WRTE /* 1163154007 */:
                                case AdbProtocol.CMD_OKAY /* 1497451343 */:
                                    if (this.connected && (adbStream = (AdbStream) AdbConnection.this.openStreams.get(Integer.valueOf(parseAdbMessage.arg1))) != null) {
                                        synchronized (adbStream) {
                                            if (parseAdbMessage.command == 1497451343) {
                                                adbStream.updateRemoteId(parseAdbMessage.arg0);
                                                adbStream.readyForWrite();
                                                adbStream.notify();
                                            } else if (parseAdbMessage.command == 1163154007) {
                                                adbStream.addPayload(parseAdbMessage.payload);
                                                adbStream.sendReady();
                                            } else if (parseAdbMessage.command == 1163086915) {
                                                this.openStreams.remove(Integer.valueOf(parseAdbMessage.arg1));
                                                adbStream.notifyClose();
                                            }
                                        }
                                        continue;
                                    }
                                    break;
                                case AdbProtocol.CMD_AUTH /* 1213486401 */:
                                    if (parseAdbMessage.arg0 == 1) {
                                        if (this.sentSignature) {
                                            generateAuth = AdbProtocol.generateAuth(3, this.crypto.getAdbPublicKeyPayload());
                                        } else {
                                            generateAuth = AdbProtocol.generateAuth(2, this.crypto.signAdbTokenPayload(parseAdbMessage.payload));
                                            this.sentSignature = true;
                                        }
                                        this.outputStream.write(generateAuth);
                                        this.outputStream.flush();
                                        break;
                                    } else {
                                        continue;
                                    }
                                case AdbProtocol.CMD_CNXN /* 1314410051 */:
                                    synchronized (this) {
                                        this.maxData = parseAdbMessage.arg1;
                                        this.connected = true;
                                        this.notifyAll();
                                    }
                                    continue;
                                default:
                                    continue;
                            }
                        }
                    } catch (Exception unused) {
                    }
                }
                synchronized (this) {
                    AdbConnection.this.cleanupStreams();
                    this.notifyAll();
                    this.connectAttempted = false;
                }
            }
        });
    }

    public int getMaxData() throws InterruptedException, IOException {
        if (!this.connectAttempted) {
            throw new IllegalStateException("connect() must be called first");
        }
        synchronized (this) {
            if (!this.connected) {
                wait();
            }
            if (!this.connected) {
                throw new IOException("Connection failed");
            }
        }
        return this.maxData;
    }

    public void connect() throws IOException, InterruptedException {
        if (this.connected) {
            throw new IllegalStateException("Already connected");
        }
        this.outputStream.write(AdbProtocol.generateConnect());
        this.outputStream.flush();
        this.connectAttempted = true;
        this.connectionThread.start();
        synchronized (this) {
            if (!this.connected) {
                wait();
            }
            if (!this.connected) {
                throw new IOException("Connection failed");
            }
        }
    }

    public AdbStream open(String str) throws UnsupportedEncodingException, IOException, InterruptedException {
        int i = this.lastLocalId + 1;
        this.lastLocalId = i;
        if (!this.connectAttempted) {
            throw new IllegalStateException("connect() must be called first");
        }
        synchronized (this) {
            if (!this.connected) {
                wait();
            }
            if (!this.connected) {
                throw new IOException("Connection failed");
            }
        }
        AdbStream adbStream = new AdbStream(this, i);
        this.openStreams.put(Integer.valueOf(i), adbStream);
        this.outputStream.write(AdbProtocol.generateOpen(i, str));
        this.outputStream.flush();
        synchronized (adbStream) {
            adbStream.wait();
        }
        if (adbStream.isClosed()) {
            throw new ConnectException("Stream open actively rejected by remote peer");
        }
        return adbStream;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void cleanupStreams() {
        for (AdbStream adbStream : this.openStreams.values()) {
            try {
                adbStream.close();
            } catch (IOException unused) {
            }
        }
        this.openStreams.clear();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        if (this.connectionThread == null) {
            return;
        }
        this.socket.close();
        this.connectionThread.interrupt();
        try {
            this.connectionThread.join();
        } catch (InterruptedException unused) {
        }
    }
}
