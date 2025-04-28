package com.arialyy.aria.util;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.NetworkInfo;
import android.net.Proxy;
import android.os.Build;
import android.telephony.TelephonyManager;
import android.text.TextUtils;
import com.arialyy.aria.core.AriaConfig;
/* loaded from: classes.dex */
public class NetUtils {
    public static final int NETWORK_TYPE_2G = 2;
    public static final int NETWORK_TYPE_3G = 3;
    public static final int NETWORK_TYPE_INVALID = 0;
    public static final int NETWORK_TYPE_WAP = 1;
    public static final int NETWORK_TYPE_WIFI = 4;

    public static boolean isConnected(Context context) {
        if (AriaConfig.getInstance().getAConfig().isNetCheck()) {
            if (Build.VERSION.SDK_INT >= 21) {
                return AriaConfig.getInstance().isConnectedNet();
            }
            NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
            return activeNetworkInfo != null && activeNetworkInfo.isConnectedOrConnecting();
        }
        return true;
    }

    public static boolean isWifi(Context context) {
        return getNetWorkType(context) == 4;
    }

    public static int getNetWorkType(Context context) {
        NetworkInfo activeNetworkInfo = ((ConnectivityManager) context.getSystemService("connectivity")).getActiveNetworkInfo();
        if (activeNetworkInfo == null || !activeNetworkInfo.isConnected()) {
            return 0;
        }
        String typeName = activeNetworkInfo.getTypeName();
        if (typeName.equalsIgnoreCase("WIFI")) {
            return 4;
        }
        if (typeName.equalsIgnoreCase("MOBILE")) {
            if (TextUtils.isEmpty(Proxy.getDefaultHost())) {
                return isFastMobileNetwork(context) ? 3 : 2;
            }
            return 1;
        }
        return -1;
    }

    private static boolean isFastMobileNetwork(Context context) {
        switch (((TelephonyManager) context.getSystemService("phone")).getNetworkType()) {
            case 3:
            case 5:
            case 6:
            case 8:
            case 9:
            case 10:
            case 12:
            case 13:
            case 14:
            case 15:
                return true;
            case 4:
            case 7:
            case 11:
            default:
                return false;
        }
    }
}
