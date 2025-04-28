package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import java.io.File;
import java.io.IOException;
/* loaded from: classes.dex */
public class WarmHintActivity extends Activity {
    boolean isCheckBoxClicked = false;

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_warm_hint);
        ((Button) findViewById(R.id.btn_ok)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.WarmHintActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                File file = new File(WarmHintActivity.this.getFilesDir(), "isWarmHintAgree.txt");
                if (!file.exists()) {
                    try {
                        file.createNewFile();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                }
                WarmHintActivity.this.finish();
            }
        });
    }

    @Override // android.app.Activity, android.view.Window.Callback
    public boolean dispatchKeyEvent(KeyEvent keyEvent) {
        if (keyEvent.getKeyCode() == 4) {
            return true;
        }
        return super.dispatchKeyEvent(keyEvent);
    }
}
