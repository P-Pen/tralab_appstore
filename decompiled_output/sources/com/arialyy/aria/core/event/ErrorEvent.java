package com.arialyy.aria.core.event;
/* loaded from: classes.dex */
public class ErrorEvent {
    public String errorMsg;
    public long taskId;

    public ErrorEvent(long j, String str) {
        this.taskId = j;
        this.errorMsg = str;
    }
}
