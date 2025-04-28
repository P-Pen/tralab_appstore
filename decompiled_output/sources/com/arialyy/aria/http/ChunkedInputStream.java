package com.arialyy.aria.http;

import com.arialyy.aria.util.ALog;
import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
@Deprecated
/* loaded from: classes.dex */
public class ChunkedInputStream extends InputStream {
    private static final String TAG = "ChunkedInputStream";
    private DataInputStream din;
    private String id;
    private int unreadBytes = 0;
    private byte[] singleByte = new byte[1];
    private boolean endOfData = false;

    public ChunkedInputStream(InputStream inputStream, String str) {
        this.din = new DataInputStream(inputStream);
        this.id = str;
        ALog.d(TAG, String.format("Creating chunked input for %s", str));
    }

    @Override // java.io.InputStream, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        ALog.d(TAG, String.format("%s: Closing chunked input.", this.id));
        this.din.close();
    }

    @Override // java.io.InputStream
    public int read() throws IOException {
        if (read(this.singleByte, 0, 1) == -1) {
            return -1;
        }
        return this.singleByte[0];
    }

    @Override // java.io.InputStream
    public int read(byte[] bArr, int i, int i2) throws IOException {
        if (i2 < 0) {
            throw new IllegalArgumentException(this.id + ": Negative read length");
        } else if (i2 == 0) {
            return 0;
        } else {
            if (this.unreadBytes == 0) {
                try {
                    int readInt = this.din.readInt();
                    this.unreadBytes = readInt;
                    ALog.d(TAG, String.format("%s: Chunk size %s", this.id, Integer.valueOf(readInt)));
                    if (this.unreadBytes == 0) {
                        ALog.d(TAG, String.format("%s: Hit end of data", this.id));
                        this.endOfData = true;
                        return -1;
                    }
                } catch (IOException e) {
                    throw new IOException(this.id + ": Error while attempting to read chunk length", e);
                }
            }
            int min = Math.min(i2, this.unreadBytes);
            try {
                this.din.readFully(bArr, i, min);
                this.unreadBytes -= min;
                return 0 + min;
            } catch (IOException e2) {
                throw new IOException(this.id + ": Error while attempting to read " + min + " bytes from current chunk", e2);
            }
        }
    }

    public boolean isEndOfData() {
        return this.endOfData;
    }
}
