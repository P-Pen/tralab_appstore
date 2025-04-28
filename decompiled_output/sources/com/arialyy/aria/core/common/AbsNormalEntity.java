package com.arialyy.aria.core.common;

import android.os.Parcel;
import android.os.Parcelable;
import com.arialyy.aria.orm.annotation.Default;
/* loaded from: classes.dex */
public abstract class AbsNormalEntity extends AbsEntity implements Parcelable {
    private String fileName;
    @Default("false")
    private boolean isGroupChild;
    @Default("false")
    private boolean isRedirect;
    private String redirectUrl;
    private int taskType;
    private String url;

    @Override // com.arialyy.aria.core.common.AbsEntity, android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public abstract String getFilePath();

    public void setTaskType(int i) {
        this.taskType = i;
    }

    public String getUrl() {
        return this.url;
    }

    public void setUrl(String str) {
        this.url = str;
    }

    public boolean isGroupChild() {
        return this.isGroupChild;
    }

    public void setGroupChild(boolean z) {
        this.isGroupChild = z;
    }

    public String getFileName() {
        return this.fileName;
    }

    public void setFileName(String str) {
        this.fileName = str;
    }

    public boolean isRedirect() {
        return this.isRedirect;
    }

    public void setRedirect(boolean z) {
        this.isRedirect = z;
    }

    public String getRedirectUrl() {
        return this.redirectUrl;
    }

    public void setRedirectUrl(String str) {
        this.redirectUrl = str;
    }

    public AbsNormalEntity() {
        this.isGroupChild = false;
        this.isRedirect = false;
    }

    @Override // com.arialyy.aria.core.common.AbsEntity, android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        super.writeToParcel(parcel, i);
        parcel.writeString(this.url);
        parcel.writeString(this.fileName);
        parcel.writeByte(this.isGroupChild ? (byte) 1 : (byte) 0);
        parcel.writeByte(this.isRedirect ? (byte) 1 : (byte) 0);
        parcel.writeString(this.redirectUrl);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbsNormalEntity(Parcel parcel) {
        super(parcel);
        this.isGroupChild = false;
        this.isRedirect = false;
        this.url = parcel.readString();
        this.fileName = parcel.readString();
        this.isGroupChild = parcel.readByte() != 0;
        this.isRedirect = parcel.readByte() != 0;
        this.redirectUrl = parcel.readString();
    }
}
