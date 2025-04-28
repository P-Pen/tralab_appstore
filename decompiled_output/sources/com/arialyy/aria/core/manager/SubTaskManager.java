package com.arialyy.aria.core.manager;

import android.text.TextUtils;
import com.arialyy.aria.core.command.CmdHelper;
import com.arialyy.aria.core.download.DGTaskWrapper;
import com.arialyy.aria.core.download.DownloadGroupEntity;
import com.arialyy.aria.core.event.EventMsgUtil;
import com.arialyy.aria.util.ALog;
import java.util.List;
/* loaded from: classes.dex */
public class SubTaskManager {
    private final String TAG = getClass().getSimpleName();
    private DGTaskWrapper mEntity;

    public SubTaskManager(DGTaskWrapper dGTaskWrapper) {
        this.mEntity = dGTaskWrapper;
    }

    public void startSubTask(String str) {
        if (checkUrl(str)) {
            EventMsgUtil.getDefault().post(CmdHelper.createGroupCmd(this.mEntity, 161, str));
        }
    }

    public void stopSubTask(String str) {
        if (checkUrl(str)) {
            EventMsgUtil.getDefault().post(CmdHelper.createGroupCmd(this.mEntity, 162, str));
        }
    }

    private boolean checkUrl(String str) {
        if (TextUtils.isEmpty(str)) {
            ALog.e(this.TAG, "子任务地址不能为null");
            return false;
        }
        List<String> urls = ((DownloadGroupEntity) this.mEntity.getEntity()).getUrls();
        if (urls == null || urls.isEmpty()) {
            ALog.e(this.TAG, "任务组任务链接为null");
            return false;
        } else if (urls.contains(str)) {
            return true;
        } else {
            String str2 = this.TAG;
            ALog.e(str2, "任务组中没有改Url【+ " + str + "】");
            return false;
        }
    }
}
