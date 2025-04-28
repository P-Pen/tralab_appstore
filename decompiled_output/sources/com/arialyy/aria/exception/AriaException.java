package com.arialyy.aria.exception;
/* loaded from: classes.dex */
public class AriaException extends Exception {
    public AriaException(String str) {
        super(str);
    }

    /* JADX WARN: Illegal instructions before constructor call */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public AriaException(java.lang.String r4, java.lang.Exception r5) {
        /*
            r3 = this;
            r0 = 2
            java.lang.Object[] r0 = new java.lang.Object[r0]
            java.lang.String r1 = ""
            if (r4 != 0) goto L8
            r4 = r1
        L8:
            r2 = 0
            r0[r2] = r4
            r4 = 1
            if (r5 != 0) goto Lf
            goto L13
        Lf:
            java.lang.String r1 = r5.getMessage()
        L13:
            r0[r4] = r1
            java.lang.String r4 = "%s\n%s"
            java.lang.String r4 = java.lang.String.format(r4, r0)
            r3.<init>(r4)
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.arialyy.aria.exception.AriaException.<init>(java.lang.String, java.lang.Exception):void");
    }
}
