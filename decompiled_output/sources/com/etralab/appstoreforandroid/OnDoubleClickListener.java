package com.etralab.appstoreforandroid;

import android.view.MotionEvent;
import android.view.View;
import androidx.recyclerview.widget.ItemTouchHelper;
/* loaded from: classes.dex */
public class OnDoubleClickListener implements View.OnTouchListener {
    private DoubleClickCallback mCallback;
    private int count = 0;
    private long firstClick = 0;
    private long secondClick = 0;
    private final int totalTime = ItemTouchHelper.Callback.DEFAULT_SWIPE_ANIMATION_DURATION;

    /* loaded from: classes.dex */
    public interface DoubleClickCallback {
        void onDoubleClick();
    }

    public OnDoubleClickListener(DoubleClickCallback doubleClickCallback) {
        this.mCallback = doubleClickCallback;
    }

    @Override // android.view.View.OnTouchListener
    public boolean onTouch(View view, MotionEvent motionEvent) {
        if (motionEvent.getAction() == 0) {
            int i = this.count + 1;
            this.count = i;
            if (1 == i) {
                this.firstClick = System.currentTimeMillis();
            } else if (2 == i) {
                long currentTimeMillis = System.currentTimeMillis();
                this.secondClick = currentTimeMillis;
                if (currentTimeMillis - this.firstClick < 250) {
                    DoubleClickCallback doubleClickCallback = this.mCallback;
                    if (doubleClickCallback != null) {
                        doubleClickCallback.onDoubleClick();
                    }
                    this.count = 0;
                    this.firstClick = 0L;
                } else {
                    this.firstClick = currentTimeMillis;
                    this.count = 1;
                }
                this.secondClick = 0L;
            }
        }
        return true;
    }
}
