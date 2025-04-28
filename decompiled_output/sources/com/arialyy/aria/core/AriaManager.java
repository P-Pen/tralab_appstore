package com.arialyy.aria.core;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.os.Bundle;
import android.util.Log;
import com.arialyy.aria.core.command.CommandManager;
import com.arialyy.aria.core.common.QueueMod;
import com.arialyy.aria.core.config.AppConfig;
import com.arialyy.aria.core.config.DGroupConfig;
import com.arialyy.aria.core.config.DownloadConfig;
import com.arialyy.aria.core.config.UploadConfig;
import com.arialyy.aria.core.download.DownloadEntity;
import com.arialyy.aria.core.download.DownloadGroupEntity;
import com.arialyy.aria.core.download.DownloadReceiver;
import com.arialyy.aria.core.inf.AbsReceiver;
import com.arialyy.aria.core.inf.IReceiver;
import com.arialyy.aria.core.inf.ReceiverType;
import com.arialyy.aria.core.upload.UploadEntity;
import com.arialyy.aria.core.upload.UploadReceiver;
import com.arialyy.aria.orm.DbEntity;
import com.arialyy.aria.orm.DelegateWrapper;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.AriaCrashHandler;
import com.arialyy.aria.util.CommonUtil;
import com.arialyy.aria.util.DeleteURecord;
import com.arialyy.aria.util.RecordUtil;
import java.io.File;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
/* loaded from: classes.dex */
public class AriaManager {
    private static Context APP = null;
    private static volatile AriaManager INSTANCE = null;
    private static final Object LOCK = new Object();
    private static final String TAG = "AriaManager";
    private AriaConfig mConfig;
    private DelegateWrapper mDbWrapper;
    private Map<String, AbsReceiver> mReceivers = new ConcurrentHashMap();

    private AriaManager(Context context) {
        APP = context.getApplicationContext();
    }

    public static AriaManager getInstance() {
        return INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static AriaManager init(Context context) {
        if (INSTANCE == null) {
            synchronized (LOCK) {
                if (INSTANCE == null) {
                    INSTANCE = new AriaManager(context);
                    INSTANCE.initData();
                }
            }
        }
        return INSTANCE;
    }

    private void initData() {
        this.mConfig = AriaConfig.init(APP);
        initDb(APP);
        regAppLifeCallback(APP);
        initAria();
    }

    public Context getAPP() {
        return APP;
    }

    private void initDb(Context context) {
        File databasePath = context.getDatabasePath("AriaLyyDb");
        if (databasePath != null && databasePath.exists()) {
            File file = new File(String.format("%s/%s", databasePath.getParent(), "AriaLyyDb-journal"));
            databasePath.renameTo(new File(String.format("%s/%s", databasePath.getParent(), "AndroidAria.db")));
            if (file.exists()) {
                file.delete();
            }
        }
        this.mDbWrapper = DelegateWrapper.init(context.getApplicationContext());
        amendTaskState();
    }

    private void initAria() {
        AppConfig aConfig = this.mConfig.getAConfig();
        if (aConfig.getUseAriaCrashHandler()) {
            Thread.setDefaultUncaughtExceptionHandler(new AriaCrashHandler());
        }
        aConfig.setLogLevel(aConfig.getLogLevel());
        CommandManager.init();
    }

    private void amendTaskState() {
        Class[] clsArr = {DownloadEntity.class, UploadEntity.class, DownloadGroupEntity.class};
        for (int i = 0; i < 3; i++) {
            Class cls = clsArr[i];
            if (this.mDbWrapper.tableExists(cls)) {
                DbEntity.exeSql(String.format("UPDATE %s SET state=2 WHERE state IN (4,5,6)", cls.getSimpleName()));
            }
        }
    }

    public Map<String, AbsReceiver> getReceiver() {
        return this.mReceivers;
    }

    @Deprecated
    public AriaManager setUploadQueueMod(QueueMod queueMod) {
        this.mConfig.getUConfig().setQueueMod(queueMod.tag);
        return this;
    }

    @Deprecated
    public AriaManager setDownloadQueueMod(QueueMod queueMod) {
        this.mConfig.getDConfig().setQueueMod(queueMod.tag);
        return this;
    }

    public DownloadConfig getDownloadConfig() {
        return this.mConfig.getDConfig();
    }

    public UploadConfig getUploadConfig() {
        return this.mConfig.getUConfig();
    }

    public AppConfig getAppConfig() {
        return this.mConfig.getAConfig();
    }

    public DGroupConfig getDGroupConfig() {
        return this.mConfig.getDGConfig();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public DownloadReceiver download(Object obj) {
        AbsReceiver absReceiver = this.mReceivers.get(getKey(ReceiverType.DOWNLOAD, obj));
        if (absReceiver == null) {
            absReceiver = putReceiver(ReceiverType.DOWNLOAD, obj);
        }
        if (absReceiver instanceof DownloadReceiver) {
            return (DownloadReceiver) absReceiver;
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public UploadReceiver upload(Object obj) {
        AbsReceiver absReceiver = this.mReceivers.get(getKey(ReceiverType.UPLOAD, obj));
        if (absReceiver == null) {
            absReceiver = putReceiver(ReceiverType.UPLOAD, obj);
        }
        if (absReceiver instanceof UploadReceiver) {
            return (UploadReceiver) absReceiver;
        }
        return null;
    }

    public void delRecord(int i, String str, boolean z) {
        if (i == 1) {
            RecordUtil.delTaskRecord(str, 1, z, true);
        } else if (i == 2) {
            RecordUtil.delGroupTaskRecordByHash(str, z);
        } else if (i != 3) {
        } else {
            DeleteURecord.getInstance().deleteRecord(str, z, true);
        }
    }

    private IReceiver putReceiver(ReceiverType receiverType, Object obj) {
        String key = getKey(receiverType, obj);
        AbsReceiver absReceiver = this.mReceivers.get(key);
        if (absReceiver == null) {
            AbsReceiver downloadReceiver = receiverType.equals(ReceiverType.DOWNLOAD) ? new DownloadReceiver(obj) : new UploadReceiver(obj);
            this.mReceivers.put(key, downloadReceiver);
            return downloadReceiver;
        }
        return absReceiver;
    }

    private String getKey(ReceiverType receiverType, Object obj) {
        return String.format("%s_%s_%s", CommonUtil.getTargetName(obj), receiverType.name(), Integer.valueOf(obj.hashCode()));
    }

    private void regAppLifeCallback(Context context) {
        Context applicationContext = context.getApplicationContext();
        if (applicationContext instanceof Application) {
            ((Application) applicationContext).registerActivityLifecycleCallbacks(new LifeCallback());
        }
    }

    public void removeReceiver(Object obj) {
        Method method;
        if (obj == null) {
            ALog.e(TAG, "target obj is null");
            return;
        }
        Iterator<Map.Entry<String, AbsReceiver>> it = this.mReceivers.entrySet().iterator();
        while (it.hasNext()) {
            Map.Entry<String, AbsReceiver> next = it.next();
            String key = next.getKey();
            AbsReceiver value = next.getValue();
            if (value.isFragment() && (method = CommonUtil.getMethod(value.obj.getClass(), "getActivity", new Class[0])) != null) {
                try {
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InvocationTargetException e2) {
                    e2.printStackTrace();
                }
                if (((Activity) method.invoke(value.obj, new Object[0])) == obj) {
                    value.destroy();
                    it.remove();
                }
            }
            String name = obj.getClass().getName();
            if (value.isLocalOrAnonymousClass && key.startsWith(name)) {
                value.destroy();
                it.remove();
            } else if (key.equals(getKey(ReceiverType.DOWNLOAD, obj)) || key.equals(getKey(ReceiverType.UPLOAD, obj))) {
                value.destroy();
                it.remove();
            }
        }
        Log.d(TAG, "debug");
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class LifeCallback implements Application.ActivityLifecycleCallbacks {
        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityCreated(Activity activity, Bundle bundle) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityPaused(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityResumed(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivitySaveInstanceState(Activity activity, Bundle bundle) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStarted(Activity activity) {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityStopped(Activity activity) {
        }

        private LifeCallback() {
        }

        @Override // android.app.Application.ActivityLifecycleCallbacks
        public void onActivityDestroyed(Activity activity) {
            AriaManager.this.removeReceiver(activity);
        }
    }
}
