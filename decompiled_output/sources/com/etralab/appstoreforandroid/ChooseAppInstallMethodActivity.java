package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Toast;
import java.io.File;
import java.io.IOException;
/* loaded from: classes.dex */
public class ChooseAppInstallMethodActivity extends Activity {
    int apkInstallMethodId = 0;

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_choose_app_install_method);
        final ImageView imageView = (ImageView) findViewById(R.id.iv_use_package_installer);
        final ImageView imageView2 = (ImageView) findViewById(R.id.iv_use_wlan_adb);
        ((LinearLayout) findViewById(R.id.ll_help_for_choose_app_install_method)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ChooseAppInstallMethodActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ChooseAppInstallMethodActivity.this.startActivity(new Intent(ChooseAppInstallMethodActivity.this, HelpForChooseApkInstallMethodActivity.class));
            }
        });
        ((LinearLayout) findViewById(R.id.ll_use_package_installer)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ChooseAppInstallMethodActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ChooseAppInstallMethodActivity.this.apkInstallMethodId = 1;
                ChooseAppInstallMethodActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.ChooseAppInstallMethodActivity.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                        imageView.setImageResource(R.drawable.icon_radio_button_full_blue);
                        imageView2.setImageResource(R.drawable.icon_radio_button_background);
                    }
                });
            }
        });
        ((LinearLayout) findViewById(R.id.ll_use_wlan_adb)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ChooseAppInstallMethodActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ChooseAppInstallMethodActivity.this.apkInstallMethodId = 2;
                ChooseAppInstallMethodActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.ChooseAppInstallMethodActivity.3.1
                    @Override // java.lang.Runnable
                    public void run() {
                        imageView.setImageResource(R.drawable.icon_radio_button_background);
                        imageView2.setImageResource(R.drawable.icon_radio_button_full_blue);
                    }
                });
            }
        });
        ((Button) findViewById(R.id.btn_choose)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ChooseAppInstallMethodActivity.4
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                File file = new File(ChooseAppInstallMethodActivity.this.getFilesDir(), "UsePackageInstaller.txt");
                if (file.isFile() && file.exists()) {
                    file.delete();
                }
                File file2 = new File(ChooseAppInstallMethodActivity.this.getFilesDir(), "UseWlanAdb.txt");
                if (file2.isFile() && file2.exists()) {
                    file2.delete();
                }
                if (ChooseAppInstallMethodActivity.this.apkInstallMethodId == 1) {
                    File file3 = new File(ChooseAppInstallMethodActivity.this.getFilesDir(), "UsePackageInstaller.txt");
                    if (file3.exists()) {
                        return;
                    }
                    try {
                        file3.createNewFile();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    ChooseAppInstallMethodActivity.this.finish();
                } else if (ChooseAppInstallMethodActivity.this.apkInstallMethodId == 2) {
                    File file4 = new File(ChooseAppInstallMethodActivity.this.getFilesDir(), "UseWlanAdb.txt");
                    if (file4.exists()) {
                        return;
                    }
                    try {
                        file4.createNewFile();
                    } catch (IOException e2) {
                        e2.printStackTrace();
                    }
                    ChooseAppInstallMethodActivity.this.finish();
                } else {
                    Toast.makeText(ChooseAppInstallMethodActivity.this, "请先选择应用安装方式", 0).show();
                }
            }
        });
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        File file = new File(getFilesDir(), "UsePackageInstaller.txt");
        File file2 = new File(getFilesDir(), "UseWlanAdb.txt");
        if (!file.exists() && !file2.exists()) {
            startActivity(new Intent(this, ChooseLayoutActivity.class));
        }
        super.onDestroy();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (keyEvent.getKeyCode() == 4) {
            return true;
        }
        return super.dispatchKeyEvent(keyEvent);
    }
}
