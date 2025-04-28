package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.KeyEvent;
import android.view.View;
import android.widget.EditText;
import android.widget.LinearLayout;
import android.widget.Toast;
import java.io.File;
/* loaded from: classes.dex */
public class SearchActivity extends Activity {
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setLayout();
        ClickToBackLastActivity();
        ((EditText) findViewById(R.id.et_search_box)).setOnKeyListener(new View.OnKeyListener() { // from class: com.etralab.appstoreforandroid.SearchActivity.1
            @Override // android.view.View.OnKeyListener
            public boolean onKey(View view, int i, KeyEvent keyEvent) {
                if (keyEvent.getAction() == 1 && i == 66) {
                    SearchActivity.this.Search();
                    return false;
                }
                return false;
            }
        });
        ((LinearLayout) findViewById(R.id.ll_search)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SearchActivity.2
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SearchActivity.this.Search();
            }
        });
    }

    /* JADX INFO: Access modifiers changed from: private */
    public void Search() {
        EditText editText = (EditText) findViewById(R.id.et_search_box);
        if (!editText.getText().toString().equals("")) {
            Intent intent = new Intent(this, SearchResultActivity.class);
            intent.putExtra("searchText", editText.getText().toString());
            startActivity(intent);
            finish();
            return;
        }
        Toast.makeText(getApplicationContext(), "请先输入搜索内容", 0).show();
    }

    void setLayout() {
        File file = new File(getFilesDir(), "CircleLayout.txt");
        File file2 = new File(getFilesDir(), "SquareLayout.txt");
        if (file.exists() && file2.exists()) {
            setContentView(R.layout.activity_search);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        } else if (file.exists()) {
            setContentView(R.layout.activity_search);
        } else if (file2.exists()) {
            setContentView(R.layout.activity_search_square);
        } else {
            setContentView(R.layout.activity_search);
            startActivity(new Intent(this, ChooseLayoutActivity.class));
            finish();
        }
    }

    private void ClickToBackLastActivity() {
        ((LinearLayout) findViewById(R.id.ll_back)).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.SearchActivity.3
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                SearchActivity.this.finish();
            }
        });
    }
}
