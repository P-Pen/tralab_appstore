package com.arialyy.aria.core.group;

import com.arialyy.aria.core.config.Configuration;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class SimpleSubQueue implements ISubQueue<AbsSubDLoadUtil> {
    private final String TAG = CommonUtil.getClassName((Class) getClass());
    private Map<String, AbsSubDLoadUtil> mCache = new ConcurrentHashMap();
    private Map<String, AbsSubDLoadUtil> mExec = new ConcurrentHashMap();
    private boolean isStopAll = false;
    private int mExecSize = Configuration.getInstance().dGroupCfg.getSubMaxTaskNum();

    private SimpleSubQueue() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static SimpleSubQueue newInstance() {
        return new SimpleSubQueue();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public synchronized AbsSubDLoadUtil getLoaderUtil(String str) {
        AbsSubDLoadUtil absSubDLoadUtil = this.mExec.get(str);
        if (absSubDLoadUtil != null) {
            return absSubDLoadUtil;
        }
        return this.mCache.get(str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getCacheSize() {
        return this.mCache.size();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean isStopAll() {
        return this.isStopAll;
    }

    @Override // com.arialyy.aria.core.group.ISubQueue
    public void addTask(AbsSubDLoadUtil absSubDLoadUtil) {
        this.mCache.put(absSubDLoadUtil.getKey(), absSubDLoadUtil);
    }

    @Override // com.arialyy.aria.core.group.ISubQueue
    public void startTask(AbsSubDLoadUtil absSubDLoadUtil) {
        if (this.mExec.size() < this.mExecSize) {
            this.mCache.remove(absSubDLoadUtil.getKey());
            this.mExec.put(absSubDLoadUtil.getKey(), absSubDLoadUtil);
            ALog.d(this.TAG, String.format("开始执行子任务：%s，key: %s", absSubDLoadUtil.getEntity().getFileName(), absSubDLoadUtil.getKey()));
            absSubDLoadUtil.run();
            return;
        }
        ALog.d(this.TAG, String.format("执行队列已满，任务进入缓存器中，key: %s", absSubDLoadUtil.getKey()));
        addTask(absSubDLoadUtil);
    }

    @Override // com.arialyy.aria.core.group.ISubQueue
    public void stopTask(AbsSubDLoadUtil absSubDLoadUtil) {
        absSubDLoadUtil.stop();
        this.mExec.remove(absSubDLoadUtil.getKey());
    }

    @Override // com.arialyy.aria.core.group.ISubQueue
    public void stopAllTask() {
        this.isStopAll = true;
        ALog.d(this.TAG, "停止组合任务");
        for (String str : this.mExec.keySet()) {
            AbsSubDLoadUtil absSubDLoadUtil = this.mExec.get(str);
            if (absSubDLoadUtil != null) {
                ALog.d(this.TAG, String.format("停止子任务：%s", absSubDLoadUtil.getEntity().getFileName()));
                absSubDLoadUtil.stop();
            }
        }
    }

    @Override // com.arialyy.aria.core.group.ISubQueue
    public void modifyMaxExecNum(int i) {
        int i2 = 0;
        if (i < 1) {
            ALog.e(this.TAG, String.format("修改组合任务子任务队列数失败，num: %s", Integer.valueOf(i)));
            return;
        }
        int i3 = this.mExecSize;
        if (i == i3) {
            ALog.i(this.TAG, String.format("忽略此次修改，oldSize: %s, num: %s", Integer.valueOf(i3), Integer.valueOf(i)));
            return;
        }
        this.mExecSize = i;
        int abs = Math.abs(i3 - i);
        if (i3 < i) {
            if (this.mExec.size() > i) {
                Set<String> keySet = this.mExec.keySet();
                ArrayList<AbsSubDLoadUtil> arrayList = new ArrayList();
                for (String str : keySet) {
                    if (i2 > i) {
                        arrayList.add(this.mExec.get(str));
                    }
                    i2++;
                }
                Collection<AbsSubDLoadUtil> values = this.mCache.values();
                this.mCache.clear();
                for (AbsSubDLoadUtil absSubDLoadUtil : arrayList) {
                    addTask(absSubDLoadUtil);
                }
                for (AbsSubDLoadUtil absSubDLoadUtil2 : values) {
                    addTask(absSubDLoadUtil2);
                }
            }
        } else if (this.mExec.size() < i) {
            while (i2 < abs) {
                AbsSubDLoadUtil nextTask = getNextTask();
                if (nextTask != null) {
                    startTask(nextTask);
                } else {
                    ALog.d(this.TAG, "子任务中没有缓存任务");
                }
                i2++;
            }
        }
    }

    @Override // com.arialyy.aria.core.group.ISubQueue
    public void removeTaskFromExecQ(AbsSubDLoadUtil absSubDLoadUtil) {
        this.mExec.remove(absSubDLoadUtil.getKey());
    }

    @Override // com.arialyy.aria.core.group.ISubQueue
    public void removeTask(AbsSubDLoadUtil absSubDLoadUtil) {
        removeTaskFromExecQ(absSubDLoadUtil);
        this.mCache.remove(absSubDLoadUtil.getKey());
    }

    @Override // com.arialyy.aria.core.group.ISubQueue
    public void removeAllTask() {
        ALog.d(this.TAG, "删除组合任务");
        for (String str : this.mExec.keySet()) {
            AbsSubDLoadUtil absSubDLoadUtil = this.mExec.get(str);
            if (absSubDLoadUtil != null) {
                ALog.d(this.TAG, String.format("停止子任务：%s", absSubDLoadUtil.getEntity().getFileName()));
                absSubDLoadUtil.cancel();
            }
        }
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.arialyy.aria.core.group.ISubQueue
    public AbsSubDLoadUtil getNextTask() {
        Iterator<String> it = this.mCache.keySet().iterator();
        if (it.hasNext()) {
            return this.mCache.get(it.next());
        }
        return null;
    }

    @Override // com.arialyy.aria.core.group.ISubQueue
    public void clear() {
        this.mCache.clear();
        this.mExec.clear();
    }
}
