package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.Toast;
import java.io.File;
import java.io.IOException;
/* loaded from: classes.dex */
public class ChooseLayoutActivity extends Activity {
    int layoutId;

    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_choose_layout);
        final ImageView imageView = (ImageView) findViewById(R.id.iv_square_layout);
        final ImageView imageView2 = (ImageView) findViewById(R.id.iv_circle_layout);
        imageView.setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ChooseLayoutActivity.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ChooseLayoutActivity.this.layoutId = 2;
                ChooseLayoutActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.ChooseLayoutActivity.1.1
                    @Override // java.lang.Runnable
                    public void run() {
                        imageView.setImageResource(R.drawable.icon_square_layout_highlight);
                        imageView2.setImageResource(R.drawable.icon_circle_layout);
                    }
                });
            }
        });
        imageView2.setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ChooseLayoutActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                ChooseLayoutActivity.this.layoutId = 1;
                ChooseLayoutActivity.this.runOnUiThread(new Runnable() { // from class: com.etralab.appstoreforandroid.ChooseLayoutActivity.2.1
                    @Override // java.lang.Runnable
                    public void run() {
                        imageView.setImageResource(R.drawable.icon_square_layout);
                        imageView2.setImageResource(R.drawable.icon_circle_layout_highlight);
                    }
                });
            }
        });
        ((Button) findViewById(R.id.btn_choose)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.ChooseLayoutActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                File file = new File(ChooseLayoutActivity.this.getFilesDir(), "SquareLayout.txt");
                if (file.isFile() && file.exists()) {
                    file.delete();
                }
                File file2 = new File(ChooseLayoutActivity.this.getFilesDir(), "CircleLayout.txt");
                if (file2.isFile() && file2.exists()) {
                    file2.delete();
                }
                if (ChooseLayoutActivity.this.layoutId == 2) {
                    File file3 = new File(ChooseLayoutActivity.this.getFilesDir(), "SquareLayout.txt");
                    if (file3.exists()) {
                        return;
                    }
                    try {
                        file3.createNewFile();
                    } catch (IOException e) {
                        e.printStackTrace();
                    }
                    ChooseLayoutActivity.this.startActivity(new Intent(ChooseLayoutActivity.this, RestartMainActivity.class));
                    ChooseLayoutActivity.this.finish();
                } else if (ChooseLayoutActivity.this.layoutId == 1) {
                    File file4 = new File(ChooseLayoutActivity.this.getFilesDir(), "CircleLayout.txt");
                    if (!file4.exists()) {
                        try {
                            file4.createNewFile();
                        } catch (IOException e2) {
                            e2.printStackTrace();
                        }
                    }
                    ChooseLayoutActivity.this.startActivity(new Intent(ChooseLayoutActivity.this, RestartMainActivity.class));
                    ChooseLayoutActivity.this.finish();
                } else {
                    Toast.makeText(ChooseLayoutActivity.this, "请先选择布局", 0).show();
                }
            }
        });
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        File file = new File(getFilesDir(), "SquareLayout.txt");
        File file2 = new File(getFilesDir(), "CircleLayout.txt");
        if (!file.exists() && !file2.exists()) {
            startActivity(new Intent(this, ChooseLayoutActivity.class));
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
