package com.arialyy.aria.core.download.target;

import com.arialyy.aria.core.download.DTaskWrapper;
import com.arialyy.aria.core.inf.AbsTarget;
import java.util.List;
/* loaded from: classes.dex */
class FtpDirConfigHandler<TARGET extends AbsTarget> extends AbsGroupConfigHandler<TARGET> {
    /* JADX INFO: Access modifiers changed from: package-private */
    public FtpDirConfigHandler(TARGET target, long j) {
        super(target, j);
        init();
    }

    private void init() {
        getTaskWrapper().setRequestType(4);
        List<DTaskWrapper> subTaskWrapper = getTaskWrapper().getSubTaskWrapper();
        if (subTaskWrapper.isEmpty()) {
            return;
        }
        for (DTaskWrapper dTaskWrapper : subTaskWrapper) {
            dTaskWrapper.setRequestType(3);
            dTaskWrapper.getEntity().setTaskType(3);
        }
    }
}
