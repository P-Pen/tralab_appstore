package org.apache.http.impl.client;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.http.ConnectionReuseStrategy;
import org.apache.http.HttpEntity;
import org.apache.http.HttpEntityEnclosingRequest;
import org.apache.http.HttpException;
import org.apache.http.HttpHost;
import org.apache.http.HttpRequest;
import org.apache.http.HttpResponse;
import org.apache.http.NoHttpResponseException;
import org.apache.http.ProtocolException;
import org.apache.http.auth.AuthScheme;
import org.apache.http.auth.AuthState;
import org.apache.http.client.AuthenticationHandler;
import org.apache.http.client.AuthenticationStrategy;
import org.apache.http.client.HttpRequestRetryHandler;
import org.apache.http.client.NonRepeatableRequestException;
import org.apache.http.client.RedirectException;
import org.apache.http.client.RedirectHandler;
import org.apache.http.client.RedirectStrategy;
import org.apache.http.client.RequestDirector;
import org.apache.http.client.UserTokenHandler;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.params.ClientPNames;
import org.apache.http.client.params.HttpClientParams;
import org.apache.http.client.utils.URIUtils;
import org.apache.http.conn.ClientConnectionManager;
import org.apache.http.conn.ConnectionKeepAliveStrategy;
import org.apache.http.conn.ManagedClientConnection;
import org.apache.http.conn.routing.BasicRouteDirector;
import org.apache.http.conn.routing.HttpRoute;
import org.apache.http.conn.routing.HttpRoutePlanner;
import org.apache.http.entity.BufferedHttpEntity;
import org.apache.http.message.BasicHttpRequest;
import org.apache.http.params.HttpConnectionParams;
import org.apache.http.params.HttpParams;
import org.apache.http.params.HttpProtocolParams;
import org.apache.http.protocol.ExecutionContext;
import org.apache.http.protocol.HttpContext;
import org.apache.http.protocol.HttpProcessor;
import org.apache.http.protocol.HttpRequestExecutor;
import org.apache.http.util.Args;
import org.apache.http.util.EntityUtils;
@Deprecated
/* loaded from: classes.dex */
public class DefaultRequestDirector implements RequestDirector {
    private final HttpAuthenticator authenticator;
    protected final ClientConnectionManager connManager;
    private int execCount;
    protected final HttpProcessor httpProcessor;
    protected final ConnectionKeepAliveStrategy keepAliveStrategy;
    private final Log log;
    protected ManagedClientConnection managedConn;
    private final int maxRedirects;
    protected final HttpParams params;
    protected final AuthenticationHandler proxyAuthHandler;
    protected final AuthState proxyAuthState;
    protected final AuthenticationStrategy proxyAuthStrategy;
    private int redirectCount;
    protected final RedirectHandler redirectHandler;
    protected final RedirectStrategy redirectStrategy;
    protected final HttpRequestExecutor requestExec;
    protected final HttpRequestRetryHandler retryHandler;
    protected final ConnectionReuseStrategy reuseStrategy;
    protected final HttpRoutePlanner routePlanner;
    protected final AuthenticationHandler targetAuthHandler;
    protected final AuthState targetAuthState;
    protected final AuthenticationStrategy targetAuthStrategy;
    protected final UserTokenHandler userTokenHandler;
    private HttpHost virtualHost;

    public DefaultRequestDirector(HttpRequestExecutor httpRequestExecutor, ClientConnectionManager clientConnectionManager, ConnectionReuseStrategy connectionReuseStrategy, ConnectionKeepAliveStrategy connectionKeepAliveStrategy, HttpRoutePlanner httpRoutePlanner, HttpProcessor httpProcessor, HttpRequestRetryHandler httpRequestRetryHandler, RedirectHandler redirectHandler, AuthenticationHandler authenticationHandler, AuthenticationHandler authenticationHandler2, UserTokenHandler userTokenHandler, HttpParams httpParams) {
        this(LogFactory.getLog(DefaultRequestDirector.class), httpRequestExecutor, clientConnectionManager, connectionReuseStrategy, connectionKeepAliveStrategy, httpRoutePlanner, httpProcessor, httpRequestRetryHandler, new DefaultRedirectStrategyAdaptor(redirectHandler), new AuthenticationStrategyAdaptor(authenticationHandler), new AuthenticationStrategyAdaptor(authenticationHandler2), userTokenHandler, httpParams);
    }

    public DefaultRequestDirector(Log log, HttpRequestExecutor httpRequestExecutor, ClientConnectionManager clientConnectionManager, ConnectionReuseStrategy connectionReuseStrategy, ConnectionKeepAliveStrategy connectionKeepAliveStrategy, HttpRoutePlanner httpRoutePlanner, HttpProcessor httpProcessor, HttpRequestRetryHandler httpRequestRetryHandler, RedirectStrategy redirectStrategy, AuthenticationHandler authenticationHandler, AuthenticationHandler authenticationHandler2, UserTokenHandler userTokenHandler, HttpParams httpParams) {
        this(LogFactory.getLog(DefaultRequestDirector.class), httpRequestExecutor, clientConnectionManager, connectionReuseStrategy, connectionKeepAliveStrategy, httpRoutePlanner, httpProcessor, httpRequestRetryHandler, redirectStrategy, new AuthenticationStrategyAdaptor(authenticationHandler), new AuthenticationStrategyAdaptor(authenticationHandler2), userTokenHandler, httpParams);
    }

    public DefaultRequestDirector(Log log, HttpRequestExecutor httpRequestExecutor, ClientConnectionManager clientConnectionManager, ConnectionReuseStrategy connectionReuseStrategy, ConnectionKeepAliveStrategy connectionKeepAliveStrategy, HttpRoutePlanner httpRoutePlanner, HttpProcessor httpProcessor, HttpRequestRetryHandler httpRequestRetryHandler, RedirectStrategy redirectStrategy, AuthenticationStrategy authenticationStrategy, AuthenticationStrategy authenticationStrategy2, UserTokenHandler userTokenHandler, HttpParams httpParams) {
        Args.notNull(log, "Log");
        Args.notNull(httpRequestExecutor, "Request executor");
        Args.notNull(clientConnectionManager, "Client connection manager");
        Args.notNull(connectionReuseStrategy, "Connection reuse strategy");
        Args.notNull(connectionKeepAliveStrategy, "Connection keep alive strategy");
        Args.notNull(httpRoutePlanner, "Route planner");
        Args.notNull(httpProcessor, "HTTP protocol processor");
        Args.notNull(httpRequestRetryHandler, "HTTP request retry handler");
        Args.notNull(redirectStrategy, "Redirect strategy");
        Args.notNull(authenticationStrategy, "Target authentication strategy");
        Args.notNull(authenticationStrategy2, "Proxy authentication strategy");
        Args.notNull(userTokenHandler, "User token handler");
        Args.notNull(httpParams, "HTTP parameters");
        this.log = log;
        this.authenticator = new HttpAuthenticator(log);
        this.requestExec = httpRequestExecutor;
        this.connManager = clientConnectionManager;
        this.reuseStrategy = connectionReuseStrategy;
        this.keepAliveStrategy = connectionKeepAliveStrategy;
        this.routePlanner = httpRoutePlanner;
        this.httpProcessor = httpProcessor;
        this.retryHandler = httpRequestRetryHandler;
        this.redirectStrategy = redirectStrategy;
        this.targetAuthStrategy = authenticationStrategy;
        this.proxyAuthStrategy = authenticationStrategy2;
        this.userTokenHandler = userTokenHandler;
        this.params = httpParams;
        if (redirectStrategy instanceof DefaultRedirectStrategyAdaptor) {
            this.redirectHandler = ((DefaultRedirectStrategyAdaptor) redirectStrategy).getHandler();
        } else {
            this.redirectHandler = null;
        }
        if (authenticationStrategy instanceof AuthenticationStrategyAdaptor) {
            this.targetAuthHandler = ((AuthenticationStrategyAdaptor) authenticationStrategy).getHandler();
        } else {
            this.targetAuthHandler = null;
        }
        if (authenticationStrategy2 instanceof AuthenticationStrategyAdaptor) {
            this.proxyAuthHandler = ((AuthenticationStrategyAdaptor) authenticationStrategy2).getHandler();
        } else {
            this.proxyAuthHandler = null;
        }
        this.managedConn = null;
        this.execCount = 0;
        this.redirectCount = 0;
        this.targetAuthState = new AuthState();
        this.proxyAuthState = new AuthState();
        this.maxRedirects = httpParams.getIntParameter(ClientPNames.MAX_REDIRECTS, 100);
    }

    private RequestWrapper wrapRequest(HttpRequest httpRequest) throws ProtocolException {
        if (httpRequest instanceof HttpEntityEnclosingRequest) {
            return new EntityEnclosingRequestWrapper((HttpEntityEnclosingRequest) httpRequest);
        }
        return new RequestWrapper(httpRequest);
    }

    protected void rewriteRequestURI(RequestWrapper requestWrapper, HttpRoute httpRoute) throws ProtocolException {
        URI rewriteURI;
        try {
            URI uri = requestWrapper.getURI();
            if (httpRoute.getProxyHost() != null && !httpRoute.isTunnelled()) {
                if (!uri.isAbsolute()) {
                    rewriteURI = URIUtils.rewriteURI(uri, httpRoute.getTargetHost(), URIUtils.DROP_FRAGMENT_AND_NORMALIZE);
                } else {
                    rewriteURI = URIUtils.rewriteURI(uri);
                }
            } else if (uri.isAbsolute()) {
                rewriteURI = URIUtils.rewriteURI(uri, (HttpHost) null, URIUtils.DROP_FRAGMENT_AND_NORMALIZE);
            } else {
                rewriteURI = URIUtils.rewriteURI(uri);
            }
            requestWrapper.setURI(rewriteURI);
        } catch (URISyntaxException e) {
            throw new ProtocolException("Invalid URI: " + requestWrapper.getRequestLine().getUri(), e);
        }
    }

    /* JADX WARN: Code restructure failed: missing block: B:108:0x0278, code lost:
        r12.managedConn.markReusable();
     */
    @Override // org.apache.http.client.RequestDirector
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public org.apache.http.HttpResponse execute(org.apache.http.HttpHost r13, org.apache.http.HttpRequest r14, org.apache.http.protocol.HttpContext r15) throws org.apache.http.HttpException, java.io.IOException {
        /*
            Method dump skipped, instructions count: 664
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: org.apache.http.impl.client.DefaultRequestDirector.execute(org.apache.http.HttpHost, org.apache.http.HttpRequest, org.apache.http.protocol.HttpContext):org.apache.http.HttpResponse");
    }

    private void tryConnect(RoutedRequest routedRequest, HttpContext httpContext) throws HttpException, IOException {
        HttpRoute route = routedRequest.getRoute();
        RequestWrapper request = routedRequest.getRequest();
        int i = 0;
        while (true) {
            httpContext.setAttribute("http.request", request);
            i++;
            try {
                if (!this.managedConn.isOpen()) {
                    this.managedConn.open(route, httpContext, this.params);
                } else {
                    this.managedConn.setSocketTimeout(HttpConnectionParams.getSoTimeout(this.params));
                }
                establishRoute(route, httpContext);
                return;
            } catch (IOException e) {
                try {
                    this.managedConn.close();
                } catch (IOException unused) {
                }
                if (this.retryHandler.retryRequest(e, i, httpContext)) {
                    if (this.log.isInfoEnabled()) {
                        Log log = this.log;
                        log.info("I/O exception (" + e.getClass().getName() + ") caught when connecting to " + route + ": " + e.getMessage());
                        if (this.log.isDebugEnabled()) {
                            this.log.debug(e.getMessage(), e);
                        }
                        Log log2 = this.log;
                        log2.info("Retrying connect to " + route);
                    }
                } else {
                    throw e;
                }
            }
        }
    }

    private HttpResponse tryExecute(RoutedRequest routedRequest, HttpContext httpContext) throws HttpException, IOException {
        RequestWrapper request = routedRequest.getRequest();
        HttpRoute route = routedRequest.getRoute();
        IOException e = null;
        while (true) {
            this.execCount++;
            request.incrementExecCount();
            if (!request.isRepeatable()) {
                this.log.debug("Cannot retry non-repeatable request");
                if (e != null) {
                    throw new NonRepeatableRequestException("Cannot retry request with a non-repeatable request entity.  The cause lists the reason the original request failed.", e);
                }
                throw new NonRepeatableRequestException("Cannot retry request with a non-repeatable request entity.");
            }
            try {
                if (!this.managedConn.isOpen()) {
                    if (!route.isTunnelled()) {
                        this.log.debug("Reopening the direct connection.");
                        this.managedConn.open(route, httpContext, this.params);
                    } else {
                        this.log.debug("Proxied connection. Need to start over.");
                        return null;
                    }
                }
                if (this.log.isDebugEnabled()) {
                    this.log.debug("Attempt " + this.execCount + " to execute request");
                }
                return this.requestExec.execute(request, this.managedConn, httpContext);
            } catch (IOException e2) {
                e = e2;
                this.log.debug("Closing the connection.");
                try {
                    this.managedConn.close();
                } catch (IOException unused) {
                }
                if (this.retryHandler.retryRequest(e, request.getExecCount(), httpContext)) {
                    if (this.log.isInfoEnabled()) {
                        this.log.info("I/O exception (" + e.getClass().getName() + ") caught when processing request to " + route + ": " + e.getMessage());
                    }
                    if (this.log.isDebugEnabled()) {
                        this.log.debug(e.getMessage(), e);
                    }
                    if (this.log.isInfoEnabled()) {
                        this.log.info("Retrying request to " + route);
                    }
                } else if (e instanceof NoHttpResponseException) {
                    NoHttpResponseException noHttpResponseException = new NoHttpResponseException(route.getTargetHost().toHostString() + " failed to respond");
                    noHttpResponseException.setStackTrace(e.getStackTrace());
                    throw noHttpResponseException;
                } else {
                    throw e;
                }
            }
        }
    }

    protected void releaseConnection() {
        try {
            this.managedConn.releaseConnection();
        } catch (IOException e) {
            this.log.debug("IOException releasing connection", e);
        }
        this.managedConn = null;
    }

    protected HttpRoute determineRoute(HttpHost httpHost, HttpRequest httpRequest, HttpContext httpContext) throws HttpException {
        HttpRoutePlanner httpRoutePlanner = this.routePlanner;
        if (httpHost == null) {
            httpHost = (HttpHost) httpRequest.getParams().getParameter(ClientPNames.DEFAULT_HOST);
        }
        return httpRoutePlanner.determineRoute(httpHost, httpRequest, httpContext);
    }

    protected void establishRoute(HttpRoute httpRoute, HttpContext httpContext) throws HttpException, IOException {
        int nextStep;
        BasicRouteDirector basicRouteDirector = new BasicRouteDirector();
        do {
            HttpRoute route = this.managedConn.getRoute();
            nextStep = basicRouteDirector.nextStep(httpRoute, route);
            switch (nextStep) {
                case -1:
                    throw new HttpException("Unable to establish route: planned = " + httpRoute + "; current = " + route);
                case 0:
                    break;
                case 1:
                case 2:
                    this.managedConn.open(httpRoute, httpContext, this.params);
                    continue;
                case 3:
                    boolean createTunnelToTarget = createTunnelToTarget(httpRoute, httpContext);
                    this.log.debug("Tunnel to target created.");
                    this.managedConn.tunnelTarget(createTunnelToTarget, this.params);
                    continue;
                case 4:
                    int hopCount = route.getHopCount() - 1;
                    boolean createTunnelToProxy = createTunnelToProxy(httpRoute, hopCount, httpContext);
                    this.log.debug("Tunnel to proxy created.");
                    this.managedConn.tunnelProxy(httpRoute.getHopTarget(hopCount), createTunnelToProxy, this.params);
                    continue;
                case 5:
                    this.managedConn.layerProtocol(httpContext, this.params);
                    continue;
                default:
                    throw new IllegalStateException("Unknown step indicator " + nextStep + " from RouteDirector.");
            }
        } while (nextStep > 0);
    }

    protected boolean createTunnelToTarget(HttpRoute httpRoute, HttpContext httpContext) throws HttpException, IOException {
        HttpResponse execute;
        HttpHost proxyHost = httpRoute.getProxyHost();
        HttpHost targetHost = httpRoute.getTargetHost();
        while (true) {
            if (!this.managedConn.isOpen()) {
                this.managedConn.open(httpRoute, httpContext, this.params);
            }
            HttpRequest createConnectRequest = createConnectRequest(httpRoute, httpContext);
            createConnectRequest.setParams(this.params);
            httpContext.setAttribute("http.target_host", targetHost);
            httpContext.setAttribute("http.route", httpRoute);
            httpContext.setAttribute(ExecutionContext.HTTP_PROXY_HOST, proxyHost);
            httpContext.setAttribute("http.connection", this.managedConn);
            httpContext.setAttribute("http.request", createConnectRequest);
            this.requestExec.preProcess(createConnectRequest, this.httpProcessor, httpContext);
            execute = this.requestExec.execute(createConnectRequest, this.managedConn, httpContext);
            execute.setParams(this.params);
            this.requestExec.postProcess(execute, this.httpProcessor, httpContext);
            if (execute.getStatusLine().getStatusCode() < 200) {
                throw new HttpException("Unexpected response to CONNECT request: " + execute.getStatusLine());
            } else if (HttpClientParams.isAuthenticating(this.params)) {
                if (!this.authenticator.isAuthenticationRequested(proxyHost, execute, this.proxyAuthStrategy, this.proxyAuthState, httpContext) || !this.authenticator.authenticate(proxyHost, execute, this.proxyAuthStrategy, this.proxyAuthState, httpContext)) {
                    break;
                } else if (this.reuseStrategy.keepAlive(execute, httpContext)) {
                    this.log.debug("Connection kept alive");
                    EntityUtils.consume(execute.getEntity());
                } else {
                    this.managedConn.close();
                }
            }
        }
        if (execute.getStatusLine().getStatusCode() > 299) {
            HttpEntity entity = execute.getEntity();
            if (entity != null) {
                execute.setEntity(new BufferedHttpEntity(entity));
            }
            this.managedConn.close();
            throw new TunnelRefusedException("CONNECT refused by proxy: " + execute.getStatusLine(), execute);
        }
        this.managedConn.markReusable();
        return false;
    }

    protected boolean createTunnelToProxy(HttpRoute httpRoute, int i, HttpContext httpContext) throws HttpException, IOException {
        throw new HttpException("Proxy chains are not supported.");
    }

    protected HttpRequest createConnectRequest(HttpRoute httpRoute, HttpContext httpContext) {
        HttpHost targetHost = httpRoute.getTargetHost();
        String hostName = targetHost.getHostName();
        int port = targetHost.getPort();
        if (port < 0) {
            port = this.connManager.getSchemeRegistry().getScheme(targetHost.getSchemeName()).getDefaultPort();
        }
        StringBuilder sb = new StringBuilder(hostName.length() + 6);
        sb.append(hostName);
        sb.append(':');
        sb.append(Integer.toString(port));
        return new BasicHttpRequest("CONNECT", sb.toString(), HttpProtocolParams.getVersion(this.params));
    }

    protected RoutedRequest handleResponse(RoutedRequest routedRequest, HttpResponse httpResponse, HttpContext httpContext) throws HttpException, IOException {
        HttpHost httpHost;
        HttpRoute route = routedRequest.getRoute();
        RequestWrapper request = routedRequest.getRequest();
        HttpParams params = request.getParams();
        if (HttpClientParams.isAuthenticating(params)) {
            HttpHost httpHost2 = (HttpHost) httpContext.getAttribute("http.target_host");
            if (httpHost2 == null) {
                httpHost2 = route.getTargetHost();
            }
            if (httpHost2.getPort() < 0) {
                httpHost = new HttpHost(httpHost2.getHostName(), this.connManager.getSchemeRegistry().getScheme(httpHost2).getDefaultPort(), httpHost2.getSchemeName());
            } else {
                httpHost = httpHost2;
            }
            boolean isAuthenticationRequested = this.authenticator.isAuthenticationRequested(httpHost, httpResponse, this.targetAuthStrategy, this.targetAuthState, httpContext);
            HttpHost proxyHost = route.getProxyHost();
            if (proxyHost == null) {
                proxyHost = route.getTargetHost();
            }
            HttpHost httpHost3 = proxyHost;
            boolean isAuthenticationRequested2 = this.authenticator.isAuthenticationRequested(httpHost3, httpResponse, this.proxyAuthStrategy, this.proxyAuthState, httpContext);
            if (isAuthenticationRequested) {
                if (this.authenticator.authenticate(httpHost, httpResponse, this.targetAuthStrategy, this.targetAuthState, httpContext)) {
                    return routedRequest;
                }
            }
            if (isAuthenticationRequested2 && this.authenticator.authenticate(httpHost3, httpResponse, this.proxyAuthStrategy, this.proxyAuthState, httpContext)) {
                return routedRequest;
            }
        }
        if (HttpClientParams.isRedirecting(params) && this.redirectStrategy.isRedirected(request, httpResponse, httpContext)) {
            int i = this.redirectCount;
            if (i >= this.maxRedirects) {
                throw new RedirectException("Maximum redirects (" + this.maxRedirects + ") exceeded");
            }
            this.redirectCount = i + 1;
            this.virtualHost = null;
            HttpUriRequest redirect = this.redirectStrategy.getRedirect(request, httpResponse, httpContext);
            redirect.setHeaders(request.getOriginal().getAllHeaders());
            URI uri = redirect.getURI();
            HttpHost extractHost = URIUtils.extractHost(uri);
            if (extractHost == null) {
                throw new ProtocolException("Redirect URI does not specify a valid host name: " + uri);
            }
            if (!route.getTargetHost().equals(extractHost)) {
                this.log.debug("Resetting target auth state");
                this.targetAuthState.reset();
                AuthScheme authScheme = this.proxyAuthState.getAuthScheme();
                if (authScheme != null && authScheme.isConnectionBased()) {
                    this.log.debug("Resetting proxy auth state");
                    this.proxyAuthState.reset();
                }
            }
            RequestWrapper wrapRequest = wrapRequest(redirect);
            wrapRequest.setParams(params);
            HttpRoute determineRoute = determineRoute(extractHost, wrapRequest, httpContext);
            RoutedRequest routedRequest2 = new RoutedRequest(wrapRequest, determineRoute);
            if (this.log.isDebugEnabled()) {
                Log log = this.log;
                log.debug("Redirecting to '" + uri + "' via " + determineRoute);
            }
            return routedRequest2;
        }
        return null;
    }

    private void abortConnection() {
        ManagedClientConnection managedClientConnection = this.managedConn;
        if (managedClientConnection != null) {
            this.managedConn = null;
            try {
                managedClientConnection.abortConnection();
            } catch (IOException e) {
                if (this.log.isDebugEnabled()) {
                    this.log.debug(e.getMessage(), e);
                }
            }
            try {
                managedClientConnection.releaseConnection();
            } catch (IOException e2) {
                this.log.debug("Error releasing connection", e2);
            }
        }
    }
}
