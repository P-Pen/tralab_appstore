package com.arialyy.aria.core.queue.pool;

import com.arialyy.aria.core.AriaConfig;
import com.arialyy.aria.core.task.AbsTask;
/* loaded from: classes.dex */
public class UploadExecutePool<TASK extends AbsTask> extends BaseExecutePool<TASK> {
    @Override // com.arialyy.aria.core.queue.pool.BaseExecutePool
    protected int getMaxSize() {
        return AriaConfig.getInstance().getUConfig().getMaxTaskNum();
    }
}
