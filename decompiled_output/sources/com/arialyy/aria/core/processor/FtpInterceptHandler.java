package com.arialyy.aria.core.processor;

import android.text.TextUtils;
/* loaded from: classes.dex */
public class FtpInterceptHandler {
    private boolean coverServerFile;
    private String newFileName;

    private FtpInterceptHandler() {
    }

    public boolean isCoverServerFile() {
        return this.coverServerFile;
    }

    public String getNewFileName() {
        return this.newFileName;
    }

    /* loaded from: classes.dex */
    public static final class Builder {
        private String newFileName;
        private boolean coverServerFile = false;
        private boolean stopUpload = false;

        public Builder coverServerFile() {
            this.coverServerFile = true;
            return this;
        }

        public Builder resetFileName(String str) {
            this.newFileName = str;
            return this;
        }

        public Builder stopUpload() {
            this.stopUpload = true;
            return this;
        }

        public FtpInterceptHandler build() {
            FtpInterceptHandler ftpInterceptHandler = new FtpInterceptHandler();
            if (this.coverServerFile) {
                ftpInterceptHandler.coverServerFile = true;
            } else if (!TextUtils.isEmpty(this.newFileName)) {
                ftpInterceptHandler.newFileName = this.newFileName;
            }
            return ftpInterceptHandler;
        }
    }
}
