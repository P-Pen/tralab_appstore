package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ScrollView;
import android.widget.TextView;
import android.widget.Toast;
import com.bumptech.glide.Glide;
import com.bumptech.glide.RequestManager;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.request.RequestOptions;
import com.etralab.appstoreforandroid.OnDoubleClickListener;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import org.apache.http.HttpResponse;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.params.CoreConnectionPNames;
import org.json.JSONException;
import org.json.JSONObject;
/* loaded from: classes.dex */
public class NoticeActivity extends Activity {
    String notice_dislike_num;
    String notice_like_num;
    String notice_view_num;
    boolean isLikeNotice = false;
    boolean isDislikeNotice = false;

    /* JADX WARN: Type inference failed for: r3v2, types: [com.etralab.appstoreforandroid.NoticeActivity$1] */
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setLayout();
        ClickToBackLastActivity();
        parseByJSONObject();
        new Thread() { // from class: com.etralab.appstoreforandroid.NoticeActivity.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                ImageView imageView = (ImageView) NoticeActivity.this.findViewById(R.id.iv_loading_anim);
                if (imageView != null) {
                    ((AnimationDrawable) imageView.getBackground()).start();
                }
            }
        }.start();
        ((Button) findViewById(R.id.btn_retry)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.NoticeActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                NoticeActivity.this.ReloadNotice();
            }
        });
        ((LinearLayout) findViewById(R.id.ll_layout_body)).setOnTouchListener(new OnDoubleClickListener(new AnonymousClass3()));
        ((LinearLayout) findViewById(R.id.ll_like_number)).setOnClickListener(new AnonymousClass4());
        ((LinearLayout) findViewById(R.id.ll_dislike_number)).setOnClickListener(new AnonymousClass5());
        final ScrollView scrollView = (ScrollView) findViewById(R.id.sv_layout_body);
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.NoticeActivity.6
            @Override // java.lang.Runnable
            public void run() {
                scrollView.requestFocus();
            }
        });
    }

    /* renamed from: com.etralab.appstoreforandroid.NoticeActivity$3  reason: invalid class name */
    /* loaded from: classes.dex */
    class AnonymousClass3 implements OnDoubleClickListener.DoubleClickCallback {
        AnonymousClass3() {
        }

        @Override // com.etralab.appstoreforandroid.OnDoubleClickListener.DoubleClickCallback
        public void onDoubleClick() {
            NoticeActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.NoticeActivity.3.1
                /* JADX WARN: Type inference failed for: r0v8, types: [com.etralab.appstoreforandroid.NoticeActivity$3$1$1] */
                @Override // java.lang.Runnable
                public void run() {
                    ImageView imageView = (ImageView) NoticeActivity.this.findViewById(R.id.iv_anim_like);
                    imageView.setVisibility(0);
                    AnimationDrawable animationDrawable = (AnimationDrawable) NoticeActivity.this.getResources().getDrawable(R.drawable.animation_like);
                    imageView.setImageDrawable(animationDrawable);
                    if (animationDrawable.isRunning()) {
                        return;
                    }
                    animationDrawable.start();
                    if (NoticeActivity.this.isLikeNotice) {
                        return;
                    }
                    new Thread() { // from class: com.etralab.appstoreforandroid.NoticeActivity.3.1.1
                        @Override // java.lang.Thread, java.lang.Runnable
                        public void run() {
                            super.run();
                            NoticeActivity.this.UpdateNoticeLikeNum();
                        }
                    }.start();
                    ((ImageView) NoticeActivity.this.findViewById(R.id.iv_like_number)).setImageResource(R.drawable.icon_like_highlight);
                    ((TextView) NoticeActivity.this.findViewById(R.id.tv_like_number)).setText(NumUnitConversionUtil.NumUnitConversion((Integer.parseInt(NoticeActivity.this.notice_like_num) + 1) + ""));
                    NoticeActivity.this.isLikeNotice = true;
                }
            });
        }
    }

    /* renamed from: com.etralab.appstoreforandroid.NoticeActivity$4  reason: invalid class name */
    /* loaded from: classes.dex */
    class AnonymousClass4 implements View.OnClickListener {
        AnonymousClass4() {
        }

        /* JADX WARN: Type inference failed for: r1v1, types: [com.etralab.appstoreforandroid.NoticeActivity$4$1] */
        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            new Thread() { // from class: com.etralab.appstoreforandroid.NoticeActivity.4.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    super.run();
                    if (!NoticeActivity.this.isLikeNotice) {
                        NoticeActivity.this.UpdateNoticeLikeNum();
                        final TextView textView = (TextView) NoticeActivity.this.findViewById(R.id.tv_like_number);
                        final ImageView imageView = (ImageView) NoticeActivity.this.findViewById(R.id.iv_like_number);
                        NoticeActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.NoticeActivity.4.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                imageView.setImageResource(R.drawable.icon_like_highlight);
                                TextView textView2 = textView;
                                textView2.setText(NumUnitConversionUtil.NumUnitConversion((Integer.parseInt(NoticeActivity.this.notice_like_num) + 1) + ""));
                            }
                        });
                        NoticeActivity.this.isLikeNotice = true;
                        return;
                    }
                    NoticeActivity.this.SubNoticeLikeNum();
                    final TextView textView2 = (TextView) NoticeActivity.this.findViewById(R.id.tv_like_number);
                    final ImageView imageView2 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_like_number);
                    NoticeActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.NoticeActivity.4.1.2
                        @Override // java.lang.Runnable
                        public void run() {
                            imageView2.setImageResource(R.drawable.icon_like);
                            TextView textView3 = textView2;
                            textView3.setText(NumUnitConversionUtil.NumUnitConversion(Integer.parseInt(NoticeActivity.this.notice_like_num) + ""));
                        }
                    });
                    NoticeActivity.this.isLikeNotice = false;
                }
            }.start();
        }
    }

    /* renamed from: com.etralab.appstoreforandroid.NoticeActivity$5  reason: invalid class name */
    /* loaded from: classes.dex */
    class AnonymousClass5 implements View.OnClickListener {
        AnonymousClass5() {
        }

        /* JADX WARN: Type inference failed for: r1v1, types: [com.etralab.appstoreforandroid.NoticeActivity$5$1] */
        @Override // android.view.View.OnClickListener
        public void onClick(View view) {
            new Thread() { // from class: com.etralab.appstoreforandroid.NoticeActivity.5.1
                @Override // java.lang.Thread, java.lang.Runnable
                public void run() {
                    super.run();
                    if (!NoticeActivity.this.isDislikeNotice) {
                        NoticeActivity.this.UpdateNoticeDislikeNum();
                        final ImageView imageView = (ImageView) NoticeActivity.this.findViewById(R.id.iv_dislike_number);
                        NoticeActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.NoticeActivity.5.1.1
                            @Override // java.lang.Runnable
                            public void run() {
                                imageView.setImageResource(R.drawable.icon_dislike_highlight);
                                Toast.makeText(NoticeActivity.this, "感谢您的反馈！\n我们将对后续公告的内容进行优化。", 1).show();
                            }
                        });
                        NoticeActivity.this.isDislikeNotice = true;
                        return;
                    }
                    NoticeActivity.this.SubNoticeDislikeNum();
                    final ImageView imageView2 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_dislike_number);
                    NoticeActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.NoticeActivity.5.1.2
                        @Override // java.lang.Runnable
                        public void run() {
                            imageView2.setImageResource(R.drawable.icon_dislike);
                        }
                    });
                    NoticeActivity.this.isDislikeNotice = false;
                }
            }.start();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ShowNotice() {
        final LinearLayout linearLayout = (LinearLayout) findViewById(R.id.ll_loading_app_information);
        final ScrollView scrollView = (ScrollView) findViewById(R.id.sv_layout_body);
        ImageView imageView = (ImageView) findViewById(R.id.iv_loading_anim);
        if (imageView != null && ((AnimationDrawable) imageView.getBackground()).isRunning()) {
            ((AnimationDrawable) imageView.getBackground()).stop();
        }
        UpdateNoticeViewNum();
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.NoticeActivity.7
            @Override // java.lang.Runnable
            public void run() {
                linearLayout.setVisibility(8);
                scrollView.setVisibility(0);
                ((TextView) NoticeActivity.this.findViewById(R.id.tv_view_number)).setText(NumUnitConversionUtil.NumUnitConversion((Integer.parseInt(NoticeActivity.this.notice_view_num) + 1) + ""));
                scrollView.requestFocus();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void ReloadNotice() {
        final ImageView imageView = (ImageView) findViewById(R.id.iv_loading_anim);
        final TextView textView = (TextView) findViewById(R.id.tv_loading_text);
        final ImageView imageView2 = (ImageView) findViewById(R.id.iv_load_failed);
        final TextView textView2 = (TextView) findViewById(R.id.tv_retry_text);
        final Button button = (Button) findViewById(R.id.btn_retry);
        runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.NoticeActivity.8
            @Override // java.lang.Runnable
            public void run() {
                textView.setVisibility(0);
                imageView.setVisibility(0);
                imageView2.setVisibility(8);
                textView2.setVisibility(8);
                button.setVisibility(8);
            }
        });
        if (imageView != null) {
            ((AnimationDrawable) imageView.getBackground()).start();
        }
        parseByJSONObject();
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.etralab.appstoreforandroid.NoticeActivity$9] */
    public void parseByJSONObject() {
        new Thread() { // from class: com.etralab.appstoreforandroid.NoticeActivity.9
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                NoticeActivity.this.UpdateNoticeActivityTotalPv();
                String json = NoticeActivity.this.getJson();
                if (json != null) {
                    try {
                        JSONObject jSONObject = new JSONObject(json);
                        jSONObject.getString("id");
                        final String string = jSONObject.getString("title");
                        final String string2 = jSONObject.getString("author");
                        jSONObject.getString("publication_time");
                        final String string3 = jSONObject.getString("modification_time");
                        NoticeActivity.this.notice_view_num = jSONObject.getString("view_num");
                        NoticeActivity.this.notice_like_num = jSONObject.getString("like_num");
                        NoticeActivity.this.notice_dislike_num = jSONObject.getString("dislike_num");
                        final String string4 = jSONObject.getString("img_0_url");
                        final String string5 = jSONObject.getString("text_0");
                        final String string6 = jSONObject.getString("img_1_url");
                        final String string7 = jSONObject.getString("text_1");
                        final String string8 = jSONObject.getString("img_2_url");
                        final String string9 = jSONObject.getString("text_2");
                        final String string10 = jSONObject.getString("img_3_url");
                        final String string11 = jSONObject.getString("text_3");
                        final String string12 = jSONObject.getString("img_4_url");
                        final String string13 = jSONObject.getString("text_4");
                        final String string14 = jSONObject.getString("img_5_url");
                        final String string15 = jSONObject.getString("text_5");
                        final String string16 = jSONObject.getString("img_6_url");
                        final String string17 = jSONObject.getString("text_6");
                        final String string18 = jSONObject.getString("img_7_url");
                        final String string19 = jSONObject.getString("text_7");
                        final String string20 = jSONObject.getString("img_8_url");
                        final String string21 = jSONObject.getString("text_8");
                        final String string22 = jSONObject.getString("img_9_url");
                        final String string23 = jSONObject.getString("text_9");
                        final String string24 = jSONObject.getString("img_10_url");
                        final String string25 = jSONObject.getString("text_10");
                        final String string26 = jSONObject.getString("img_11_url");
                        final String string27 = jSONObject.getString("text_11");
                        final String string28 = jSONObject.getString("img_12_url");
                        final String string29 = jSONObject.getString("text_12");
                        final String string30 = jSONObject.getString("img_13_url");
                        final String string31 = jSONObject.getString("text_13");
                        final String string32 = jSONObject.getString("img_14_url");
                        final String string33 = jSONObject.getString("text_14");
                        final String string34 = jSONObject.getString("img_15_url");
                        final String string35 = jSONObject.getString("text_15");
                        final String string36 = jSONObject.getString("img_16_url");
                        final String string37 = jSONObject.getString("text_16");
                        final String string38 = jSONObject.getString("img_17_url");
                        final String string39 = jSONObject.getString("text_17");
                        final String string40 = jSONObject.getString("img_18_url");
                        final String string41 = jSONObject.getString("text_18");
                        final String string42 = jSONObject.getString("img_19_url");
                        final String string43 = jSONObject.getString("text_19");
                        final String string44 = jSONObject.getString("img_20_url");
                        final String string45 = jSONObject.getString("text_20");
                        final String string46 = jSONObject.getString("img_21_url");
                        final String string47 = jSONObject.getString("text_21");
                        final String string48 = jSONObject.getString("img_22_url");
                        final String string49 = jSONObject.getString("text_22");
                        final String string50 = jSONObject.getString("img_23_url");
                        final String string51 = jSONObject.getString("text_23");
                        final String string52 = jSONObject.getString("img_24_url");
                        final String string53 = jSONObject.getString("text_24");
                        final String string54 = jSONObject.getString("img_25_url");
                        final String string55 = jSONObject.getString("text_25");
                        final String string56 = jSONObject.getString("img_26_url");
                        final String string57 = jSONObject.getString("text_26");
                        final String string58 = jSONObject.getString("img_27_url");
                        final String string59 = jSONObject.getString("text_27");
                        final String string60 = jSONObject.getString("img_28_url");
                        final String string61 = jSONObject.getString("text_28");
                        final String string62 = jSONObject.getString("img_29_url");
                        final String string63 = jSONObject.getString("text_29");
                        final String string64 = jSONObject.getString("img_30_url");
                        final String string65 = jSONObject.getString("text_30");
                        final String string66 = jSONObject.getString("img_31_url");
                        final String string67 = jSONObject.getString("text_31");
                        try {
                            NoticeActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.NoticeActivity.9.1
                                @Override // java.lang.Runnable
                                public void run() {
                                    ((TextView) NoticeActivity.this.findViewById(R.id.tv_notice_tittle)).setText(string);
                                    ((TextView) NoticeActivity.this.findViewById(R.id.tv_notice_author)).setText(string2);
                                    ((TextView) NoticeActivity.this.findViewById(R.id.tv_notice_time)).setText(string3);
                                    ((TextView) NoticeActivity.this.findViewById(R.id.tv_view_number)).setText(NumUnitConversionUtil.NumUnitConversion(NoticeActivity.this.notice_view_num));
                                    ((TextView) NoticeActivity.this.findViewById(R.id.tv_like_number)).setText(NumUnitConversionUtil.NumUnitConversion(NoticeActivity.this.notice_like_num));
                                    if (!string5.equals("null")) {
                                        TextView textView = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_0);
                                        textView.setVisibility(0);
                                        textView.setText(string5);
                                    }
                                    if (!string7.equals("null")) {
                                        TextView textView2 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_1);
                                        textView2.setVisibility(0);
                                        textView2.setText(string7);
                                    }
                                    if (!string9.equals("null")) {
                                        TextView textView3 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_2);
                                        textView3.setVisibility(0);
                                        textView3.setText(string9);
                                    }
                                    if (!string11.equals("null")) {
                                        TextView textView4 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_3);
                                        textView4.setVisibility(0);
                                        textView4.setText(string11);
                                    }
                                    if (!string13.equals("null")) {
                                        TextView textView5 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_4);
                                        textView5.setVisibility(0);
                                        textView5.setText(string13);
                                    }
                                    if (!string15.equals("null")) {
                                        TextView textView6 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_5);
                                        textView6.setVisibility(0);
                                        textView6.setText(string15);
                                    }
                                    if (!string17.equals("null")) {
                                        TextView textView7 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_6);
                                        textView7.setVisibility(0);
                                        textView7.setText(string17);
                                    }
                                    if (!string19.equals("null")) {
                                        TextView textView8 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_7);
                                        textView8.setVisibility(0);
                                        textView8.setText(string19);
                                    }
                                    if (!string21.equals("null")) {
                                        TextView textView9 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_8);
                                        textView9.setVisibility(0);
                                        textView9.setText(string21);
                                    }
                                    if (!string23.equals("null")) {
                                        TextView textView10 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_9);
                                        textView10.setVisibility(0);
                                        textView10.setText(string23);
                                    }
                                    if (!string25.equals("null")) {
                                        TextView textView11 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_10);
                                        textView11.setVisibility(0);
                                        textView11.setText(string25);
                                    }
                                    if (!string27.equals("null")) {
                                        TextView textView12 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_11);
                                        textView12.setVisibility(0);
                                        textView12.setText(string27);
                                    }
                                    if (!string29.equals("null")) {
                                        TextView textView13 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_12);
                                        textView13.setVisibility(0);
                                        textView13.setText(string29);
                                    }
                                    if (!string31.equals("null")) {
                                        TextView textView14 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_13);
                                        textView14.setVisibility(0);
                                        textView14.setText(string31);
                                    }
                                    if (!string33.equals("null")) {
                                        TextView textView15 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_14);
                                        textView15.setVisibility(0);
                                        textView15.setText(string33);
                                    }
                                    if (!string35.equals("null")) {
                                        TextView textView16 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_15);
                                        textView16.setVisibility(0);
                                        textView16.setText(string35);
                                    }
                                    if (!string37.equals("null")) {
                                        TextView textView17 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_16);
                                        textView17.setVisibility(0);
                                        textView17.setText(string37);
                                    }
                                    if (!string39.equals("null")) {
                                        TextView textView18 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_17);
                                        textView18.setVisibility(0);
                                        textView18.setText(string39);
                                    }
                                    if (!string41.equals("null")) {
                                        TextView textView19 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_18);
                                        textView19.setVisibility(0);
                                        textView19.setText(string41);
                                    }
                                    if (!string43.equals("null")) {
                                        TextView textView20 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_19);
                                        textView20.setVisibility(0);
                                        textView20.setText(string43);
                                    }
                                    if (!string45.equals("null")) {
                                        TextView textView21 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_20);
                                        textView21.setVisibility(0);
                                        textView21.setText(string45);
                                    }
                                    if (!string47.equals("null")) {
                                        TextView textView22 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_21);
                                        textView22.setVisibility(0);
                                        textView22.setText(string47);
                                    }
                                    if (!string49.equals("null")) {
                                        TextView textView23 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_22);
                                        textView23.setVisibility(0);
                                        textView23.setText(string49);
                                    }
                                    if (!string51.equals("null")) {
                                        TextView textView24 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_23);
                                        textView24.setVisibility(0);
                                        textView24.setText(string51);
                                    }
                                    if (!string53.equals("null")) {
                                        TextView textView25 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_24);
                                        textView25.setVisibility(0);
                                        textView25.setText(string53);
                                    }
                                    if (!string55.equals("null")) {
                                        TextView textView26 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_25);
                                        textView26.setVisibility(0);
                                        textView26.setText(string55);
                                    }
                                    if (!string57.equals("null")) {
                                        TextView textView27 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_26);
                                        textView27.setVisibility(0);
                                        textView27.setText(string57);
                                    }
                                    if (!string59.equals("null")) {
                                        TextView textView28 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_27);
                                        textView28.setVisibility(0);
                                        textView28.setText(string59);
                                    }
                                    if (!string61.equals("null")) {
                                        TextView textView29 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_28);
                                        textView29.setVisibility(0);
                                        textView29.setText(string61);
                                    }
                                    if (!string63.equals("null")) {
                                        TextView textView30 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_29);
                                        textView30.setVisibility(0);
                                        textView30.setText(string63);
                                    }
                                    if (!string65.equals("null")) {
                                        TextView textView31 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_30);
                                        textView31.setVisibility(0);
                                        textView31.setText(string65);
                                    }
                                    if (!string67.equals("null")) {
                                        TextView textView32 = (TextView) NoticeActivity.this.findViewById(R.id.tv_notice_text_31);
                                        textView32.setVisibility(0);
                                        textView32.setText(string67);
                                    }
                                    RequestOptions format = new RequestOptions().placeholder(R.drawable.icon_banner_background_loading).fallback(R.drawable.icon_banner_background_loading).error(R.drawable.icon_banner_background_loading).override(Integer.MIN_VALUE, Integer.MIN_VALUE).format(DecodeFormat.PREFER_RGB_565);
                                    if (!string4.equals("null")) {
                                        ImageView imageView = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_0);
                                        imageView.setVisibility(0);
                                        RequestManager with = Glide.with(imageView);
                                        with.load("http://img.etrasoft.cn" + string4).apply(format).into(imageView);
                                    }
                                    if (!string6.equals("null")) {
                                        ImageView imageView2 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_1);
                                        imageView2.setVisibility(0);
                                        RequestManager with2 = Glide.with(imageView2);
                                        with2.load("http://img.etrasoft.cn" + string6).apply(format).into(imageView2);
                                    }
                                    if (!string8.equals("null")) {
                                        ImageView imageView3 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_2);
                                        imageView3.setVisibility(0);
                                        RequestManager with3 = Glide.with(imageView3);
                                        with3.load("http://img.etrasoft.cn" + string8).apply(format).into(imageView3);
                                    }
                                    if (!string10.equals("null")) {
                                        ImageView imageView4 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_3);
                                        imageView4.setVisibility(0);
                                        RequestManager with4 = Glide.with(imageView4);
                                        with4.load("http://img.etrasoft.cn" + string10).apply(format).into(imageView4);
                                    }
                                    if (!string12.equals("null")) {
                                        ImageView imageView5 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_4);
                                        imageView5.setVisibility(0);
                                        RequestManager with5 = Glide.with(imageView5);
                                        with5.load("http://img.etrasoft.cn" + string12).apply(format).into(imageView5);
                                    }
                                    if (!string14.equals("null")) {
                                        ImageView imageView6 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_5);
                                        imageView6.setVisibility(0);
                                        RequestManager with6 = Glide.with(imageView6);
                                        with6.load("http://img.etrasoft.cn" + string14).apply(format).into(imageView6);
                                    }
                                    if (!string16.equals("null")) {
                                        ImageView imageView7 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_6);
                                        imageView7.setVisibility(0);
                                        RequestManager with7 = Glide.with(imageView7);
                                        with7.load("http://img.etrasoft.cn" + string16).apply(format).into(imageView7);
                                    }
                                    if (!string18.equals("null")) {
                                        ImageView imageView8 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_7);
                                        imageView8.setVisibility(0);
                                        RequestManager with8 = Glide.with(imageView8);
                                        with8.load("http://img.etrasoft.cn" + string18).apply(format).into(imageView8);
                                    }
                                    if (!string20.equals("null")) {
                                        ImageView imageView9 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_8);
                                        imageView9.setVisibility(0);
                                        RequestManager with9 = Glide.with(imageView9);
                                        with9.load("http://img.etrasoft.cn" + string20).apply(format).into(imageView9);
                                    }
                                    if (!string22.equals("null")) {
                                        ImageView imageView10 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_9);
                                        imageView10.setVisibility(0);
                                        RequestManager with10 = Glide.with(imageView10);
                                        with10.load("http://img.etrasoft.cn" + string22).apply(format).into(imageView10);
                                    }
                                    if (!string24.equals("null")) {
                                        ImageView imageView11 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_10);
                                        imageView11.setVisibility(0);
                                        RequestManager with11 = Glide.with(imageView11);
                                        with11.load("http://img.etrasoft.cn" + string24).apply(format).into(imageView11);
                                    }
                                    if (!string26.equals("null")) {
                                        ImageView imageView12 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_11);
                                        imageView12.setVisibility(0);
                                        RequestManager with12 = Glide.with(imageView12);
                                        with12.load("http://img.etrasoft.cn" + string26).apply(format).into(imageView12);
                                    }
                                    if (!string28.equals("null")) {
                                        ImageView imageView13 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_12);
                                        imageView13.setVisibility(0);
                                        RequestManager with13 = Glide.with(imageView13);
                                        with13.load("http://img.etrasoft.cn" + string28).apply(format).into(imageView13);
                                    }
                                    if (!string30.equals("null")) {
                                        ImageView imageView14 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_13);
                                        imageView14.setVisibility(0);
                                        RequestManager with14 = Glide.with(imageView14);
                                        with14.load("http://img.etrasoft.cn" + string30).apply(format).into(imageView14);
                                    }
                                    if (!string32.equals("null")) {
                                        ImageView imageView15 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_14);
                                        imageView15.setVisibility(0);
                                        RequestManager with15 = Glide.with(imageView15);
                                        with15.load("http://img.etrasoft.cn" + string32).apply(format).into(imageView15);
                                    }
                                    if (!string34.equals("null")) {
                                        ImageView imageView16 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_15);
                                        imageView16.setVisibility(0);
                                        RequestManager with16 = Glide.with(imageView16);
                                        with16.load("http://img.etrasoft.cn" + string34).apply(format).into(imageView16);
                                    }
                                    if (!string36.equals("null")) {
                                        ImageView imageView17 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_16);
                                        imageView17.setVisibility(0);
                                        RequestManager with17 = Glide.with(imageView17);
                                        with17.load("http://img.etrasoft.cn" + string36).apply(format).into(imageView17);
                                    }
                                    if (!string38.equals("null")) {
                                        ImageView imageView18 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_17);
                                        imageView18.setVisibility(0);
                                        RequestManager with18 = Glide.with(imageView18);
                                        with18.load("http://img.etrasoft.cn" + string38).apply(format).into(imageView18);
                                    }
                                    if (!string40.equals("null")) {
                                        ImageView imageView19 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_18);
                                        imageView19.setVisibility(0);
                                        RequestManager with19 = Glide.with(imageView19);
                                        with19.load("http://img.etrasoft.cn" + string40).apply(format).into(imageView19);
                                    }
                                    if (!string42.equals("null")) {
                                        ImageView imageView20 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_19);
                                        imageView20.setVisibility(0);
                                        RequestManager with20 = Glide.with(imageView20);
                                        with20.load("http://img.etrasoft.cn" + string42).apply(format).into(imageView20);
                                    }
                                    if (!string44.equals("null")) {
                                        ImageView imageView21 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_20);
                                        imageView21.setVisibility(0);
                                        RequestManager with21 = Glide.with(imageView21);
                                        with21.load("http://img.etrasoft.cn" + string44).apply(format).into(imageView21);
                                    }
                                    if (!string46.equals("null")) {
                                        ImageView imageView22 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_21);
                                        imageView22.setVisibility(0);
                                        RequestManager with22 = Glide.with(imageView22);
                                        with22.load("http://img.etrasoft.cn" + string46).apply(format).into(imageView22);
                                    }
                                    if (!string48.equals("null")) {
                                        ImageView imageView23 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_22);
                                        imageView23.setVisibility(0);
                                        RequestManager with23 = Glide.with(imageView23);
                                        with23.load("http://img.etrasoft.cn" + string48).apply(format).into(imageView23);
                                    }
                                    if (!string50.equals("null")) {
                                        ImageView imageView24 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_23);
                                        imageView24.setVisibility(0);
                                        RequestManager with24 = Glide.with(imageView24);
                                        with24.load("http://img.etrasoft.cn" + string50).apply(format).into(imageView24);
                                    }
                                    if (!string52.equals("null")) {
                                        ImageView imageView25 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_24);
                                        imageView25.setVisibility(0);
                                        RequestManager with25 = Glide.with(imageView25);
                                        with25.load("http://img.etrasoft.cn" + string52).apply(format).into(imageView25);
                                    }
                                    if (!string54.equals("null")) {
                                        ImageView imageView26 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_25);
                                        imageView26.setVisibility(0);
                                        RequestManager with26 = Glide.with(imageView26);
                                        with26.load("http://img.etrasoft.cn" + string54).apply(format).into(imageView26);
                                    }
                                    if (!string56.equals("null")) {
                                        ImageView imageView27 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_26);
                                        imageView27.setVisibility(0);
                                        RequestManager with27 = Glide.with(imageView27);
                                        with27.load("http://img.etrasoft.cn" + string56).apply(format).into(imageView27);
                                    }
                                    if (!string58.equals("null")) {
                                        ImageView imageView28 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_27);
                                        imageView28.setVisibility(0);
                                        RequestManager with28 = Glide.with(imageView28);
                                        with28.load("http://img.etrasoft.cn" + string58).apply(format).into(imageView28);
                                    }
                                    if (!string60.equals("null")) {
                                        ImageView imageView29 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_28);
                                        imageView29.setVisibility(0);
                                        RequestManager with29 = Glide.with(imageView29);
                                        with29.load("http://img.etrasoft.cn" + string60).apply(format).into(imageView29);
                                    }
                                    if (!string62.equals("null")) {
                                        ImageView imageView30 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_29);
                                        imageView30.setVisibility(0);
                                        RequestManager with30 = Glide.with(imageView30);
                                        with30.load("http://img.etrasoft.cn" + string62).apply(format).into(imageView30);
                                    }
                                    if (!string64.equals("null")) {
                                        ImageView imageView31 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_30);
                                        imageView31.setVisibility(0);
                                        RequestManager with31 = Glide.with(imageView31);
                                        with31.load("http://img.etrasoft.cn" + string64).apply(format).into(imageView31);
                                    }
                                    if (string66.equals("null")) {
                                        return;
                                    }
                                    ImageView imageView32 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_notice_img_31);
                                    imageView32.setVisibility(0);
                                    RequestManager with32 = Glide.with(imageView32);
                                    with32.load("http://img.etrasoft.cn" + string66).apply(format).into(imageView32);
                                }
                            });
                            try {
                                NoticeActivity.this.ShowNotice();
                            } catch (JSONException e) {
                                e = e;
                                e.printStackTrace();
                            }
                        } catch (JSONException e2) {
                            e = e2;
                        }
                    } catch (JSONException e3) {
                        e = e3;
                    }
                } else {
                    final ImageView imageView = (ImageView) NoticeActivity.this.findViewById(R.id.iv_loading_anim);
                    final TextView textView = (TextView) NoticeActivity.this.findViewById(R.id.tv_loading_text);
                    final ImageView imageView2 = (ImageView) NoticeActivity.this.findViewById(R.id.iv_load_failed);
                    final Button button = (Button) NoticeActivity.this.findViewById(R.id.btn_retry);
                    final TextView textView2 = (TextView) NoticeActivity.this.findViewById(R.id.tv_retry_text);
                    NoticeActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.NoticeActivity.9.2
                        @Override // java.lang.Runnable
                        public void run() {
                            imageView.setVisibility(8);
                            textView.setVisibility(8);
                            imageView2.setVisibility(0);
                            textView2.setVisibility(0);
                            button.setVisibility(0);
                        }
                    });
                }
            }
        }.start();
    }

    /* JADX INFO: Access modifiers changed from: private */
    public String getJson() {
        String stringExtra = getIntent().getStringExtra("noticeId");
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
        HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/notice_activity/get_notice_data.php");
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("noticeId", stringExtra));
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
                    return sb.toString();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    void setLayout() {
        File file = new File(getFilesDir(), "CircleLayout.txt");
        File file2 = new File(getFilesDir(), "SquareLayout.txt");
        if (file.exists() && file2.exists()) {
            setContentView(R.layout.activity_notice);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        } else if (file.exists()) {
            setContentView(R.layout.activity_notice);
        } else if (file2.exists()) {
            setContentView(R.layout.activity_notice_square);
        } else {
            setContentView(R.layout.activity_notice);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        }
    }

    private void ClickToBackLastActivity() {
        ((LinearLayout) findViewById(R.id.ll_back)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.NoticeActivity.10
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                NoticeActivity.this.finish();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateNoticeActivityTotalPv() {
        try {
            HttpURLConnection httpURLConnection = (HttpURLConnection) new URL("http://106.53.152.67/etralab_appstore_android/pv/notice_activity/pv.php").openConnection();
            httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
            httpURLConnection.setConnectTimeout(6000);
            httpURLConnection.getResponseCode();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void UpdateNoticeViewNum() {
        String stringExtra = getIntent().getStringExtra("noticeId");
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
        HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/notice_activity/update_notice_view_num.php");
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("noticeId", stringExtra));
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
            defaultHttpClient.execute((HttpUriRequest) httpPost);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateNoticeLikeNum() {
        String stringExtra = getIntent().getStringExtra("noticeId");
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
        HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/notice_activity/update_notice_like_num.php");
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("noticeId", stringExtra));
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
            defaultHttpClient.execute((HttpUriRequest) httpPost);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void SubNoticeLikeNum() {
        String stringExtra = getIntent().getStringExtra("noticeId");
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
        HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/notice_activity/sub_notice_like_num.php");
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("noticeId", stringExtra));
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
            defaultHttpClient.execute((HttpUriRequest) httpPost);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void UpdateNoticeDislikeNum() {
        String stringExtra = getIntent().getStringExtra("noticeId");
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
        HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/notice_activity/update_notice_dislike_num.php");
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("noticeId", stringExtra));
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
            defaultHttpClient.execute((HttpUriRequest) httpPost);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void SubNoticeDislikeNum() {
        String stringExtra = getIntent().getStringExtra("noticeId");
        DefaultHttpClient defaultHttpClient = new DefaultHttpClient();
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.CONNECTION_TIMEOUT, 5000);
        defaultHttpClient.getParams().setParameter(CoreConnectionPNames.SO_TIMEOUT, 5000);
        HttpPost httpPost = new HttpPost("http://106.53.152.67/etralab_appstore_android/php/notice_activity/sub_notice_dislike_num.php");
        ArrayList arrayList = new ArrayList();
        arrayList.add(new BasicNameValuePair("noticeId", stringExtra));
        try {
            httpPost.setEntity(new UrlEncodedFormEntity(arrayList, "UTF-8"));
            defaultHttpClient.execute((HttpUriRequest) httpPost);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
