package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextClock;
import android.widget.Toast;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import org.apache.http.client.methods.HttpGet;
/* loaded from: classes.dex */
public class SettingsActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setLayout();
        ClickToBackLastActivity();
        CheckForUpdatesByVersionCode();
        ((LinearLayout) findViewById(R.id.ll_help)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SettingsActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Toast.makeText(SettingsActivity.this, "该功能暂未开放，敬请期待！", 0).show();
            }
        });
        ((LinearLayout) findViewById(R.id.ll_choose_apk_install_method)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SettingsActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SettingsActivity.this.startActivity(new Intent(SettingsActivity.this, ChooseAppInstallMethodActivity.class));
            }
        });
        ((LinearLayout) findViewById(R.id.ll_choose_layout)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SettingsActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SettingsActivity.this.startActivity(new Intent(SettingsActivity.this, ChooseLayoutActivity.class));
                SettingsActivity.this.finish();
            }
        });
        ((LinearLayout) findViewById(R.id.ll_clear_data)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SettingsActivity.4
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SettingsActivity.this.startActivity(new Intent(SettingsActivity.this, ClearDataActivity.class));
            }
        });
        ((LinearLayout) findViewById(R.id.ll_userAgreement)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SettingsActivity.5
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SettingsActivity.this.startActivity(new Intent(SettingsActivity.this, UserAgreementActivity.class));
            }
        });
        ((LinearLayout) findViewById(R.id.ll_support_us)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SettingsActivity.6
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SettingsActivity.this.startActivity(new Intent(SettingsActivity.this, SupportUsActivity.class));
            }
        });
        ((LinearLayout) findViewById(R.id.ll_check_for_updates)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SettingsActivity.7
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SettingsActivity.this.startActivity(new Intent(SettingsActivity.this, CheckUpdateActivity.class));
            }
        });
        ((LinearLayout) findViewById(R.id.ll_about)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SettingsActivity.8
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SettingsActivity.this.startActivity(new Intent(SettingsActivity.this, AboutActivity.class));
            }
        });
        TextClock textClock = (TextClock) findViewById(R.id.tc_time);
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.etralab.appstoreforandroid.SettingsActivity$9] */
    private void CheckForUpdatesByVersionCode() {
        new Thread() { // from class: com.etralab.appstoreforandroid.SettingsActivity.9
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                try {
                    HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/php/check_update_activity/get_latest_version_data.php").openConnection();
                    httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
                    httpURLConnection.setConnectTimeout(6000);
                    if (httpURLConnection.getResponseCode() == 200) {
                        InputStream inputStream = httpURLConnection.getInputStream();
                        byte[] bArr = new byte[1024];
                        ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                        while (true) {
                            int read = inputStream.read(bArr);
                            if (read <= -1) {
                                break;
                            }
                            byteArrayOutputStream.write(bArr, 0, read);
                        }
                        Long valueOf = Long.valueOf(Long.parseLong(new String(byteArrayOutputStream.toByteArray())));
                        Long valueOf2 = Long.valueOf(SettingsActivity.getAppVersionCode(SettingsActivity.this));
                        if (valueOf.longValue() == 0 || valueOf2.longValue() == 0 || valueOf2.longValue() >= valueOf.longValue()) {
                            return;
                        }
                        SettingsActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.SettingsActivity.9.1
                            @Override // java.lang.Runnable
                            public void run() {
                                ((ImageView) SettingsActivity.this.findViewById(R.id.iv_update_point)).setVisibility(0);
                            }
                        });
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }.start();
    }

    public static long getAppVersionCode(Context context) {
        long j;
        try {
            PackageInfo packageInfo = context.getApplicationContext().getPackageManager().getPackageInfo(context.getPackageName(), 0);
            if (Build.VERSION.SDK_INT >= 28) {
                j = packageInfo.getLongVersionCode();
            } else {
                j = packageInfo.versionCode;
            }
            return j;
        } catch (PackageManager.NameNotFoundException e) {
            Log.e("", e.getMessage());
            return 0L;
        }
    }

    void setLayout() {
        File file = new File(getFilesDir(), "CircleLayout.txt");
        File file2 = new File(getFilesDir(), "SquareLayout.txt");
        if (file.exists() && file2.exists()) {
            setContentView(R.layout.activity_settings);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        } else if (file.exists()) {
            setContentView(R.layout.activity_settings);
        } else if (file2.exists()) {
            setContentView(R.layout.activity_settings_square);
        } else {
            setContentView(R.layout.activity_settings);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        }
    }

    private void ClickToBackLastActivity() {
        ((LinearLayout) findViewById(R.id.ll_back)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SettingsActivity.10
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SettingsActivity.this.finish();
            }
        });
    }
}
