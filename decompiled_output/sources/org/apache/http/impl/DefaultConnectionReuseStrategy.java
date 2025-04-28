package org.apache.http.impl;

import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.HeaderIterator;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.TokenIterator;
import org.apache.http.client.methods.HttpHead;
import org.apache.http.message.BasicTokenIterator;
/* loaded from: classes.dex */
public class DefaultConnectionReuseStrategy implements ConnectionReuseStrategy {
    public static final DefaultConnectionReuseStrategy INSTANCE = new DefaultConnectionReuseStrategy();

    /* JADX WARN: Code restructure failed: missing block: B:31:0x008e, code lost:
        if (java.lang.Integer.parseInt(r9[0].getValue()) < 0) goto L59;
     */
    @Override // org.apache.http.ConnectionReuseStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public boolean keepAlive(org.apache.http.HttpResponse r8, org.apache.http.protocol.HttpContext r9) {
        /*
            r7 = this;
            java.lang.String r0 = "HTTP response"
            org.apache.http.util.Args.notNull(r8, r0)
            java.lang.String r0 = "HTTP context"
            org.apache.http.util.Args.notNull(r9, r0)
            org.apache.http.StatusLine r0 = r8.getStatusLine()
            int r0 = r0.getStatusCode()
            java.lang.String r1 = "Transfer-Encoding"
            java.lang.String r2 = "Content-Length"
            r3 = 0
            r4 = 204(0xcc, float:2.86E-43)
            if (r0 != r4) goto L33
            org.apache.http.Header r0 = r8.getFirstHeader(r2)
            if (r0 == 0) goto L2c
            java.lang.String r0 = r0.getValue()     // Catch: java.lang.NumberFormatException -> L2c
            int r0 = java.lang.Integer.parseInt(r0)     // Catch: java.lang.NumberFormatException -> L2c
            if (r0 <= 0) goto L2c
            return r3
        L2c:
            org.apache.http.Header r0 = r8.getFirstHeader(r1)
            if (r0 == 0) goto L33
            return r3
        L33:
            java.lang.String r0 = "http.request"
            java.lang.Object r9 = r9.getAttribute(r0)
            org.apache.http.HttpRequest r9 = (org.apache.http.HttpRequest) r9
            java.lang.String r0 = "Close"
            java.lang.String r4 = "Connection"
            if (r9 == 0) goto L5b
            org.apache.http.message.BasicTokenIterator r5 = new org.apache.http.message.BasicTokenIterator     // Catch: org.apache.http.ParseException -> L5a
            org.apache.http.HeaderIterator r6 = r9.headerIterator(r4)     // Catch: org.apache.http.ParseException -> L5a
            r5.<init>(r6)     // Catch: org.apache.http.ParseException -> L5a
        L4a:
            boolean r6 = r5.hasNext()     // Catch: org.apache.http.ParseException -> L5a
            if (r6 == 0) goto L5b
            java.lang.String r6 = r5.nextToken()     // Catch: org.apache.http.ParseException -> L5a
            boolean r6 = r0.equalsIgnoreCase(r6)     // Catch: org.apache.http.ParseException -> L5a
            if (r6 == 0) goto L4a
        L5a:
            return r3
        L5b:
            org.apache.http.StatusLine r5 = r8.getStatusLine()
            org.apache.http.ProtocolVersion r5 = r5.getProtocolVersion()
            org.apache.http.Header r1 = r8.getFirstHeader(r1)
            r6 = 1
            if (r1 == 0) goto L77
            java.lang.String r9 = r1.getValue()
            java.lang.String r1 = "chunked"
            boolean r9 = r1.equalsIgnoreCase(r9)
            if (r9 != 0) goto L91
            return r3
        L77:
            boolean r9 = r7.canResponseHaveBody(r9, r8)
            if (r9 == 0) goto L91
            org.apache.http.Header[] r9 = r8.getHeaders(r2)
            int r1 = r9.length
            if (r1 != r6) goto L90
            r9 = r9[r3]
            java.lang.String r9 = r9.getValue()     // Catch: java.lang.NumberFormatException -> L90
            int r9 = java.lang.Integer.parseInt(r9)     // Catch: java.lang.NumberFormatException -> L90
            if (r9 >= 0) goto L91
        L90:
            return r3
        L91:
            org.apache.http.HeaderIterator r9 = r8.headerIterator(r4)
            boolean r1 = r9.hasNext()
            if (r1 != 0) goto La1
            java.lang.String r9 = "Proxy-Connection"
            org.apache.http.HeaderIterator r9 = r8.headerIterator(r9)
        La1:
            boolean r8 = r9.hasNext()
            if (r8 == 0) goto Lcc
            org.apache.http.message.BasicTokenIterator r8 = new org.apache.http.message.BasicTokenIterator     // Catch: org.apache.http.ParseException -> Lcb
            r8.<init>(r9)     // Catch: org.apache.http.ParseException -> Lcb
            r9 = r3
        Lad:
            boolean r1 = r8.hasNext()     // Catch: org.apache.http.ParseException -> Lcb
            if (r1 == 0) goto Lc8
            java.lang.String r1 = r8.nextToken()     // Catch: org.apache.http.ParseException -> Lcb
            boolean r2 = r0.equalsIgnoreCase(r1)     // Catch: org.apache.http.ParseException -> Lcb
            if (r2 == 0) goto Lbe
            return r3
        Lbe:
            java.lang.String r2 = "Keep-Alive"
            boolean r1 = r2.equalsIgnoreCase(r1)     // Catch: org.apache.http.ParseException -> Lcb
            if (r1 == 0) goto Lad
            r9 = r6
            goto Lad
        Lc8:
            if (r9 == 0) goto Lcc
            return r6
        Lcb:
            return r3
        Lcc:
            org.apache.http.HttpVersion r8 = org.apache.http.HttpVersion.HTTP_1_0
            boolean r8 = r5.lessEquals(r8)
            r8 = r8 ^ r6
            return r8
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.DefaultConnectionReuseStrategy.keepAlive(org.apache.http.HttpResponse, org.apache.http.protocol.HttpContext):boolean");
    }

    protected TokenIterator createTokenIterator(HeaderIterator headerIterator) {
        return new BasicTokenIterator(headerIterator);
    }

    private boolean canResponseHaveBody(HttpRequest httpRequest, HttpResponse httpResponse) {
        int statusCode;
        return ((httpRequest != null && httpRequest.getRequestLine().getMethod().equalsIgnoreCase(HttpHead.METHOD_NAME)) || (statusCode = httpResponse.getStatusLine().getStatusCode()) < 200 || statusCode == 204 || statusCode == 304 || statusCode == 205) ? false : true;
    }
}
