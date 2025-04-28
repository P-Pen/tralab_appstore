package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.os.Bundle;
/* loaded from: classes.dex */
public class HelpActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_help);
    }
}
