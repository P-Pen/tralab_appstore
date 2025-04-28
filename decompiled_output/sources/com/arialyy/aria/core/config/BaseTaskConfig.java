package com.arialyy.aria.core.config;

import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import java.io.Serializable;
/* loaded from: classes.dex */
public abstract class BaseTaskConfig extends BaseConfig implements Serializable {
    String caName;
    String caPath;
    protected String TAG = CommonUtil.getClassName((Class) getClass());
    int buffSize = 8192;
    long updateInterval = 1000;
    public int oldMaxTaskNum = 2;
    int maxTaskNum = 2;
    int reTryNum = 10;
    int reTryInterval = 2000;
    int connectTimeOut = 5000;
    boolean isConvertSpeed = false;
    String queueMod = "wait";
    int iOTimeOut = 20000;
    int maxSpeed = 0;

    public String getCaPath() {
        return this.caPath;
    }

    public BaseConfig setCaPath(String str) {
        this.caPath = str;
        save();
        return this;
    }

    public String getCaName() {
        return this.caName;
    }

    public BaseConfig setCaName(String str) {
        this.caName = str;
        save();
        return this;
    }

    public BaseTaskConfig setMaxTaskNum(int i) {
        this.oldMaxTaskNum = this.maxTaskNum;
        this.maxTaskNum = i;
        save();
        return this;
    }

    public int getMaxSpeed() {
        return this.maxSpeed;
    }

    public BaseTaskConfig setMaxSpeed(int i) {
        this.maxSpeed = i;
        save();
        return this;
    }

    public long getUpdateInterval() {
        return this.updateInterval;
    }

    public BaseTaskConfig setUpdateInterval(long j) {
        if (j <= 0) {
            ALog.w("Configuration", "进度更新间隔不能小于0");
            return this;
        }
        this.updateInterval = j;
        save();
        return this;
    }

    public String getQueueMod() {
        return this.queueMod;
    }

    public BaseTaskConfig setQueueMod(String str) {
        this.queueMod = str;
        save();
        return this;
    }

    public int getMaxTaskNum() {
        return this.maxTaskNum;
    }

    public int getReTryNum() {
        return this.reTryNum;
    }

    public BaseTaskConfig setReTryNum(int i) {
        this.reTryNum = i;
        save();
        return this;
    }

    public int getReTryInterval() {
        return this.reTryInterval;
    }

    public BaseTaskConfig setReTryInterval(int i) {
        this.reTryInterval = i;
        save();
        return this;
    }

    public boolean isConvertSpeed() {
        return this.isConvertSpeed;
    }

    public BaseTaskConfig setConvertSpeed(boolean z) {
        this.isConvertSpeed = z;
        save();
        return this;
    }

    public int getConnectTimeOut() {
        return this.connectTimeOut;
    }

    public BaseTaskConfig setConnectTimeOut(int i) {
        this.connectTimeOut = i;
        save();
        return this;
    }

    public int getIOTimeOut() {
        return this.iOTimeOut;
    }

    public BaseTaskConfig setIOTimeOut(int i) {
        this.iOTimeOut = i;
        save();
        return this;
    }

    public int getBuffSize() {
        return this.buffSize;
    }

    public BaseTaskConfig setBuffSize(int i) {
        this.buffSize = i;
        save();
        return this;
    }
}
