package com.arialyy.aria.core.download.tcp;
/* loaded from: classes.dex */
public class TcpTaskConfig {
    private String heartbeat;
    private String params;
    private long heartbeatInterval = 1000;
    private String charset = "utf-8";

    public String getCharset() {
        return this.charset;
    }

    public void setCharset(String str) {
        this.charset = str;
    }

    public String getHeartbeat() {
        return this.heartbeat;
    }

    public void setHeartbeat(String str) {
        this.heartbeat = str;
    }

    public long getHeartbeatInterval() {
        return this.heartbeatInterval;
    }

    public void setHeartbeatInterval(long j) {
        this.heartbeatInterval = j;
    }

    public String getParams() {
        return this.params;
    }

    public void setParams(String str) {
        this.params = str;
    }
}
