package com.etralab.appstoreforandroid;

import java.text.SimpleDateFormat;
/* loaded from: classes.dex */
public class TimeNow {
    public static String getTimeNow() {
        return new SimpleDateFormat("HH:mm:ss.SSS").format(Long.valueOf(System.currentTimeMillis()));
    }
}
