package com.arialyy.aria.core.upload;

import android.text.TextUtils;
import com.arialyy.aria.core.inf.ICheckEntityUtil;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CheckUtil;
import java.io.File;
/* loaded from: classes.dex */
public class CheckUEntityUtil implements ICheckEntityUtil {
    private final String TAG = "CheckUEntityUtil";
    private int action;
    private UploadEntity mEntity;
    private UTaskWrapper mWrapper;

    public static CheckUEntityUtil newInstance(UTaskWrapper uTaskWrapper, int i) {
        return new CheckUEntityUtil(uTaskWrapper, i);
    }

    private CheckUEntityUtil(UTaskWrapper uTaskWrapper, int i) {
        this.action = i;
        this.mWrapper = uTaskWrapper;
        this.mEntity = uTaskWrapper.getEntity();
    }

    @Override // com.arialyy.aria.core.inf.ICheckEntityUtil
    public boolean checkEntity() {
        boolean z = true;
        if (this.mWrapper.getErrorEvent() != null) {
            ALog.e("CheckUEntityUtil", String.format("任务操作失败，%s", this.mWrapper.getErrorEvent().errorMsg));
            return false;
        }
        if (!checkUrl() || !checkFilePath()) {
            z = false;
        }
        if (z) {
            this.mEntity.save();
        }
        return z;
    }

    private boolean checkFilePath() {
        String filePath = this.mEntity.getFilePath();
        if (TextUtils.isEmpty(filePath)) {
            ALog.e("CheckUEntityUtil", "上传失败，文件路径为null");
            return false;
        } else if (!filePath.startsWith("/")) {
            ALog.e("CheckUEntityUtil", "上传失败，文件路径【" + filePath + "】不合法");
            return false;
        } else if (!this.mWrapper.isNewTask() || CheckUtil.checkUPathConflicts(this.mWrapper.isIgnoreFilePathOccupy(), filePath, this.mWrapper.getRequestType())) {
            File file = new File(this.mEntity.getFilePath());
            if (!file.exists()) {
                ALog.e("CheckUEntityUtil", "上传失败，文件【" + filePath + "】不存在");
                return false;
            } else if (file.isDirectory()) {
                ALog.e("CheckUEntityUtil", "上传失败，文件【" + filePath + "】不能是文件夹");
                return false;
            } else {
                return true;
            }
        } else {
            return false;
        }
    }

    private boolean checkUrl() {
        String tempUrl = this.mWrapper.getTempUrl();
        if (TextUtils.isEmpty(tempUrl)) {
            ALog.e("CheckUEntityUtil", "上传失败，url为null");
            return false;
        } else if (!CheckUtil.checkUrl(tempUrl)) {
            ALog.e("CheckUEntityUtil", "上传失败，url【" + tempUrl + "】错误");
            return false;
        } else if (tempUrl.indexOf("://") == -1) {
            ALog.e("CheckUEntityUtil", "上传失败，url【" + tempUrl + "】不合法");
            return false;
        } else {
            this.mEntity.setUrl(tempUrl);
            return true;
        }
    }
}
