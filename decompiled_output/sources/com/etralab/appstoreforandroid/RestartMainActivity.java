package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
/* loaded from: classes.dex */
public class RestartMainActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_restart_main);
        if (MainActivity.instance != null) {
            MainActivity.instance.finish();
        }
        startActivity(new Intent(this, MainActivity.class));
        finish();
    }
}
