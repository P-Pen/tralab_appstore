package com.etralab.appstoreforandroid.basefloat;

import android.content.Context;
import android.view.View;
import com.etralab.appstoreforandroid.R;
/* loaded from: classes.dex */
public class DebugFloatView extends DebugFloatBase {
    private static String debugInfo = "";
    private static int debugInfoId = 1;

    public static void AddDebugMsg(String str, String str2) {
    }

    @Override // com.etralab.appstoreforandroid.basefloat.DebugFloatBase
    protected void onAddWindowFailed(Exception exc) {
    }

    public DebugFloatView(Context context) {
        super(context);
    }

    @Override // com.etralab.appstoreforandroid.basefloat.DebugFloatBase
    public void create() {
        super.create();
        this.mViewMode = 2;
        this.mGravity = 17;
        inflate(R.layout.view_debug_float);
        findView(R.id.ll_debug_float_body).setOnClickListener(new View.OnClickListener() { // from class: com.etralab.appstoreforandroid.basefloat.DebugFloatView.1
            @Override // android.view.View.OnClickListener
            public void onClick(View view) {
                DebugFloatView.this.remove();
            }
        });
    }
}
