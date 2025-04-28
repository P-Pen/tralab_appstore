package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.TextView;
/* loaded from: classes.dex */
public class AboutActivity extends Activity {
    int tv_buildCode_clickNumber = 0;

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_about);
        ((TextView) findViewById(R.id.tv_buildCode)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.AboutActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                AboutActivity.this.tv_buildCode_clickNumber++;
                if (AboutActivity.this.tv_buildCode_clickNumber >= 5) {
                    AboutActivity.this.startActivity(new Intent(AboutActivity.this, DeveloperOptionActivity.class));
                    AboutActivity.this.tv_buildCode_clickNumber = 0;
                }
            }
        });
    }
}
