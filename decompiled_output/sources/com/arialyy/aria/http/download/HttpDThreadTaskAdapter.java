package com.arialyy.aria.http.download;

import com.arialyy.aria.core.common.RequestEnum;
import com.arialyy.aria.core.common.SubThreadConfig;
import com.arialyy.aria.core.download.DTaskWrapper;
import com.arialyy.aria.exception.AriaHTTPException;
import com.arialyy.aria.http.BaseHttpThreadTaskAdapter;
import com.arialyy.aria.http.ConnectionHelp;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.BufferedRandomAccessFile;
import java.io.BufferedInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URLEncoder;
import java.util.Map;
import java.util.Set;
import org.apache.http.HttpHeaders;
/* loaded from: classes.dex */
final class HttpDThreadTaskAdapter extends BaseHttpThreadTaskAdapter {
    private final String TAG;
    private DTaskWrapper mTaskWrapper;

    /* JADX INFO: Access modifiers changed from: package-private */
    public HttpDThreadTaskAdapter(SubThreadConfig subThreadConfig) {
        super(subThreadConfig);
        this.TAG = "HttpDThreadTaskAdapter";
    }

    @Override // com.arialyy.aria.core.task.AbsThreadTaskAdapter
    protected void handlerThreadTask() {
        BufferedInputStream bufferedInputStream;
        HttpURLConnection httpURLConnection;
        Exception e;
        ArrayIndexOutOfBoundsException e2;
        IOException e3;
        MalformedURLException e4;
        Map<String, String> params;
        this.mTaskWrapper = (DTaskWrapper) getTaskWrapper();
        if (getThreadRecord().isComplete) {
            handleComplete();
            return;
        }
        BufferedRandomAccessFile bufferedRandomAccessFile = null;
        try {
            try {
                try {
                    httpURLConnection = ConnectionHelp.handleConnection(ConnectionHelp.handleUrl(getThreadConfig().url, this.mTaskOption), this.mTaskOption);
                    try {
                        if (this.mTaskWrapper.isSupportBP()) {
                            ALog.d("HttpDThreadTaskAdapter", String.format("任务【%s】线程__%s__开始下载【开始位置 : %s，结束位置：%s】", getFileName(), Integer.valueOf(getThreadRecord().threadId), Long.valueOf(getThreadRecord().startLocation), Long.valueOf(getThreadRecord().endLocation)));
                            httpURLConnection.setRequestProperty(HttpHeaders.RANGE, String.format("bytes=%s-%s", Long.valueOf(getThreadRecord().startLocation), Long.valueOf(getThreadRecord().endLocation - 1)));
                        } else {
                            ALog.w("HttpDThreadTaskAdapter", "该下载不支持断点");
                        }
                        ConnectionHelp.setConnectParam(this.mTaskOption, httpURLConnection);
                        httpURLConnection.setConnectTimeout(getTaskConfig().getConnectTimeOut());
                        httpURLConnection.setReadTimeout(getTaskConfig().getIOTimeOut());
                        if (this.mTaskOption.isChunked()) {
                            httpURLConnection.setDoInput(true);
                            httpURLConnection.setChunkedStreamingMode(0);
                        }
                        httpURLConnection.connect();
                        if (this.mTaskOption.getRequestEnum() == RequestEnum.POST && (params = this.mTaskOption.getParams()) != null) {
                            OutputStreamWriter outputStreamWriter = new OutputStreamWriter(httpURLConnection.getOutputStream());
                            Set<String> keySet = params.keySet();
                            StringBuilder sb = new StringBuilder();
                            for (String str : keySet) {
                                sb.append(str);
                                sb.append("=");
                                sb.append(URLEncoder.encode(params.get(str)));
                                sb.append("&");
                            }
                            String sb2 = sb.toString();
                            outputStreamWriter.write(sb2.substring(0, sb2.length() - 1));
                            outputStreamWriter.flush();
                            outputStreamWriter.close();
                        }
                        bufferedInputStream = new BufferedInputStream(ConnectionHelp.convertInputStream(httpURLConnection));
                        try {
                            if (this.mTaskOption.isChunked()) {
                                readChunked(bufferedInputStream);
                            } else if (getThreadConfig().isBlock) {
                                readDynamicFile(bufferedInputStream);
                            } else {
                                BufferedRandomAccessFile bufferedRandomAccessFile2 = new BufferedRandomAccessFile(getThreadConfig().tempFile, "rwd", getTaskConfig().getBuffSize());
                                try {
                                    if (getThreadRecord().startLocation > 0) {
                                        bufferedRandomAccessFile2.seek(getThreadRecord().startLocation);
                                    }
                                    readNormal(bufferedInputStream, bufferedRandomAccessFile2);
                                    handleComplete();
                                    bufferedRandomAccessFile = bufferedRandomAccessFile2;
                                } catch (IOException e5) {
                                    e3 = e5;
                                    bufferedRandomAccessFile = bufferedRandomAccessFile2;
                                    fail(new AriaHTTPException(String.format("任务【%s】下载失败，filePath: %s, url: %s", getFileName(), getEntity().getFilePath(), getEntity().getUrl()), e3), true);
                                    if (bufferedRandomAccessFile != null) {
                                        bufferedRandomAccessFile.close();
                                    }
                                    if (bufferedInputStream != null) {
                                        bufferedInputStream.close();
                                    }
                                    if (httpURLConnection != null) {
                                        httpURLConnection.getInputStream().close();
                                        httpURLConnection.disconnect();
                                        return;
                                    }
                                    return;
                                } catch (ArrayIndexOutOfBoundsException e6) {
                                    e2 = e6;
                                    bufferedRandomAccessFile = bufferedRandomAccessFile2;
                                    fail(new AriaHTTPException(String.format("任务【%s】下载失败，filePath: %s, url: %s", getFileName(), getEntity().getFilePath(), getEntity().getUrl()), e2), false);
                                    if (bufferedRandomAccessFile != null) {
                                        bufferedRandomAccessFile.close();
                                    }
                                    if (bufferedInputStream != null) {
                                        bufferedInputStream.close();
                                    }
                                    if (httpURLConnection != null) {
                                        httpURLConnection.getInputStream().close();
                                        httpURLConnection.disconnect();
                                        return;
                                    }
                                    return;
                                } catch (MalformedURLException e7) {
                                    e4 = e7;
                                    bufferedRandomAccessFile = bufferedRandomAccessFile2;
                                    fail(new AriaHTTPException(String.format("任务【%s】下载失败，filePath: %s, url: %s", getFileName(), getEntity().getFilePath(), getEntity().getUrl()), e4), false);
                                    if (bufferedRandomAccessFile != null) {
                                        bufferedRandomAccessFile.close();
                                    }
                                    if (bufferedInputStream != null) {
                                        bufferedInputStream.close();
                                    }
                                    if (httpURLConnection != null) {
                                        httpURLConnection.getInputStream().close();
                                        httpURLConnection.disconnect();
                                        return;
                                    }
                                    return;
                                } catch (Exception e8) {
                                    e = e8;
                                    bufferedRandomAccessFile = bufferedRandomAccessFile2;
                                    fail(new AriaHTTPException(String.format("任务【%s】下载失败，filePath: %s, url: %s", getFileName(), getEntity().getFilePath(), getEntity().getUrl()), e), false);
                                    if (bufferedRandomAccessFile != null) {
                                        bufferedRandomAccessFile.close();
                                    }
                                    if (bufferedInputStream != null) {
                                        bufferedInputStream.close();
                                    }
                                    if (httpURLConnection != null) {
                                        httpURLConnection.getInputStream().close();
                                        httpURLConnection.disconnect();
                                        return;
                                    }
                                    return;
                                } catch (Throwable th) {
                                    th = th;
                                    bufferedRandomAccessFile = bufferedRandomAccessFile2;
                                    if (bufferedRandomAccessFile != null) {
                                        try {
                                            bufferedRandomAccessFile.close();
                                        } catch (IOException e9) {
                                            e9.printStackTrace();
                                            throw th;
                                        }
                                    }
                                    if (bufferedInputStream != null) {
                                        bufferedInputStream.close();
                                    }
                                    if (httpURLConnection != null) {
                                        httpURLConnection.getInputStream().close();
                                        httpURLConnection.disconnect();
                                    }
                                    throw th;
                                }
                            }
                            if (bufferedRandomAccessFile != null) {
                                bufferedRandomAccessFile.close();
                            }
                            bufferedInputStream.close();
                            if (httpURLConnection != null) {
                                httpURLConnection.getInputStream().close();
                                httpURLConnection.disconnect();
                            }
                        } catch (IOException e10) {
                            e3 = e10;
                        } catch (ArrayIndexOutOfBoundsException e11) {
                            e2 = e11;
                        } catch (MalformedURLException e12) {
                            e4 = e12;
                        } catch (Exception e13) {
                            e = e13;
                        }
                    } catch (MalformedURLException e14) {
                        e4 = e14;
                        bufferedInputStream = null;
                    } catch (IOException e15) {
                        e3 = e15;
                        bufferedInputStream = null;
                    } catch (ArrayIndexOutOfBoundsException e16) {
                        e2 = e16;
                        bufferedInputStream = null;
                    } catch (Exception e17) {
                        e = e17;
                        bufferedInputStream = null;
                    } catch (Throwable th2) {
                        th = th2;
                        bufferedInputStream = null;
                    }
                } catch (IOException e18) {
                    e18.printStackTrace();
                }
            } catch (MalformedURLException e19) {
                httpURLConnection = null;
                e4 = e19;
                bufferedInputStream = null;
            } catch (IOException e20) {
                httpURLConnection = null;
                e3 = e20;
                bufferedInputStream = null;
            } catch (ArrayIndexOutOfBoundsException e21) {
                httpURLConnection = null;
                e2 = e21;
                bufferedInputStream = null;
            } catch (Exception e22) {
                httpURLConnection = null;
                e = e22;
                bufferedInputStream = null;
            } catch (Throwable th3) {
                th = th3;
                httpURLConnection = null;
                bufferedInputStream = null;
            }
        } catch (Throwable th4) {
            th = th4;
        }
    }

    private void readChunked(InputStream inputStream) {
        FileOutputStream fileOutputStream;
        int read;
        FileOutputStream fileOutputStream2 = null;
        try {
            try {
                try {
                    fileOutputStream = new FileOutputStream(getThreadConfig().tempFile, true);
                } catch (IOException e) {
                    e = e;
                }
            } catch (Throwable th) {
                th = th;
            }
            try {
                byte[] bArr = new byte[getTaskConfig().getBuffSize()];
                while (getThreadTask().isLive() && (read = inputStream.read(bArr)) != -1 && !getThreadTask().isBreak()) {
                    if (this.mSpeedBandUtil != null) {
                        this.mSpeedBandUtil.limitNextBytes(read);
                    }
                    fileOutputStream.write(bArr, 0, read);
                    progress(read);
                }
                handleComplete();
                fileOutputStream.close();
            } catch (IOException e2) {
                e = e2;
                fileOutputStream2 = fileOutputStream;
                fail(new AriaHTTPException(String.format("文件下载失败，savePath: %s, url: %s", getEntity().getFilePath(), getThreadConfig().url), e), true);
                if (fileOutputStream2 != null) {
                    fileOutputStream2.close();
                }
            } catch (Throwable th2) {
                th = th2;
                fileOutputStream2 = fileOutputStream;
                if (fileOutputStream2 != null) {
                    try {
                        fileOutputStream2.close();
                    } catch (IOException e3) {
                        e3.printStackTrace();
                    }
                }
                throw th;
            }
        } catch (IOException e4) {
            e4.printStackTrace();
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:57:0x00fe A[Catch: IOException -> 0x00fa, TryCatch #1 {IOException -> 0x00fa, blocks: (B:53:0x00f3, B:57:0x00fe, B:59:0x0103), top: B:65:0x00f3 }] */
    /* JADX WARN: Removed duplicated region for block: B:59:0x0103 A[Catch: IOException -> 0x00fa, TRY_LEAVE, TryCatch #1 {IOException -> 0x00fa, blocks: (B:53:0x00f3, B:57:0x00fe, B:59:0x0103), top: B:65:0x00f3 }] */
    /* JADX WARN: Removed duplicated region for block: B:65:0x00f3 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void readDynamicFile(java.io.InputStream r14) {
        /*
            Method dump skipped, instructions count: 267
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.arialyy.aria.http.download.HttpDThreadTaskAdapter.readDynamicFile(java.io.InputStream):void");
    }

    private void readNormal(InputStream inputStream, BufferedRandomAccessFile bufferedRandomAccessFile) throws IOException {
        int read;
        byte[] bArr = new byte[getTaskConfig().getBuffSize()];
        while (getThreadTask().isLive() && (read = inputStream.read(bArr)) != -1 && !getThreadTask().isBreak()) {
            if (this.mSpeedBandUtil != null) {
                this.mSpeedBandUtil.limitNextBytes(read);
            }
            bufferedRandomAccessFile.write(bArr, 0, read);
            progress(read);
        }
    }

    private void handleComplete() {
        if (!getThreadTask().isBreak() && getThreadTask().checkBlock()) {
            complete();
        }
    }
}
