package com.arialyy.aria.core.download.target;

import com.arialyy.aria.core.common.AbsNormalTarget;
import com.arialyy.aria.core.common.HttpOption;
import com.arialyy.aria.core.download.AbsGroupTaskWrapper;
import com.arialyy.aria.core.download.DGTaskWrapper;
import com.arialyy.aria.core.manager.SubTaskManager;
import com.arialyy.aria.util.ALog;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public class GroupNormalTarget extends AbsNormalTarget<GroupNormalTarget> {
    private HttpGroupConfigHandler<GroupNormalTarget> mConfigHandler;

    /* JADX INFO: Access modifiers changed from: package-private */
    public GroupNormalTarget(long j) {
        this.mConfigHandler = new HttpGroupConfigHandler<>(this, j);
        getTaskWrapper().setRequestType(2);
        getTaskWrapper().setNewTask(false);
    }

    public GroupNormalTarget option(HttpOption httpOption) {
        Objects.requireNonNull(httpOption, "任务配置为空");
        getTaskWrapper().getOptionParams().setParams(httpOption);
        return this;
    }

    public SubTaskManager getSubTaskManager() {
        return this.mConfigHandler.getSubTaskManager();
    }

    public GroupNormalTarget setGroupAlias(String str) {
        this.mConfigHandler.setGroupAlias(str);
        return this;
    }

    public GroupNormalTarget updateUrls(List<String> list) {
        return this.mConfigHandler.updateUrls(list);
    }

    public GroupNormalTarget ignoreTaskOccupy() {
        ((AbsGroupTaskWrapper) getTaskWrapper()).setIgnoreTaskOccupy(true);
        return this;
    }

    public GroupNormalTarget modifyDirPath(String str) {
        return this.mConfigHandler.setDirPath(str);
    }

    public GroupNormalTarget modifySubFileName(List<String> list) {
        return this.mConfigHandler.setSubFileName(list);
    }

    public GroupNormalTarget unknownSize() {
        ((DGTaskWrapper) getTaskWrapper()).setUnknownSize(true);
        return this;
    }

    public GroupNormalTarget setFileSize(long j) {
        if (j <= 0) {
            ALog.e(this.TAG, "文件大小不能小于 0");
            return this;
        }
        if (getEntity().getFileSize() <= 1 || getEntity().getFileSize() != j) {
            getEntity().setFileSize(j);
        }
        return this;
    }

    @Override // com.arialyy.aria.core.common.AbsNormalTarget
    public boolean isRunning() {
        return this.mConfigHandler.isRunning();
    }

    @Override // com.arialyy.aria.core.common.AbsNormalTarget
    public boolean taskExists() {
        return this.mConfigHandler.taskExists();
    }
}
