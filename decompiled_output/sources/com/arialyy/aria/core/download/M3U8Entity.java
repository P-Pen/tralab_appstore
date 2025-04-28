package com.arialyy.aria.core.download;

import android.os.Parcel;
import android.os.Parcelable;
import android.text.TextUtils;
import com.arialyy.aria.core.TaskRecord;
import com.arialyy.aria.core.ThreadRecord;
import com.arialyy.aria.orm.DbEntity;
import com.arialyy.aria.orm.annotation.Default;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.DbDataHelper;
import java.io.File;
import java.io.FilenameFilter;
import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class M3U8Entity extends DbEntity implements Parcelable {
    public static final Parcelable.Creator<M3U8Entity> CREATOR = new Parcelable.Creator<M3U8Entity>() { // from class: com.arialyy.aria.core.download.M3U8Entity.2
        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public M3U8Entity createFromParcel(Parcel parcel) {
            return new M3U8Entity(parcel);
        }

        /* JADX WARN: Can't rename method to resolve collision */
        @Override // android.os.Parcelable.Creator
        public M3U8Entity[] newArray(int i) {
            return new M3U8Entity[i];
        }
    };
    private String cacheDir;
    private String filePath;
    private boolean isLive;
    public String iv;
    public String keyFormat;
    @Default("1")
    public String keyFormatVersion = "1";
    public String keyPath;
    public String keyUrl;
    public String method;
    private int peerIndex;
    private int peerNum;

    @Override // android.os.Parcelable
    public int describeContents() {
        return 0;
    }

    public String getKeyFormat() {
        return this.keyFormat;
    }

    public void setKeyFormat(String str) {
        this.keyFormat = str;
    }

    public String getKeyFormatVersion() {
        return this.keyFormatVersion;
    }

    public void setKeyFormatVersion(String str) {
        this.keyFormatVersion = str;
    }

    public String getKeyPath() {
        return this.keyPath;
    }

    public void setKeyPath(String str) {
        this.keyPath = str;
    }

    public String getKeyUrl() {
        return this.keyUrl;
    }

    public void setKeyUrl(String str) {
        this.keyUrl = str;
    }

    public String getMethod() {
        return this.method;
    }

    public void setMethod(String str) {
        this.method = str;
    }

    public String getIv() {
        return this.iv;
    }

    public void setIv(String str) {
        this.iv = str;
    }

    public boolean isLive() {
        return this.isLive;
    }

    public List<PeerInfo> getCompletedPeer() {
        if (TextUtils.isEmpty(getCacheDir())) {
            ALog.w("M3U8Entity", "任务未下载，获取切片失败");
            return null;
        }
        ArrayList arrayList = new ArrayList();
        TaskRecord taskRecord = DbDataHelper.getTaskRecord(this.filePath, this.isLive ? 8 : 7);
        File file = new File(getCacheDir());
        if ((taskRecord == null || taskRecord.threadRecords == null || taskRecord.threadRecords.isEmpty()) && !file.exists()) {
            return null;
        }
        if (taskRecord == null || taskRecord.threadRecords == null || (taskRecord.threadRecords.isEmpty() && file.exists())) {
            String[] list = file.list(new FilenameFilter() { // from class: com.arialyy.aria.core.download.M3U8Entity.1
                @Override // java.io.FilenameFilter
                public boolean accept(File file2, String str) {
                    return str.endsWith(".ts");
                }
            });
            for (String str : list) {
                arrayList.add(new PeerInfo(Integer.parseInt(str.substring(0, str.lastIndexOf(".ts"))), getCacheDir().concat("/").concat(str)));
            }
            return arrayList;
        } else if (taskRecord.threadRecords == null || taskRecord.threadRecords.isEmpty() || !file.exists()) {
            return null;
        } else {
            for (ThreadRecord threadRecord : taskRecord.threadRecords) {
                if (threadRecord.isComplete) {
                    String format = String.format("%s/%s.ts", file, Integer.valueOf(threadRecord.threadId));
                    if (new File(format).exists()) {
                        arrayList.add(new PeerInfo(threadRecord.threadId, format));
                    }
                }
            }
            return arrayList;
        }
    }

    public String getCacheDir() {
        return this.cacheDir;
    }

    public void setCacheDir(String str) {
        this.cacheDir = str;
    }

    public void setLive(boolean z) {
        this.isLive = z;
    }

    public String getFilePath() {
        return this.filePath;
    }

    public void setFilePath(String str) {
        this.filePath = str;
    }

    public int getPeerIndex() {
        return this.peerIndex;
    }

    public void setPeerIndex(int i) {
        this.peerIndex = i;
    }

    public int getPeerNum() {
        return this.peerNum;
    }

    public void setPeerNum(int i) {
        this.peerNum = i;
    }

    public M3U8Entity() {
    }

    /* loaded from: classes.dex */
    public static class PeerInfo {
        public int peerId;
        public String peerPath;

        public PeerInfo(int i, String str) {
            this.peerId = i;
            this.peerPath = str;
        }
    }

    @Override // android.os.Parcelable
    public void writeToParcel(Parcel parcel, int i) {
        parcel.writeString(this.filePath);
        parcel.writeInt(this.peerIndex);
        parcel.writeInt(this.peerNum);
        parcel.writeByte(this.isLive ? (byte) 1 : (byte) 0);
        parcel.writeString(this.cacheDir);
        parcel.writeString(this.keyPath);
        parcel.writeString(this.keyUrl);
        parcel.writeString(this.method);
        parcel.writeString(this.iv);
    }

    protected M3U8Entity(Parcel parcel) {
        this.filePath = parcel.readString();
        this.peerIndex = parcel.readInt();
        this.peerNum = parcel.readInt();
        this.isLive = parcel.readByte() != 0;
        this.cacheDir = parcel.readString();
        this.keyPath = parcel.readString();
        this.keyUrl = parcel.readString();
        this.method = parcel.readString();
        this.iv = parcel.readString();
    }
}
