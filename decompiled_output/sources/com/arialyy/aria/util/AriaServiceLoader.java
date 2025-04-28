package com.arialyy.aria.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.ServiceConfigurationError;
/* loaded from: classes.dex */
public class AriaServiceLoader<S> {
    private static final String PREFIX = "META-INF/services/";
    private static final String TAG = "AriaServiceLoader";
    private AriaServiceLoader<S>.LazyLoader lazyLoader;
    private final ClassLoader loader;
    private final Class<S> service;

    public void reload() {
        this.lazyLoader = new LazyLoader(this.service, this.loader);
    }

    private AriaServiceLoader(Class<S> cls, ClassLoader classLoader) {
        this.service = cls;
        this.loader = classLoader == null ? ClassLoader.getSystemClassLoader() : classLoader;
        reload();
    }

    public static <S> AriaServiceLoader<S> load(Class<S> cls, ClassLoader classLoader) {
        return new AriaServiceLoader<>(cls, classLoader);
    }

    public static <S> AriaServiceLoader<S> load(Class<S> cls) {
        Thread.currentThread().setContextClassLoader(AriaServiceLoader.class.getClassLoader());
        return load(cls, Thread.currentThread().getContextClassLoader());
    }

    public S getService(String str) {
        return (S) this.lazyLoader.loadService(str);
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class LazyLoader {
        private Enumeration<URL> configs;
        private ClassLoader loader;
        private List<String> pending;
        private Class<S> service;

        private LazyLoader(Class<S> cls, ClassLoader classLoader) {
            this.configs = null;
            this.pending = null;
            this.service = cls;
            this.loader = classLoader;
            parseConfig();
        }

        private List<String> parse(Class<?> cls, URL url) throws ServiceConfigurationError {
            InputStream inputStream;
            ArrayList arrayList = new ArrayList();
            BufferedReader bufferedReader = null;
            try {
                try {
                    inputStream = url.openStream();
                    try {
                        try {
                            BufferedReader bufferedReader2 = new BufferedReader(new InputStreamReader(inputStream, "utf-8"));
                            int i = 1;
                            do {
                                try {
                                    i = parseLine(cls, url, bufferedReader2, i, arrayList);
                                } catch (IOException e) {
                                    e = e;
                                    bufferedReader = bufferedReader2;
                                    fail(cls, "Error reading configuration file", e);
                                    if (bufferedReader != null) {
                                        bufferedReader.close();
                                    }
                                    if (inputStream != null) {
                                        inputStream.close();
                                    }
                                    return arrayList;
                                } catch (Throwable th) {
                                    th = th;
                                    bufferedReader = bufferedReader2;
                                    if (bufferedReader != null) {
                                        try {
                                            bufferedReader.close();
                                        } catch (IOException e2) {
                                            fail(cls, "Error closing configuration file", e2);
                                            throw th;
                                        }
                                    }
                                    if (inputStream != null) {
                                        inputStream.close();
                                    }
                                    throw th;
                                }
                            } while (i >= 0);
                            bufferedReader2.close();
                            if (inputStream != null) {
                                inputStream.close();
                            }
                        } catch (IOException e3) {
                            e = e3;
                        }
                    } catch (Throwable th2) {
                        th = th2;
                    }
                } catch (IOException e4) {
                    fail(cls, "Error closing configuration file", e4);
                }
            } catch (IOException e5) {
                e = e5;
                inputStream = null;
            } catch (Throwable th3) {
                th = th3;
                inputStream = null;
            }
            return arrayList;
        }

        private void fail(Class<?> cls, String str, Throwable th) throws ServiceConfigurationError {
            throw new ServiceConfigurationError(cls.getName() + ": " + str, th);
        }

        private void fail(Class<?> cls, String str) throws ServiceConfigurationError {
            throw new ServiceConfigurationError(cls.getName() + ": " + str);
        }

        private void fail(Class<?> cls, URL url, int i, String str) throws ServiceConfigurationError {
            fail(cls, url + ":" + i + ": " + str);
        }

        private int parseLine(Class<?> cls, URL url, BufferedReader bufferedReader, int i, List<String> list) throws IOException, ServiceConfigurationError {
            String readLine = bufferedReader.readLine();
            if (readLine == null) {
                return -1;
            }
            int indexOf = readLine.indexOf(35);
            if (indexOf >= 0) {
                readLine = readLine.substring(0, indexOf);
            }
            String trim = readLine.trim();
            int length = trim.length();
            if (length != 0) {
                if (trim.indexOf(32) >= 0 || trim.indexOf(9) >= 0) {
                    fail(cls, url, i, "Illegal configuration-file syntax");
                }
                int codePointAt = trim.codePointAt(0);
                if (!Character.isJavaIdentifierStart(codePointAt)) {
                    fail(cls, url, i, "Illegal provider-class name: " + trim);
                }
                int charCount = Character.charCount(codePointAt);
                while (charCount < length) {
                    int codePointAt2 = trim.codePointAt(charCount);
                    if (!Character.isJavaIdentifierPart(codePointAt2) && codePointAt2 != 46) {
                        fail(cls, url, i, "Illegal provider-class name: " + trim);
                    }
                    charCount += Character.charCount(codePointAt2);
                }
                if (!list.contains(trim)) {
                    list.add(trim);
                }
            }
            return i + 1;
        }

        /* JADX INFO: Access modifiers changed from: private */
        public S loadService(String str) {
            Class<?> cls;
            List<String> list = this.pending;
            if (list == null) {
                ALog.e(AriaServiceLoader.TAG, "pending为空");
                return null;
            }
            for (String str2 : list) {
                if (str2.equals(str)) {
                    try {
                        cls = Class.forName(str, false, this.loader);
                    } catch (ClassNotFoundException e) {
                        Class<S> cls2 = this.service;
                        fail(cls2, "Provider " + str + " not found", e);
                        cls = null;
                    }
                    if (!this.service.isAssignableFrom(cls)) {
                        Throwable classCastException = new ClassCastException(this.service.getCanonicalName() + " is not assignable from " + cls.getCanonicalName());
                        Class<S> cls3 = this.service;
                        fail(cls3, "Provider " + str + " not a subtype", classCastException);
                    }
                    try {
                        return this.service.cast(cls.newInstance());
                    } catch (Throwable th) {
                        Class<S> cls4 = this.service;
                        fail(cls4, "Provider " + str + " could not be instantiated", th);
                    }
                }
            }
            throw new Error();
        }

        /*  JADX ERROR: JadxOverflowException in pass: RegionMakerVisitor
            jadx.core.utils.exceptions.JadxOverflowException: Regions count limit reached
            	at jadx.core.utils.ErrorsCounter.addError(ErrorsCounter.java:56)
            	at jadx.core.utils.ErrorsCounter.error(ErrorsCounter.java:30)
            	at jadx.core.dex.attributes.nodes.NotificationAttrNode.addError(NotificationAttrNode.java:18)
            */
        /* JADX WARN: Removed duplicated region for block: B:13:0x0039  */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:10:0x002e -> B:11:0x0035). Please submit an issue!!! */
        /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:21:0x0035 -> B:11:0x0035). Please submit an issue!!! */
        /*
            Code decompiled incorrectly, please refer to instructions dump.
            To view partially-correct add '--show-bad-code' argument
        */
        private void parseConfig() {
            /*
                r3 = this;
                java.util.Enumeration<java.net.URL> r0 = r3.configs
                if (r0 != 0) goto L35
                java.lang.StringBuilder r0 = new java.lang.StringBuilder     // Catch: java.io.IOException -> L2d
                r0.<init>()     // Catch: java.io.IOException -> L2d
                java.lang.String r1 = "META-INF/services/"
                r0.append(r1)     // Catch: java.io.IOException -> L2d
                java.lang.Class<S> r1 = r3.service     // Catch: java.io.IOException -> L2d
                java.lang.String r1 = r1.getName()     // Catch: java.io.IOException -> L2d
                r0.append(r1)     // Catch: java.io.IOException -> L2d
                java.lang.String r0 = r0.toString()     // Catch: java.io.IOException -> L2d
                java.lang.ClassLoader r1 = r3.loader     // Catch: java.io.IOException -> L2d
                if (r1 != 0) goto L26
                java.util.Enumeration r0 = java.lang.ClassLoader.getSystemResources(r0)     // Catch: java.io.IOException -> L2d
                r3.configs = r0     // Catch: java.io.IOException -> L2d
                goto L35
            L26:
                java.util.Enumeration r0 = r1.getResources(r0)     // Catch: java.io.IOException -> L2d
                r3.configs = r0     // Catch: java.io.IOException -> L2d
                goto L35
            L2d:
                r0 = move-exception
                java.lang.Class<S> r1 = r3.service
                java.lang.String r2 = "Error locating configuration files"
                r3.fail(r1, r2, r0)
            L35:
                java.util.List<java.lang.String> r0 = r3.pending
                if (r0 == 0) goto L41
                boolean r0 = r0.isEmpty()
                if (r0 == 0) goto L40
                goto L41
            L40:
                return
            L41:
                java.util.Enumeration<java.net.URL> r0 = r3.configs
                boolean r0 = r0.hasMoreElements()
                if (r0 != 0) goto L4a
                return
            L4a:
                java.lang.Class<S> r0 = r3.service
                java.util.Enumeration<java.net.URL> r1 = r3.configs
                java.lang.Object r1 = r1.nextElement()
                java.net.URL r1 = (java.net.URL) r1
                java.util.List r0 = r3.parse(r0, r1)
                r3.pending = r0
                goto L35
            */
            throw new UnsupportedOperationException("Method not decompiled: com.arialyy.aria.util.AriaServiceLoader.LazyLoader.parseConfig():void");
        }
    }
}
