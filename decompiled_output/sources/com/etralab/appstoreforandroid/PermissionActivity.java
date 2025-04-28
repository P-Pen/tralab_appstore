package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.os.Build;
import android.os.Bundle;
import android.view.KeyEvent;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import java.util.Objects;
/* loaded from: classes.dex */
public class PermissionActivity extends Activity {
    boolean isOW3 = false;

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_permission);
        if (Objects.equals(Build.MODEL, "OWW211") || Objects.equals(Build.MODEL, "OWW212")) {
            this.isOW3 = true;
        }
        if (ContextCompat.checkSelfPermission(this, "android.permission.WRITE_EXTERNAL_STORAGE") != 0) {
            ActivityCompat.requestPermissions(this, new String[]{"android.permission.WRITE_EXTERNAL_STORAGE"}, 1);
        }
        int checkSelfPermission = ContextCompat.checkSelfPermission(this, "com.android.permission.GET_INSTALLED_APPS");
        if (!this.isOW3 || checkSelfPermission == 0) {
            return;
        }
        ActivityCompat.requestPermissions(this, new String[]{"com.android.permission.GET_INSTALLED_APPS"}, 1);
    }

    @Override // android.app.Activity
    protected void onResume() {
        super.onResume();
        int checkSelfPermission = ContextCompat.checkSelfPermission(this, "android.permission.WRITE_EXTERNAL_STORAGE");
        if (checkSelfPermission != 0) {
            ActivityCompat.requestPermissions(this, new String[]{"android.permission.WRITE_EXTERNAL_STORAGE"}, 1);
        }
        int checkSelfPermission2 = ContextCompat.checkSelfPermission(this, "com.android.permission.GET_INSTALLED_APPS");
        if (this.isOW3 && checkSelfPermission2 != 0) {
            ActivityCompat.requestPermissions(this, new String[]{"com.android.permission.GET_INSTALLED_APPS"}, 1);
        }
        if (!this.isOW3) {
            if (checkSelfPermission == 0) {
                finish();
            }
        } else if (checkSelfPermission == 0 && checkSelfPermission2 == 0) {
            finish();
        }
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (keyEvent.getKeyCode() == 4) {
            return true;
        }
        return super.dispatchKeyEvent(keyEvent);
    }
}
