package com.arialyy.aria.util;

import android.support.v4.media.session.PlaybackStateCompat;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.RandomAccessFile;
import java.util.Arrays;
import kotlin.UByte;
/* loaded from: classes.dex */
public final class BufferedRandomAccessFile extends RandomAccessFile {
    static final long BuffMask_ = -65536;
    public static final int BuffSz_ = 65536;
    static final int LogBuffSz_ = 16;
    private byte[] buff_;
    private boolean closed_;
    private long curr_;
    private boolean dirty_;
    private long diskPos_;
    private long hi_;
    private boolean hitEOF_;
    private long lo_;
    private long maxHi_;

    public BufferedRandomAccessFile(File file, String str) throws IOException {
        super(file, str);
        init(0);
    }

    public BufferedRandomAccessFile(File file, String str, int i) throws IOException {
        super(file, str);
        init(i);
    }

    public BufferedRandomAccessFile(String str, String str2) throws IOException {
        super(str, str2);
        init(0);
    }

    public BufferedRandomAccessFile(String str, String str2, int i) throws FileNotFoundException {
        super(str, str2);
        init(i);
    }

    private void init(int i) {
        this.closed_ = false;
        this.dirty_ = false;
        this.hi_ = 0L;
        this.curr_ = 0L;
        this.lo_ = 0L;
        this.buff_ = i > 65536 ? new byte[i] : new byte[65536];
        this.maxHi_ = PlaybackStateCompat.ACTION_PREPARE_FROM_SEARCH;
        this.hitEOF_ = false;
        this.diskPos_ = 0L;
    }

    @Override // java.io.RandomAccessFile, java.io.Closeable, java.lang.AutoCloseable
    public void close() throws IOException {
        flush();
        this.closed_ = true;
        super.close();
    }

    public void flush() throws IOException {
        flushBuffer();
    }

    private void flushBuffer() throws IOException {
        if (this.dirty_) {
            long j = this.diskPos_;
            long j2 = this.lo_;
            if (j != j2) {
                super.seek(j2);
            }
            super.write(this.buff_, 0, (int) (this.curr_ - this.lo_));
            this.diskPos_ = this.curr_;
            this.dirty_ = false;
        }
    }

    private int fillBuffer() throws IOException {
        int length = this.buff_.length;
        int i = 0;
        while (length > 0) {
            int read = super.read(this.buff_, i, length);
            if (read < 0) {
                break;
            }
            i += read;
            length -= read;
        }
        if (i < 0) {
            byte[] bArr = this.buff_;
            boolean z = i < bArr.length;
            this.hitEOF_ = z;
            if (z) {
                Arrays.fill(bArr, i, bArr.length, (byte) -1);
            }
        }
        this.diskPos_ += i;
        return i;
    }

    @Override // java.io.RandomAccessFile
    public void seek(long j) throws IOException {
        if (j >= this.hi_ || j < this.lo_) {
            flushBuffer();
            long j2 = BuffMask_ & j;
            this.lo_ = j2;
            this.maxHi_ = this.buff_.length + j2;
            if (this.diskPos_ != j2) {
                super.seek(j2);
                this.diskPos_ = this.lo_;
            }
            this.hi_ = this.lo_ + fillBuffer();
        } else if (j < this.curr_) {
            flushBuffer();
        }
        this.curr_ = j;
    }

    @Override // java.io.RandomAccessFile
    public long getFilePointer() {
        return this.curr_;
    }

    @Override // java.io.RandomAccessFile
    public long length() throws IOException {
        return Math.max(this.curr_, super.length());
    }

    @Override // java.io.RandomAccessFile
    public int read() throws IOException {
        long j = this.curr_;
        if (j >= this.hi_) {
            if (this.hitEOF_) {
                return -1;
            }
            seek(j);
            if (this.curr_ == this.hi_) {
                return -1;
            }
        }
        byte[] bArr = this.buff_;
        long j2 = this.curr_;
        byte b = bArr[(int) (j2 - this.lo_)];
        this.curr_ = j2 + 1;
        return b & UByte.MAX_VALUE;
    }

    @Override // java.io.RandomAccessFile
    public int read(byte[] bArr) throws IOException {
        return read(bArr, 0, bArr.length);
    }

    @Override // java.io.RandomAccessFile
    public int read(byte[] bArr, int i, int i2) throws IOException {
        long j = this.curr_;
        if (j >= this.hi_) {
            if (this.hitEOF_) {
                return -1;
            }
            seek(j);
            if (this.curr_ == this.hi_) {
                return -1;
            }
        }
        int min = Math.min(i2, (int) (this.hi_ - this.curr_));
        System.arraycopy(this.buff_, (int) (this.curr_ - this.lo_), bArr, i, min);
        this.curr_ += min;
        return min;
    }

    @Override // java.io.RandomAccessFile, java.io.DataOutput
    public void write(int i) throws IOException {
        long j = this.curr_;
        long j2 = this.hi_;
        if (j >= j2) {
            if (this.hitEOF_ && j2 < this.maxHi_) {
                this.hi_ = j2 + 1;
            } else {
                seek(j);
                long j3 = this.curr_;
                long j4 = this.hi_;
                if (j3 == j4) {
                    this.hi_ = j4 + 1;
                }
            }
        }
        byte[] bArr = this.buff_;
        long j5 = this.curr_;
        bArr[(int) (j5 - this.lo_)] = (byte) i;
        this.curr_ = j5 + 1;
        this.dirty_ = true;
    }

    @Override // java.io.RandomAccessFile, java.io.DataOutput
    public void write(byte[] bArr) throws IOException {
        write(bArr, 0, bArr.length);
    }

    @Override // java.io.RandomAccessFile, java.io.DataOutput
    public void write(byte[] bArr, int i, int i2) throws IOException {
        while (i2 > 0) {
            int writeAtMost = writeAtMost(bArr, i, i2);
            i += writeAtMost;
            i2 -= writeAtMost;
            this.dirty_ = true;
        }
    }

    private int writeAtMost(byte[] bArr, int i, int i2) throws IOException {
        long j = this.curr_;
        long j2 = this.hi_;
        if (j >= j2) {
            if (this.hitEOF_) {
                long j3 = this.maxHi_;
                if (j2 < j3) {
                    this.hi_ = j3;
                }
            }
            seek(j);
            if (this.curr_ == this.hi_) {
                this.hi_ = this.maxHi_;
            }
        }
        int min = Math.min(i2, (int) (this.hi_ - this.curr_));
        System.arraycopy(bArr, i, this.buff_, (int) (this.curr_ - this.lo_), min);
        this.curr_ += min;
        return min;
    }
}
