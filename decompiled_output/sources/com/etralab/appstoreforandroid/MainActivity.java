package com.etralab.appstoreforandroid;

import android.content.Intent;
import android.os.Bundle;
import android.widget.LinearLayout;
import android.widget.Toast;
import androidx.fragment.app.Fragment;
import androidx.fragment.app.FragmentActivity;
import androidx.viewpager2.adapter.FragmentStateAdapter;
import androidx.viewpager2.widget.ViewPager2;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.client.methods.HttpGet;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class MainActivity extends FragmentActivity {
    public static MainActivity instance;
    LinearLayout dots;
    int versionCheck;
    ViewPager2 viewPager;
    boolean isVersionCheckJsonDownload = false;
    boolean isPostedDeviceInfo = false;
    List<Fragment> list = new ArrayList();

    @Override // androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_main);
        instance = this;
        isChooseLayout();
        isChooseApkInstallMethod();
        isWarmHintAgree();
        isUserAgreementAgree();
        startActivity(new Intent(this, PermissionActivity.class));
        InitViewPager();
        SetDots();
        parseVersionCheckJsonByJSONObject();
        getWindow().setFlags(128, 128);
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onResume() {
        super.onResume();
        if (this.isPostedDeviceInfo) {
            return;
        }
        PostDeviceInfo();
        this.isPostedDeviceInfo = true;
    }

    @Override // androidx.fragment.app.FragmentActivity, android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
    }

    public void isNameChangeHintAgree() {
        if (new File(getFilesDir(), "isNameChangeHintAgree").exists()) {
            return;
        }
        startActivity(new Intent(this, NameChangeHintActivity.class));
    }

    public void isWarmHintAgree() {
        if (new File(getFilesDir(), "isWarmHintAgree.txt").exists()) {
            return;
        }
        startActivity(new Intent(this, WarmHintActivity.class));
    }

    public void isChooseLayout() {
        File file = new File(getFilesDir(), "SquareLayout.txt");
        File file2 = new File(getFilesDir(), "CircleLayout.txt");
        if (!file.exists() && !file2.exists()) {
            startActivity(new Intent(this, ChooseLayoutActivity.class));
        } else if (file.exists() && file2.exists()) {
            startActivity(new Intent(this, ChooseLayoutActivity.class));
        }
    }

    public void isChooseApkInstallMethod() {
        File file = new File(getFilesDir(), "UsePackageInstaller.txt");
        File file2 = new File(getFilesDir(), "UseWlanAdb.txt");
        if (!file.exists() && !file2.exists()) {
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        } else if (file.exists() && file2.exists()) {
            startActivity(new Intent(this, ChooseAppInstallMethodActivity.class));
        }
    }

    public void isUserAgreementAgree() {
        if (new File(getFilesDir(), "isUserAgreementAgree4").exists()) {
            return;
        }
        startActivity(new Intent(this, UserAgreementActivity.class));
        finish();
    }

    public void InitViewPager() {
        this.viewPager = (ViewPager2) findViewById(R.id.viewPager);
        HomeFragment homeFragment = new HomeFragment();
        ClassificationFragment classificationFragment = new ClassificationFragment();
        new RankingFragment();
        MineFragment mineFragment = new MineFragment();
        this.list.add(homeFragment);
        this.list.add(classificationFragment);
        this.list.add(mineFragment);
        this.viewPager.setAdapter(new FragmentStateAdapter(this) { // from class: com.etralab.appstoreforandroid.MainActivity.1
            @Override // androidx.viewpager2.adapter.FragmentStateAdapter
            public Fragment createFragment(int i) {
                return MainActivity.this.list.get(i);
            }

            @Override // androidx.recyclerview.widget.RecyclerView.Adapter
            public int getItemCount() {
                return MainActivity.this.list.size();
            }
        });
    }

    public void SetDots() {
        this.dots = (LinearLayout) findViewById(R.id.dots);
        this.viewPager.registerOnPageChangeCallback(new ViewPager2.OnPageChangeCallback() { // from class: com.etralab.appstoreforandroid.MainActivity.2
            @Override // androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
            public void onPageSelected(int i) {
                super.onPageSelected(i);
                for (int i2 = 0; i2 < MainActivity.this.dots.getChildCount(); i2++) {
                    MainActivity.this.dots.getChildAt(i2).setBackgroundResource(R.drawable.icon_unselected);
                }
                if (i == 0) {
                    MainActivity.this.dots.getChildAt(i).setBackgroundResource(R.drawable.icon_home);
                } else if (i == 1) {
                    MainActivity.this.dots.getChildAt(i).setBackgroundResource(R.drawable.icon_classification);
                } else if (i == 2) {
                    MainActivity.this.dots.getChildAt(i).setBackgroundResource(R.drawable.icon_mine);
                } else {
                    MainActivity.this.dots.getChildAt(i).setBackgroundResource(R.drawable.icon_selected);
                }
            }
        });
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.etralab.appstoreforandroid.MainActivity$3] */
    public void parseVersionCheckJsonByJSONObject() {
        new Thread() { // from class: com.etralab.appstoreforandroid.MainActivity.3
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                String versionCheckJson = MainActivity.this.getVersionCheckJson();
                if (versionCheckJson != null) {
                    try {
                        MainActivity.this.versionCheck = new JSONObject(versionCheckJson).getInt("build_17");
                        if ((MainActivity.this.versionCheck == 1) | (MainActivity.this.versionCheck == 0)) {
                            MainActivity.this.isVersionCheckJsonDownload = true;
                        }
                        MainActivity.this.VersionCheck();
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
            }
        }.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getVersionCheckJson() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/json/version_check.json").openConnection();
            httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
            httpURLConnection.setConnectTimeout(6000);
            if (httpURLConnection.getResponseCode() != 200) {
                return null;
            }
            InputStream inputStream = httpURLConnection.getInputStream();
            byte[] bArr = new byte[1024];
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            while (true) {
                int read = inputStream.read(bArr);
                if (read > -1) {
                    byteArrayOutputStream.write(bArr, 0, read);
                } else {
                    return new String(byteArrayOutputStream.toByteArray());
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void VersionCheck() {
        if (!this.isVersionCheckJsonDownload || this.versionCheck == 1) {
            return;
        }
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.MainActivity.4
            @Override // java.lang.Runnable
            public void run() {
                Toast.makeText(MainActivity.this, "唯趣应用商店版本过低，请先更新至最新版本", 1).show();
            }
        });
        startActivity(new Intent(this, ForceUpdateActivity.class));
    }

    /* JADX WARN: Can't wrap try/catch for region: R(9:1|(3:2|3|4)|(2:5|6)|(4:(3:7|(3:9|10|11)(1:30)|12)|17|18|20)|13|14|15|16|(1:(0))) */
    /* JADX WARN: Code restructure failed: missing block: B:26:0x01d4, code lost:
        r0 = e;
     */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void PostDeviceInfo() {
        /*
            Method dump skipped, instructions count: 475
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.etralab.appstoreforandroid.MainActivity.PostDeviceInfo():void");
    }
}
