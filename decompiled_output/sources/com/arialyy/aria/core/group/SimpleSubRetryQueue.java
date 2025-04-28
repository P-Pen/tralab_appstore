package com.arialyy.aria.core.group;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.SynchronousQueue;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
final class SimpleSubRetryQueue {
    private static volatile SimpleSubRetryQueue INSTANCE;
    private ExecutorService pool = new ThreadPoolExecutor(5, 100, 60, TimeUnit.SECONDS, new SynchronousQueue());

    public static synchronized SimpleSubRetryQueue getInstance() {
        SimpleSubRetryQueue simpleSubRetryQueue;
        synchronized (SimpleSubRetryQueue.class) {
            if (INSTANCE == null) {
                synchronized (SimpleSubRetryQueue.class) {
                    INSTANCE = new SimpleSubRetryQueue();
                }
            }
            simpleSubRetryQueue = INSTANCE;
        }
        return simpleSubRetryQueue;
    }

    private SimpleSubRetryQueue() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void offer(AbsSubDLoadUtil absSubDLoadUtil) {
        this.pool.submit(absSubDLoadUtil.getLoader());
    }
}
