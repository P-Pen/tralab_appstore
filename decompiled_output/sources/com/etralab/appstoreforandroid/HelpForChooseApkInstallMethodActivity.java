package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
/* loaded from: classes.dex */
public class HelpForChooseApkInstallMethodActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_help_for_choose_apk_install_method);
        ((Button) findViewById(R.id.btn_ok)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.HelpForChooseApkInstallMethodActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                HelpForChooseApkInstallMethodActivity.this.finish();
            }
        });
    }
}
