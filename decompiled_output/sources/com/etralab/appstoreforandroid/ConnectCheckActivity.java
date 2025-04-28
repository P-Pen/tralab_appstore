package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.os.Bundle;
import android.os.Looper;
import android.view.View;
import android.widget.Button;
import android.widget.Toast;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
/* loaded from: classes.dex */
public class ConnectCheckActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_connect_check);
        ((Button) findViewById(R.id.btn_main_server_connect_check)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ConnectCheckActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Toast.makeText(ConnectCheckActivity.this.getApplicationContext(), "正在连接至主服务器", 0).show();
                new Thread(new Runnable() { // from class: com.etralab.appstoreforandroid.ConnectCheckActivity.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        if (ConnectCheckActivity.this.isConnByHttp()) {
                            Looper.prepare();
                            Toast.makeText(ConnectCheckActivity.this.getApplicationContext(), "成功连接至主服务器", 0).show();
                            Looper.loop();
                            return;
                        }
                        Looper.prepare();
                        Toast.makeText(ConnectCheckActivity.this.getApplicationContext(), "无法连接至主服务器", 0).show();
                        Looper.loop();
                    }
                }).start();
            }
        });
    }

    public boolean isConnByHttp() {
        HttpURLConnection httpURLConnection;
        IOException e;
        MalformedURLException e2;
        boolean z = false;
        HttpURLConnection httpURLConnection2 = null;
        try {
            try {
                httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/").openConnection();
                try {
                    httpURLConnection.setConnectTimeout(5000);
                    if (httpURLConnection.getResponseCode() == 200) {
                        z = true;
                    }
                } catch (MalformedURLException e3) {
                    e2 = e3;
                    e2.printStackTrace();
                    httpURLConnection.disconnect();
                    return z;
                } catch (IOException e4) {
                    e = e4;
                    e.printStackTrace();
                    httpURLConnection.disconnect();
                    return z;
                }
            } catch (Throwable th) {
                th = th;
                httpURLConnection2 = httpURLConnection;
                httpURLConnection2.disconnect();
                throw th;
            }
        } catch (MalformedURLException e5) {
            httpURLConnection = null;
            e2 = e5;
        } catch (IOException e6) {
            httpURLConnection = null;
            e = e6;
        } catch (Throwable th2) {
            th = th2;
            httpURLConnection2.disconnect();
            throw th;
        }
        httpURLConnection.disconnect();
        return z;
    }
}
