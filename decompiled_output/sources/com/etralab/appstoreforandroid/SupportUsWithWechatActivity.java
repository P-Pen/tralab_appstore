package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.LinearLayout;
import java.io.File;
/* loaded from: classes.dex */
public class SupportUsWithWechatActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setLayout();
        ClickToBackLastActivity();
    }

    void setLayout() {
        File file = new File(getFilesDir(), "CircleLayout.txt");
        File file2 = new File(getFilesDir(), "SquareLayout.txt");
        if (file.exists() && file2.exists()) {
            setContentView(R.layout.activity_support_us_with_wechat);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        } else if (file.exists()) {
            setContentView(R.layout.activity_support_us_with_wechat);
        } else if (file2.exists()) {
            setContentView(R.layout.activity_support_us_with_wechat_square);
        } else {
            setContentView(R.layout.activity_support_us_with_wechat);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        }
    }

    private void ClickToBackLastActivity() {
        ((LinearLayout) findViewById(R.id.ll_back)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SupportUsWithWechatActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SupportUsWithWechatActivity.this.finish();
            }
        });
    }
}
