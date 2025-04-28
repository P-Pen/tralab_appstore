package com.arialyy.aria.core.common;

import android.os.Parcel;
import android.os.Parcelable;
import com.arialyy.aria.core.inf.IEntity;
import com.arialyy.aria.orm.DbEntity;
import com.arialyy.aria.orm.annotation.Default;
import com.arialyy.aria.orm.annotation.Ignore;
import java.io.Serializable;
/* loaded from: classes.dex */
public abstract class AbsEntity extends DbEntity implements IEntity, Parcelable, Serializable {
    private long completeTime;
    private String convertFileSize;
    @Ignore
    private String convertSpeed;
    private long currentProgress;
    @Ignore
    private int failNum;
    private long fileSize;
    @Default("false")
    private boolean isComplete;
    @Ignore
    private int netCode;
    private int percent;
    @Ignore
    private long speed;
    @Default("3")
    private int state;
    private long stopTime;
    private String str;
    @Ignore
    private int timeLeft;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public abstract String getKey();

    public abstract int getTaskType();

    public int getNetCode() {
        return this.netCode;
    }

    public void setNetCode(int i) {
        this.netCode = i;
    }

    public int getTimeLeft() {
        return this.timeLeft;
    }

    public void setTimeLeft(int i) {
        this.timeLeft = i;
    }

    public boolean isComplete() {
        return this.isComplete;
    }

    public void setComplete(boolean z) {
        this.isComplete = z;
    }

    public String getConvertFileSize() {
        return this.convertFileSize;
    }

    public void setConvertFileSize(String str) {
        this.convertFileSize = str;
    }

    public int getFailNum() {
        return this.failNum;
    }

    public void setFailNum(int i) {
        this.failNum = i;
    }

    public long getSpeed() {
        return this.speed;
    }

    public void setSpeed(long j) {
        this.speed = j;
    }

    public String getConvertSpeed() {
        return this.convertSpeed;
    }

    public void setConvertSpeed(String str) {
        this.convertSpeed = str;
    }

    public String getStr() {
        return this.str;
    }

    public void setStr(String str) {
        this.str = str;
    }

    public long getFileSize() {
        return this.fileSize;
    }

    public void setFileSize(long j) {
        this.fileSize = j;
    }

    public int getState() {
        return this.state;
    }

    public void setState(int i) {
        this.state = i;
    }

    public long getCurrentProgress() {
        return this.currentProgress;
    }

    public void setCurrentProgress(long j) {
        this.currentProgress = j;
    }

    public long getCompleteTime() {
        return this.completeTime;
    }

    public void setCompleteTime(long j) {
        this.completeTime = j;
    }

    public int getPercent() {
        return this.percent;
    }

    public void setPercent(int i) {
        this.percent = i;
    }

    public long getStopTime() {
        return this.stopTime;
    }

    public void setStopTime(long j) {
        this.stopTime = j;
    }

    public long getId() {
        return getRowID();
    }

    public AbsEntity() {
        this.speed = 0L;
        this.failNum = 0;
        this.timeLeft = Integer.MAX_VALUE;
        this.fileSize = 0L;
        this.state = 3;
        this.currentProgress = 0L;
        this.isComplete = false;
        this.stopTime = 0L;
        this.netCode = 200;
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeLong(this.speed);
        parcel.writeString(this.convertSpeed);
        parcel.writeInt(this.failNum);
        parcel.writeString(this.str);
        parcel.writeLong(this.fileSize);
        parcel.writeString(this.convertFileSize);
        parcel.writeInt(this.state);
        parcel.writeLong(this.currentProgress);
        parcel.writeLong(this.completeTime);
        parcel.writeInt(this.percent);
        parcel.writeByte(this.isComplete ? (byte) 1 : (byte) 0);
        parcel.writeLong(this.stopTime);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbsEntity(Parcel parcel) {
        this.speed = 0L;
        this.failNum = 0;
        this.timeLeft = Integer.MAX_VALUE;
        this.fileSize = 0L;
        this.state = 3;
        this.currentProgress = 0L;
        this.isComplete = false;
        this.stopTime = 0L;
        this.netCode = 200;
        this.speed = parcel.readLong();
        this.convertSpeed = parcel.readString();
        this.failNum = parcel.readInt();
        this.str = parcel.readString();
        this.fileSize = parcel.readLong();
        this.convertFileSize = parcel.readString();
        this.state = parcel.readInt();
        this.currentProgress = parcel.readLong();
        this.completeTime = parcel.readLong();
        this.percent = parcel.readInt();
        this.isComplete = parcel.readByte() != 0;
        this.stopTime = parcel.readLong();
    }
}
