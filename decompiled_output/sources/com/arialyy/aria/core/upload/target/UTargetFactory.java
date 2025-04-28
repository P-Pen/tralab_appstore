package com.arialyy.aria.core.upload.target;

import com.arialyy.aria.core.common.AbsBuilderTarget;
import com.arialyy.aria.core.common.AbsNormalTarget;
/* loaded from: classes.dex */
public class UTargetFactory {
    public static volatile UTargetFactory INSTANCE;

    private UTargetFactory() {
    }

    public static UTargetFactory getInstance() {
        if (INSTANCE == null) {
            synchronized (UTargetFactory.class) {
                if (INSTANCE == null) {
                    INSTANCE = new UTargetFactory();
                }
            }
        }
        return INSTANCE;
    }

    public <T extends AbsNormalTarget> T generateNormalTarget(Class<T> cls, long j) {
        if (cls == HttpNormalTarget.class) {
            return new HttpNormalTarget(j);
        }
        if (cls == FtpNormalTarget.class) {
            return new FtpNormalTarget(j);
        }
        return null;
    }

    public <T extends AbsBuilderTarget> T generateBuilderTarget(Class<T> cls, String str) {
        if (cls == HttpBuilderTarget.class) {
            return new HttpBuilderTarget(str);
        }
        if (cls == FtpBuilderTarget.class) {
            return new FtpBuilderTarget(str);
        }
        return null;
    }
}
