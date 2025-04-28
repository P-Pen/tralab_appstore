package com.etralab.appstoreforandroid.basefloat;

import android.os.Build;
import android.view.WindowManager;
/* loaded from: classes.dex */
public class FloatWindowParamManager {
    public static WindowManager.LayoutParams getFloatLayoutParam(boolean z, boolean z2) {
        WindowManager.LayoutParams layoutParams = new WindowManager.LayoutParams();
        if (Build.VERSION.SDK_INT >= 26) {
            layoutParams.type = 2038;
            if (Build.VERSION.SDK_INT >= 28) {
                layoutParams.layoutInDisplayCutoutMode = 1;
            }
        } else if (Build.VERSION.SDK_INT >= 19 && Build.VERSION.SDK_INT < 23) {
            layoutParams.type = 2005;
        } else {
            layoutParams.type = 2002;
        }
        layoutParams.flags |= 16777216;
        if (z2) {
            layoutParams.flags |= 40;
        } else {
            layoutParams.flags |= 24;
        }
        if (z) {
            layoutParams.flags |= 66816;
            layoutParams.width = -1;
            layoutParams.height = -1;
        } else {
            layoutParams.flags |= 65792;
            layoutParams.width = -2;
            layoutParams.height = -2;
        }
        layoutParams.format = -2;
        return layoutParams;
    }
}
