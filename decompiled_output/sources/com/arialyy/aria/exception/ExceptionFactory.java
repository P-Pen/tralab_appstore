package com.arialyy.aria.exception;
/* loaded from: classes.dex */
public class ExceptionFactory {
    public static final int TYPE_FTP = 1;
    public static final int TYPE_GROUP = 5;
    public static final int TYPE_HTTP = 2;
    public static final int TYPE_M3U8 = 3;
    public static final int TYPE_SFTP = 4;

    public static AriaException getException(int i, String str, Exception exc) {
        if (i == 1) {
            return exc == null ? new AriaFTPException(str) : new AriaFTPException(str, exc);
        } else if (i == 2) {
            return exc == null ? new AriaHTTPException(str) : new AriaHTTPException(str, exc);
        } else if (i == 3) {
            return exc == null ? new AriaM3U8Exception(str) : new AriaM3U8Exception(str, exc);
        } else if (i == 4) {
            return exc == null ? new AriaSFTPException(str) : new AriaSFTPException(str, exc);
        } else if (i == 5) {
            return exc == null ? new AriaGroupException(str) : new AriaGroupException(str, exc);
        } else {
            return exc == null ? new AriaException(str) : new AriaException(str, exc);
        }
    }
}
