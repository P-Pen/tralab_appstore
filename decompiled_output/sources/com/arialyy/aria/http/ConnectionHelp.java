package com.arialyy.aria.http;

import android.text.TextUtils;
import com.arialyy.aria.core.AriaConfig;
import com.arialyy.aria.core.common.RequestEnum;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import com.arialyy.aria.util.SSLContextUtil;
import java.io.IOException;
import java.io.InputStream;
import java.net.CookieManager;
import java.net.CookieStore;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.Map;
import java.util.zip.GZIPInputStream;
import java.util.zip.InflaterInputStream;
import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;
import org.apache.http.HttpHeaders;
import org.apache.http.cookie.SM;
import org.apache.http.protocol.HTTP;
/* loaded from: classes.dex */
public final class ConnectionHelp {
    private static final String TAG = "ConnectionHelp";

    public static URL handleUrl(String str, HttpTaskOption httpTaskOption) throws MalformedURLException {
        Map<String, String> params = httpTaskOption.getParams();
        if (params != null && httpTaskOption.getRequestEnum() == RequestEnum.GET) {
            if (str.contains("?")) {
                ALog.e(TAG, String.format("设置参数失败，url中已经有?，url: %s", str));
                return new URL(CommonUtil.convertUrl(str));
            }
            StringBuilder sb = new StringBuilder();
            sb.append(str);
            sb.append("?");
            for (String str2 : params.keySet()) {
                sb.append(str2);
                sb.append("=");
                sb.append(URLEncoder.encode(params.get(str2)));
                sb.append("&");
            }
            String sb2 = sb.toString();
            return new URL(CommonUtil.convertUrl(sb2.substring(0, sb2.length() - 1)));
        }
        return new URL(CommonUtil.convertUrl(str));
    }

    public static InputStream convertInputStream(HttpURLConnection httpURLConnection) throws IOException {
        String headerField = httpURLConnection.getHeaderField("Content-Encoding");
        if (TextUtils.isEmpty(headerField)) {
            return httpURLConnection.getInputStream();
        }
        if (headerField.contains("gzip")) {
            return new GZIPInputStream(httpURLConnection.getInputStream());
        }
        if (headerField.contains("deflate")) {
            return new InflaterInputStream(httpURLConnection.getInputStream());
        }
        return httpURLConnection.getInputStream();
    }

    public static HttpURLConnection handleConnection(URL url, HttpTaskOption httpTaskOption) throws IOException {
        URLConnection openConnection;
        if (httpTaskOption.getProxy() != null) {
            openConnection = url.openConnection(httpTaskOption.getProxy());
        } else {
            openConnection = url.openConnection();
        }
        if (openConnection instanceof HttpsURLConnection) {
            AriaConfig ariaConfig = AriaConfig.getInstance();
            HttpsURLConnection httpsURLConnection = (HttpsURLConnection) openConnection;
            SSLContext sSLContextFromAssets = SSLContextUtil.getSSLContextFromAssets(ariaConfig.getDConfig().getCaName(), ariaConfig.getDConfig().getCaPath(), "TLS");
            if (sSLContextFromAssets == null) {
                sSLContextFromAssets = SSLContextUtil.getDefaultSLLContext("TLS");
            }
            httpsURLConnection.setSSLSocketFactory(sSLContextFromAssets.getSocketFactory());
            httpsURLConnection.setHostnameVerifier(SSLContextUtil.HOSTNAME_VERIFIER);
            return httpsURLConnection;
        }
        return (HttpURLConnection) openConnection;
    }

    public static HttpURLConnection setConnectParam(HttpTaskOption httpTaskOption, HttpURLConnection httpURLConnection) {
        CookieStore cookieStore;
        if (httpTaskOption.getRequestEnum() == RequestEnum.POST) {
            httpURLConnection.setDoInput(true);
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setUseCaches(false);
        }
        if (httpTaskOption.getHeaders() != null && httpTaskOption.getHeaders().size() > 0) {
            for (String str : httpTaskOption.getHeaders().keySet()) {
                httpURLConnection.setRequestProperty(str, httpTaskOption.getHeaders().get(str));
            }
        }
        if (httpURLConnection.getRequestProperty(HttpHeaders.ACCEPT_LANGUAGE) == null) {
            httpURLConnection.setRequestProperty(HttpHeaders.ACCEPT_LANGUAGE, "zh-CN,zh;q=0.9,en;q=0.8,ja;q=0.7");
        }
        if (httpURLConnection.getRequestProperty(HttpHeaders.ACCEPT_ENCODING) == null) {
            httpURLConnection.setRequestProperty(HttpHeaders.ACCEPT_ENCODING, HTTP.IDENTITY_CODING);
        }
        if (httpURLConnection.getRequestProperty(HttpHeaders.ACCEPT_CHARSET) == null) {
            httpURLConnection.setRequestProperty(HttpHeaders.ACCEPT_CHARSET, "UTF-8");
        }
        if (httpURLConnection.getRequestProperty("Connection") == null) {
            httpURLConnection.setRequestProperty("Connection", HTTP.CONN_KEEP_ALIVE);
        }
        if (httpURLConnection.getRequestProperty("Charset") == null) {
            httpURLConnection.setRequestProperty("Charset", "UTF-8");
        }
        if (httpURLConnection.getRequestProperty("User-Agent") == null) {
            httpURLConnection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36");
        }
        if (httpURLConnection.getRequestProperty(HttpHeaders.ACCEPT) == null) {
            httpURLConnection.setRequestProperty(HttpHeaders.ACCEPT, "image/gif, image/jpeg, image/pjpeg, image/webp, image/apng, application/xml, application/xaml+xml, application/xhtml+xml, application/x-shockwave-flash, application/x-ms-xbap, application/x-ms-application, application/msword, application/vnd.ms-excel, application/vnd.ms-xpsdocument, application/vnd.ms-powerpoint, application/signed-exchange, text/plain, text/html, */*");
        }
        httpURLConnection.setInstanceFollowRedirects(false);
        CookieManager cookieManager = httpTaskOption.getCookieManager();
        if (cookieManager != null && (cookieStore = cookieManager.getCookieStore()) != null && cookieStore.getCookies().size() > 0) {
            httpURLConnection.setRequestProperty(SM.COOKIE, TextUtils.join(";", cookieStore.getCookies()));
        }
        return httpURLConnection;
    }
}
