package com.arialyy.aria.core.download.target;

import com.arialyy.aria.core.common.AbsBuilderTarget;
import com.arialyy.aria.core.download.DownloadEntity;
/* loaded from: classes.dex */
public class TcpBuilderTarget extends AbsBuilderTarget<TcpBuilderTarget> {
    private DNormalConfigHandler mConfigHandler = new DNormalConfigHandler(this, -1);

    TcpBuilderTarget(String str, int i) {
        getTaskWrapper().setRequestType(9);
        ((DownloadEntity) getEntity()).setTaskType(9);
        getTaskWrapper().setNewTask(true);
    }

    public TcpBuilderTarget setFilePath(String str) {
        this.mConfigHandler.setTempFilePath(str);
        return this;
    }
}
