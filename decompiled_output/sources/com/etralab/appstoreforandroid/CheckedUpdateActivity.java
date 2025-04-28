package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
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
import androidx.core.content.FileProvider;
import com.arialyy.aria.core.Aria;
import com.arialyy.aria.core.download.target.HttpBuilderTarget;
import com.arialyy.aria.core.task.DownloadTask;
import com.arialyy.aria.util.ALog;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import org.apache.http.HttpResponse;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.cookie.ClientCookie;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.CoreConnectionPNames;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class CheckedUpdateActivity extends Activity {
    int apkDownloadFailedNum = 0;
    String app_download_url;
    String app_name_en;
    String app_pkg_name;

    /* JADX WARN: Type inference failed for: r2v4, types: [com.etralab.appstoreforandroid.CheckedUpdateActivity$1] */
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setLayout();
        ClickToBackLastActivity();
        getWindow().setFlags(128, 128);
        Aria.download(this).register();
        new Thread() { // from class: com.etralab.appstoreforandroid.CheckedUpdateActivity.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                ImageView imageView = (ImageView) CheckedUpdateActivity.this.findViewById(R.id.iv_loading_anim);
                if (imageView != null) {
                    ((AnimationDrawable) imageView.getBackground()).start();
                }
            }
        }.start();
        parseByJSONObject();
        ((Button) findViewById(R.id.btn_retry)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.CheckedUpdateActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CheckedUpdateActivity.this.ReloadUpdateInformation();
            }
        });
        ((Button) findViewById(R.id.btn_update)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.CheckedUpdateActivity.3
            /* JADX WARN: Type inference failed for: r1v5, types: [com.etralab.appstoreforandroid.CheckedUpdateActivity$3$1] */
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (CheckedUpdateActivity.this.app_name_en == null || CheckedUpdateActivity.this.app_download_url == null) {
                    return;
                }
                new Thread() { // from class: com.etralab.appstoreforandroid.CheckedUpdateActivity.3.1
                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        super.run();
                        CheckedUpdateActivity.this.UpdateAppDownloadNum();
                        final FrameLayout frameLayout = (FrameLayout) CheckedUpdateActivity.this.findViewById(R.id.fl_downloading_progress);
                        final Button button = (Button) CheckedUpdateActivity.this.findViewById(R.id.btn_update);
                        CheckedUpdateActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.CheckedUpdateActivity.3.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                button.setVisibility(8);
                                frameLayout.setVisibility(0);
                            }
                        });
                        HttpBuilderTarget load = Aria.download(this).load(CheckedUpdateActivity.this.app_download_url);
                        load.setFilePath(CheckedUpdateActivity.this.getExternalCacheDir() + "/" + CheckedUpdateActivity.this.app_name_en + ".apk", true).create();
                    }
                }.start();
            }
        });
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        Aria.download(this).stopAllTask();
        super.onDestroy();
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.etralab.appstoreforandroid.CheckedUpdateActivity$4] */
    public void parseByJSONObject() {
        new Thread() { // from class: com.etralab.appstoreforandroid.CheckedUpdateActivity.4
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                CheckedUpdateActivity.this.UpdateCheckedUpdateActivityTotalPv();
                String json = CheckedUpdateActivity.this.getJson();
                if (json != null) {
                    try {
                        JSONObject jSONObject = new JSONObject(json);
                        CheckedUpdateActivity.this.app_pkg_name = jSONObject.getString("pkg_name");
                        final String string = jSONObject.getString("name");
                        CheckedUpdateActivity.this.app_name_en = jSONObject.getString("name_en");
                        final String string2 = jSONObject.getString(ClientCookie.VERSION_ATTR);
                        final String string3 = jSONObject.getString("download_size");
                        final String string4 = jSONObject.getString("update_time");
                        final String string5 = jSONObject.getString("update_log");
                        CheckedUpdateActivity checkedUpdateActivity = CheckedUpdateActivity.this;
                        checkedUpdateActivity.app_download_url = "http://dl1.etrasoft.cn" + jSONObject.getString("download_url");
                        CheckedUpdateActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.CheckedUpdateActivity.4.1
                            @Override // java.lang.Runnable
                            public void run() {
                                ((TextView) CheckedUpdateActivity.this.findViewById(R.id.tv_new_app_name)).setText(string);
                                ((TextView) CheckedUpdateActivity.this.findViewById(R.id.tv_new_version)).setText(string2);
                                ((TextView) CheckedUpdateActivity.this.findViewById(R.id.tv_app_apk_size)).setText(string3);
                                ((TextView) CheckedUpdateActivity.this.findViewById(R.id.tv_app_update_time)).setText(string4);
                                ((TextView) CheckedUpdateActivity.this.findViewById(R.id.tv_app_update_log)).setText(string5);
                            }
                        });
                        CheckedUpdateActivity.this.ShowUpdateInformation();
                        return;
                    } catch (JSONException e) {
                        e.printStackTrace();
                        return;
                    }
                }
                final ImageView imageView = (ImageView) CheckedUpdateActivity.this.findViewById(R.id.iv_loading_anim);
                final TextView textView = (TextView) CheckedUpdateActivity.this.findViewById(R.id.tv_loading_text);
                final ImageView imageView2 = (ImageView) CheckedUpdateActivity.this.findViewById(R.id.iv_load_failed);
                final Button button = (Button) CheckedUpdateActivity.this.findViewById(R.id.btn_retry);
                final TextView textView2 = (TextView) CheckedUpdateActivity.this.findViewById(R.id.tv_retry_text);
                CheckedUpdateActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.CheckedUpdateActivity.4.2
                    @Override // java.lang.Runnable
                    public void run() {
                        imageView.setVisibility(8);
                        textView.setVisibility(8);
                        imageView2.setVisibility(0);
                        textView2.setVisibility(0);
                        button.setVisibility(0);
                    }
                });
            }
        }.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getJson() {
        String stringExtra = getIntent().getStringExtra("appId");
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
        HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/checked_update_activity/get_update_data.php");
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
    public void ShowUpdateInformation() {
        final LinearLayout linearLayout = (LinearLayout) findViewById(R.id.ll_loading_update_content);
        final ScrollView scrollView = (ScrollView) findViewById(R.id.sv_layout_body);
        ImageView imageView = (ImageView) findViewById(R.id.iv_loading_anim);
        if (imageView != null && ((AnimationDrawable) imageView.getBackground()).isRunning()) {
            ((AnimationDrawable) imageView.getBackground()).stop();
        }
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.CheckedUpdateActivity.5
            @Override // java.lang.Runnable
            public void run() {
                linearLayout.setVisibility(8);
                scrollView.setVisibility(0);
                scrollView.requestFocus();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ReloadUpdateInformation() {
        final ImageView imageView = (ImageView) findViewById(R.id.iv_loading_anim);
        final TextView textView = (TextView) findViewById(R.id.tv_loading_text);
        final ImageView imageView2 = (ImageView) findViewById(R.id.iv_load_failed);
        final TextView textView2 = (TextView) findViewById(R.id.tv_retry_text);
        final Button button = (Button) findViewById(R.id.btn_retry);
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.CheckedUpdateActivity.6
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
        final TextView textView = (TextView) findViewById(R.id.tv_download_progress_bar);
        final TextView textView2 = (TextView) findViewById(R.id.tv_donloading_progress);
        final int width = ((TextView) findViewById(R.id.tv_progress_bar_max_width)).getWidth();
        final int percent = downloadTask.getPercent();
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.CheckedUpdateActivity.7
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
        final FrameLayout frameLayout = (FrameLayout) findViewById(R.id.fl_downloading_progress);
        final FrameLayout frameLayout2 = (FrameLayout) findViewById(R.id.fl_installing);
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.CheckedUpdateActivity.8
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
            InstallUpdateWithPackageInstaller(this, getExternalCacheDir() + "/" + this.app_name_en + ".apk");
        } else if (file2.exists()) {
            InstallUpdateWithWlanAdb(getExternalCacheDir() + "/" + this.app_name_en + ".apk");
        } else {
            startActivity(new Intent(this, ChooseAppInstallMethodActivity.class));
            finish();
        }
    }

    public void InstallUpdateWithPackageInstaller(Context context, String str) {
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

    public void InstallUpdateWithWlanAdb(String str) {
        Intent intent = new Intent(this, InstallApkActivity.class);
        intent.putExtra("apkPath", str);
        startActivity(intent);
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateAppDownloadNum() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/php/checked_update_activity/update_app_download_num.php").openConnection();
            httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
            httpURLConnection.setConnectTimeout(6000);
            httpURLConnection.getResponseCode();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateCheckedUpdateActivityTotalPv() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/pv/checked_update_activity/pv.php").openConnection();
            httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
            httpURLConnection.setConnectTimeout(6000);
            httpURLConnection.getResponseCode();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    void setLayout() {
        File file = new File(getFilesDir(), "CircleLayout.txt");
        File file2 = new File(getFilesDir(), "SquareLayout.txt");
        if (file.exists() && file2.exists()) {
            setContentView(R.layout.activity_checked_update);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        } else if (file.exists()) {
            setContentView(R.layout.activity_checked_update);
        } else if (file2.exists()) {
            setContentView(R.layout.activity_checked_update_square);
        } else {
            setContentView(R.layout.activity_checked_update);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        }
    }

    private void ClickToBackLastActivity() {
        ((LinearLayout) findViewById(R.id.ll_back)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.CheckedUpdateActivity.9
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CheckedUpdateActivity.this.finish();
            }
        });
    }
}
