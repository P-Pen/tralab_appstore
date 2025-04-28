package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.graphics.drawable.AnimationDrawable;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import org.apache.http.client.methods.HttpGet;
/* loaded from: classes.dex */
public class CheckUpdateActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setLayout();
        ClickToBackLastActivity();
        getWindow().setFlags(128, 128);
        CheckForUpdatesByVersionCode();
        ((Button) findViewById(R.id.btn_retry)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.CheckUpdateActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CheckUpdateActivity.this.CheckForUpdatesByVersionCode();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.etralab.appstoreforandroid.CheckUpdateActivity$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass2 extends Thread {
        AnonymousClass2() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            final LinearLayout linearLayout = (LinearLayout) CheckUpdateActivity.this.findViewById(R.id.ll_checking_update);
            final LinearLayout linearLayout2 = (LinearLayout) CheckUpdateActivity.this.findViewById(R.id.ll_no_update);
            final ImageView imageView = (ImageView) CheckUpdateActivity.this.findViewById(R.id.iv_loading_anim);
            final TextView textView = (TextView) CheckUpdateActivity.this.findViewById(R.id.tv_loading_text);
            final ImageView imageView2 = (ImageView) CheckUpdateActivity.this.findViewById(R.id.iv_load_failed);
            final TextView textView2 = (TextView) CheckUpdateActivity.this.findViewById(R.id.tv_retry_text);
            final Button button = (Button) CheckUpdateActivity.this.findViewById(R.id.btn_retry);
            CheckUpdateActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.CheckUpdateActivity.2.1
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
                    String str = new String(byteArrayOutputStream.toByteArray());
                    CheckUpdateActivity.this.UpdateCheckUpdateActivityTotalPv();
                    if (CheckUpdateActivity.getAppVersionCode(CheckUpdateActivity.this) < Long.parseLong(str)) {
                        CheckUpdateActivity.this.startActivity(new Intent(CheckUpdateActivity.this, CheckedUpdateActivity.class));
                        CheckUpdateActivity.this.finish();
                        return;
                    }
                    CheckUpdateActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.CheckUpdateActivity.2.2
                        /* JADX WARN: Type inference failed for: r0v2, types: [com.etralab.appstoreforandroid.CheckUpdateActivity$2$2$1] */
                        @Override // java.lang.Runnable
                        public void run() {
                            linearLayout.setVisibility(8);
                            linearLayout2.setVisibility(0);
                            new Thread() { // from class: com.etralab.appstoreforandroid.CheckUpdateActivity.2.2.1
                                @Override // java.lang.Thread, java.lang.Runnable
                                public void run() {
                                    super.run();
                                    ImageView imageView3 = (ImageView) CheckUpdateActivity.this.findViewById(R.id.iv_ok);
                                    if (imageView3 != null) {
                                        ((AnimationDrawable) imageView3.getBackground()).start();
                                    }
                                }
                            }.start();
                        }
                    });
                    return;
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            CheckUpdateActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.CheckUpdateActivity.2.3
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
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void CheckForUpdatesByVersionCode() {
        new AnonymousClass2().start();
    }

    void setLayout() {
        File file = new File(getFilesDir(), "CircleLayout.txt");
        File file2 = new File(getFilesDir(), "SquareLayout.txt");
        if (file.exists() && file2.exists()) {
            setContentView(R.layout.activity_check_update);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        } else if (file.exists()) {
            setContentView(R.layout.activity_check_update);
        } else if (file2.exists()) {
            setContentView(R.layout.activity_check_update_square);
        } else {
            setContentView(R.layout.activity_check_update);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        }
    }

    private void ClickToBackLastActivity() {
        ((LinearLayout) findViewById(R.id.ll_back)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.CheckUpdateActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                CheckUpdateActivity.this.finish();
            }
        });
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

    public static String getAppVersionName(Context context) {
        try {
            return context.getApplicationContext().getPackageManager().getPackageInfo(context.getPackageName(), 0).versionName;
        } catch (PackageManager.NameNotFoundException unused) {
            return "";
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateCheckUpdateActivityTotalPv() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/pv/check_update_activity/pv.php").openConnection();
            httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
            httpURLConnection.setConnectTimeout(6000);
            httpURLConnection.getResponseCode();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
