package com.etralab.appstoreforandroid;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import androidx.fragment.app.FragmentActivity;
import androidx.recyclerview.widget.RecyclerView;
import com.bumptech.glide.Glide;
import com.bumptech.glide.load.DecodeFormat;
import com.bumptech.glide.request.RequestOptions;
import java.util.List;
/* loaded from: classes.dex */
public class AppAdapter extends RecyclerView.Adapter<ViewHolder> {
    private List<App> mAppList;

    /* JADX INFO: Access modifiers changed from: package-private */
    /* loaded from: classes.dex */
    public static class ViewHolder extends RecyclerView.ViewHolder {
        TextView appDownloadNumber;
        TextView appId;
        TextView appLikeNumber;
        MyImageView appLogo;
        TextView appName;
        ImageView appOsType;

        public ViewHolder(View view) {
            super(view);
            this.appLogo = (MyImageView) view.findViewById(R.id.iv_AppLogo);
            this.appId = (TextView) view.findViewById(R.id.tv_app_id);
            this.appName = (TextView) view.findViewById(R.id.tv_AppName);
            this.appDownloadNumber = (TextView) view.findViewById(R.id.tv_DownloadNumber);
            this.appLikeNumber = (TextView) view.findViewById(R.id.tv_LikeNumber);
            this.appOsType = (ImageView) view.findViewById(R.id.iv_OsType);
        }
    }

    public AppAdapter(FragmentActivity fragmentActivity, List<App> list) {
        this.mAppList = list;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public ViewHolder onCreateViewHolder(final ViewGroup viewGroup, int i) {
        final ViewHolder viewHolder = new ViewHolder(LayoutInflater.from(viewGroup.getContext()).inflate(R.layout.item_app_list, viewGroup, false));
        viewHolder.itemView.setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AppAdapter.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                Context context = viewGroup.getContext();
                Intent intent = new Intent(context, AppActivity.class);
                intent.putExtra("appId", viewHolder.appId.getText());
                context.startActivity(intent);
            }
        });
        return viewHolder;
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public void onBindViewHolder(ViewHolder viewHolder, int i) {
        App app = this.mAppList.get(i);
        Glide.with(viewHolder.appLogo).load(app.getAppLogoUrl()).apply(new RequestOptions().placeholder(R.drawable.icon_app_logo_loading).fallback(R.drawable.icon_app_logo_loading).error(R.drawable.icon_app_logo_loading).override(Integer.MIN_VALUE, Integer.MIN_VALUE).format(DecodeFormat.PREFER_RGB_565)).into(viewHolder.appLogo);
        viewHolder.appId.setText(app.getAppId());
        viewHolder.appName.setText(app.getAppName());
        viewHolder.appDownloadNumber.setText(NumUnitConversionUtil.NumUnitConversion(app.getAppDownloadNumber()));
        viewHolder.appLikeNumber.setText(NumUnitConversionUtil.NumUnitConversion(app.getAppLikeNumber()));
        if (app.getAppOsType().equals("0")) {
            viewHolder.appOsType.setImageResource(R.drawable.icon_wear_os);
        } else if (app.getAppOsType().equals("1")) {
            viewHolder.appOsType.setImageResource(R.drawable.icon_android_watch);
        } else {
            viewHolder.appOsType.setImageResource(R.drawable.icon_android_phone);
        }
    }

    @Override // androidx.recyclerview.widget.RecyclerView.Adapter
    public int getItemCount() {
        return this.mAppList.size();
    }
}
