package com.arialyy.aria.util;

import android.support.v4.media.session.PlaybackStateCompat;
/* loaded from: classes.dex */
public class BandwidthLimiter {
    private static Long CHUNK_LENGTH = null;
    private static Long KB = null;
    public static int maxBandWith = 2048;
    private int bytesWillBeSentOrReceive = 0;
    private long lastPieceSentOrReceiveTick = System.nanoTime();
    private int maxRate = 1024;
    private long timeCostPerChunk = (CHUNK_LENGTH.longValue() * 1000000000) / (this.maxRate * KB.longValue());

    static {
        Long valueOf = Long.valueOf((long) PlaybackStateCompat.ACTION_PLAY_FROM_MEDIA_ID);
        KB = valueOf;
        CHUNK_LENGTH = valueOf;
    }

    public BandwidthLimiter(int i, int i2) {
        setMaxRate(i2 > 1 ? i / i2 : i);
    }

    public synchronized void setMaxRate(int i) throws IllegalArgumentException {
        if (i < 0) {
            throw new IllegalArgumentException("maxRate can not less than 0");
        }
        this.maxRate = i;
        if (i == 0) {
            this.timeCostPerChunk = 0L;
        } else {
            this.timeCostPerChunk = (CHUNK_LENGTH.longValue() * 1000000000) / (this.maxRate * KB.longValue());
        }
    }

    public synchronized void limitNextBytes() {
        limitNextBytes(1);
    }

    public synchronized void limitNextBytes(int i) {
        this.bytesWillBeSentOrReceive += i;
        while (!Thread.currentThread().isInterrupted() && this.bytesWillBeSentOrReceive > CHUNK_LENGTH.longValue()) {
            long nanoTime = System.nanoTime();
            long j = this.timeCostPerChunk - (nanoTime - this.lastPieceSentOrReceiveTick);
            int i2 = (j > 0L ? 1 : (j == 0L ? 0 : -1));
            if (i2 > 0) {
                try {
                    Thread.currentThread();
                    Thread.sleep(j / 1000000, (int) (j % 1000000));
                } catch (InterruptedException e) {
                    e.printStackTrace();
                }
            }
            this.bytesWillBeSentOrReceive = (int) (this.bytesWillBeSentOrReceive - CHUNK_LENGTH.longValue());
            if (i2 <= 0) {
                j = 0;
            }
            this.lastPieceSentOrReceiveTick = nanoTime + j;
        }
    }
}
