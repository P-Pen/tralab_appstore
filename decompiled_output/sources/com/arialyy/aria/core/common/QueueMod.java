package com.arialyy.aria.core.common;
/* loaded from: classes.dex */
public enum QueueMod {
    WAIT("wait"),
    NOW("now");
    
    public String tag;

    public String getTag() {
        return this.tag;
    }

    QueueMod(String str) {
        this.tag = str;
    }
}
