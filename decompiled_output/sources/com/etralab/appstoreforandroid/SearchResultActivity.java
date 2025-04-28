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
public class SearchResultActivity extends Activity {
    private final List<App> appList = new ArrayList();
    boolean isPrepareData = false;

    /* JADX WARN: Type inference failed for: r1v2, types: [com.etralab.appstoreforandroid.SearchResultActivity$1] */
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setLayout();
        ClickToBackLastActivity();
        new Thread() { // from class: com.etralab.appstoreforandroid.SearchResultActivity.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                ImageView imageView = (ImageView) SearchResultActivity.this.findViewById(R.id.iv_loading_anim);
                if (imageView != null) {
                    ((AnimationDrawable) imageView.getBackground()).start();
                }
            }
        }.start();
        parseByJSONObject();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ShowAppsData() {
        RecyclerView recyclerView = (RecyclerView) findViewById(R.id.rv_search_result);
        recyclerView.setHasFixedSize(true);
        recyclerView.setNestedScrollingEnabled(false);
        new AnonymousClass2(recyclerView).start();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.etralab.appstoreforandroid.SearchResultActivity$2  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass2 extends Thread {
        final /* synthetic */ RecyclerView val$rv_search_result;

        AnonymousClass2(RecyclerView recyclerView) {
            this.val$rv_search_result = recyclerView;
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            SearchResultActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.SearchResultActivity.2.1
                @Override // java.lang.Runnable
                public void run() {
                    LinearLayout linearLayout = (LinearLayout) SearchResultActivity.this.findViewById(R.id.ll_loading_app_list);
                    final ImageView imageView = (ImageView) SearchResultActivity.this.findViewById(R.id.iv_loading_anim);
                    ((AnimationDrawable) imageView.getBackground()).stop();
                    if (linearLayout == null || AnonymousClass2.this.val$rv_search_result == null) {
                        return;
                    }
                    if (SearchResultActivity.this.appList.size() > 0) {
                        AppAdapterForActivity appAdapterForActivity = new AppAdapterForActivity(SearchResultActivity.this, SearchResultActivity.this.appList);
                        AnonymousClass2.this.val$rv_search_result.setLayoutManager(new LinearLayoutManager(SearchResultActivity.this, 1, false));
                        AnonymousClass2.this.val$rv_search_result.setItemAnimator(new DefaultItemAnimator());
                        AnonymousClass2.this.val$rv_search_result.setAdapter(appAdapterForActivity);
                        AnonymousClass2.this.val$rv_search_result.addItemDecoration(new DividerItemDecoration(SearchResultActivity.this, 1));
                        SearchResultActivity.this.isPrepareData = true;
                        linearLayout.setVisibility(8);
                        AnonymousClass2.this.val$rv_search_result.setVisibility(0);
                        return;
                    }
                    final TextView textView = (TextView) SearchResultActivity.this.findViewById(R.id.tv_loading_app_list);
                    final ImageView imageView2 = (ImageView) SearchResultActivity.this.findViewById(R.id.iv_load_failed);
                    final TextView textView2 = (TextView) SearchResultActivity.this.findViewById(R.id.tv_retry_text);
                    final Button button = (Button) SearchResultActivity.this.findViewById(R.id.btn_retry);
                    imageView.setVisibility(8);
                    textView.setVisibility(8);
                    imageView2.setVisibility(0);
                    textView2.setVisibility(0);
                    button.setVisibility(0);
                    button.setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SearchResultActivity.2.1.1
                        @Override // android.view.View.OnClickListener
                        public void onClick(View view) {
                            imageView.setVisibility(0);
                            textView.setVisibility(0);
                            imageView2.setVisibility(8);
                            textView2.setVisibility(8);
                            button.setVisibility(8);
                            ((AnimationDrawable) imageView.getBackground()).start();
                            SearchResultActivity.this.parseByJSONObject();
                        }
                    });
                }
            });
        }
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.etralab.appstoreforandroid.SearchResultActivity$3] */
    public void parseByJSONObject() {
        new Thread() { // from class: com.etralab.appstoreforandroid.SearchResultActivity.3
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                String json = SearchResultActivity.this.getJson();
                if (json != null) {
                    SearchResultActivity.this.UpdateSearchResultActivityTotalPv();
                    if (!json.equals("no_result")) {
                        try {
                            JSONArray jSONArray = new JSONObject(json).getJSONArray("data");
                            for (int i = 0; i < jSONArray.length(); i++) {
                                JSONObject jSONObject = jSONArray.getJSONObject(i);
                                String string = jSONObject.getString("id");
                                String string2 = jSONObject.getString("name");
                                SearchResultActivity.this.appList.add(new App(string, string2, "http://img.etrasoft.cn" + jSONObject.getString("logo_url"), jSONObject.getString("download_num"), jSONObject.getString("like_num"), jSONObject.getString("os_type")));
                            }
                        } catch (JSONException e) {
                            e.printStackTrace();
                        }
                        SearchResultActivity.this.ShowAppsData();
                        return;
                    }
                    SearchResultActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.SearchResultActivity.3.1
                        @Override // java.lang.Runnable
                        public void run() {
                            ((LinearLayout) SearchResultActivity.this.findViewById(R.id.ll_loading_app_list)).setVisibility(8);
                            ((LinearLayout) SearchResultActivity.this.findViewById(R.id.ll_no_search_result)).setVisibility(0);
                        }
                    });
                }
            }
        }.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getJson() {
        String stringExtra = getIntent().getStringExtra("searchText");
        try {
            DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
            defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
            defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
            HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/search_result_activity/get_apps_data.php");
            ArrayList arrayList = new ArrayList();
            arrayList.add(new BasicNameValuePair("searchText", stringExtra));
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
            } catch (Exception e) {
                e.printStackTrace();
            }
            return null;
        } catch (Exception e2) {
            e2.printStackTrace();
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateSearchResultActivityTotalPv() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/pv/search_result_activity/pv.php").openConnection();
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
            setContentView(R.layout.activity_search_result);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        } else if (file.exists()) {
            setContentView(R.layout.activity_search_result);
        } else if (file2.exists()) {
            setContentView(R.layout.activity_search_result_square);
        } else {
            setContentView(R.layout.activity_search_result);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        }
    }

    private void ClickToBackLastActivity() {
        ((LinearLayout) findViewById(R.id.ll_back)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SearchResultActivity.4
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SearchResultActivity.this.finish();
            }
        });
    }
}
