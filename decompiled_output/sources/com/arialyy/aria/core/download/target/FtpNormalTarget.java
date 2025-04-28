package com.arialyy.aria.core.download.target;

import com.arialyy.aria.core.common.AbsNormalTarget;
import com.arialyy.aria.core.common.FtpOption;
import com.arialyy.aria.core.common.SFtpOption;
import com.arialyy.aria.core.download.DownloadEntity;
import com.arialyy.aria.util.CommonUtil;
import java.util.Objects;
/* loaded from: classes.dex */
public class FtpNormalTarget extends AbsNormalTarget<FtpNormalTarget> {
    private DNormalConfigHandler<FtpNormalTarget> mConfigHandler;

    /* JADX INFO: Access modifiers changed from: package-private */
    public FtpNormalTarget(long j) {
        this.mConfigHandler = new DNormalConfigHandler<>(this, j);
        getTaskWrapper().setRequestType(3);
        getTaskWrapper().setNewTask(false);
    }

    public FtpNormalTarget option(FtpOption ftpOption) {
        Objects.requireNonNull(ftpOption, "ftp 任务配置为空");
        ftpOption.setUrlEntity(CommonUtil.getFtpUrlInfo(getEntity().getUrl()));
        getTaskWrapper().getOptionParams().setParams(ftpOption);
        return this;
    }

    public FtpNormalTarget sftpOption(SFtpOption sFtpOption) {
        Objects.requireNonNull(sFtpOption, "ftp 任务配置为空");
        sFtpOption.setUrlEntity(CommonUtil.getFtpUrlInfo(this.mConfigHandler.getUrl()));
        getTaskWrapper().getOptionParams().setParams(sFtpOption);
        getEntity().setTaskType(12);
        getTaskWrapper().setRequestType(12);
        return this;
    }

    public FtpNormalTarget modifyFilePath(String str) {
        getEntity().setFileName(this.mConfigHandler.getUrl().substring(this.mConfigHandler.getUrl().lastIndexOf("/") + 1));
        this.mConfigHandler.setTempFilePath(str);
        return this;
    }

    public FtpNormalTarget updateUrl(String str) {
        return this.mConfigHandler.updateUrl(str);
    }

    @Override // com.arialyy.aria.core.common.AbsNormalTarget
    public boolean isRunning() {
        return this.mConfigHandler.isRunning();
    }

    @Override // com.arialyy.aria.core.common.AbsNormalTarget
    public boolean taskExists() {
        return this.mConfigHandler.taskExists();
    }

    @Override // com.arialyy.aria.core.inf.AbsTarget
    public DownloadEntity getEntity() {
        return (DownloadEntity) super.getEntity();
    }
}
