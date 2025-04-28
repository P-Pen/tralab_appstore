package com.etralab.appstoreforandroid;

import android.content.Context;
import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import androidx.fragment.app.Fragment;
import androidx.recyclerview.widget.DefaultItemAnimator;
import androidx.recyclerview.widget.DividerItemDecoration;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.request.RequestOptions;
import com.youth.banner.Banner;
import com.youth.banner.adapter.BannerImageAdapter;
import com.youth.banner.holder.BannerImageHolder;
import com.youth.banner.listener.OnBannerListener;
import com.youth.banner.listener.OnPageChangeListener;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import org.apache.http.client.methods.HttpGet;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class HomeFragment extends Fragment {
    Banner bn_banner;
    ImageView iv_loading_anim;
    RecyclerView rv_download_ranking;
    RecyclerView rv_new_arrival;
    RecyclerView rv_recommendation;
    View view;
    boolean isPrepareData = false;
    boolean isShowData = false;
    private final List<BannerDataBean> bannerList = new ArrayList();
    private final List<App> newArrivalAppsList = new ArrayList();
    private final List<App> recommendationAppsList = new ArrayList();
    private final List<App> downloadRankingAppsList = new ArrayList();

    @Override // androidx.fragment.app.Fragment
    public void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        parseByJSONObject();
    }

    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        File file = new File(getContext().getFilesDir(), "CircleLayout.txt");
        File file2 = new File(getContext().getFilesDir(), "SquareLayout.txt");
        if (file.exists()) {
            this.view = layoutInflater.inflate(R.layout.fragment_home, viewGroup, false);
        } else if (file2.exists()) {
            this.view = layoutInflater.inflate(R.layout.fragment_home_square, viewGroup, false);
        } else {
            this.view = layoutInflater.inflate(R.layout.fragment_home, viewGroup, false);
        }
        this.rv_new_arrival = (RecyclerView) this.view.findViewById(R.id.rv_new_arrival);
        this.rv_download_ranking = (RecyclerView) this.view.findViewById(R.id.rv_download_ranking);
        this.rv_recommendation = (RecyclerView) this.view.findViewById(R.id.rv_recommendation);
        ImageView imageView = (ImageView) this.view.findViewById(R.id.iv_loading_anim);
        this.iv_loading_anim = imageView;
        if (imageView != null) {
            ((AnimationDrawable) imageView.getBackground()).start();
        }
        return this.view;
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
        if (!this.isPrepareData || this.isShowData) {
            return;
        }
        ShowAppsData();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* renamed from: com.etralab.appstoreforandroid.HomeFragment$1  reason: invalid class name */
    /* loaded from: classes.dex */
    public class AnonymousClass1 extends Thread {
        AnonymousClass1() {
        }

        @Override // java.lang.Thread, java.lang.Runnable
        public void run() {
            super.run();
            HomeFragment.this.getActivity().runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.HomeFragment.1.1
                @Override // java.lang.Runnable
                public void run() {
                    HomeFragment.this.rv_new_arrival.setHasFixedSize(true);
                    HomeFragment.this.rv_new_arrival.setNestedScrollingEnabled(false);
                    HomeFragment.this.rv_recommendation.setHasFixedSize(true);
                    HomeFragment.this.rv_recommendation.setNestedScrollingEnabled(false);
                    HomeFragment.this.rv_download_ranking.setHasFixedSize(true);
                    HomeFragment.this.rv_download_ranking.setNestedScrollingEnabled(false);
                    LinearLayout linearLayout = (LinearLayout) HomeFragment.this.getActivity().findViewById(R.id.ll_loading_app_list);
                    LinearLayout linearLayout2 = (LinearLayout) HomeFragment.this.getActivity().findViewById(R.id.ll_home_body);
                    final ImageView imageView = (ImageView) HomeFragment.this.getActivity().findViewById(R.id.iv_loading_anim);
                    if (imageView != null) {
                        ((AnimationDrawable) imageView.getBackground()).stop();
                    }
                    if (linearLayout == null || HomeFragment.this.rv_new_arrival == null || HomeFragment.this.rv_recommendation == null || HomeFragment.this.rv_download_ranking == null) {
                        return;
                    }
                    if (HomeFragment.this.newArrivalAppsList.size() > 0 && HomeFragment.this.recommendationAppsList.size() > 0 && HomeFragment.this.downloadRankingAppsList.size() > 0) {
                        AppAdapter appAdapter = new AppAdapter(HomeFragment.this.getActivity(), HomeFragment.this.newArrivalAppsList);
                        HomeFragment.this.rv_new_arrival.setLayoutManager(new LinearLayoutManager(HomeFragment.this.getActivity(), 1, false));
                        HomeFragment.this.rv_new_arrival.setItemAnimator(new DefaultItemAnimator());
                        HomeFragment.this.rv_new_arrival.setAdapter(appAdapter);
                        HomeFragment.this.rv_new_arrival.addItemDecoration(new DividerItemDecoration(HomeFragment.this.getActivity(), 1));
                        AppAdapter appAdapter2 = new AppAdapter(HomeFragment.this.getActivity(), HomeFragment.this.recommendationAppsList);
                        HomeFragment.this.rv_recommendation.setLayoutManager(new LinearLayoutManager(HomeFragment.this.getActivity(), 1, false));
                        HomeFragment.this.rv_recommendation.setItemAnimator(new DefaultItemAnimator());
                        HomeFragment.this.rv_recommendation.setAdapter(appAdapter2);
                        HomeFragment.this.rv_recommendation.addItemDecoration(new DividerItemDecoration(HomeFragment.this.getActivity(), 1));
                        AppAdapter appAdapter3 = new AppAdapter(HomeFragment.this.getActivity(), HomeFragment.this.downloadRankingAppsList);
                        HomeFragment.this.rv_download_ranking.setLayoutManager(new LinearLayoutManager(HomeFragment.this.getActivity(), 1, false));
                        HomeFragment.this.rv_download_ranking.setItemAnimator(new DefaultItemAnimator());
                        HomeFragment.this.rv_download_ranking.setAdapter(appAdapter3);
                        HomeFragment.this.rv_download_ranking.addItemDecoration(new DividerItemDecoration(HomeFragment.this.getActivity(), 1));
                        HomeFragment.this.isPrepareData = true;
                        HomeFragment.this.isShowData = true;
                        linearLayout.setVisibility(8);
                        linearLayout2.setVisibility(0);
                        HomeFragment.this.initBanner();
                        ((LinearLayout) HomeFragment.this.getActivity().findViewById(R.id.ll_search_box)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.HomeFragment.1.1.1
                            static final /* synthetic */ boolean $assertionsDisabled = false;

                            @Override // android.view.View.OnClickListener
                            public void onClick(View view) {
                                Context context = HomeFragment.this.getContext();
                                context.startActivity(new Intent(context, SearchActivity.class));
                            }
                        });
                        ((LinearLayout) HomeFragment.this.getActivity().findViewById(R.id.ll_jump_to_new_arrival)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.HomeFragment.1.1.2
                            @Override // android.view.View.OnClickListener
                            public void onClick(View view) {
                                Context context = HomeFragment.this.getContext();
                                Intent intent = new Intent(context, ClassificationActivity.class);
                                intent.putExtra("appClassification", "最新上架");
                                intent.putExtra("appClassificationEn", "NewArrival");
                                context.startActivity(intent);
                            }
                        });
                        ((LinearLayout) HomeFragment.this.getActivity().findViewById(R.id.ll_jump_to_recommendation)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.HomeFragment.1.1.3
                            @Override // android.view.View.OnClickListener
                            public void onClick(View view) {
                                Context context = HomeFragment.this.getContext();
                                Intent intent = new Intent(context, ClassificationActivity.class);
                                intent.putExtra("appClassification", "热门推荐");
                                intent.putExtra("appClassificationEn", "Hot");
                                context.startActivity(intent);
                            }
                        });
                        ((LinearLayout) HomeFragment.this.getActivity().findViewById(R.id.ll_jump_to_download_ranking)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.HomeFragment.1.1.4
                            @Override // android.view.View.OnClickListener
                            public void onClick(View view) {
                                Context context = HomeFragment.this.getContext();
                                Intent intent = new Intent(context, ClassificationActivity.class);
                                intent.putExtra("appClassification", "下载排行");
                                intent.putExtra("appClassificationEn", "Ranking");
                                context.startActivity(intent);
                            }
                        });
                        return;
                    }
                    final TextView textView = (TextView) HomeFragment.this.getActivity().findViewById(R.id.tv_loading_app_list);
                    final ImageView imageView2 = (ImageView) HomeFragment.this.getActivity().findViewById(R.id.iv_load_failed);
                    final TextView textView2 = (TextView) HomeFragment.this.getActivity().findViewById(R.id.tv_retry_text);
                    final Button button = (Button) HomeFragment.this.getActivity().findViewById(R.id.btn_retry);
                    imageView.setVisibility(8);
                    textView.setVisibility(8);
                    imageView2.setVisibility(0);
                    textView2.setVisibility(0);
                    button.setVisibility(0);
                    button.setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.HomeFragment.1.1.5
                        @Override // android.view.View.OnClickListener
                        public void onClick(View view) {
                            imageView.setVisibility(0);
                            textView.setVisibility(0);
                            imageView2.setVisibility(8);
                            textView2.setVisibility(8);
                            button.setVisibility(8);
                            ((AnimationDrawable) imageView.getBackground()).start();
                            HomeFragment.this.parseByJSONObject();
                        }
                    });
                }
            });
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ShowAppsData() {
        new AnonymousClass1().start();
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.etralab.appstoreforandroid.HomeFragment$2] */
    public void parseByJSONObject() {
        new Thread() { // from class: com.etralab.appstoreforandroid.HomeFragment.2
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                String bannerImgUrlJson = HomeFragment.this.getBannerImgUrlJson();
                if (bannerImgUrlJson != null) {
                    try {
                        JSONArray jSONArray = new JSONObject(bannerImgUrlJson).getJSONArray("data");
                        for (int i = 0; i < jSONArray.length(); i++) {
                            JSONObject jSONObject = jSONArray.getJSONObject(i);
                            String string = jSONObject.getString("id");
                            HomeFragment.this.bannerList.add(new BannerDataBean(string, "http://img.etrasoft.cn" + jSONObject.getString("banner_img_url")));
                        }
                    } catch (JSONException e) {
                        e.printStackTrace();
                    }
                }
                String newArrivalAppsJson = HomeFragment.this.getNewArrivalAppsJson();
                if (newArrivalAppsJson != null) {
                    HomeFragment.this.UpdateHomeFragmentTotalPv();
                    try {
                        JSONArray jSONArray2 = new JSONObject(newArrivalAppsJson).getJSONArray("data");
                        for (int i2 = 0; i2 < jSONArray2.length(); i2++) {
                            JSONObject jSONObject2 = jSONArray2.getJSONObject(i2);
                            String string2 = jSONObject2.getString("id");
                            String string3 = jSONObject2.getString("name");
                            HomeFragment.this.newArrivalAppsList.add(new App(string2, string3, "http://img.etrasoft.cn" + jSONObject2.getString("logo_url"), jSONObject2.getString("download_num"), jSONObject2.getString("like_num"), jSONObject2.getString("os_type")));
                        }
                    } catch (JSONException e2) {
                        e2.printStackTrace();
                    }
                }
                String recommendationAppsJson = HomeFragment.this.getRecommendationAppsJson();
                if (recommendationAppsJson != null) {
                    try {
                        JSONArray jSONArray3 = new JSONObject(recommendationAppsJson).getJSONArray("data");
                        for (int i3 = 0; i3 < jSONArray3.length(); i3++) {
                            JSONObject jSONObject3 = jSONArray3.getJSONObject(i3);
                            String string4 = jSONObject3.getString("id");
                            String string5 = jSONObject3.getString("name");
                            HomeFragment.this.recommendationAppsList.add(new App(string4, string5, "http://img.etrasoft.cn" + jSONObject3.getString("logo_url"), jSONObject3.getString("download_num"), jSONObject3.getString("like_num"), jSONObject3.getString("os_type")));
                        }
                    } catch (JSONException e3) {
                        e3.printStackTrace();
                    }
                }
                String downloadRankingAppsJson = HomeFragment.this.getDownloadRankingAppsJson();
                if (downloadRankingAppsJson != null) {
                    try {
                        JSONArray jSONArray4 = new JSONObject(downloadRankingAppsJson).getJSONArray("data");
                        for (int i4 = 0; i4 < jSONArray4.length(); i4++) {
                            JSONObject jSONObject4 = jSONArray4.getJSONObject(i4);
                            String string6 = jSONObject4.getString("id");
                            String string7 = jSONObject4.getString("name");
                            HomeFragment.this.downloadRankingAppsList.add(new App(string6, string7, "http://img.etrasoft.cn" + jSONObject4.getString("logo_url"), jSONObject4.getString("download_num"), jSONObject4.getString("like_num"), jSONObject4.getString("os_type")));
                        }
                    } catch (JSONException e4) {
                        e4.printStackTrace();
                    }
                }
                HomeFragment.this.ShowAppsData();
            }
        }.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getBannerImgUrlJson() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/php/home_fragment/get_notice_data.php").openConnection();
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
    public String getNewArrivalAppsJson() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/php/home_fragment/get_new_arrival_apps_data.php").openConnection();
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
    public String getRecommendationAppsJson() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/php/home_fragment/get_recommendation_apps_data.php").openConnection();
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
    public String getDownloadRankingAppsJson() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/php/home_fragment/get_download_ranking_apps_data.php").openConnection();
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
    public void UpdateHomeFragmentTotalPv() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/pv/home_fragment/pv.php").openConnection();
            httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
            httpURLConnection.setConnectTimeout(6000);
            httpURLConnection.getResponseCode();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public void initBanner() {
        this.bn_banner = (Banner) getActivity().findViewById(R.id.bn_banner);
        final TextView textView = (TextView) getActivity().findViewById(R.id.tv_banner_indicator_selected);
        final FrameLayout frameLayout = (FrameLayout) getActivity().findViewById(R.id.fl_banner_indicator_background);
        this.bn_banner.setAdapter(new BannerImageAdapter<BannerDataBean>(this.bannerList) { // from class: com.etralab.appstoreforandroid.HomeFragment.4
            @Override // com.youth.banner.holder.IViewHolder
            public void onBindView(BannerImageHolder bannerImageHolder, BannerDataBean bannerDataBean, int i, int i2) {
                Glide.with(bannerImageHolder.itemView).load(bannerDataBean.getBannerImgUrl()).apply(new RequestOptions().placeholder(R.drawable.icon_banner_background_loading).fallback(R.drawable.icon_banner_background_loading).error(R.drawable.icon_banner_background_loading).override(Integer.MIN_VALUE, Integer.MIN_VALUE).format(DecodeFormat.PREFER_RGB_565)).into(bannerImageHolder.imageView);
            }
        }).addBannerLifecycleObserver(this).addOnPageChangeListener(new OnPageChangeListener() { // from class: com.etralab.appstoreforandroid.HomeFragment.3
            @Override // com.youth.banner.listener.OnPageChangeListener
            public void onPageScrollStateChanged(int i) {
            }

            @Override // com.youth.banner.listener.OnPageChangeListener
            public void onPageScrolled(int i, float f, int i2) {
                ((ScrollView) HomeFragment.this.getActivity().findViewById(R.id.sv_layout_body)).requestFocus();
            }

            @Override // com.youth.banner.listener.OnPageChangeListener
            public void onPageSelected(int i) {
                int i2 = frameLayout.getLayoutParams().width;
                int realCount = HomeFragment.this.bn_banner.getRealCount();
                FrameLayout.LayoutParams layoutParams = (FrameLayout.LayoutParams) textView.getLayoutParams();
                layoutParams.leftMargin = (i2 * i) / realCount;
                textView.setLayoutParams(layoutParams);
                ((ScrollView) HomeFragment.this.getActivity().findViewById(R.id.sv_layout_body)).requestFocus();
            }
        });
        this.bn_banner.setOnBannerListener(new OnBannerListener() { // from class: com.etralab.appstoreforandroid.HomeFragment.5
            @Override // com.youth.banner.listener.OnBannerListener
            public void OnBannerClick(Object obj, int i) {
                Context context = HomeFragment.this.getContext();
                Intent intent = new Intent(context, NoticeActivity.class);
                intent.putExtra("noticeId", ((BannerDataBean) HomeFragment.this.bannerList.get(i)).getBannerId());
                context.startActivity(intent);
            }
        });
        try {
            textView.getLayoutParams().width = (textView.getLayoutParams().width / this.bn_banner.getRealCount()) + 1;
        } catch (ArithmeticException unused) {
        }
        this.bn_banner.start();
    }
}
