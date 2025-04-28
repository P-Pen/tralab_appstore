package com.arialyy.aria.core.download.target;

import com.arialyy.aria.core.common.AbsBuilderTarget;
import com.arialyy.aria.core.common.AbsNormalTarget;
import java.util.List;
/* loaded from: classes.dex */
public class DTargetFactory {
    public static volatile DTargetFactory INSTANCE;

    private DTargetFactory() {
    }

    public static DTargetFactory getInstance() {
        if (INSTANCE == null) {
            synchronized (DTargetFactory.class) {
                if (INSTANCE == null) {
                    INSTANCE = new DTargetFactory();
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
        if (cls == GroupNormalTarget.class) {
            return new GroupNormalTarget(j);
        }
        if (cls == FtpDirNormalTarget.class) {
            return new FtpDirNormalTarget(j);
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

    public FtpDirBuilderTarget generateDirBuilderTarget(String str) {
        return new FtpDirBuilderTarget(str);
    }

    public GroupBuilderTarget generateGroupBuilderTarget(List<String> list) {
        return new GroupBuilderTarget(list);
    }
}
