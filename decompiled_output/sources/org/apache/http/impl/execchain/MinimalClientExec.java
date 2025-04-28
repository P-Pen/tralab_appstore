package org.apache.http.impl.execchain;

import java.net.URI;
import java.net.URISyntaxException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.HttpHost;
import org.apache.http.ProtocolException;
import org.apache.http.client.methods.HttpRequestWrapper;
import org.apache.http.client.protocol.RequestClientConnControl;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.conn.HttpClientConnectionManager;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.protocol.HttpProcessor;
import org.apache.http.protocol.HttpRequestExecutor;
import org.apache.http.protocol.ImmutableHttpProcessor;
import org.apache.http.protocol.RequestContent;
import org.apache.http.protocol.RequestTargetHost;
import org.apache.http.protocol.RequestUserAgent;
import org.apache.http.util.Args;
import org.apache.http.util.VersionInfo;
/* loaded from: classes.dex */
public class MinimalClientExec implements ClientExecChain {
    private final HttpClientConnectionManager connManager;
    private final HttpProcessor httpProcessor;
    private final ConnectionKeepAliveStrategy keepAliveStrategy;
    private final Log log = LogFactory.getLog(getClass());
    private final HttpRequestExecutor requestExecutor;
    private final ConnectionReuseStrategy reuseStrategy;

    public MinimalClientExec(HttpRequestExecutor httpRequestExecutor, HttpClientConnectionManager httpClientConnectionManager, ConnectionReuseStrategy connectionReuseStrategy, ConnectionKeepAliveStrategy connectionKeepAliveStrategy) {
        Args.notNull(httpRequestExecutor, "HTTP request executor");
        Args.notNull(httpClientConnectionManager, "Client connection manager");
        Args.notNull(connectionReuseStrategy, "Connection reuse strategy");
        Args.notNull(connectionKeepAliveStrategy, "Connection keep alive strategy");
        this.httpProcessor = new ImmutableHttpProcessor(new RequestContent(), new RequestTargetHost(), new RequestClientConnControl(), new RequestUserAgent(VersionInfo.getUserAgent("Apache-HttpClient", "org.apache.http.client", getClass())));
        this.requestExecutor = httpRequestExecutor;
        this.connManager = httpClientConnectionManager;
        this.reuseStrategy = connectionReuseStrategy;
        this.keepAliveStrategy = connectionKeepAliveStrategy;
    }

    static void rewriteRequestURI(HttpRequestWrapper httpRequestWrapper, HttpRoute httpRoute, boolean z) throws ProtocolException {
        URI rewriteURI;
        try {
            URI uri = httpRequestWrapper.getURI();
            if (uri != null) {
                if (uri.isAbsolute()) {
                    rewriteURI = URIUtils.rewriteURI(uri, (HttpHost) null, z ? URIUtils.DROP_FRAGMENT_AND_NORMALIZE : URIUtils.DROP_FRAGMENT);
                } else {
                    rewriteURI = URIUtils.rewriteURI(uri);
                }
                httpRequestWrapper.setURI(rewriteURI);
            }
        } catch (URISyntaxException e) {
            throw new ProtocolException("Invalid URI: " + httpRequestWrapper.getRequestLine().getUri(), e);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x00b4 A[Catch: Error -> 0x0112, RuntimeException -> 0x0119, IOException -> 0x011e, HttpException -> 0x0123, ConnectionShutdownException -> 0x0128, TryCatch #3 {IOException -> 0x011e, Error -> 0x0112, ConnectionShutdownException -> 0x0128, RuntimeException -> 0x0119, HttpException -> 0x0123, blocks: (B:17:0x0057, B:19:0x005d, B:20:0x0061, B:21:0x0069, B:22:0x006a, B:24:0x0070, B:28:0x007a, B:29:0x0082, B:31:0x0088, B:32:0x008b, B:34:0x0093, B:36:0x009f, B:39:0x00b4, B:40:0x00b8, B:42:0x00e4, B:44:0x00f6, B:46:0x00fc, B:49:0x0103, B:51:0x0109, B:43:0x00f3), top: B:80:0x0057 }] */
    /* JADX WARN: Removed duplicated region for block: B:42:0x00e4 A[Catch: Error -> 0x0112, RuntimeException -> 0x0119, IOException -> 0x011e, HttpException -> 0x0123, ConnectionShutdownException -> 0x0128, TryCatch #3 {IOException -> 0x011e, Error -> 0x0112, ConnectionShutdownException -> 0x0128, RuntimeException -> 0x0119, HttpException -> 0x0123, blocks: (B:17:0x0057, B:19:0x005d, B:20:0x0061, B:21:0x0069, B:22:0x006a, B:24:0x0070, B:28:0x007a, B:29:0x0082, B:31:0x0088, B:32:0x008b, B:34:0x0093, B:36:0x009f, B:39:0x00b4, B:40:0x00b8, B:42:0x00e4, B:44:0x00f6, B:46:0x00fc, B:49:0x0103, B:51:0x0109, B:43:0x00f3), top: B:80:0x0057 }] */
    /* JADX WARN: Removed duplicated region for block: B:43:0x00f3 A[Catch: Error -> 0x0112, RuntimeException -> 0x0119, IOException -> 0x011e, HttpException -> 0x0123, ConnectionShutdownException -> 0x0128, TryCatch #3 {IOException -> 0x011e, Error -> 0x0112, ConnectionShutdownException -> 0x0128, RuntimeException -> 0x0119, HttpException -> 0x0123, blocks: (B:17:0x0057, B:19:0x005d, B:20:0x0061, B:21:0x0069, B:22:0x006a, B:24:0x0070, B:28:0x007a, B:29:0x0082, B:31:0x0088, B:32:0x008b, B:34:0x0093, B:36:0x009f, B:39:0x00b4, B:40:0x00b8, B:42:0x00e4, B:44:0x00f6, B:46:0x00fc, B:49:0x0103, B:51:0x0109, B:43:0x00f3), top: B:80:0x0057 }] */
    @Override // org.apache.http.impl.execchain.ClientExecChain
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public org.apache.http.client.methods.CloseableHttpResponse execute(org.apache.http.conn.routing.HttpRoute r8, org.apache.http.client.methods.HttpRequestWrapper r9, org.apache.http.client.protocol.HttpClientContext r10, org.apache.http.client.methods.HttpExecutionAware r11) throws java.io.IOException, org.apache.http.HttpException {
        /*
            Method dump skipped, instructions count: 339
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.execchain.MinimalClientExec.execute(org.apache.http.conn.routing.HttpRoute, org.apache.http.client.methods.HttpRequestWrapper, org.apache.http.client.protocol.HttpClientContext, org.apache.http.client.methods.HttpExecutionAware):org.apache.http.client.methods.CloseableHttpResponse");
    }
}
