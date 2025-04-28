package com.etralab.appstoreforandroid;
/* loaded from: classes.dex */
public class NumUnitConversionUtil {
    public static String NumUnitConversion(String str) {
        float parseFloat = Float.parseFloat(str);
        if (parseFloat < 10000.0f) {
            return str;
        }
        if (parseFloat >= 10000.0f && parseFloat < 100000.0f) {
            return (Math.round((parseFloat / 1000.0f) * 10.0f) / 10.0f) + "K";
        } else if (parseFloat >= 100000.0f && parseFloat < 1000000.0f) {
            return Math.round(parseFloat / 1000.0f) + "K";
        } else if (parseFloat >= 1000000.0f && parseFloat < 1.0E7f) {
            return (Math.round((parseFloat / 1000000.0f) * 100.0f) / 100.0f) + "M";
        } else if (parseFloat >= 1.0E7f && parseFloat < 1.0E8f) {
            return (Math.round((parseFloat / 1000000.0f) * 10.0f) / 10.0f) + "M";
        } else if (parseFloat >= 1.0E8f && parseFloat < 1.0E9f) {
            return Math.round(parseFloat / 1000000.0f) + "M";
        } else if (parseFloat >= 1.0E9f && parseFloat < 1.0E10f) {
            return (Math.round((parseFloat / 1.0E9f) * 100.0f) / 100.0f) + "B";
        } else if (parseFloat >= 1.0E10f && parseFloat < 1.0E11f) {
            return (Math.round((parseFloat / 1.0E9f) * 10.0f) / 10.0f) + "B";
        } else if (parseFloat < 1.0E11f || parseFloat >= 1.0E12f) {
            return str;
        } else {
            return Math.round(parseFloat / 1.0E9f) + "B";
        }
    }
}
