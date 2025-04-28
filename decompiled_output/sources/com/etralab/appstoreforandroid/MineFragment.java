package com.etralab.appstoreforandroid;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.Toast;
import androidx.fragment.app.Fragment;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import org.apache.http.client.methods.HttpGet;
/* loaded from: classes.dex */
public class MineFragment extends Fragment {
    long latestVersionCode = 0;
    long currentVersionCode = 0;

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        File file = new File(getContext().getFilesDir(), "CircleLayout.txt");
        File file2 = new File(getContext().getFilesDir(), "SquareLayout.txt");
        if (file.exists()) {
            return layoutInflater.inflate(R.layout.fragment_mine, viewGroup, false);
        }
        if (file2.exists()) {
            return layoutInflater.inflate(R.layout.fragment_mine_square, viewGroup, false);
        }
        return layoutInflater.inflate(R.layout.fragment_mine, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        long j = this.latestVersionCode;
        if (j != 0) {
            long j2 = this.currentVersionCode;
            if (j2 == 0 || j2 >= j) {
                return;
            }
            getActivity().runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.MineFragment.1
                @Override // java.lang.Runnable
                public void run() {
                    ((ImageView) MineFragment.this.getActivity().findViewById(R.id.iv_settings_point)).setVisibility(0);
                }
            });
        }
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        CheckForUpdatesByVersionCode();
        ((LinearLayout) getActivity().findViewById(R.id.ll_download_record)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.MineFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Toast.makeText(MineFragment.this.getActivity(), "该功能暂未开放，敬请期待！", 0).show();
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_skin)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.MineFragment.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Toast.makeText(MineFragment.this.getActivity(), "该功能暂未开放，敬请期待！", 0).show();
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_exit)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.MineFragment.4
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                MineFragment.this.getActivity().finish();
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_settings)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.MineFragment.5
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = MineFragment.this.getContext();
                context.startActivity(new Intent(context, SettingsActivity.class));
            }
        });
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.etralab.appstoreforandroid.MineFragment$6] */
    private void CheckForUpdatesByVersionCode() {
        new Thread() { // from class: com.etralab.appstoreforandroid.MineFragment.6
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                try {
                    HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/php/check_update_activity/get_latest_version_data.php").openConnection();
                    httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
                    httpURLConnection.setConnectTimeout(6000);
                    if (httpURLConnection.getResponseCode() != 200) {
                        return;
                    }
                    InputStream inputStream = httpURLConnection.getInputStream();
                    byte[] bArr = new byte[1024];
                    ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
                    while (true) {
                        int read = inputStream.read(bArr);
                        if (read > -1) {
                            byteArrayOutputStream.write(bArr, 0, read);
                        } else {
                            String str = new String(byteArrayOutputStream.toByteArray());
                            MineFragment.this.latestVersionCode = Long.parseLong(str);
                            MineFragment mineFragment = MineFragment.this;
                            mineFragment.currentVersionCode = MineFragment.getAppVersionCode(mineFragment.getContext());
                            return;
                        }
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
}
