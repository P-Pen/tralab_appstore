package com.etralab.appstoreforandroid;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.LinearLayout;
import androidx.fragment.app.Fragment;
import java.io.File;
/* loaded from: classes.dex */
public class ClassificationFragment extends Fragment {
    @Override // androidx.fragment.app.Fragment
    public View onCreateView(LayoutInflater layoutInflater, ViewGroup viewGroup, Bundle bundle) {
        File file = new File(getContext().getFilesDir(), "CircleLayout.txt");
        File file2 = new File(getContext().getFilesDir(), "SquareLayout.txt");
        if (file.exists()) {
            return layoutInflater.inflate(R.layout.fragment_classification, viewGroup, false);
        }
        if (file2.exists()) {
            return layoutInflater.inflate(R.layout.fragment_classification_square, viewGroup, false);
        }
        return layoutInflater.inflate(R.layout.fragment_classification, viewGroup, false);
    }

    @Override // androidx.fragment.app.Fragment
    public void onResume() {
        super.onResume();
    }

    @Override // androidx.fragment.app.Fragment
    public void onActivityCreated(Bundle bundle) {
        super.onActivityCreated(bundle);
        ((LinearLayout) getActivity().findViewById(R.id.ll_ranking)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "下载排行");
                intent.putExtra("appClassificationEn", "Ranking");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_newArrival)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "最新上架");
                intent.putExtra("appClassificationEn", "NewArrival");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_hot)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "热门推荐");
                intent.putExtra("appClassificationEn", "Hot");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_socialContact)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.4
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "社交通讯");
                intent.putExtra("appClassificationEn", "SocialContact");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_productivity)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.5
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "工作效率");
                intent.putExtra("appClassificationEn", "Productivity");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_videoAudio)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.6
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "影音");
                intent.putExtra("appClassificationEn", "VideoAudio");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_reading)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.7
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "阅读");
                intent.putExtra("appClassificationEn", "Reading");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_weather)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.8
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "天气");
                intent.putExtra("appClassificationEn", "Weather");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_game)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.9
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "游戏");
                intent.putExtra("appClassificationEn", "Game");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_watchFace)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.10
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "表盘");
                intent.putExtra("appClassificationEn", "WatchFace");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_hankmi_section)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.11
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "HankMi专区");
                intent.putExtra("appClassificationEn", "HankMiSection");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_other)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.12
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "其他");
                intent.putExtra("appClassificationEn", "Other");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_exercise_health)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.13
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "运动健康");
                intent.putExtra("appClassificationEn", "ExerciseHealth");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_news)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.14
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "新闻资讯");
                intent.putExtra("appClassificationEn", "News");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_map)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.15
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "地图导航");
                intent.putExtra("appClassificationEn", "Map");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_travelling)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.16
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "旅游出行");
                intent.putExtra("appClassificationEn", "Travelling");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_financial)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.17
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "金融理财");
                intent.putExtra("appClassificationEn", "Financial");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_image_processing)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.18
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "图像处理");
                intent.putExtra("appClassificationEn", "ImageProcessing");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_file_management)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.19
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "文件管理");
                intent.putExtra("appClassificationEn", "FileManagement");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_web_browser)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.20
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "浏览器");
                intent.putExtra("appClassificationEn", "WebBrowser");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_input_method)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.21
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "输入法");
                intent.putExtra("appClassificationEn", "InputMethod");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_education)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.22
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "教育");
                intent.putExtra("appClassificationEn", "Education");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_car)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.23
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "汽车");
                intent.putExtra("appClassificationEn", "Car");
                context.startActivity(intent);
            }
        });
        ((LinearLayout) getActivity().findViewById(R.id.ll_personalization)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ClassificationFragment.24
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = ClassificationFragment.this.getContext();
                Intent intent = new Intent(context, ClassificationActivity.class);
                intent.putExtra("appClassification", "主题个性");
                intent.putExtra("appClassificationEn", "Personalization");
                context.startActivity(intent);
            }
        });
    }
}
