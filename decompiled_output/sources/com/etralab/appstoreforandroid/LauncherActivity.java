package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.view.KeyEvent;
/* loaded from: classes.dex */
public class LauncherActivity extends Activity {
    private Context context = this;

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_launcher);
        new Handler().postDelayed(new Runnable() { // from class: com.etralab.appstoreforandroid.LauncherActivity.1
            @Override // java.lang.Runnable
            public void run() {
                LauncherActivity.this.startActivity(new Intent(LauncherActivity.this.context, MainActivity.class));
                LauncherActivity.this.finish();
            }
        }, 1500L);
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (keyEvent.getKeyCode() == 4) {
            return true;
        }
        return super.dispatchKeyEvent(keyEvent);
    }
}
