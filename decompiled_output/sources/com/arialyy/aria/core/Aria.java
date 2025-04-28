package com.arialyy.aria.core;

import android.app.Activity;
import android.app.Application;
import android.app.Dialog;
import android.app.Service;
import android.content.Context;
import android.widget.PopupWindow;
import com.arialyy.aria.core.download.DownloadReceiver;
import com.arialyy.aria.core.upload.UploadReceiver;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import java.util.Objects;
/* loaded from: classes.dex */
public class Aria {
    private Aria() {
    }

    public static DownloadReceiver download(Object obj) {
        if (AriaManager.getInstance() != null) {
            return AriaManager.getInstance().download(obj);
        }
        return get(convertContext(obj)).download(obj);
    }

    public static UploadReceiver upload(Object obj) {
        if (AriaManager.getInstance() != null) {
            return AriaManager.getInstance().upload(obj);
        }
        return get(convertContext(obj)).upload(obj);
    }

    public static AriaManager get(Context context) {
        Objects.requireNonNull(context, "context 无效，在非【Activity、Service、Application、DialogFragment、Fragment、PopupWindow、Dialog】，请参考【https://aria.laoyuyu.me/aria_doc/create/any_java.html】，参数请使用 download(this) 或 upload(this);不要使用 download(getContext()) 或 upload(getContext())");
        return AriaManager.init(context);
    }

    public static AriaManager init(Context context) {
        return get(context);
    }

    private static Context convertContext(Object obj) {
        if (obj instanceof Application) {
            return (Application) obj;
        }
        if (obj instanceof Service) {
            return (Service) obj;
        }
        if (obj instanceof Activity) {
            return (Activity) obj;
        }
        if (CommonUtil.isFragment(obj.getClass())) {
            return CommonUtil.getFragmentActivity(obj);
        }
        if (obj instanceof Dialog) {
            return ((Dialog) obj).getContext();
        }
        if (obj instanceof PopupWindow) {
            return ((PopupWindow) obj).getContentView().getContext();
        }
        ALog.e("Aria", "请使用download(this)或upload(this)");
        return null;
    }
}
