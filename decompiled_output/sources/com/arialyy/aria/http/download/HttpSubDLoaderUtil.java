package com.arialyy.aria.http.download;

import android.os.Handler;
import com.arialyy.aria.core.group.AbsSubDLoadUtil;
import com.arialyy.aria.core.group.SubRecordHandler;
import com.arialyy.aria.core.loader.GroupSubThreadStateManager;
import com.arialyy.aria.core.loader.LoaderStructure;
import com.arialyy.aria.core.loader.NormalTTBuilder;
import com.arialyy.aria.core.loader.SubLoader;
/* loaded from: classes.dex */
final class HttpSubDLoaderUtil extends AbsSubDLoadUtil {
    /* JADX INFO: Access modifiers changed from: package-private */
    public HttpSubDLoaderUtil(Handler handler, boolean z, String str) {
        super(handler, z, str);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.arialyy.aria.core.group.AbsSubDLoadUtil
    public SubLoader getLoader() {
        if (this.mDLoader == null) {
            this.mDLoader = new SubLoader(getWrapper(), getSchedulers());
            this.mDLoader.setNeedGetInfo(isNeedGetInfo());
            this.mDLoader.setParentKey(getParentKey());
        }
        return this.mDLoader;
    }

    @Override // com.arialyy.aria.core.group.AbsSubDLoadUtil
    protected LoaderStructure buildLoaderStructure() {
        LoaderStructure loaderStructure = new LoaderStructure();
        loaderStructure.addComponent(new SubRecordHandler(getWrapper())).addComponent(new GroupSubThreadStateManager(getSchedulers(), getKey())).addComponent(new NormalTTBuilder(getWrapper(), new HttpDTTBuilderAdapter())).addComponent(new HttpDFileInfoTask(getWrapper()));
        loaderStructure.accept(getLoader());
        return loaderStructure;
    }
}
