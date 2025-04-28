package com.arialyy.aria.http;

import android.text.TextUtils;
import com.arialyy.aria.core.common.RequestEnum;
import com.arialyy.aria.core.inf.ITaskOption;
import com.arialyy.aria.core.processor.IHttpFileLenAdapter;
import com.arialyy.aria.core.processor.IHttpFileNameAdapter;
import java.lang.ref.SoftReference;
import java.net.CookieManager;
import java.net.Proxy;
import java.util.HashMap;
import java.util.Map;
/* loaded from: classes.dex */
public final class HttpTaskOption implements ITaskOption {
    private String attachment;
    private CookieManager cookieManager;
    private SoftReference<IHttpFileLenAdapter> fileLenAdapter;
    private SoftReference<IHttpFileNameAdapter> fileNameAdapter;
    private Map<String, String> params;
    private Proxy proxy;
    private Map<String, String> headers = new HashMap();
    private String charSet = "utf-8";
    private RequestEnum requestEnum = RequestEnum.GET;
    private boolean useServerFileName = false;
    private String redirectUrl = "";
    private boolean isChunked = false;
    private Map<String, String> formFields = new HashMap();

    public IHttpFileLenAdapter getFileLenAdapter() {
        SoftReference<IHttpFileLenAdapter> softReference = this.fileLenAdapter;
        if (softReference == null) {
            return null;
        }
        return softReference.get();
    }

    public IHttpFileNameAdapter getFileNameAdapter() {
        SoftReference<IHttpFileNameAdapter> softReference = this.fileNameAdapter;
        if (softReference == null) {
            return null;
        }
        return softReference.get();
    }

    public void setFileLenAdapter(IHttpFileLenAdapter iHttpFileLenAdapter) {
        this.fileLenAdapter = new SoftReference<>(iHttpFileLenAdapter);
    }

    public void setFileNameAdapter(IHttpFileNameAdapter iHttpFileNameAdapter) {
        this.fileNameAdapter = new SoftReference<>(iHttpFileNameAdapter);
    }

    public Map<String, String> getFormFields() {
        return this.formFields;
    }

    public void setFormFields(Map<String, String> map) {
        this.formFields = map;
    }

    public String getAttachment() {
        return TextUtils.isEmpty(this.attachment) ? "file" : this.attachment;
    }

    public void setAttachment(String str) {
        this.attachment = str;
    }

    public boolean isChunked() {
        return this.isChunked;
    }

    public void setChunked(boolean z) {
        this.isChunked = z;
    }

    public CookieManager getCookieManager() {
        return this.cookieManager;
    }

    public void setCookieManager(CookieManager cookieManager) {
        this.cookieManager = cookieManager;
    }

    public Proxy getProxy() {
        return this.proxy;
    }

    public void setProxy(Proxy proxy) {
        this.proxy = proxy;
    }

    public Map<String, String> getHeaders() {
        return this.headers;
    }

    public void setHeaders(Map<String, String> map) {
        this.headers = map;
    }

    public String getCharSet() {
        return TextUtils.isEmpty(this.charSet) ? "utf-8" : this.charSet;
    }

    public void setCharSet(String str) {
        this.charSet = str;
    }

    public RequestEnum getRequestEnum() {
        return this.requestEnum;
    }

    public void setRequestEnum(RequestEnum requestEnum) {
        this.requestEnum = requestEnum;
    }

    public boolean isUseServerFileName() {
        return this.useServerFileName;
    }

    public void setUseServerFileName(boolean z) {
        this.useServerFileName = z;
    }

    public String getRedirectUrl() {
        return this.redirectUrl;
    }

    public void setRedirectUrl(String str) {
        this.redirectUrl = str;
    }

    public Map<String, String> getParams() {
        return this.params;
    }

    public void setParams(Map<String, String> map) {
        this.params = map;
    }
}
