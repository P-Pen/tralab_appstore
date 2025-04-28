package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Process;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;
import java.io.File;
/* loaded from: classes.dex */
public class ClearDataActivity extends Activity {
    boolean isCheckBoxApplicationDataFull;
    boolean isCheckBoxCacheDataFull;

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setLayout();
        ClickToBackLastActivity();
        ShowCacheDirSize();
        ShowFilesDirSize();
        OnClickCheckBox();
        final ImageView imageView = (ImageView) findViewById(R.id.iv_cache_data);
        final ImageView imageView2 = (ImageView) findViewById(R.id.iv_application_data);
        ((Button) findViewById(R.id.btn_clean_data)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClearDataActivity.1
            /* JADX WARN: Type inference failed for: r6v9, types: [com.etralab.appstoreforandroid.ClearDataActivity$1$1] */
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (ClearDataActivity.this.isCheckBoxCacheDataFull) {
                    File file = new File(String.valueOf(ClearDataActivity.this.getCacheDir()));
                    File file2 = new File(String.valueOf(ClearDataActivity.this.getExternalCacheDir()));
                    if (file.exists()) {
                        DeleteFile.DeleteDirWithFile(file);
                    }
                    if (file2.exists()) {
                        DeleteFile.DeleteDirWithFile(file2);
                    }
                    Toast.makeText(ClearDataActivity.this, "缓存数据已清除！", 0).show();
                    ClearDataActivity.this.isCheckBoxCacheDataFull = false;
                    imageView.setImageResource(R.drawable.icon_checkbox_background);
                    ClearDataActivity.this.ShowCacheDirSize();
                }
                if (ClearDataActivity.this.isCheckBoxApplicationDataFull) {
                    File file3 = new File(String.valueOf(ClearDataActivity.this.getFilesDir()));
                    File file4 = new File(String.valueOf(ClearDataActivity.this.getExternalFilesDir(null)));
                    if (file3.exists()) {
                        DeleteFile.DeleteDirWithFile(file3);
                    }
                    if (file4.exists()) {
                        DeleteFile.DeleteDirWithFile(file4);
                    }
                    Toast.makeText(ClearDataActivity.this, "应用数据已清除，唯趣应用商店即将退出。", 1).show();
                    new Thread() { // from class: com.etralab.appstoreforandroid.ClearDataActivity.1.1
                        @Override // java.lang.Thread, java.lang.Runnable
                        public void run() {
                            super.run();
                            try {
                                sleep(3500L);
                            } catch (InterruptedException e) {
                                e.printStackTrace();
                            }
                            Process.killProcess(Process.myPid());
                            System.exit(0);
                        }
                    }.start();
                    ClearDataActivity.this.isCheckBoxApplicationDataFull = false;
                    imageView2.setImageResource(R.drawable.icon_checkbox_background);
                    ClearDataActivity.this.ShowFilesDirSize();
                }
            }
        });
    }

    void setLayout() {
        File file = new File(getFilesDir(), "CircleLayout.txt");
        File file2 = new File(getFilesDir(), "SquareLayout.txt");
        if (file.exists() && file2.exists()) {
            setContentView(R.layout.activity_clear_data);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        } else if (file.exists()) {
            setContentView(R.layout.activity_clear_data);
        } else if (file2.exists()) {
            setContentView(R.layout.activity_clear_data_square);
        } else {
            setContentView(R.layout.activity_clear_data);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        }
    }

    private void OnClickCheckBox() {
        final ImageView imageView = (ImageView) findViewById(R.id.iv_cache_data);
        final ImageView imageView2 = (ImageView) findViewById(R.id.iv_application_data);
        ((LinearLayout) findViewById(R.id.ll_cache_data)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClearDataActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (ClearDataActivity.this.isCheckBoxApplicationDataFull) {
                    return;
                }
                if (!ClearDataActivity.this.isCheckBoxCacheDataFull) {
                    ClearDataActivity.this.isCheckBoxCacheDataFull = true;
                    ClearDataActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.ClearDataActivity.2.1
                        @Override // java.lang.Runnable
                        public void run() {
                            imageView.setImageResource(R.drawable.icon_checkbox_full_blue);
                        }
                    });
                    return;
                }
                ClearDataActivity.this.isCheckBoxCacheDataFull = false;
                ClearDataActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.ClearDataActivity.2.2
                    @Override // java.lang.Runnable
                    public void run() {
                        imageView.setImageResource(R.drawable.icon_checkbox_background);
                    }
                });
            }
        });
        ((LinearLayout) findViewById(R.id.ll_application_data)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClearDataActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                if (!ClearDataActivity.this.isCheckBoxApplicationDataFull) {
                    ClearDataActivity.this.isCheckBoxApplicationDataFull = true;
                    ClearDataActivity.this.isCheckBoxCacheDataFull = true;
                    ClearDataActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.ClearDataActivity.3.1
                        @Override // java.lang.Runnable
                        public void run() {
                            imageView.setImageResource(R.drawable.icon_checkbox_full_gray);
                            imageView2.setImageResource(R.drawable.icon_checkbox_full_blue);
                        }
                    });
                    return;
                }
                ClearDataActivity.this.isCheckBoxApplicationDataFull = false;
                ClearDataActivity.this.isCheckBoxCacheDataFull = true;
                ClearDataActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.ClearDataActivity.3.2
                    @Override // java.lang.Runnable
                    public void run() {
                        imageView.setImageResource(R.drawable.icon_checkbox_full_blue);
                        imageView2.setImageResource(R.drawable.icon_checkbox_background);
                    }
                });
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ShowCacheDirSize() {
        final TextView textView = (TextView) findViewById(R.id.tv_cache_data_size);
        final String format = String.format("%.1f", Float.valueOf((((float) (getDirSize(new File(String.valueOf(getCacheDir()))) + getDirSize(new File(String.valueOf(getExternalCacheDir()))))) / 1024.0f) / 1024.0f));
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.ClearDataActivity.4
            @Override // java.lang.Runnable
            public void run() {
                TextView textView2 = textView;
                textView2.setText(format + "MB");
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ShowFilesDirSize() {
        final TextView textView = (TextView) findViewById(R.id.tv_application_data_size);
        final String format = String.format("%.1f", Float.valueOf(((float) (getDirSize(new File(String.valueOf(getFilesDir()))) + getDirSize(new File(String.valueOf(getExternalFilesDir(null)))))) / 1024.0f));
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.ClearDataActivity.5
            @Override // java.lang.Runnable
            public void run() {
                TextView textView2 = textView;
                textView2.setText(format + "KB");
            }
        });
    }

    private long getDirSize(File file) {
        long j = 0;
        try {
            File[] listFiles = file.listFiles();
            for (int i = 0; i < listFiles.length; i++) {
                j += listFiles[i].isDirectory() ? getDirSize(listFiles[i]) : listFiles[i].length();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return j;
    }

    void ClickToBackLastActivity() {
        ((LinearLayout) findViewById(R.id.ll_back)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClearDataActivity.6
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ClearDataActivity.this.finish();
            }
        });
    }
}
