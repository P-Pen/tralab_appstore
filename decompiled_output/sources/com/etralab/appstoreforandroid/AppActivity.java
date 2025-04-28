package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.AnimationDrawable;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import androidx.core.content.FileProvider;
import com.arialyy.aria.core.Aria;
import com.arialyy.aria.core.download.target.HttpBuilderTarget;
import com.arialyy.aria.core.task.DownloadTask;
import com.arialyy.aria.util.ALog;
import com.etralab.appstoreforandroid.OnDoubleClickListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.HttpResponse;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.CoreConnectionPNames;
/* loaded from: classes.dex */
public class AppActivity extends Activity {
    String app_developer;
    String app_download_number;
    String app_download_url;
    String app_like_number;
    String app_name_en;
    String app_pkg_name;
    String app_screen_shot_0;
    String app_screen_shot_1;
    String app_screen_shot_2;
    String app_screen_shot_3;
    String app_screen_shot_4;
    String app_screen_shot_5;
    String app_screen_shot_6;
    String app_screen_shot_7;
    String app_version_code;
    int apkDownloadFailedNum = 0;
    List<String> appScreenshotUrlList = new ArrayList();
    boolean isAppDownloading = false;
    boolean isLikeApp = false;

    /* JADX WARN: Type inference failed for: r3v3, types: [com.etralab.appstoreforandroid.AppActivity$1] */
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        requestWindowFeature(1);
        super.onCreate(bundle);
        setLayout();
        getWindow().setFlags(128, 128);
        ClickToBackLastActivity();
        Aria.download(this).register();
        new Thread() { // from class: com.etralab.appstoreforandroid.AppActivity.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                ImageView imageView = (ImageView) AppActivity.this.findViewById(R.id.iv_loading_anim);
                if (imageView != null) {
                    ((AnimationDrawable) imageView.getBackground()).start();
                }
            }
        }.start();
        parseByJSONObject();
        ((Button) findViewById(R.id.btn_retry)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity.this.ReloadAppInformation();
            }
        });
        ((TextView) findViewById(R.id.tv_AppDeveloper)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.AppActivity.3.1
                    @Override // java.lang.Runnable
                    public void run() {
                        AppActivity appActivity = AppActivity.this;
                        Intent intent = new Intent(appActivity, DeveloperAppActivity.class);
                        intent.putExtra("appDeveloperName", AppActivity.this.app_developer);
                        appActivity.startActivity(intent);
                    }
                });
            }
        });
        ((LinearLayout) findViewById(R.id.ll_layout_body)).setOnTouchListener(new OnDoubleClickListener(new AnonymousClass4()));
        ScreenshotImageViewOnClick();
        ((LinearLayout) findViewById(R.id.ll_history_version)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.5
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.AppActivity.5.1
                    @Override // java.lang.Runnable
                    public void run() {
                        Toast.makeText(AppActivity.this, "该功能暂未开放，敬请期待！", 0).show();
                    }
                });
            }
        });
        ((LinearLayout) findViewById(R.id.ll_LikeNumber)).setOnClickListener(new AnonymousClass6());
        ((LinearLayout) findViewById(R.id.ll_download_option)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.7
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity.this.DownloadApp();
            }
        });
    }

    /* renamed from: com.etralab.appstoreforandroid.AppActivity$4  reason: invalid class name */
    /* loaded from: classes.dex */
    class AnonymousClass4 implements OnDoubleClickListener.DoubleClickCallback {
        AnonymousClass4() {
        }

        @Override // com.etralab.appstoreforandroid.OnDoubleClickListener.DoubleClickCallback
        public void onDoubleClick() {
            AppActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.AppActivity.4.1
                /* JADX WARN: Type inference failed for: r0v8, types: [com.etralab.appstoreforandroid.AppActivity$4$1$1] */
                @Override // java.lang.Runnable
                public void run() {
                    ImageView imageView = (ImageView) AppActivity.this.findViewById(R.id.iv_anim_like);
                    imageView.setVisibility(0);
                    AnimationDrawable animationDrawable = (AnimationDrawable) AppActivity.this.getResources().getDrawable(R.drawable.animation_like);
                    imageView.setImageDrawable(animationDrawable);
                    if (animationDrawable.isRunning()) {
                        return;
                    }
                    animationDrawable.start();
                    if (AppActivity.this.isLikeApp) {
                        return;
                    }
                    new Thread() { // from class: com.etralab.appstoreforandroid.AppActivity.4.1.1
                        @Override // java.lang.Thread, java.lang.Runnable
                        public void run() {
                            super.run();
                            AppActivity.this.UpdateAppLikeNum();
                        }
                    }.start();
                    ((ImageView) AppActivity.this.findViewById(R.id.iv_LikeNumber)).setImageResource(R.drawable.icon_like_number_highlight);
                    ((TextView) AppActivity.this.findViewById(R.id.tv_LikeNumber)).setText(NumUnitConversionUtil.NumUnitConversion((Integer.parseInt(AppActivity.this.app_like_number) + 1) + ""));
                    AppActivity.this.isLikeApp = true;
                }
            });
        }
    }

    /* renamed from: com.etralab.appstoreforandroid.AppActivity$6  reason: invalid class name */
    /* loaded from: classes.dex */
    class AnonymousClass6 implements View.OnClickListener {
        AnonymousClass6() {
        }

        /* JADX WARN: Type inference failed for: r1v1, types: [com.etralab.appstoreforandroid.AppActivity$6$1] */
        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            new Thread() { // from class: com.etralab.appstoreforandroid.AppActivity.6.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    super.run();
                    if (!AppActivity.this.isLikeApp) {
                        AppActivity.this.UpdateAppLikeNum();
                        final TextView textView = (TextView) AppActivity.this.findViewById(R.id.tv_LikeNumber);
                        final ImageView imageView = (ImageView) AppActivity.this.findViewById(R.id.iv_LikeNumber);
                        AppActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.AppActivity.6.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                imageView.setImageResource(R.drawable.icon_like_number_highlight);
                                TextView textView2 = textView;
                                textView2.setText(NumUnitConversionUtil.NumUnitConversion((Integer.parseInt(AppActivity.this.app_like_number) + 1) + ""));
                            }
                        });
                        AppActivity.this.isLikeApp = true;
                        return;
                    }
                    AppActivity.this.SubAppLikeNum();
                    final TextView textView2 = (TextView) AppActivity.this.findViewById(R.id.tv_LikeNumber);
                    final ImageView imageView2 = (ImageView) AppActivity.this.findViewById(R.id.iv_LikeNumber);
                    AppActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.AppActivity.6.1.2
                        @Override // java.lang.Runnable
                        public void run() {
                            imageView2.setImageResource(R.drawable.icon_like_number);
                            TextView textView3 = textView2;
                            textView3.setText(NumUnitConversionUtil.NumUnitConversion(Integer.parseInt(AppActivity.this.app_like_number) + ""));
                        }
                    });
                    AppActivity.this.isLikeApp = false;
                }
            }.start();
        }
    }

    @Override // android.app.Activity
    protected void onResume() {
        final FrameLayout frameLayout = (FrameLayout) findViewById(R.id.fl_installing);
        final LinearLayout linearLayout = (LinearLayout) findViewById(R.id.ll_installed);
        final LinearLayout linearLayout2 = (LinearLayout) findViewById(R.id.ll_update);
        if (CheckAppInstalled(this, this.app_pkg_name) && !this.isAppDownloading) {
            runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.AppActivity.8
                @Override // java.lang.Runnable
                public void run() {
                    int i;
                    try {
                        i = Integer.parseInt(AppActivity.this.app_version_code);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        i = 0;
                    }
                    if (i != 0) {
                        AppActivity appActivity = AppActivity.this;
                        if (appActivity.getAppVersionCode(appActivity) != 0) {
                            AppActivity appActivity2 = AppActivity.this;
                            if (i > appActivity2.getAppVersionCode(appActivity2)) {
                                frameLayout.setVisibility(8);
                                linearLayout2.setVisibility(0);
                                AppActivity.this.UpdateUninstallAppOnClick();
                                return;
                            }
                        }
                    }
                    frameLayout.setVisibility(8);
                    linearLayout.setVisibility(0);
                    File file = new File(AppActivity.this.getExternalCacheDir(), AppActivity.this.app_name_en + ".apk");
                    if (file.exists()) {
                        file.delete();
                    }
                    AppActivity.this.OpenUninstallAppOnClick();
                }
            });
        }
        super.onResume();
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        Aria.download(this).stopAllTask();
        super.onDestroy();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public boolean CheckAppInstalled(Context context, String str) {
        List<PackageInfo> installedPackages;
        if (str != null && !str.isEmpty() && (installedPackages = context.getPackageManager().getInstalledPackages(0)) != null && !installedPackages.isEmpty()) {
            for (int i = 0; i < installedPackages.size(); i++) {
                if (str.equals(installedPackages.get(i).packageName)) {
                    return true;
                }
            }
        }
        return false;
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.etralab.appstoreforandroid.AppActivity$9] */
    public void parseByJSONObject() {
        new Thread() { // from class: com.etralab.appstoreforandroid.AppActivity.9
            /* JADX WARN: Code restructure failed: missing block: B:46:0x0279, code lost:
                if (r0.equals("1") != false) goto L35;
             */
            @Override // java.lang.Thread, java.lang.Runnable
            /*
                Code decompiled incorrectly, please refer to instructions dump.
                To view partially-correct add '--show-bad-code' argument
            */
            public void run() {
                /*
                    Method dump skipped, instructions count: 870
                    To view this dump add '--comments-level debug' option
                */
                throw new UnsupportedOperationException("Method not decompiled: com.etralab.appstoreforandroid.AppActivity.AnonymousClass9.run():void");
            }
        }.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getJson() {
        String stringExtra = getIntent().getStringExtra("appId");
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
        HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/app_activity/get_app_data.php");
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("appId", stringExtra));
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
            HttpResponse execute = defaultHttpClient.execute((HttpUriRequest) httpPost);
            if (execute.getStatusLine().getStatusCode() != 200) {
                return null;
            }
            StringBuilder sb = new StringBuilder();
            BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(execute.getEntity().getContent()));
            while (true) {
                String readLine = bufferedReader.readLine();
                if (readLine != null) {
                    sb.append(readLine);
                } else {
                    return sb.toString();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateAppDownloadNum() {
        String stringExtra = getIntent().getStringExtra("appId");
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
        HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/app_activity/update_app_download_num.php");
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("appId", stringExtra));
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
            defaultHttpClient.execute((HttpUriRequest) httpPost);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateAppLikeNum() {
        String stringExtra = getIntent().getStringExtra("appId");
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
        HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/app_activity/update_app_like_num.php");
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("appId", stringExtra));
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
            defaultHttpClient.execute((HttpUriRequest) httpPost);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void SubAppLikeNum() {
        String stringExtra = getIntent().getStringExtra("appId");
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
        HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/app_activity/sub_app_like_num.php");
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("appId", stringExtra));
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
            defaultHttpClient.execute((HttpUriRequest) httpPost);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ShowAppInformation() {
        final LinearLayout linearLayout = (LinearLayout) findViewById(R.id.ll_loading_app_information);
        final ScrollView scrollView = (ScrollView) findViewById(R.id.sv_layout_body);
        ImageView imageView = (ImageView) findViewById(R.id.iv_loading_anim);
        if (imageView != null && ((AnimationDrawable) imageView.getBackground()).isRunning()) {
            ((AnimationDrawable) imageView.getBackground()).stop();
        }
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.AppActivity.10
            @Override // java.lang.Runnable
            public void run() {
                int i;
                linearLayout.setVisibility(8);
                scrollView.setVisibility(0);
                AppActivity appActivity = AppActivity.this;
                if (appActivity.CheckAppInstalled(appActivity, appActivity.app_pkg_name)) {
                    LinearLayout linearLayout2 = (LinearLayout) AppActivity.this.findViewById(R.id.ll_download_option);
                    LinearLayout linearLayout3 = (LinearLayout) AppActivity.this.findViewById(R.id.ll_installed);
                    LinearLayout linearLayout4 = (LinearLayout) AppActivity.this.findViewById(R.id.ll_update);
                    try {
                        i = Integer.parseInt(AppActivity.this.app_version_code);
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                        i = 0;
                    }
                    if (i != 0) {
                        AppActivity appActivity2 = AppActivity.this;
                        if (appActivity2.getAppVersionCode(appActivity2) != 0) {
                            AppActivity appActivity3 = AppActivity.this;
                            if (i > appActivity3.getAppVersionCode(appActivity3)) {
                                linearLayout2.setVisibility(8);
                                linearLayout4.setVisibility(0);
                                AppActivity.this.UpdateUninstallAppOnClick();
                            }
                        }
                    }
                    linearLayout2.setVisibility(8);
                    linearLayout3.setVisibility(0);
                    AppActivity.this.OpenUninstallAppOnClick();
                }
                scrollView.requestFocus();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ReloadAppInformation() {
        final ImageView imageView = (ImageView) findViewById(R.id.iv_loading_anim);
        final TextView textView = (TextView) findViewById(R.id.tv_loading_text);
        final ImageView imageView2 = (ImageView) findViewById(R.id.iv_load_failed);
        final TextView textView2 = (TextView) findViewById(R.id.tv_retry_text);
        final Button button = (Button) findViewById(R.id.btn_retry);
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.AppActivity.11
            @Override // java.lang.Runnable
            public void run() {
                textView.setVisibility(0);
                imageView.setVisibility(0);
                imageView2.setVisibility(8);
                textView2.setVisibility(8);
                button.setVisibility(8);
            }
        });
        if (imageView != null) {
            ((AnimationDrawable) imageView.getBackground()).start();
        }
        parseByJSONObject();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void taskFail(DownloadTask downloadTask, Exception exc) {
        ALog.e("TAG", ALog.getExceptionString(exc));
        int i = this.apkDownloadFailedNum;
        if (i <= 3) {
            this.apkDownloadFailedNum = i + 1;
            if (downloadTask != null) {
                downloadTask.cancel();
                HttpBuilderTarget load = Aria.download(this).load(this.app_download_url);
                load.setFilePath(getExternalCacheDir() + "/" + this.app_name_en + ".apk", true).create();
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void running(DownloadTask downloadTask) {
        this.isAppDownloading = true;
        final TextView textView = (TextView) findViewById(R.id.tv_download_progress_bar);
        final TextView textView2 = (TextView) findViewById(R.id.tv_donloading_progress);
        final int width = ((TextView) findViewById(R.id.tv_progress_bar_max_width)).getWidth();
        final int percent = downloadTask.getPercent();
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.AppActivity.12
            @Override // java.lang.Runnable
            public void run() {
                textView.getLayoutParams().width = (int) (width * percent * 0.01d);
                TextView textView3 = textView2;
                textView3.setText(percent + "%");
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void taskComplete(DownloadTask downloadTask) {
        this.isAppDownloading = false;
        final FrameLayout frameLayout = (FrameLayout) findViewById(R.id.fl_downloading_progress);
        final FrameLayout frameLayout2 = (FrameLayout) findViewById(R.id.fl_installing);
        LinearLayout linearLayout = (LinearLayout) findViewById(R.id.ll_installed);
        LinearLayout linearLayout2 = (LinearLayout) findViewById(R.id.ll_open);
        LinearLayout linearLayout3 = (LinearLayout) findViewById(R.id.ll_uninstall);
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.AppActivity.13
            @Override // java.lang.Runnable
            public void run() {
                frameLayout.setVisibility(8);
                frameLayout2.setVisibility(0);
            }
        });
        File file = new File(getFilesDir(), "UsePackageInstaller.txt");
        File file2 = new File(getFilesDir(), "UseWlanAdb.txt");
        if (file.exists() && file2.exists()) {
            startActivity(new Intent(this, ChooseAppInstallMethodActivity.class));
            finish();
        } else if (file.exists()) {
            InstallAppWithPackageInstaller(this, getExternalCacheDir() + "/" + this.app_name_en + ".apk");
        } else if (file2.exists()) {
            InstallAppWithWlanAdb(getExternalCacheDir() + "/" + this.app_name_en + ".apk");
        } else {
            startActivity(new Intent(this, ChooseAppInstallMethodActivity.class));
            finish();
        }
    }

    public void InstallAppWithPackageInstaller(Context context, String str) {
        File file = new File(str);
        if (file.exists()) {
            Intent intent = new Intent("android.intent.action.VIEW");
            if (Build.VERSION.SDK_INT >= 24) {
                intent.addFlags(268435456);
                intent.addFlags(1);
                intent.setDataAndType(FileProvider.getUriForFile(context, "com.etralab.appstoreforandroid.FileProvider", file), "application/vnd.android.package-archive");
            } else {
                intent.setDataAndType(Uri.fromFile(file), "application/vnd.android.package-archive");
                intent.setFlags(268435456);
            }
            context.startActivity(intent);
        }
    }

    public void InstallAppWithWlanAdb(String str) {
        Intent intent = new Intent(this, InstallApkActivity.class);
        intent.putExtra("apkPath", str);
        startActivity(intent);
    }

    void setLayout() {
        File file = new File(getFilesDir(), "CircleLayout.txt");
        File file2 = new File(getFilesDir(), "SquareLayout.txt");
        if (file.exists() && file2.exists()) {
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        } else if (file.exists()) {
            setContentView(R.layout.activity_app);
        } else if (file2.exists()) {
            setContentView(R.layout.activity_app_square);
        } else {
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        }
    }

    private void ScreenshotImageViewOnClick() {
        ((ImageView) findViewById(R.id.iv_screen_shot_0)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.14
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity appActivity = AppActivity.this;
                Intent intent = new Intent(appActivity, ScreenshotActivity.class);
                intent.putExtra("appScreenshotUrlList", (String[]) AppActivity.this.appScreenshotUrlList.toArray(new String[0]));
                intent.putExtra("appScreenshotUrlIndex", 0);
                appActivity.startActivity(intent);
            }
        });
        ((ImageView) findViewById(R.id.iv_screen_shot_1)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.15
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity appActivity = AppActivity.this;
                Intent intent = new Intent(appActivity, ScreenshotActivity.class);
                intent.putExtra("appScreenshotUrlList", (String[]) AppActivity.this.appScreenshotUrlList.toArray(new String[0]));
                intent.putExtra("appScreenshotUrlIndex", 1);
                appActivity.startActivity(intent);
            }
        });
        ((ImageView) findViewById(R.id.iv_screen_shot_2)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.16
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity appActivity = AppActivity.this;
                Intent intent = new Intent(appActivity, ScreenshotActivity.class);
                intent.putExtra("appScreenshotUrlList", (String[]) AppActivity.this.appScreenshotUrlList.toArray(new String[0]));
                intent.putExtra("appScreenshotUrlIndex", 2);
                appActivity.startActivity(intent);
            }
        });
        ((ImageView) findViewById(R.id.iv_screen_shot_3)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.17
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity appActivity = AppActivity.this;
                Intent intent = new Intent(appActivity, ScreenshotActivity.class);
                intent.putExtra("appScreenshotUrlList", (String[]) AppActivity.this.appScreenshotUrlList.toArray(new String[0]));
                intent.putExtra("appScreenshotUrlIndex", 3);
                appActivity.startActivity(intent);
            }
        });
        ((ImageView) findViewById(R.id.iv_screen_shot_4)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.18
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity appActivity = AppActivity.this;
                Intent intent = new Intent(appActivity, ScreenshotActivity.class);
                intent.putExtra("appScreenshotUrlList", (String[]) AppActivity.this.appScreenshotUrlList.toArray(new String[0]));
                intent.putExtra("appScreenshotUrlIndex", 4);
                appActivity.startActivity(intent);
            }
        });
        ((ImageView) findViewById(R.id.iv_screen_shot_5)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.19
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity appActivity = AppActivity.this;
                Intent intent = new Intent(appActivity, ScreenshotActivity.class);
                intent.putExtra("appScreenshotUrlList", (String[]) AppActivity.this.appScreenshotUrlList.toArray(new String[0]));
                intent.putExtra("appScreenshotUrlIndex", 5);
                appActivity.startActivity(intent);
            }
        });
        ((ImageView) findViewById(R.id.iv_screen_shot_6)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.20
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity appActivity = AppActivity.this;
                Intent intent = new Intent(appActivity, ScreenshotActivity.class);
                intent.putExtra("appScreenshotUrlList", (String[]) AppActivity.this.appScreenshotUrlList.toArray(new String[0]));
                intent.putExtra("appScreenshotUrlIndex", 6);
                appActivity.startActivity(intent);
            }
        });
        ((ImageView) findViewById(R.id.iv_screen_shot_7)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.21
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity appActivity = AppActivity.this;
                Intent intent = new Intent(appActivity, ScreenshotActivity.class);
                intent.putExtra("appScreenshotUrlList", (String[]) AppActivity.this.appScreenshotUrlList.toArray(new String[0]));
                intent.putExtra("appScreenshotUrlIndex", 7);
                appActivity.startActivity(intent);
            }
        });
    }

    private void ClickToBackLastActivity() {
        ((LinearLayout) findViewById(R.id.ll_back)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.22
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity.this.finish();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateAppActivityTotalPv() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/pv/app_activity/pv.php").openConnection();
            httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
            httpURLConnection.setConnectTimeout(6000);
            httpURLConnection.getResponseCode();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateDownloadAppTotalPv() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/pv/download_app/pv.php").openConnection();
            httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
            httpURLConnection.setConnectTimeout(6000);
            httpURLConnection.getResponseCode();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void OpenUninstallAppOnClick() {
        ((LinearLayout) findViewById(R.id.ll_open)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.23
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (AppActivity.this.app_pkg_name != null) {
                    try {
                        AppActivity.this.startActivity(AppActivity.this.getPackageManager().getLaunchIntentForPackage(AppActivity.this.app_pkg_name));
                    } catch (Exception unused) {
                        Toast.makeText(AppActivity.this, "应用打开失败，请手动打开！", 0).show();
                    }
                }
            }
        });
        ((LinearLayout) findViewById(R.id.ll_uninstall)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.24
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (AppActivity.this.app_pkg_name != null) {
                    Intent intent = new Intent();
                    intent.setAction("android.settings.APPLICATION_DETAILS_SETTINGS");
                    intent.setData(Uri.parse("package:" + AppActivity.this.app_pkg_name));
                    try {
                        AppActivity.this.startActivity(intent);
                    } catch (Exception unused) {
                        Toast.makeText(AppActivity.this, "应用卸载失败，请手动前往系统设置中卸载！", 0).show();
                    }
                }
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateUninstallAppOnClick() {
        ((LinearLayout) findViewById(R.id.ll_update_btn)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.25
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AppActivity.this.DownloadApp();
            }
        });
        ((LinearLayout) findViewById(R.id.ll_uninstall_2)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppActivity.26
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (AppActivity.this.app_pkg_name != null) {
                    Intent intent = new Intent();
                    intent.setAction("android.settings.APPLICATION_DETAILS_SETTINGS");
                    intent.setData(Uri.parse("package:" + AppActivity.this.app_pkg_name));
                    try {
                        AppActivity.this.startActivity(intent);
                    } catch (Exception unused) {
                        Toast.makeText(AppActivity.this, "应用卸载失败，请手动前往系统设置中卸载！", 0).show();
                    }
                }
            }
        });
    }

    public void setDownloadServerData() {
        String str = this.app_name_en;
        if (str == null || str.equals("")) {
            return;
        }
        int random = (int) ((Math.random() * 9999) + 1);
        SharedPreferences sharedPreferences = getSharedPreferences("AppDownloadData", 0);
        if (sharedPreferences.getString(this.app_name_en, null) == null) {
            if (random <= 2500) {
                SharedPreferences.Editor edit = sharedPreferences.edit();
                edit.putString(this.app_name_en, "1");
                edit.apply();
            } else if (random <= 5000) {
                SharedPreferences.Editor edit2 = sharedPreferences.edit();
                edit2.putString(this.app_name_en, "2");
                edit2.apply();
            } else if (random <= 7500) {
                SharedPreferences.Editor edit3 = sharedPreferences.edit();
                edit3.putString(this.app_name_en, "3");
                edit3.apply();
            } else {
                SharedPreferences.Editor edit4 = sharedPreferences.edit();
                edit4.putString(this.app_name_en, "4");
                edit4.apply();
            }
        }
    }

    public int getAppVersionCode(Context context) {
        if (context == null) {
            return 0;
        }
        try {
            return context.getPackageManager().getPackageInfo(this.app_pkg_name, 0).versionCode;
        } catch (PackageManager.NameNotFoundException unused) {
            return 0;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* JADX WARN: Type inference failed for: r0v2, types: [com.etralab.appstoreforandroid.AppActivity$27] */
    public void DownloadApp() {
        if (this.app_name_en == null || this.app_download_url == null) {
            return;
        }
        new Thread() { // from class: com.etralab.appstoreforandroid.AppActivity.27
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                AppActivity.this.UpdateDownloadAppTotalPv();
                AppActivity.this.UpdateAppDownloadNum();
                final FrameLayout frameLayout = (FrameLayout) AppActivity.this.findViewById(R.id.fl_downloading_progress);
                final FrameLayout frameLayout2 = (FrameLayout) AppActivity.this.findViewById(R.id.fl_installing);
                final LinearLayout linearLayout = (LinearLayout) AppActivity.this.findViewById(R.id.ll_download_option);
                final LinearLayout linearLayout2 = (LinearLayout) AppActivity.this.findViewById(R.id.ll_update);
                final TextView textView = (TextView) AppActivity.this.findViewById(R.id.tv_DownloadNumber);
                AppActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.AppActivity.27.1
                    @Override // java.lang.Runnable
                    public void run() {
                        linearLayout.setVisibility(8);
                        linearLayout2.setVisibility(8);
                        frameLayout.setVisibility(0);
                        TextView textView2 = textView;
                        textView2.setText(NumUnitConversionUtil.NumUnitConversion((Integer.parseInt(AppActivity.this.app_download_number) + 1) + ""));
                    }
                });
                if (!new File(AppActivity.this.getExternalCacheDir() + "/" + AppActivity.this.app_name_en + ".apk").exists()) {
                    HttpBuilderTarget load = Aria.download(this).load(AppActivity.this.app_download_url);
                    load.setFilePath(AppActivity.this.getExternalCacheDir() + "/" + AppActivity.this.app_name_en + ".apk", true).create();
                    return;
                }
                AppActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.AppActivity.27.2
                    @Override // java.lang.Runnable
                    public void run() {
                        frameLayout.setVisibility(8);
                        frameLayout2.setVisibility(0);
                    }
                });
                File file = new File(AppActivity.this.getFilesDir(), "UsePackageInstaller.txt");
                File file2 = new File(AppActivity.this.getFilesDir(), "UseWlanAdb.txt");
                if (file.exists() && file2.exists()) {
                    AppActivity.this.startActivity(new Intent(AppActivity.this, ChooseAppInstallMethodActivity.class));
                    AppActivity.this.finish();
                } else if (file.exists()) {
                    AppActivity appActivity = AppActivity.this;
                    appActivity.InstallAppWithPackageInstaller(appActivity, AppActivity.this.getExternalCacheDir() + "/" + AppActivity.this.app_name_en + ".apk");
                } else if (file2.exists()) {
                    AppActivity appActivity2 = AppActivity.this;
                    appActivity2.InstallAppWithWlanAdb(AppActivity.this.getExternalCacheDir() + "/" + AppActivity.this.app_name_en + ".apk");
                } else {
                    AppActivity.this.startActivity(new Intent(AppActivity.this, ChooseAppInstallMethodActivity.class));
                    AppActivity.this.finish();
                }
            }
        }.start();
    }
}
