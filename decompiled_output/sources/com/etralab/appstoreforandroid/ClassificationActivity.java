package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class ClassificationActivity extends Activity {
    private final List<App> appList = new ArrayList();
    boolean isPrepareData = false;

    /* JADX WARN: Type inference failed for: r1v2, types: [com.etralab.appstoreforandroid.ClassificationActivity$1] */
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setLayout();
        ClickToBackLastActivity();
        setTitle();
        new Thread() { // from class: com.etralab.appstoreforandroid.ClassificationActivity.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                ImageView imageView = (ImageView) ClassificationActivity.this.findViewById(R.id.iv_loading_anim);
                if (imageView != null) {
                    ((AnimationDrawable) imageView.getBackground()).start();
                }
            }
        }.start();
        parseByJSONObject();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ShowAppsData() {
        RecyclerView recyclerView = (RecyclerView) findViewById(R.id.recyclerView_home);
        recyclerView.setHasFixedSize(true);
        recyclerView.setNestedScrollingEnabled(false);
        new AnonymousClass2(recyclerView).start();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.etralab.appstoreforandroid.ClassificationActivity$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass2 extends Thread {
        final /* synthetic */ RecyclerView val$recyclerView_home;

        AnonymousClass2(RecyclerView recyclerView) {
            this.val$recyclerView_home = recyclerView;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            ClassificationActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.ClassificationActivity.2.1
                @Override // java.lang.Runnable
                public void run() {
                    LinearLayout linearLayout = (LinearLayout) ClassificationActivity.this.findViewById(R.id.ll_loading_app_list);
                    final ImageView imageView = (ImageView) ClassificationActivity.this.findViewById(R.id.iv_loading_anim);
                    ((AnimationDrawable) imageView.getBackground()).stop();
                    if (linearLayout == null || AnonymousClass2.this.val$recyclerView_home == null) {
                        return;
                    }
                    if (ClassificationActivity.this.appList.size() > 0) {
                        AppAdapterForActivity appAdapterForActivity = new AppAdapterForActivity(ClassificationActivity.this, ClassificationActivity.this.appList);
                        AnonymousClass2.this.val$recyclerView_home.setLayoutManager(new LinearLayoutManager(ClassificationActivity.this, 1, false));
                        AnonymousClass2.this.val$recyclerView_home.setItemAnimator(new DefaultItemAnimator());
                        AnonymousClass2.this.val$recyclerView_home.setAdapter(appAdapterForActivity);
                        AnonymousClass2.this.val$recyclerView_home.addItemDecoration(new DividerItemDecoration(ClassificationActivity.this, 1));
                        ClassificationActivity.this.isPrepareData = true;
                        linearLayout.setVisibility(8);
                        AnonymousClass2.this.val$recyclerView_home.setVisibility(0);
                        return;
                    }
                    final TextView textView = (TextView) ClassificationActivity.this.findViewById(R.id.tv_loading_app_list);
                    final ImageView imageView2 = (ImageView) ClassificationActivity.this.findViewById(R.id.iv_load_failed);
                    final TextView textView2 = (TextView) ClassificationActivity.this.findViewById(R.id.tv_retry_text);
                    final Button button = (Button) ClassificationActivity.this.findViewById(R.id.btn_retry);
                    imageView.setVisibility(8);
                    textView.setVisibility(8);
                    imageView2.setVisibility(0);
                    textView2.setVisibility(0);
                    button.setVisibility(0);
                    button.setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationActivity.2.1.1
                        @Override // android.view.View.OnClickListener
                        public void onClick(View view) {
                            imageView.setVisibility(0);
                            textView.setVisibility(0);
                            imageView2.setVisibility(8);
                            textView2.setVisibility(8);
                            button.setVisibility(8);
                            ((AnimationDrawable) imageView.getBackground()).start();
                            ClassificationActivity.this.parseByJSONObject();
                        }
                    });
                }
            });
        }
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.etralab.appstoreforandroid.ClassificationActivity$3] */
    public void parseByJSONObject() {
        new Thread() { // from class: com.etralab.appstoreforandroid.ClassificationActivity.3
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                String json = ClassificationActivity.this.getJson();
                if (json != null) {
                    try {
                        JSONArray jSONArray = new JSONObject(json).getJSONArray("data");
                        for (int i = 0; i < jSONArray.length(); i++) {
                            JSONObject jSONObject = jSONArray.getJSONObject(i);
                            String string = jSONObject.getString("id");
                            String string2 = jSONObject.getString("name");
                            ClassificationActivity.this.appList.add(new App(string, string2, "http://img.etrasoft.cn" + jSONObject.getString("logo_url"), jSONObject.getString("download_num"), jSONObject.getString("like_num"), jSONObject.getString("os_type")));
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
                ClassificationActivity.this.ShowAppsData();
            }
        }.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getJson() {
        String stringExtra = getIntent().getStringExtra("appClassificationEn");
        if (stringExtra.equals("Ranking")) {
            try {
                HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/php/classification_activity/get_download_ranking_apps_data.php").openConnection();
                httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
                httpURLConnection.setConnectTimeout(6000);
                if (httpURLConnection.getResponseCode() == 200) {
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
                }
            } catch (IOException e) {
                e.printStackTrace();
            }
            return null;
        } else if (stringExtra.equals("NewArrival")) {
            try {
                HttpURLConnection httpURLConnection2 = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/php/classification_activity/get_new_apps_data.php").openConnection();
                httpURLConnection2.setRequestMethod(HttpGet.METHOD_NAME);
                httpURLConnection2.setConnectTimeout(6000);
                if (httpURLConnection2.getResponseCode() == 200) {
                    InputStream inputStream2 = httpURLConnection2.getInputStream();
                    byte[] bArr2 = new byte[1024];
                    ByteArrayOutputStream byteArrayOutputStream2 = new ByteArrayOutputStream();
                    while (true) {
                        int read2 = inputStream2.read(bArr2);
                        if (read2 > -1) {
                            byteArrayOutputStream2.write(bArr2, 0, read2);
                        } else {
                            return new String(byteArrayOutputStream2.toByteArray());
                        }
                    }
                }
            } catch (IOException e2) {
                e2.printStackTrace();
            }
            return null;
        } else if (stringExtra.equals("Hot")) {
            try {
                HttpURLConnection httpURLConnection3 = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/php/classification_activity/get_hot_apps_data.php").openConnection();
                httpURLConnection3.setRequestMethod(HttpGet.METHOD_NAME);
                httpURLConnection3.setConnectTimeout(6000);
                if (httpURLConnection3.getResponseCode() == 200) {
                    InputStream inputStream3 = httpURLConnection3.getInputStream();
                    byte[] bArr3 = new byte[1024];
                    ByteArrayOutputStream byteArrayOutputStream3 = new ByteArrayOutputStream();
                    while (true) {
                        int read3 = inputStream3.read(bArr3);
                        if (read3 > -1) {
                            byteArrayOutputStream3.write(bArr3, 0, read3);
                        } else {
                            return new String(byteArrayOutputStream3.toByteArray());
                        }
                    }
                }
            } catch (IOException e3) {
                e3.printStackTrace();
            }
            return null;
        } else if (stringExtra.equals("HankMiSection")) {
            try {
                HttpURLConnection httpURLConnection4 = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/php/classification_activity/get_hankmi_apps_data.php").openConnection();
                httpURLConnection4.setRequestMethod(HttpGet.METHOD_NAME);
                httpURLConnection4.setConnectTimeout(6000);
                if (httpURLConnection4.getResponseCode() == 200) {
                    InputStream inputStream4 = httpURLConnection4.getInputStream();
                    byte[] bArr4 = new byte[1024];
                    ByteArrayOutputStream byteArrayOutputStream4 = new ByteArrayOutputStream();
                    while (true) {
                        int read4 = inputStream4.read(bArr4);
                        if (read4 > -1) {
                            byteArrayOutputStream4.write(bArr4, 0, read4);
                        } else {
                            return new String(byteArrayOutputStream4.toByteArray());
                        }
                    }
                }
            } catch (IOException e4) {
                e4.printStackTrace();
            }
            return null;
        } else {
            DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
            defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
            defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
            HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/classification_activity/get_apps_data_new.php");
            ArrayList arrayList = new ArrayList();
            arrayList.add(new BasicNameValuePair("classification", stringExtra));
            try {
                httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
                HttpResponse execute = defaultHttpClient.execute((HttpUriRequest) httpPost);
                if (execute.getStatusLine().getStatusCode() == 200) {
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
                }
            } catch (Exception e5) {
                e5.printStackTrace();
            }
            return null;
        }
    }

    void setTitle() {
        final String stringExtra = getIntent().getStringExtra("appClassification");
        final TextView textView = (TextView) findViewById(R.id.tv_title);
        if (textView != null) {
            runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.ClassificationActivity.4
                @Override // java.lang.Runnable
                public void run() {
                    textView.setText(stringExtra);
                }
            });
        }
    }

    void setLayout() {
        File file = new File(getFilesDir(), "CircleLayout.txt");
        File file2 = new File(getFilesDir(), "SquareLayout.txt");
        if (file.exists() && file2.exists()) {
            setContentView(R.layout.activity_classification);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        } else if (file.exists()) {
            setContentView(R.layout.activity_classification);
        } else if (file2.exists()) {
            setContentView(R.layout.activity_classification_square);
        } else {
            setContentView(R.layout.activity_classification);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        }
    }

    private void ClickToBackLastActivity() {
        ((LinearLayout) findViewById(R.id.ll_back)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationActivity.5
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ClassificationActivity.this.finish();
            }
        });
    }
}
