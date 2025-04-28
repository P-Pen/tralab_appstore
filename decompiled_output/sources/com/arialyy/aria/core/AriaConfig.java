package com.arialyy.aria.core;

import android.content.Context;
import android.net.ConnectivityManager;
import android.net.Network;
import android.net.NetworkInfo;
import android.net.NetworkRequest;
import android.os.Build;
import android.os.Handler;
import android.os.Looper;
import com.arialyy.aria.core.config.AppConfig;
import com.arialyy.aria.core.config.Configuration;
import com.arialyy.aria.core.config.DGroupConfig;
import com.arialyy.aria.core.config.DownloadConfig;
import com.arialyy.aria.core.config.UploadConfig;
import com.arialyy.aria.core.config.XMLReader;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import com.arialyy.aria.util.FileUtil;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParserFactory;
import org.xml.sax.SAXException;
/* loaded from: classes.dex */
public class AriaConfig {
    private static Context APP = null;
    public static final String DOWNLOAD_TEMP_DIR = "/Aria/temp/download/";
    public static final String IGNORE_CLASS_KLASS = "shadow$_klass_";
    public static final String IGNORE_CLASS_MONITOR = "shadow$_monitor_";
    private static volatile AriaConfig Instance = null;
    private static final String TAG = "AriaConfig";
    public static final String UPLOAD_TEMP_DIR = "/Aria/temp/upload/";
    private static boolean isConnectedNet = true;
    private AppConfig mAConfig;
    private Handler mAriaHandler;
    private DownloadConfig mDConfig;
    private DGroupConfig mDGConfig;
    private UploadConfig mUConfig;

    private AriaConfig(Context context) {
        APP = context.getApplicationContext();
    }

    public static AriaConfig init(Context context) {
        if (Instance == null) {
            synchronized (AriaConfig.class) {
                if (Instance == null) {
                    Instance = new AriaConfig(context);
                    Instance.initData();
                }
            }
        }
        return Instance;
    }

    public static AriaConfig getInstance() {
        if (Instance == null) {
            ALog.e(TAG, "请使用init()初始化");
        }
        return Instance;
    }

    public Context getAPP() {
        return APP;
    }

    private void initData() {
        initConfig();
        regNetCallBack(APP);
    }

    public DownloadConfig getDConfig() {
        return this.mDConfig;
    }

    public UploadConfig getUConfig() {
        return this.mUConfig;
    }

    public AppConfig getAConfig() {
        return this.mAConfig;
    }

    public DGroupConfig getDGConfig() {
        return this.mDGConfig;
    }

    public synchronized Handler getAriaHandler() {
        if (this.mAriaHandler == null) {
            this.mAriaHandler = new Handler(Looper.getMainLooper());
        }
        return this.mAriaHandler;
    }

    private void regNetCallBack(Context context) {
        ConnectivityManager connectivityManager;
        isConnectedNet = isNetworkAvailable();
        if (getAConfig().isNetCheck() && Build.VERSION.SDK_INT >= 21 && (connectivityManager = (ConnectivityManager) context.getSystemService("connectivity")) != null) {
            NetworkRequest build = new NetworkRequest.Builder().addCapability(12).addTransportType(1).addTransportType(0).build();
            if (Build.VERSION.SDK_INT >= 21) {
                connectivityManager.registerNetworkCallback(build, new ConnectivityManager.NetworkCallback() { // from class: com.arialyy.aria.core.AriaConfig.1
                    @Override // android.net.ConnectivityManager.NetworkCallback
                    public void onLost(Network network) {
                        super.onLost(network);
                        boolean unused = AriaConfig.isConnectedNet = AriaConfig.this.isNetworkAvailable();
                        ALog.d(AriaConfig.TAG, "onLost, isConnectNet = " + AriaConfig.isConnectedNet);
                    }

                    @Override // android.net.ConnectivityManager.NetworkCallback
                    public void onAvailable(Network network) {
                        super.onAvailable(network);
                        boolean unused = AriaConfig.isConnectedNet = true;
                        ALog.d(AriaConfig.TAG, "onAvailable, isConnectNet = true");
                    }
                });
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean isNetworkAvailable() {
        NetworkInfo[] allNetworkInfo;
        ConnectivityManager connectivityManager = (ConnectivityManager) getAPP().getSystemService("connectivity");
        if (connectivityManager != null && (allNetworkInfo = connectivityManager.getAllNetworkInfo()) != null && allNetworkInfo.length > 0) {
            for (NetworkInfo networkInfo : allNetworkInfo) {
                if (networkInfo.getState() == NetworkInfo.State.CONNECTED) {
                    return true;
                }
            }
        }
        return false;
    }

    public boolean isConnectedNet() {
        return isConnectedNet;
    }

    private void initConfig() {
        this.mDConfig = Configuration.getInstance().downloadCfg;
        this.mUConfig = Configuration.getInstance().uploadCfg;
        this.mAConfig = Configuration.getInstance().appCfg;
        this.mDGConfig = Configuration.getInstance().dGroupCfg;
        File file = new File(APP.getFilesDir().getPath() + Configuration.XML_FILE);
        File file2 = new File(APP.getFilesDir().getPath() + "/temp");
        if (!file.exists()) {
            loadConfig();
        } else {
            try {
                String fileMD5 = CommonUtil.getFileMD5(file);
                File file3 = new File(APP.getFilesDir().getPath() + "/temp.xml");
                if (file3.exists()) {
                    file3.delete();
                }
                FileUtil.createFileFormInputStream(APP.getAssets().open("aria_config.xml"), file3.getPath());
                if (!CommonUtil.checkMD5(fileMD5, file3) || !Configuration.getInstance().configExists()) {
                    loadConfig();
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        if (file2.exists()) {
            File file4 = new File(APP.getFilesDir().getPath() + DOWNLOAD_TEMP_DIR);
            file4.mkdirs();
            file2.renameTo(file4);
        }
    }

    private void loadConfig() {
        try {
            SAXParserFactory.newInstance().newSAXParser().parse(APP.getAssets().open("aria_config.xml"), new XMLReader());
            InputStream open = APP.getAssets().open("aria_config.xml");
            FileUtil.createFileFormInputStream(open, APP.getFilesDir().getPath() + Configuration.XML_FILE);
        } catch (IOException | ParserConfigurationException | SAXException e) {
            ALog.e(TAG, e.toString());
        }
    }
}
