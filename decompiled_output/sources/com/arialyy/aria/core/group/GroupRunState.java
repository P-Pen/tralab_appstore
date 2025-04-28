package com.arialyy.aria.core.group;

import com.arialyy.aria.core.listener.IDGroupListener;
import java.util.HashSet;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
/* loaded from: classes.dex */
public final class GroupRunState {
    IDGroupListener listener;
    private String mGroupHash;
    private long mProgress;
    private int mSubSize;
    SimpleSubQueue queue;
    private String TAG = "GroupRunState";
    private AtomicInteger mCompleteNum = new AtomicInteger();
    private AtomicInteger mFailNum = new AtomicInteger();
    private AtomicInteger mStopNum = new AtomicInteger();
    AtomicBoolean isRunning = new AtomicBoolean(false);
    private Set<String> mFailTemp = new HashSet();
    private Set<String> mStopTemp = new HashSet();

    /* JADX INFO: Access modifiers changed from: package-private */
    public GroupRunState(String str, IDGroupListener iDGroupListener, SimpleSubQueue simpleSubQueue) {
        this.listener = iDGroupListener;
        this.queue = simpleSubQueue;
        this.mGroupHash = str;
    }

    public void setSubSize(int i) {
        this.mSubSize = i;
    }

    public boolean isRunning() {
        return this.isRunning.get();
    }

    public void setRunning(boolean z) {
        this.isRunning.set(z);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getGroupHash() {
        return this.mGroupHash;
    }

    public int getSubSize() {
        return this.mSubSize;
    }

    public int getFailNum() {
        return this.mFailNum.get();
    }

    public int getStopNum() {
        return this.mStopNum.get();
    }

    public int getCompleteNum() {
        return this.mCompleteNum.get();
    }

    public long getProgress() {
        return this.mProgress;
    }

    public void updateCompleteNum() {
        this.mCompleteNum.getAndIncrement();
    }

    public void updateProgress(long j) {
        this.mProgress = j;
    }

    public void updateCount(String str) {
        if (this.mFailTemp.contains(str)) {
            this.mFailTemp.remove(str);
            this.mFailNum.getAndDecrement();
        } else if (this.mStopTemp.contains(str)) {
            this.mStopTemp.remove(str);
            this.mStopNum.getAndDecrement();
        }
    }

    public void countStopNum(String str) {
        this.mStopTemp.add(str);
        this.mStopNum.getAndIncrement();
    }

    public void countFailNum(String str) {
        this.mFailTemp.add(str);
        this.mFailNum.getAndIncrement();
    }
}
