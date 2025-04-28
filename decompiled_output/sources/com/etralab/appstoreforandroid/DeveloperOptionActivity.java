package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
/* loaded from: classes.dex */
public class DeveloperOptionActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_developer_option);
        ((Button) findViewById(R.id.btn_connect_check)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.DeveloperOptionActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                DeveloperOptionActivity.this.startActivity(new Intent(DeveloperOptionActivity.this, ConnectCheckActivity.class));
            }
        });
    }
}
