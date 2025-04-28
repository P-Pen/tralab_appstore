package com.arialyy.aria.core.manager;

import android.text.TextUtils;
import com.arialyy.aria.core.task.IThreadTask;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.Future;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.locks.ReentrantLock;
/* loaded from: classes.dex */
public class ThreadTaskManager {
    private static final int CORE_POOL_NUM = 20;
    private static volatile ThreadTaskManager INSTANCE;
    private static final ReentrantLock LOCK = new ReentrantLock();
    private ThreadPoolExecutor mExePool;
    private final String TAG = CommonUtil.getClassName(this);
    private Map<String, Set<FutureContainer>> mThreadTasks = new ConcurrentHashMap();

    public static synchronized ThreadTaskManager getInstance() {
        ThreadTaskManager threadTaskManager;
        synchronized (ThreadTaskManager.class) {
            if (INSTANCE == null) {
                INSTANCE = new ThreadTaskManager();
            }
            threadTaskManager = INSTANCE;
        }
        return threadTaskManager;
    }

    private ThreadTaskManager() {
        ThreadPoolExecutor threadPoolExecutor = new ThreadPoolExecutor(20, Integer.MAX_VALUE, 60L, TimeUnit.SECONDS, new SynchronousQueue());
        this.mExePool = threadPoolExecutor;
        threadPoolExecutor.allowsCoreThreadTimeOut();
    }

    public void removeAllThreadTask() {
        try {
            if (this.mThreadTasks.isEmpty()) {
                return;
            }
            try {
                LOCK.tryLock(2L, TimeUnit.SECONDS);
                for (Set<FutureContainer> set : this.mThreadTasks.values()) {
                    for (FutureContainer futureContainer : set) {
                        if (!futureContainer.future.isDone() && !futureContainer.future.isCancelled()) {
                            futureContainer.threadTask.destroy();
                        }
                    }
                    set.clear();
                }
                this.mThreadTasks.clear();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        } finally {
            LOCK.unlock();
        }
    }

    public void startThread(String str, IThreadTask iThreadTask) {
        try {
            try {
                ReentrantLock reentrantLock = LOCK;
                reentrantLock.tryLock(2L, TimeUnit.SECONDS);
                if (this.mExePool.isShutdown()) {
                    ALog.e(this.TAG, "线程池已经关闭");
                    reentrantLock.unlock();
                    return;
                }
                String key = getKey(str);
                Set<FutureContainer> set = this.mThreadTasks.get(key);
                if (set == null) {
                    set = new HashSet<>();
                    this.mThreadTasks.put(key, set);
                }
                FutureContainer futureContainer = new FutureContainer();
                futureContainer.threadTask = iThreadTask;
                futureContainer.future = this.mExePool.submit(iThreadTask);
                set.add(futureContainer);
                reentrantLock.unlock();
            } catch (Exception e) {
                e.printStackTrace();
                LOCK.unlock();
            }
        } catch (Throwable th) {
            LOCK.unlock();
            throw th;
        }
    }

    public boolean taskIsRunning(String str) {
        return this.mThreadTasks.get(getKey(str)) != null;
    }

    public void removeTaskThread(String str) {
        ReentrantLock reentrantLock;
        try {
            try {
                reentrantLock = LOCK;
                reentrantLock.tryLock(2L, TimeUnit.SECONDS);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (this.mExePool.isShutdown()) {
                ALog.e(this.TAG, "线程池已经关闭");
                reentrantLock.unlock();
                return;
            }
            String key = getKey(str);
            Set<FutureContainer> set = this.mThreadTasks.get(key);
            if (set != null && set.size() > 0) {
                for (FutureContainer futureContainer : set) {
                    if (!futureContainer.future.isDone() && !futureContainer.future.isCancelled()) {
                        futureContainer.threadTask.destroy();
                    }
                }
                set.clear();
                this.mThreadTasks.remove(key);
            }
        } finally {
            LOCK.unlock();
        }
    }

    public boolean removeSingleTaskThread(String str, String str2) {
        ReentrantLock reentrantLock;
        try {
            try {
                reentrantLock = LOCK;
                reentrantLock.tryLock(2L, TimeUnit.SECONDS);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (this.mExePool.isShutdown()) {
                ALog.e(this.TAG, "线程池已经关闭");
                reentrantLock.unlock();
                return false;
            } else if (TextUtils.isEmpty(str2)) {
                ALog.e(this.TAG, "线程名为空");
                reentrantLock.unlock();
                return false;
            } else {
                Set<FutureContainer> set = this.mThreadTasks.get(getKey(str));
                if (set != null && set.size() > 0) {
                    FutureContainer futureContainer = null;
                    Iterator<FutureContainer> it = set.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        FutureContainer next = it.next();
                        if (next.threadTask.getThreadName().equals(str2)) {
                            futureContainer = next;
                            break;
                        }
                    }
                    if (futureContainer != null) {
                        futureContainer.threadTask.destroy();
                        set.remove(futureContainer);
                        return true;
                    }
                }
                return false;
            }
        } finally {
            LOCK.unlock();
        }
    }

    public boolean removeSingleTaskThread(String str, IThreadTask iThreadTask) {
        ReentrantLock reentrantLock;
        try {
            try {
                reentrantLock = LOCK;
                reentrantLock.tryLock(2L, TimeUnit.SECONDS);
            } catch (Exception e) {
                e.printStackTrace();
            }
            if (this.mExePool.isShutdown()) {
                ALog.e(this.TAG, "线程池已经关闭");
                reentrantLock.unlock();
                return false;
            } else if (iThreadTask == null) {
                ALog.e(this.TAG, "线程任务为空");
                reentrantLock.unlock();
                return false;
            } else {
                Set<FutureContainer> set = this.mThreadTasks.get(getKey(str));
                if (set != null && set.size() > 0) {
                    FutureContainer futureContainer = null;
                    Iterator<FutureContainer> it = set.iterator();
                    while (true) {
                        if (!it.hasNext()) {
                            break;
                        }
                        FutureContainer next = it.next();
                        if (next.threadTask == iThreadTask) {
                            futureContainer = next;
                            break;
                        }
                    }
                    if (futureContainer != null) {
                        iThreadTask.destroy();
                        set.remove(futureContainer);
                        return true;
                    }
                }
                return false;
            }
        } finally {
            LOCK.unlock();
        }
    }

    public void retryThread(IThreadTask iThreadTask) {
        try {
            ReentrantLock reentrantLock = LOCK;
            reentrantLock.tryLock(2L, TimeUnit.SECONDS);
            if (this.mExePool.isShutdown()) {
                ALog.e(this.TAG, "线程池已经关闭");
                reentrantLock.unlock();
                return;
            }
            if (iThreadTask != null) {
                try {
                    if (!iThreadTask.isDestroy()) {
                        this.mExePool.submit(iThreadTask);
                        reentrantLock.unlock();
                        return;
                    }
                } catch (Exception e) {
                    ALog.e(this.TAG, "", e);
                    return;
                }
            }
            ALog.e(this.TAG, "线程为空或线程已经中断");
            reentrantLock.unlock();
        } catch (Exception e2) {
            e2.printStackTrace();
        } finally {
            LOCK.unlock();
        }
    }

    private String getKey(String str) {
        return CommonUtil.getStrMd5(str);
    }

    /* loaded from: classes.dex */
    private class FutureContainer {
        Future future;
        IThreadTask threadTask;

        private FutureContainer() {
        }
    }
}
