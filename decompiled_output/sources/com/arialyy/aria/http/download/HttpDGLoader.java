package com.arialyy.aria.http.download;

import android.os.Looper;
import com.arialyy.aria.core.common.AbsEntity;
import com.arialyy.aria.core.common.CompleteInfo;
import com.arialyy.aria.core.download.DTaskWrapper;
import com.arialyy.aria.core.group.AbsGroupLoader;
import com.arialyy.aria.core.group.AbsSubDLoadUtil;
import com.arialyy.aria.core.listener.DownloadGroupListener;
import com.arialyy.aria.core.loader.IInfoTask;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.exception.AriaException;
/* loaded from: classes.dex */
final class HttpDGLoader extends AbsGroupLoader {
    /* JADX INFO: Access modifiers changed from: package-private */
    public HttpDGLoader(AbsTaskWrapper absTaskWrapper, DownloadGroupListener downloadGroupListener) {
        super(absTaskWrapper, downloadGroupListener);
    }

    @Override // com.arialyy.aria.core.group.AbsGroupLoader
    protected void handlerTask(Looper looper) {
        if (isBreak()) {
            return;
        }
        this.mInfoTask.run();
    }

    @Override // com.arialyy.aria.core.group.AbsGroupLoader
    protected AbsSubDLoadUtil createSubLoader(DTaskWrapper dTaskWrapper, boolean z) {
        HttpSubDLoaderUtil httpSubDLoaderUtil = new HttpSubDLoaderUtil(getScheduler(), z, getKey());
        httpSubDLoaderUtil.setParams(dTaskWrapper, null);
        return httpSubDLoaderUtil;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void startSub() {
        if (isBreak()) {
            return;
        }
        onPostStart();
        for (DTaskWrapper dTaskWrapper : getWrapper().getSubTaskWrapper()) {
            startSubLoader(createSubLoader(dTaskWrapper, dTaskWrapper.getEntity().getFileSize() < 0));
        }
    }

    @Override // com.arialyy.aria.core.loader.ILoaderVisitor
    public void addComponent(IInfoTask iInfoTask) {
        this.mInfoTask = iInfoTask;
        this.mInfoTask.setCallback(new IInfoTask.Callback() { // from class: com.arialyy.aria.http.download.HttpDGLoader.1
            @Override // com.arialyy.aria.core.loader.IInfoTask.Callback
            public void onSucceed(String str, CompleteInfo completeInfo) {
                HttpDGLoader.this.startSub();
            }

            @Override // com.arialyy.aria.core.loader.IInfoTask.Callback
            public void onFail(AbsEntity absEntity, AriaException ariaException, boolean z) {
                HttpDGLoader.this.fail(ariaException, z);
            }
        });
    }
}
