package com.etralab.appstoreforandroid.basefloat;

import android.content.Context;
import android.os.Handler;
import android.os.Looper;
import android.view.View;
import android.view.WindowManager;
import android.widget.Toast;
/* loaded from: classes.dex */
public abstract class DebugFloatBase {
    static final int FULLSCREEN_NOT_TOUCHABLE = 2;
    static final int FULLSCREEN_TOUCHABLE = 1;
    public static final String TAG = "AbsFloatBase";
    static final int WRAP_CONTENT_NOT_TOUCHABLE = 4;
    static final int WRAP_CONTENT_TOUCHABLE = 3;
    static View mInflate;
    private boolean mAdded;
    Context mContext;
    WindowManager.LayoutParams mLayoutParams;
    WindowManager mWindowManager;
    private boolean mInvisibleNeed = false;
    private boolean mRequestFocus = false;
    int mGravity = 17;
    int mViewMode = 4;
    Handler mHandler = new Handler(Looper.getMainLooper());
    protected int mAddX = 0;
    protected int mAddY = 0;

    protected abstract void onAddWindowFailed(Exception exc);

    public DebugFloatBase(Context context) {
        this.mContext = context;
        create();
    }

    public void setInvisibleNeed(boolean z) {
        this.mInvisibleNeed = z;
    }

    public void requestFocus(boolean z) {
        this.mRequestFocus = z;
    }

    public void create() {
        this.mWindowManager = (WindowManager) this.mContext.getApplicationContext().getSystemService("window");
    }

    public synchronized void show() {
        View view = mInflate;
        if (view == null) {
            throw new IllegalStateException("FloatView can not be null");
        }
        if (this.mAdded) {
            view.setVisibility(0);
            return;
        }
        getLayoutParam(this.mViewMode);
        mInflate.setVisibility(0);
        try {
            this.mLayoutParams.x = this.mAddX;
            this.mLayoutParams.y = this.mAddY;
            this.mWindowManager.addView(mInflate, this.mLayoutParams);
            this.mAdded = true;
        } catch (Exception e) {
            Toast.makeText(this.mContext, "请检查悬浮窗权限", 0).show();
            onAddWindowFailed(e);
        }
    }

    public void hide() {
        View view = mInflate;
        if (view != null) {
            view.setVisibility(4);
        }
    }

    public void gone() {
        View view = mInflate;
        if (view != null) {
            view.setVisibility(8);
        }
    }

    public void remove() {
        View view = mInflate;
        if (view != null && this.mWindowManager != null) {
            if (view.isAttachedToWindow()) {
                this.mWindowManager.removeView(mInflate);
            }
            this.mAdded = false;
        }
        Handler handler = this.mHandler;
        if (handler != null) {
            handler.removeCallbacksAndMessages(null);
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public View inflate(int i) {
        View inflate = View.inflate(this.mContext, i, null);
        mInflate = inflate;
        return inflate;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public static <T extends View> T findView(int i) {
        View view = mInflate;
        if (view != null) {
            return (T) view.findViewById(i);
        }
        return null;
    }

    protected void getLayoutParam(int i) {
        if (i == 1) {
            this.mLayoutParams = FloatWindowParamManager.getFloatLayoutParam(true, true);
        } else if (i == 2) {
            this.mLayoutParams = FloatWindowParamManager.getFloatLayoutParam(true, false);
        } else if (i == 3) {
            this.mLayoutParams = FloatWindowParamManager.getFloatLayoutParam(false, true);
        } else if (i == 4) {
            this.mLayoutParams = FloatWindowParamManager.getFloatLayoutParam(false, false);
        }
        if (this.mRequestFocus) {
            this.mLayoutParams.flags &= -9;
        }
        this.mLayoutParams.gravity = this.mGravity;
    }

    public boolean getVisibility() {
        View view = mInflate;
        return view != null && view.getVisibility() == 0;
    }

    public void toggleVisibility() {
        if (mInflate != null) {
            if (getVisibility()) {
                if (this.mInvisibleNeed) {
                    hide();
                    return;
                } else {
                    gone();
                    return;
                }
            }
            show();
        }
    }
}
