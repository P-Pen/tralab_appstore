package com.arialyy.aria.core.loader;

import android.os.Handler;
import com.arialyy.aria.core.TaskRecord;
import com.arialyy.aria.core.ThreadRecord;
import com.arialyy.aria.core.common.AbsNormalEntity;
import com.arialyy.aria.core.common.SubThreadConfig;
import com.arialyy.aria.core.task.IThreadTaskAdapter;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.util.CommonUtil;
import java.io.File;
/* loaded from: classes.dex */
public abstract class AbsNormalTTBuilderAdapter {
    protected String TAG = CommonUtil.getClassName(this);
    private File tempFile;
    protected AbsTaskWrapper wrapper;

    public abstract IThreadTaskAdapter getAdapter(SubThreadConfig subThreadConfig);

    public abstract boolean handleNewTask(TaskRecord taskRecord, int i);

    /* JADX INFO: Access modifiers changed from: protected */
    public void setWrapper(AbsTaskWrapper absTaskWrapper) {
        this.wrapper = absTaskWrapper;
        this.tempFile = new File(((AbsNormalEntity) absTaskWrapper.getEntity()).getFilePath());
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public SubThreadConfig getSubThreadConfig(Handler handler, ThreadRecord threadRecord, boolean z, int i) {
        return createNormalSubThreadConfig(handler, threadRecord, z, i);
    }

    private SubThreadConfig createNormalSubThreadConfig(Handler handler, ThreadRecord threadRecord, boolean z, int i) {
        SubThreadConfig subThreadConfig = new SubThreadConfig();
        subThreadConfig.url = getEntity().isRedirect() ? getEntity().getRedirectUrl() : getEntity().getUrl();
        subThreadConfig.tempFile = z ? new File(String.format(IRecordHandler.SUB_PATH, this.tempFile.getPath(), Integer.valueOf(threadRecord.threadId))) : this.tempFile;
        subThreadConfig.isBlock = z;
        subThreadConfig.startThreadNum = i;
        subThreadConfig.taskWrapper = this.wrapper;
        subThreadConfig.record = threadRecord;
        subThreadConfig.stateHandler = handler;
        subThreadConfig.threadType = SubThreadConfig.getThreadType(this.wrapper.getRequestType());
        subThreadConfig.updateInterval = SubThreadConfig.getUpdateInterval(this.wrapper.getRequestType());
        return subThreadConfig;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public AbsNormalEntity getEntity() {
        return (AbsNormalEntity) this.wrapper.getEntity();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public File getTempFile() {
        return this.tempFile;
    }
}
