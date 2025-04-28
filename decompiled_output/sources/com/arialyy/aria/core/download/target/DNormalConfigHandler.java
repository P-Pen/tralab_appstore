package com.arialyy.aria.core.download.target;

import android.text.TextUtils;
import com.arialyy.aria.core.common.AbsNormalTarget;
import com.arialyy.aria.core.download.DTaskWrapper;
import com.arialyy.aria.core.download.DownloadEntity;
import com.arialyy.aria.core.event.ErrorEvent;
import com.arialyy.aria.core.inf.AbsTarget;
import com.arialyy.aria.core.inf.IConfigHandler;
import com.arialyy.aria.core.manager.TaskWrapperManager;
import com.arialyy.aria.core.queue.DTaskQueue;
import com.arialyy.aria.orm.DbEntity;
import com.arialyy.aria.util.ALog;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class DNormalConfigHandler<TARGET extends AbsTarget> implements IConfigHandler {
    private final String TAG = "DNormalDelegate";
    private DownloadEntity mEntity;
    private TARGET mTarget;
    private DTaskWrapper mWrapper;

    /* JADX INFO: Access modifiers changed from: package-private */
    public DNormalConfigHandler(TARGET target, long j) {
        this.mTarget = target;
        initTarget(j);
    }

    private void initTarget(long j) {
        DTaskWrapper dTaskWrapper = (DTaskWrapper) TaskWrapperManager.getInstance().getNormalTaskWrapper(DTaskWrapper.class, j);
        this.mWrapper = dTaskWrapper;
        if (this.mTarget instanceof AbsNormalTarget) {
            if (j < 0) {
                dTaskWrapper.setErrorEvent(new ErrorEvent(j, "任务id为空"));
            } else if (dTaskWrapper.getEntity().getId() < 0) {
                this.mWrapper.setErrorEvent(new ErrorEvent(j, "任务信息不存在"));
            }
        }
        this.mEntity = this.mWrapper.getEntity();
        this.mTarget.setTaskWrapper(this.mWrapper);
        if (this.mEntity != null) {
            getWrapper().setTempFilePath(this.mEntity.getFilePath());
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public TARGET updateUrl(String str) {
        if (TextUtils.isEmpty(str)) {
            ALog.e("DNormalDelegate", "url更新失败，newUrl为null");
            return this.mTarget;
        } else if (this.mEntity.getUrl().equals(str)) {
            ALog.e("DNormalDelegate", "url更新失败，新的下载url和旧的url一致");
            return this.mTarget;
        } else {
            getWrapper().setRefreshInfo(true);
            getWrapper().setTempUrl(str);
            ALog.d("DNormalDelegate", "更新url成功");
            return this.mTarget;
        }
    }

    @Override // com.arialyy.aria.core.inf.IConfigHandler
    public DownloadEntity getEntity() {
        return (DownloadEntity) this.mTarget.getEntity();
    }

    @Override // com.arialyy.aria.core.inf.IConfigHandler
    public boolean taskExists() {
        return DbEntity.checkDataExist(DownloadEntity.class, "rowid=?", String.valueOf(this.mEntity.getId()));
    }

    @Override // com.arialyy.aria.core.inf.IConfigHandler
    public boolean isRunning() {
        return DTaskQueue.getInstance().taskIsRunning(this.mEntity.getKey());
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setForceDownload(boolean z) {
        getWrapper().setIgnoreFilePathOccupy(z);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setUrl(String str) {
        this.mEntity.setUrl(str);
        this.mWrapper.setTempUrl(str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public String getUrl() {
        return this.mEntity.getUrl();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setTempFilePath(String str) {
        getWrapper().setTempFilePath(str);
    }

    private DTaskWrapper getWrapper() {
        return this.mWrapper;
    }
}
