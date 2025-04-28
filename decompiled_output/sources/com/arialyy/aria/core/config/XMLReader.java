package com.arialyy.aria.core.config;

import android.text.TextUtils;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.message.TokenParser;
import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;
/* loaded from: classes.dex */
public class XMLReader extends DefaultHandler {
    private int mType;
    private final String TAG = CommonUtil.getClassName(this);
    private DownloadConfig mDownloadConfig = Configuration.getInstance().downloadCfg;
    private UploadConfig mUploadConfig = Configuration.getInstance().uploadCfg;
    private AppConfig mAppConfig = Configuration.getInstance().appCfg;
    private DGroupConfig mDGroupConfig = Configuration.getInstance().dGroupCfg;

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void startDocument() throws SAXException {
        super.startDocument();
    }

    /* JADX WARN: Can't fix incorrect switch cases order, some code will duplicate */
    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void startElement(String str, String str2, String str3, Attributes attributes) throws SAXException {
        char c;
        char c2;
        int i;
        int i2;
        int i3;
        char c3;
        super.startElement(str, str2, str3, attributes);
        str3.hashCode();
        int i4 = 2;
        switch (str3.hashCode()) {
            case -1362975621:
                if (str3.equals("dGroup")) {
                    c = 0;
                    break;
                }
                c = 65535;
                break;
            case -838595071:
                if (str3.equals("upload")) {
                    c = 1;
                    break;
                }
                c = 65535;
                break;
            case 96801:
                if (str3.equals("app")) {
                    c = 2;
                    break;
                }
                c = 65535;
                break;
            case 1427818632:
                if (str3.equals("download")) {
                    c = 3;
                    break;
                }
                c = 65535;
                break;
            default:
                c = 65535;
                break;
        }
        switch (c) {
            case 0:
                this.mType = 4;
                break;
            case 1:
                this.mType = 2;
                break;
            case 2:
                this.mType = 3;
                break;
            case 3:
                this.mType = 1;
                break;
        }
        int i5 = this.mType;
        if (i5 != 1 && i5 != 2 && i5 != 4) {
            if (i5 == 3) {
                String value = attributes.getValue("value");
                str3.hashCode();
                switch (str3.hashCode()) {
                    case -1465029389:
                        if (str3.equals("useAriaCrashHandler")) {
                            c3 = 0;
                            break;
                        }
                        c3 = 65535;
                        break;
                    case -556102918:
                        if (str3.equals("useBroadcast")) {
                            c3 = 1;
                            break;
                        }
                        c3 = 65535;
                        break;
                    case 1265223019:
                        if (str3.equals("netCheck")) {
                            c3 = 2;
                            break;
                        }
                        c3 = 65535;
                        break;
                    case 1698008830:
                        if (str3.equals("notNetRetry")) {
                            c3 = 3;
                            break;
                        }
                        c3 = 65535;
                        break;
                    case 1995731616:
                        if (str3.equals("logLevel")) {
                            c3 = 4;
                            break;
                        }
                        c3 = 65535;
                        break;
                    default:
                        c3 = 65535;
                        break;
                }
                switch (c3) {
                    case 0:
                        setField("useAriaCrashHandler", Boolean.valueOf(checkBoolean(value) ? Boolean.valueOf(value).booleanValue() : true), 3);
                        return;
                    case 1:
                        setField("useBroadcast", Boolean.valueOf(checkBoolean(value) ? Boolean.valueOf(value).booleanValue() : false), 3);
                        return;
                    case 2:
                        setField("netCheck", Boolean.valueOf(checkBoolean(value) ? Boolean.valueOf(value).booleanValue() : false), 3);
                        return;
                    case 3:
                        setField("notNetRetry", Boolean.valueOf(checkBoolean(value) ? Boolean.valueOf(value).booleanValue() : false), 3);
                        return;
                    case 4:
                        int parseInt = checkInt(value) ? Integer.parseInt(value) : 2;
                        if (parseInt < 2 || parseInt > 8) {
                            ALog.w(this.TAG, "level【" + parseInt + "】错误");
                        } else {
                            i4 = parseInt;
                        }
                        setField("logLevel", Integer.valueOf(i4), 3);
                        return;
                    default:
                        return;
                }
            }
            return;
        }
        String value2 = attributes.getValue("value");
        str3.hashCode();
        switch (str3.hashCode()) {
            case -1562250980:
                if (str3.equals("threadNum")) {
                    c2 = 0;
                    break;
                }
                c2 = 65535;
                break;
            case -1522580748:
                if (str3.equals("buffSize")) {
                    c2 = 1;
                    break;
                }
                c2 = 65535;
                break;
            case -1225712674:
                if (str3.equals("reTryNum")) {
                    c2 = 2;
                    break;
                }
                c2 = 65535;
                break;
            case -1164496847:
                if (str3.equals("queueMod")) {
                    c2 = 3;
                    break;
                }
                c2 = 65535;
                break;
            case -363319875:
                if (str3.equals("maxTaskNum")) {
                    c2 = 4;
                    break;
                }
                c2 = 65535;
                break;
            case -359728905:
                if (str3.equals("connectTimeOut")) {
                    c2 = 5;
                    break;
                }
                c2 = 65535;
                break;
            case -310088890:
                if (str3.equals("useBlock")) {
                    c2 = 6;
                    break;
                }
                c2 = 65535;
                break;
            case -210383525:
                if (str3.equals("iOTimeOut")) {
                    c2 = 7;
                    break;
                }
                c2 = 65535;
                break;
            case 3166:
                if (str3.equals("ca")) {
                    c2 = '\b';
                    break;
                }
                c2 = 65535;
                break;
            case 75456114:
                if (str3.equals("subFailAsStop")) {
                    c2 = '\t';
                    break;
                }
                c2 = 65535;
                break;
            case 88800830:
                if (str3.equals("subReTryNum")) {
                    c2 = '\n';
                    break;
                }
                c2 = 65535;
                break;
            case 163772445:
                if (str3.equals("subMaxTaskNum")) {
                    c2 = 11;
                    break;
                }
                c2 = 65535;
                break;
            case 268851336:
                if (str3.equals("useHeadRequest")) {
                    c2 = '\f';
                    break;
                }
                c2 = 65535;
                break;
            case 396896579:
                if (str3.equals("maxSpeed")) {
                    c2 = TokenParser.CR;
                    break;
                }
                c2 = 65535;
                break;
            case 492890989:
                if (str3.equals("reTryInterval")) {
                    c2 = 14;
                    break;
                }
                c2 = 65535;
                break;
            case 699761933:
                if (str3.equals("subReTryInterval")) {
                    c2 = 15;
                    break;
                }
                c2 = 65535;
                break;
            case 755731028:
                if (str3.equals("convertSpeed")) {
                    c2 = 16;
                    break;
                }
                c2 = 65535;
                break;
            case 1440589998:
                if (str3.equals("updateInterval")) {
                    c2 = 17;
                    break;
                }
                c2 = 65535;
                break;
            default:
                c2 = 65535;
                break;
        }
        switch (c2) {
            case 0:
                if (checkInt(value2)) {
                    i2 = Integer.parseInt(value2);
                    i = 1;
                } else {
                    i = 1;
                    i2 = 3;
                }
                if (i2 < i) {
                    ALog.w(this.TAG, "下载线程数不能小于 1");
                    i2 = i;
                }
                setField("threadNum", Integer.valueOf(i2), i);
                return;
            case 1:
                int parseInt2 = checkInt(value2) ? Integer.parseInt(value2) : 8192;
                if (parseInt2 < 2048) {
                    parseInt2 = 2048;
                }
                setField("buffSize", Integer.valueOf(parseInt2), this.mType);
                return;
            case 2:
                setField("reTryNum", Integer.valueOf(checkInt(value2) ? Integer.parseInt(value2) : 0), this.mType);
                return;
            case 3:
                if (TextUtils.isEmpty(value2) || (!value2.equalsIgnoreCase("now") && !value2.equalsIgnoreCase("wait"))) {
                    value2 = "now";
                }
                setField("queueMod", value2, this.mType);
                return;
            case 4:
                int parseInt3 = checkInt(value2) ? Integer.parseInt(value2) : 2;
                if (parseInt3 < 1) {
                    ALog.w(this.TAG, "任务队列数不能小于 1");
                    i3 = 2;
                } else {
                    i3 = parseInt3;
                }
                setField("maxTaskNum", Integer.valueOf(i3), this.mType);
                return;
            case 5:
                setField("connectTimeOut", Integer.valueOf(checkInt(value2) ? Integer.parseInt(value2) : 5000), this.mType);
                return;
            case 6:
                setField("useBlock", Boolean.valueOf(checkBoolean(value2) ? Boolean.valueOf(value2).booleanValue() : false), 1);
                return;
            case 7:
                int parseInt4 = checkInt(value2) ? Integer.parseInt(value2) : 10000;
                setField("iOTimeOut", Integer.valueOf(parseInt4 >= 10000 ? parseInt4 : 10000), this.mType);
                return;
            case '\b':
                String value3 = attributes.getValue("name");
                String value4 = attributes.getValue(ClientCookie.PATH_ATTR);
                setField("caName", value3, this.mType);
                setField("caPath", value4, this.mType);
                return;
            case '\t':
                setField("subFailAsStop", Boolean.valueOf(checkBoolean(value2) ? Boolean.valueOf(value2).booleanValue() : false), 4);
                return;
            case '\n':
                setField("subReTryNum", Integer.valueOf(checkInt(value2) ? Integer.parseInt(value2) : 5), 4);
                return;
            case 11:
                setField("subMaxTaskNum", Integer.valueOf(checkInt(value2) ? Integer.parseInt(value2) : 3), 4);
                return;
            case '\f':
                setField("useHeadRequest", Boolean.valueOf(checkBoolean(value2) ? Boolean.valueOf(value2).booleanValue() : false), 1);
                return;
            case '\r':
                setField("maxSpeed", Integer.valueOf(checkInt(value2) ? Integer.parseInt(value2) : 0), this.mType);
                return;
            case 14:
                int parseInt5 = checkInt(value2) ? Integer.parseInt(value2) : 2000;
                setField("reTryInterval", Integer.valueOf(parseInt5 >= 2000 ? parseInt5 : 2000), this.mType);
                return;
            case 15:
                setField("subReTryInterval", Integer.valueOf(checkInt(value2) ? Integer.parseInt(value2) : 2000), 4);
                return;
            case 16:
                setField("isConvertSpeed", Boolean.valueOf(!checkBoolean(value2) || Boolean.parseBoolean(value2)), this.mType);
                return;
            case 17:
                setField("updateInterval", Long.valueOf(checkLong(value2) ? Long.parseLong(value2) : 1000L), this.mType);
                return;
            default:
                return;
        }
    }

    private void setField(String str, Object obj, int i) {
        if (i == 1) {
            setField(DownloadConfig.class, this.mDownloadConfig, str, obj);
        } else if (i == 2) {
            setField(UploadConfig.class, this.mUploadConfig, str, obj);
        } else if (i == 3) {
            setField(AppConfig.class, this.mAppConfig, str, obj);
        } else if (i == 4) {
            setField(DGroupConfig.class, this.mDGroupConfig, str, obj);
        }
    }

    private void setField(Class cls, Object obj, String str, Object obj2) {
        try {
            CommonUtil.getField(cls, str).set(obj, obj2);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
    }

    private boolean checkInt(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        try {
            return Integer.parseInt(str) >= 0;
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean checkLong(String str) {
        if (TextUtils.isEmpty(str)) {
            return false;
        }
        try {
            Long.valueOf(Long.parseLong(str));
            return true;
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return false;
        }
    }

    private boolean checkBoolean(String str) {
        return !TextUtils.isEmpty(str) && (str.equalsIgnoreCase("true") || str.equalsIgnoreCase("false"));
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void characters(char[] cArr, int i, int i2) throws SAXException {
        super.characters(cArr, i, i2);
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void endElement(String str, String str2, String str3) throws SAXException {
        super.endElement(str, str2, str3);
    }

    @Override // org.xml.sax.helpers.DefaultHandler, org.xml.sax.ContentHandler
    public void endDocument() throws SAXException {
        super.endDocument();
        this.mDownloadConfig.save();
        this.mUploadConfig.save();
        this.mAppConfig.save();
        this.mDGroupConfig.save();
    }
}
