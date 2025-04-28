package com.etralab.appstoreforandroid;

import android.content.Context;
import android.os.Build;
import android.provider.Settings;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Locale;
import java.util.UUID;
import kotlin.UByte;
/* loaded from: classes.dex */
public class DeviceIdUtil {
    public static String getIMEI(Context context) {
        return "";
    }

    public static String getDeviceUUID(Context context) {
        StringBuilder sb = new StringBuilder();
        String imei = getIMEI(context);
        String androidId = getAndroidId(context);
        String serial = getSERIAL();
        String replace = getDeviceID().replace("-", "");
        if (imei != null && imei.length() > 0) {
            sb.append(imei);
            sb.append("|");
        }
        if (androidId != null && androidId.length() > 0) {
            sb.append(androidId);
            sb.append("|");
        }
        if (serial != null && serial.length() > 0) {
            sb.append(serial);
            sb.append("|");
        }
        if (replace != null && replace.length() > 0) {
            sb.append(replace);
        }
        if (sb.length() > 0) {
            try {
                String bytesToHex = bytesToHex(getHashByString(sb.toString()));
                if (bytesToHex != null) {
                    if (bytesToHex.length() > 0) {
                        return bytesToHex;
                    }
                    return null;
                }
                return null;
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    public static String getAndroidId(Context context) {
        try {
            return Settings.Secure.getString(context.getContentResolver(), "android_id");
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public static String getSERIAL() {
        try {
            return Build.SERIAL;
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    public static String getDeviceID() {
        try {
            return new UUID(("3883756" + (Build.BOARD.length() % 10) + (Build.BRAND.length() % 10) + (Build.DEVICE.length() % 10) + (Build.HARDWARE.length() % 10) + (Build.ID.length() % 10) + (Build.MODEL.length() % 10) + (Build.PRODUCT.length() % 10) + (Build.SERIAL.length() % 10)).hashCode(), Build.SERIAL.hashCode()).toString();
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }

    private static byte[] getHashByString(String str) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA1");
            messageDigest.reset();
            messageDigest.update(str.getBytes(StandardCharsets.UTF_8));
            return messageDigest.digest();
        } catch (Exception unused) {
            return "".getBytes();
        }
    }

    private static String bytesToHex(byte[] bArr) {
        StringBuilder sb = new StringBuilder();
        for (byte b : bArr) {
            String hexString = Integer.toHexString(b & UByte.MAX_VALUE);
            if (hexString.length() == 1) {
                sb.append("0");
            }
            sb.append(hexString);
        }
        return sb.toString().toUpperCase(Locale.CHINA);
    }
}
