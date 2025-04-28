package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.LinearLayout;
import androidx.recyclerview.widget.RecyclerView;
import androidx.viewpager2.widget.ViewPager2;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.request.RequestOptions;
import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import org.apache.http.client.methods.HttpGet;
/* loaded from: classes.dex */
public class ScreenshotActivity extends Activity {
    int appScreenshotUrlIndex;
    String[] appScreenshotUrlList;
    ArrayList<View> viewList;

    /* JADX WARN: Type inference failed for: r0v8, types: [com.etralab.appstoreforandroid.ScreenshotActivity$1] */
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_screenshot);
        Intent intent = getIntent();
        this.appScreenshotUrlList = intent.getStringArrayExtra("appScreenshotUrlList");
        this.appScreenshotUrlIndex = intent.getIntExtra("appScreenshotUrlIndex", 0);
        LayoutInflater layoutInflater = getLayoutInflater();
        if (this.appScreenshotUrlIndex != 0) {
            new Thread() { // from class: com.etralab.appstoreforandroid.ScreenshotActivity.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    super.run();
                    ScreenshotActivity.this.UpdateScreenshotActivityTotalPv();
                }
            }.start();
        }
        ViewPager2 viewPager2 = (ViewPager2) findViewById(R.id.vp_screenshot);
        this.viewList = new ArrayList<>();
        for (int i = 0; i < this.appScreenshotUrlList.length; i++) {
            this.viewList.add(layoutInflater.inflate(R.layout.item_vp_app_screenshot, (ViewGroup) null));
        }
        viewPager2.setOrientation(0);
        viewPager2.setAdapter(new ImgPagerAdapter());
        viewPager2.setCurrentItem(this.appScreenshotUrlIndex, false);
        viewPager2.registerOnPageChangeCallback(new ViewPager2.OnPageChangeCallback() { // from class: com.etralab.appstoreforandroid.ScreenshotActivity.2
            /* JADX WARN: Type inference failed for: r1v1, types: [com.etralab.appstoreforandroid.ScreenshotActivity$2$1] */
            @Override // androidx.viewpager2.widget.ViewPager2.OnPageChangeCallback
            public void onPageSelected(int i2) {
                super.onPageSelected(i2);
                new Thread() { // from class: com.etralab.appstoreforandroid.ScreenshotActivity.2.1
                    @Override // java.lang.Thread, java.lang.Runnable
                    public void run() {
                        super.run();
                        ScreenshotActivity.this.UpdateScreenshotActivityTotalPv();
                    }
                }.start();
            }
        });
        ((LinearLayout) findViewById(R.id.ll_screenshot)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ScreenshotActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ScreenshotActivity.this.finish();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    /* loaded from: classes.dex */
    public class ViewData extends RecyclerView.ViewHolder {
        public ViewData(View view) {
            super(view);
        }

        public void setScreenshotDownloadUrl(int i, String str) {
            ImageView imageView = (ImageView) findViewHolderById(i);
            Glide.with(imageView).load(str).apply(new RequestOptions().placeholder(R.drawable.icon_app_screenshot_loading).fallback(R.drawable.icon_app_screenshot_loading).error(R.drawable.icon_app_screenshot_loading).override(Integer.MIN_VALUE, Integer.MIN_VALUE).format(DecodeFormat.PREFER_RGB_565)).into(imageView);
            imageView.setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ScreenshotActivity.ViewData.1
                @Override // android.view.View.OnClickListener
                public void onClick(View view) {
                    ScreenshotActivity.this.finish();
                }
            });
        }

        public <T extends View> T findViewHolderById(int i) {
            return (T) this.itemView.findViewById(i);
        }
    }

    /* loaded from: classes.dex */
    private class ImgPagerAdapter extends RecyclerView.Adapter<ViewData> {
        private ImgPagerAdapter() {
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public ViewData onCreateViewHolder(ViewGroup viewGroup, int i) {
            return new ViewData(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.item_vp_app_screenshot, viewGroup, false));
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public void onBindViewHolder(ViewData viewData, int i) {
            if (i == 0) {
                viewData.setScreenshotDownloadUrl(R.id.iv_screenshot, ScreenshotActivity.this.appScreenshotUrlList[0]);
            } else if (i == 1) {
                viewData.setScreenshotDownloadUrl(R.id.iv_screenshot, ScreenshotActivity.this.appScreenshotUrlList[1]);
            } else if (i == 2) {
                viewData.setScreenshotDownloadUrl(R.id.iv_screenshot, ScreenshotActivity.this.appScreenshotUrlList[2]);
            } else if (i == 3) {
                viewData.setScreenshotDownloadUrl(R.id.iv_screenshot, ScreenshotActivity.this.appScreenshotUrlList[3]);
            } else if (i == 4) {
                viewData.setScreenshotDownloadUrl(R.id.iv_screenshot, ScreenshotActivity.this.appScreenshotUrlList[4]);
            } else if (i == 5) {
                viewData.setScreenshotDownloadUrl(R.id.iv_screenshot, ScreenshotActivity.this.appScreenshotUrlList[5]);
            } else if (i == 6) {
                viewData.setScreenshotDownloadUrl(R.id.iv_screenshot, ScreenshotActivity.this.appScreenshotUrlList[6]);
            } else if (i == 7) {
                viewData.setScreenshotDownloadUrl(R.id.iv_screenshot, ScreenshotActivity.this.appScreenshotUrlList[7]);
            }
        }

        @Override // androidx.recyclerview.widget.RecyclerView.Adapter
        public int getItemCount() {
            return ScreenshotActivity.this.viewList.size();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateScreenshotActivityTotalPv() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/pv/screenshot_activity/pv.php").openConnection();
            httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
            httpURLConnection.setConnectTimeout(6000);
            httpURLConnection.getResponseCode();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
