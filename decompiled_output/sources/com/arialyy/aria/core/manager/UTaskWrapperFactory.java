package com.arialyy.aria.core.manager;

import com.arialyy.aria.core.upload.UTaskWrapper;
import com.arialyy.aria.core.upload.UploadEntity;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class UTaskWrapperFactory implements INormalTEFactory<UploadEntity, UTaskWrapper> {
    private static volatile UTaskWrapperFactory INSTANCE = null;
    private static final String TAG = "UTaskWrapperFactory";

    private UTaskWrapperFactory() {
    }

    public static UTaskWrapperFactory getInstance() {
        if (INSTANCE == null) {
            synchronized (UTaskWrapperFactory.class) {
                INSTANCE = new UTaskWrapperFactory();
            }
        }
        return INSTANCE;
    }

    /* JADX WARN: Can't rename method to resolve collision */
    @Override // com.arialyy.aria.core.manager.INormalTEFactory
    public UTaskWrapper create(long j) {
        UTaskWrapper uTaskWrapper;
        if (j == -1) {
            uTaskWrapper = new UTaskWrapper(new UploadEntity());
        } else {
            uTaskWrapper = new UTaskWrapper(getUploadEntity(j));
        }
        uTaskWrapper.setRequestType(uTaskWrapper.getEntity().getTaskType());
        return uTaskWrapper;
    }

    private UploadEntity getUploadEntity(long j) {
        UploadEntity uploadEntity = (UploadEntity) UploadEntity.findFirst(UploadEntity.class, "rowid=?", String.valueOf(j));
        return uploadEntity == null ? new UploadEntity() : uploadEntity;
    }
}
