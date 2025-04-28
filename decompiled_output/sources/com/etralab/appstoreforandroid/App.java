package com.etralab.appstoreforandroid;
/* loaded from: classes.dex */
public class App {
    private final String appDownloadNumber;
    private final String appId;
    private final String appLikeNumber;
    private final String appLogoUrl;
    private final String appName;
    private final String appOsType;

    public App(String str, String str2, String str3, String str4, String str5, String str6) {
        this.appId = str;
        this.appName = str2;
        this.appLogoUrl = str3;
        this.appDownloadNumber = str4;
        this.appLikeNumber = str5;
        this.appOsType = str6;
    }

    public String getAppId() {
        return this.appId;
    }

    public String getAppName() {
        return this.appName;
    }

    public String getAppLogoUrl() {
        return this.appLogoUrl;
    }

    public String getAppDownloadNumber() {
        return this.appDownloadNumber;
    }

    public String getAppLikeNumber() {
        return this.appLikeNumber;
    }

    public String getAppOsType() {
        return this.appOsType;
    }
}
