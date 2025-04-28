package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.os.Process;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import java.io.File;
import java.io.IOException;
/* loaded from: classes.dex */
public class UserAgreementActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_user_agreement);
        ((Button) findViewById(R.id.btn_agree)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.UserAgreementActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                File file = new File(UserAgreementActivity.this.getFilesDir(), "isUserAgreementAgree4");
                if (!file.exists()) {
                    try {
                        file.createNewFile();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                UserAgreementActivity.this.finish();
            }
        });
        ((Button) findViewById(R.id.btn_disagree)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.UserAgreementActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                File file = new File(UserAgreementActivity.this.getFilesDir(), "isUserAgreementAgree4");
                if (file.exists()) {
                    file.delete();
                }
                Process.killProcess(Process.myPid());
                System.exit(0);
            }
        });
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        if (!new File(getFilesDir(), "isUserAgreementAgree4").exists()) {
            startActivity(new Intent(this, UserAgreementActivity.class));
        }
        super.onDestroy();
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (keyEvent.getKeyCode() == 4) {
            return true;
        }
        return super.dispatchKeyEvent(keyEvent);
    }
}
