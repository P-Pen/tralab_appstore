package com.bumptech.glide.load.resource.bitmap;

import android.graphics.Bitmap;
import com.bumptech.glide.load.EncodeStrategy;
import com.bumptech.glide.load.Option;
import com.bumptech.glide.load.Options;
import com.bumptech.glide.load.ResourceEncoder;
import com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool;
/* loaded from: classes.dex */
public class BitmapEncoder implements ResourceEncoder<Bitmap> {
    private static final String TAG = "BitmapEncoder";
    private final ArrayPool arrayPool;
    public static final Option<Integer> COMPRESSION_QUALITY = Option.memory("com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionQuality", 90);
    public static final Option<Bitmap.CompressFormat> COMPRESSION_FORMAT = Option.memory("com.bumptech.glide.load.resource.bitmap.BitmapEncoder.CompressionFormat");

    public BitmapEncoder(ArrayPool arrayPool) {
        this.arrayPool = arrayPool;
    }

    @Deprecated
    public BitmapEncoder() {
        this.arrayPool = null;
    }

    /* JADX WARN: Code restructure failed: missing block: B:26:0x007d, code lost:
        if (r6 != null) goto L14;
     */
    @Override // com.bumptech.glide.load.Encoder
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean encode(com.bumptech.glide.load.engine.Resource<android.graphics.Bitmap> r9, java.io.File r10, com.bumptech.glide.load.Options r11) {
        /*
            r8 = this;
            java.lang.String r0 = "BitmapEncoder"
            java.lang.Object r9 = r9.get()
            android.graphics.Bitmap r9 = (android.graphics.Bitmap) r9
            android.graphics.Bitmap$CompressFormat r1 = r8.getFormat(r9, r11)
            java.lang.StringBuilder r2 = new java.lang.StringBuilder
            r2.<init>()
            java.lang.String r3 = "encode: ["
            r2.append(r3)
            int r3 = r9.getWidth()
            r2.append(r3)
            java.lang.String r3 = "x"
            r2.append(r3)
            int r3 = r9.getHeight()
            r2.append(r3)
            java.lang.String r3 = "] "
            r2.append(r3)
            r2.append(r1)
            java.lang.String r2 = r2.toString()
            androidx.core.os.TraceCompat.beginSection(r2)
            long r2 = com.bumptech.glide.util.LogTime.getLogTime()     // Catch: java.lang.Throwable -> Ld7
            com.bumptech.glide.load.Option<java.lang.Integer> r4 = com.bumptech.glide.load.resource.bitmap.BitmapEncoder.COMPRESSION_QUALITY     // Catch: java.lang.Throwable -> Ld7
            java.lang.Object r4 = r11.get(r4)     // Catch: java.lang.Throwable -> Ld7
            java.lang.Integer r4 = (java.lang.Integer) r4     // Catch: java.lang.Throwable -> Ld7
            int r4 = r4.intValue()     // Catch: java.lang.Throwable -> Ld7
            r5 = 0
            r6 = 0
            java.io.FileOutputStream r7 = new java.io.FileOutputStream     // Catch: java.lang.Throwable -> L6e java.io.IOException -> L70
            r7.<init>(r10)     // Catch: java.lang.Throwable -> L6e java.io.IOException -> L70
            com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool r10 = r8.arrayPool     // Catch: java.lang.Throwable -> L68 java.io.IOException -> L6b
            if (r10 == 0) goto L5c
            com.bumptech.glide.load.data.BufferedOutputStream r10 = new com.bumptech.glide.load.data.BufferedOutputStream     // Catch: java.lang.Throwable -> L68 java.io.IOException -> L6b
            com.bumptech.glide.load.engine.bitmap_recycle.ArrayPool r6 = r8.arrayPool     // Catch: java.lang.Throwable -> L68 java.io.IOException -> L6b
            r10.<init>(r7, r6)     // Catch: java.lang.Throwable -> L68 java.io.IOException -> L6b
            r6 = r10
            goto L5d
        L5c:
            r6 = r7
        L5d:
            r9.compress(r1, r4, r6)     // Catch: java.lang.Throwable -> L6e java.io.IOException -> L70
            r6.close()     // Catch: java.lang.Throwable -> L6e java.io.IOException -> L70
            r5 = 1
        L64:
            r6.close()     // Catch: java.io.IOException -> L80 java.lang.Throwable -> Ld7
            goto L80
        L68:
            r9 = move-exception
            r6 = r7
            goto Ld1
        L6b:
            r10 = move-exception
            r6 = r7
            goto L71
        L6e:
            r9 = move-exception
            goto Ld1
        L70:
            r10 = move-exception
        L71:
            r4 = 3
            boolean r4 = android.util.Log.isLoggable(r0, r4)     // Catch: java.lang.Throwable -> L6e
            if (r4 == 0) goto L7d
            java.lang.String r4 = "Failed to encode Bitmap"
            android.util.Log.d(r0, r4, r10)     // Catch: java.lang.Throwable -> L6e
        L7d:
            if (r6 == 0) goto L80
            goto L64
        L80:
            r10 = 2
            boolean r10 = android.util.Log.isLoggable(r0, r10)     // Catch: java.lang.Throwable -> Ld7
            if (r10 == 0) goto Lcd
            java.lang.StringBuilder r10 = new java.lang.StringBuilder     // Catch: java.lang.Throwable -> Ld7
            r10.<init>()     // Catch: java.lang.Throwable -> Ld7
            java.lang.String r4 = "Compressed with type: "
            r10.append(r4)     // Catch: java.lang.Throwable -> Ld7
            r10.append(r1)     // Catch: java.lang.Throwable -> Ld7
            java.lang.String r1 = " of size "
            r10.append(r1)     // Catch: java.lang.Throwable -> Ld7
            int r1 = com.bumptech.glide.util.Util.getBitmapByteSize(r9)     // Catch: java.lang.Throwable -> Ld7
            r10.append(r1)     // Catch: java.lang.Throwable -> Ld7
            java.lang.String r1 = " in "
            r10.append(r1)     // Catch: java.lang.Throwable -> Ld7
            double r1 = com.bumptech.glide.util.LogTime.getElapsedMillis(r2)     // Catch: java.lang.Throwable -> Ld7
            r10.append(r1)     // Catch: java.lang.Throwable -> Ld7
            java.lang.String r1 = ", options format: "
            r10.append(r1)     // Catch: java.lang.Throwable -> Ld7
            com.bumptech.glide.load.Option<android.graphics.Bitmap$CompressFormat> r1 = com.bumptech.glide.load.resource.bitmap.BitmapEncoder.COMPRESSION_FORMAT     // Catch: java.lang.Throwable -> Ld7
            java.lang.Object r11 = r11.get(r1)     // Catch: java.lang.Throwable -> Ld7
            r10.append(r11)     // Catch: java.lang.Throwable -> Ld7
            java.lang.String r11 = ", hasAlpha: "
            r10.append(r11)     // Catch: java.lang.Throwable -> Ld7
            boolean r9 = r9.hasAlpha()     // Catch: java.lang.Throwable -> Ld7
            r10.append(r9)     // Catch: java.lang.Throwable -> Ld7
            java.lang.String r9 = r10.toString()     // Catch: java.lang.Throwable -> Ld7
            android.util.Log.v(r0, r9)     // Catch: java.lang.Throwable -> Ld7
        Lcd:
            androidx.core.os.TraceCompat.endSection()
            return r5
        Ld1:
            if (r6 == 0) goto Ld6
            r6.close()     // Catch: java.io.IOException -> Ld6 java.lang.Throwable -> Ld7
        Ld6:
            throw r9     // Catch: java.lang.Throwable -> Ld7
        Ld7:
            r9 = move-exception
            androidx.core.os.TraceCompat.endSection()
            throw r9
        */
        throw new UnsupportedOperationException("Method not decompiled: com.bumptech.glide.load.resource.bitmap.BitmapEncoder.encode(com.bumptech.glide.load.engine.Resource, java.io.File, com.bumptech.glide.load.Options):boolean");
    }

    private Bitmap.CompressFormat getFormat(Bitmap bitmap, Options options) {
        Bitmap.CompressFormat compressFormat = (Bitmap.CompressFormat) options.get(COMPRESSION_FORMAT);
        if (compressFormat != null) {
            return compressFormat;
        }
        if (bitmap.hasAlpha()) {
            return Bitmap.CompressFormat.PNG;
        }
        return Bitmap.CompressFormat.JPEG;
    }

    @Override // com.bumptech.glide.load.ResourceEncoder
    public EncodeStrategy getEncodeStrategy(Options options) {
        return EncodeStrategy.TRANSFORMED;
    }
}
