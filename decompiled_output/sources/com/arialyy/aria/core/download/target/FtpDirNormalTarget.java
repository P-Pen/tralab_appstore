package com.arialyy.aria.core.download.target;

import com.arialyy.aria.core.common.AbsNormalTarget;
import com.arialyy.aria.core.common.FtpOption;
import com.arialyy.aria.core.download.DownloadGroupEntity;
import com.arialyy.aria.core.manager.SubTaskManager;
import com.arialyy.aria.util.CommonUtil;
import java.util.Objects;
/* loaded from: classes.dex */
public class FtpDirNormalTarget extends AbsNormalTarget<FtpDirNormalTarget> {
    private FtpDirConfigHandler<FtpDirNormalTarget> mConfigHandler;
    private FtpOption option;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FtpDirNormalTarget(long j) {
        this.mConfigHandler = new FtpDirConfigHandler<>(this, j);
        getTaskWrapper().setNewTask(false);
    }

    @Override // com.arialyy.aria.core.common.AbsNormalTarget
    public boolean isRunning() {
        return this.mConfigHandler.isRunning();
    }

    @Override // com.arialyy.aria.core.common.AbsNormalTarget
    public boolean taskExists() {
        return this.mConfigHandler.taskExists();
    }

    public FtpDirNormalTarget modifyDirPath(String str) {
        return this.mConfigHandler.setDirPath(str);
    }

    public FtpDirNormalTarget option(FtpOption ftpOption) {
        Objects.requireNonNull(ftpOption, "ftp 任务配置为空");
        this.option = ftpOption;
        return this;
    }

    @Override // com.arialyy.aria.core.inf.AbsTarget
    public DownloadGroupEntity getEntity() {
        return (DownloadGroupEntity) super.getEntity();
    }

    public SubTaskManager getSubTaskManager() {
        return this.mConfigHandler.getSubTaskManager();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.arialyy.aria.core.common.AbsNormalTarget
    public void onPre() {
        super.onPre();
        if (this.option == null) {
            this.option = new FtpOption();
        }
        this.option.setUrlEntity(CommonUtil.getFtpUrlInfo(getEntity().getKey()));
        getTaskWrapper().getOptionParams().setParams(this.option);
    }
}
