package com.arialyy.aria.core.config;

import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.AriaCrashHandler;
import java.io.Serializable;
/* loaded from: classes.dex */
public class AppConfig extends BaseConfig implements Serializable {
    int logLevel;
    boolean useAriaCrashHandler;
    boolean netCheck = true;
    boolean useBroadcast = false;
    boolean notNetRetry = false;

    @Override // com.arialyy.aria.core.config.BaseConfig
    int getType() {
        return 3;
    }

    public boolean isNotNetRetry() {
        return this.notNetRetry;
    }

    public AppConfig setNotNetRetry(boolean z) {
        this.notNetRetry = z;
        save();
        return this;
    }

    public boolean isUseBroadcast() {
        return this.useBroadcast;
    }

    public AppConfig setUseBroadcast(boolean z) {
        this.useBroadcast = z;
        save();
        return this;
    }

    public boolean isNetCheck() {
        return this.netCheck;
    }

    public AppConfig setNetCheck(boolean z) {
        this.netCheck = z;
        save();
        return this;
    }

    public AppConfig setLogLevel(int i) {
        this.logLevel = i;
        ALog.LOG_LEVEL = i;
        save();
        return this;
    }

    public int getLogLevel() {
        return this.logLevel;
    }

    public boolean getUseAriaCrashHandler() {
        return this.useAriaCrashHandler;
    }

    public AppConfig setUseAriaCrashHandler(boolean z) {
        this.useAriaCrashHandler = z;
        if (z) {
            Thread.setDefaultUncaughtExceptionHandler(new AriaCrashHandler());
        } else {
            Thread.setDefaultUncaughtExceptionHandler(null);
        }
        save();
        return this;
    }
}
