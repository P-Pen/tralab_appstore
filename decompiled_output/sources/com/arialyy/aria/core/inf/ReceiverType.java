package com.arialyy.aria.core.inf;
/* loaded from: classes.dex */
public enum ReceiverType {
    DOWNLOAD(1, "download"),
    UPLOAD(2, "upload");
    
    String name;
    int type;

    ReceiverType(int i, String str) {
        this.type = i;
        this.name = str;
    }
}
