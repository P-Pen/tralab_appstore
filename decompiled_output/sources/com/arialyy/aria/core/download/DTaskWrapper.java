package com.arialyy.aria.core.download;

import com.arialyy.aria.core.TaskOptionParams;
import com.arialyy.aria.core.config.Configuration;
import com.arialyy.aria.core.config.DownloadConfig;
import com.arialyy.aria.core.inf.ITaskOption;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.util.ComponentUtil;
/* loaded from: classes.dex */
public class DTaskWrapper extends AbsTaskWrapper<DownloadEntity> {
    private String groupHash;
    private boolean isGroupTask;
    private ITaskOption m3u8Option;
    private TaskOptionParams m3u8Params;
    private String mTempFilePath;
    private String mTempUrl;

    public DTaskWrapper(DownloadEntity downloadEntity) {
        super(downloadEntity);
        this.isGroupTask = false;
        this.m3u8Params = new TaskOptionParams();
    }

    public ITaskOption getM3u8Option() {
        return this.m3u8Option;
    }

    public void generateM3u8Option(Class<? extends ITaskOption> cls) {
        this.m3u8Option = ComponentUtil.getInstance().buildTaskOption(cls, this.m3u8Params);
    }

    public TaskOptionParams getM3U8Params() {
        if (this.m3u8Params == null) {
            this.m3u8Params = new TaskOptionParams();
        }
        return this.m3u8Params;
    }

    @Override // com.arialyy.aria.core.wrapper.ITaskWrapper
    public String getKey() {
        return getEntity().getKey();
    }

    @Override // com.arialyy.aria.core.wrapper.AbsTaskWrapper
    public DownloadConfig getConfig() {
        if (this.isGroupTask) {
            return Configuration.getInstance().dGroupCfg.getSubConfig();
        }
        return Configuration.getInstance().downloadCfg;
    }

    public String getGroupHash() {
        return this.groupHash;
    }

    public boolean isGroupTask() {
        return this.isGroupTask;
    }

    public void setGroupHash(String str) {
        this.groupHash = str;
    }

    public void setGroupTask(boolean z) {
        this.isGroupTask = z;
    }

    public String getTempUrl() {
        return this.mTempUrl;
    }

    public void setTempUrl(String str) {
        this.mTempUrl = str;
    }

    public String getTempFilePath() {
        return this.mTempFilePath;
    }

    public void setTempFilePath(String str) {
        this.mTempFilePath = str;
    }
}
