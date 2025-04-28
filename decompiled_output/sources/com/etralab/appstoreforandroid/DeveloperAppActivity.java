package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.util.Log;
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
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class DeveloperAppActivity extends Activity {
    private final List<App> appList = new ArrayList();
    boolean isPrepareData = false;

    /* JADX WARN: Type inference failed for: r2v1, types: [com.etralab.appstoreforandroid.DeveloperAppActivity$1] */
    /* JADX WARN: Type inference failed for: r2v2, types: [com.etralab.appstoreforandroid.DeveloperAppActivity$2] */
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        requestWindowFeature(1);
        super.onCreate(bundle);
        setLayout();
        ClickToBackLastActivity();
        setTitle();
        new Thread() { // from class: com.etralab.appstoreforandroid.DeveloperAppActivity.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                DeveloperAppActivity.this.UpdateDeveloperAppActivityTotalPv();
            }
        }.start();
        new Thread() { // from class: com.etralab.appstoreforandroid.DeveloperAppActivity.2
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                ImageView imageView = (ImageView) DeveloperAppActivity.this.findViewById(R.id.iv_loading_anim);
                if (imageView != null) {
                    ((AnimationDrawable) imageView.getBackground()).start();
                }
            }
        }.start();
        parseByJSONObject();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ShowAppsData() {
        RecyclerView recyclerView = (RecyclerView) findViewById(R.id.rv_developer_app);
        recyclerView.setHasFixedSize(true);
        recyclerView.setNestedScrollingEnabled(false);
        new AnonymousClass3(recyclerView).start();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.etralab.appstoreforandroid.DeveloperAppActivity$3  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass3 extends Thread {
        final /* synthetic */ RecyclerView val$rv_developer_app;

        AnonymousClass3(RecyclerView recyclerView) {
            this.val$rv_developer_app = recyclerView;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            DeveloperAppActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.DeveloperAppActivity.3.1
                @Override // java.lang.Runnable
                public void run() {
                    LinearLayout linearLayout = (LinearLayout) DeveloperAppActivity.this.findViewById(R.id.ll_loading_app_list);
                    final ImageView imageView = (ImageView) DeveloperAppActivity.this.findViewById(R.id.iv_loading_anim);
                    ((AnimationDrawable) imageView.getBackground()).stop();
                    if (linearLayout == null || AnonymousClass3.this.val$rv_developer_app == null) {
                        return;
                    }
                    if (DeveloperAppActivity.this.appList.size() > 0) {
                        AppAdapterForActivity appAdapterForActivity = new AppAdapterForActivity(DeveloperAppActivity.this, DeveloperAppActivity.this.appList);
                        AnonymousClass3.this.val$rv_developer_app.setLayoutManager(new LinearLayoutManager(DeveloperAppActivity.this, 1, false));
                        AnonymousClass3.this.val$rv_developer_app.setItemAnimator(new DefaultItemAnimator());
                        AnonymousClass3.this.val$rv_developer_app.setAdapter(appAdapterForActivity);
                        AnonymousClass3.this.val$rv_developer_app.addItemDecoration(new DividerItemDecoration(DeveloperAppActivity.this, 1));
                        DeveloperAppActivity.this.isPrepareData = true;
                        linearLayout.setVisibility(8);
                        AnonymousClass3.this.val$rv_developer_app.setVisibility(0);
                        return;
                    }
                    final TextView textView = (TextView) DeveloperAppActivity.this.findViewById(R.id.tv_loading_app_list);
                    final ImageView imageView2 = (ImageView) DeveloperAppActivity.this.findViewById(R.id.iv_load_failed);
                    final TextView textView2 = (TextView) DeveloperAppActivity.this.findViewById(R.id.tv_retry_text);
                    final Button button = (Button) DeveloperAppActivity.this.findViewById(R.id.btn_retry);
                    imageView.setVisibility(8);
                    textView.setVisibility(8);
                    imageView2.setVisibility(0);
                    textView2.setVisibility(0);
                    button.setVisibility(0);
                    button.setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.DeveloperAppActivity.3.1.1
                        @Override // android.view.View.OnClickListener
                        public void onClick(View view) {
                            imageView.setVisibility(0);
                            textView.setVisibility(0);
                            imageView2.setVisibility(8);
                            textView2.setVisibility(8);
                            button.setVisibility(8);
                            ((AnimationDrawable) imageView.getBackground()).start();
                            DeveloperAppActivity.this.parseByJSONObject();
                        }
                    });
                }
            });
        }
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.etralab.appstoreforandroid.DeveloperAppActivity$4] */
    public void parseByJSONObject() {
        new Thread() { // from class: com.etralab.appstoreforandroid.DeveloperAppActivity.4
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                String json = DeveloperAppActivity.this.getJson();
                if (json != null) {
                    try {
                        JSONArray jSONArray = new JSONObject(json).getJSONArray("data");
                        for (int i = 0; i < jSONArray.length(); i++) {
                            JSONObject jSONObject = jSONArray.getJSONObject(i);
                            String string = jSONObject.getString("id");
                            String string2 = jSONObject.getString("name");
                            DeveloperAppActivity.this.appList.add(new App(string, string2, "http://img.etrasoft.cn" + jSONObject.getString("logo_url"), jSONObject.getString("download_num"), jSONObject.getString("like_num"), jSONObject.getString("os_type")));
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
                DeveloperAppActivity.this.ShowAppsData();
            }
        }.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getJson() {
        String stringExtra = getIntent().getStringExtra("appDeveloperName");
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
        HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/developer_app_activity/get_developer_apps_data.php");
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("developerName", stringExtra));
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
                    Log.e("TAG", sb.toString());
                    return sb.toString();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    void setTitle() {
        final String stringExtra = getIntent().getStringExtra("appDeveloperName");
        final TextView textView = (TextView) findViewById(R.id.tv_title);
        final MarqueeTextView marqueeTextView = (MarqueeTextView) findViewById(R.id.mtv_title);
        if (textView != null) {
            runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.DeveloperAppActivity.5
                @Override // java.lang.Runnable
                public void run() {
                    textView.setText(stringExtra);
                }
            });
        }
        if (marqueeTextView != null) {
            runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.DeveloperAppActivity.6
                @Override // java.lang.Runnable
                public void run() {
                    marqueeTextView.setText(stringExtra);
                }
            });
        }
    }

    void setLayout() {
        File file = new File(getFilesDir(), "CircleLayout.txt");
        File file2 = new File(getFilesDir(), "SquareLayout.txt");
        if (file.exists() && file2.exists()) {
            setContentView(R.layout.activity_developer_app);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        } else if (file.exists()) {
            setContentView(R.layout.activity_developer_app);
        } else if (file2.exists()) {
            setContentView(R.layout.activity_developer_app_square);
        } else {
            setContentView(R.layout.activity_developer_app);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        }
    }

    private void ClickToBackLastActivity() {
        ((LinearLayout) findViewById(R.id.ll_back)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.DeveloperAppActivity.7
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                DeveloperAppActivity.this.finish();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateDeveloperAppActivityTotalPv() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/pv/developer_app_activity/pv.php").openConnection();
            httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
            httpURLConnection.setConnectTimeout(6000);
            httpURLConnection.getResponseCode();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
