package com.etralab.appstoreforandroid;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.os.Handler;
import android.os.Message;
import android.util.AttributeSet;
import androidx.appcompat.widget.AppCompatImageView;
import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import org.apache.http.client.methods.HttpGet;
/* loaded from: classes.dex */
public class MyImageView extends AppCompatImageView {
    public static final int GET_DATA_SUCCESS = 1;
    public static final int NETWORK_ERROR = 2;
    public static final int SERVER_ERROR = 3;
    private Handler handler;

    public MyImageView(Context context, AttributeSet attributeSet, int i) {
        super(context, attributeSet, i);
        this.handler = new Handler() { // from class: com.etralab.appstoreforandroid.MyImageView.1
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                if (message.what != 1) {
                    return;
                }
                MyImageView.this.setImageBitmap((Bitmap) message.obj);
            }
        };
    }

    public MyImageView(Context context) {
        super(context);
        this.handler = new Handler() { // from class: com.etralab.appstoreforandroid.MyImageView.1
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                if (message.what != 1) {
                    return;
                }
                MyImageView.this.setImageBitmap((Bitmap) message.obj);
            }
        };
    }

    public MyImageView(Context context, AttributeSet attributeSet) {
        super(context, attributeSet);
        this.handler = new Handler() { // from class: com.etralab.appstoreforandroid.MyImageView.1
            @Override // android.os.Handler
            public void handleMessage(Message message) {
                if (message.what != 1) {
                    return;
                }
                MyImageView.this.setImageBitmap((Bitmap) message.obj);
            }
        };
    }

    /* JADX WARN: Type inference failed for: r0v0, types: [com.etralab.appstoreforandroid.MyImageView$2] */
    public void setImageURL(final String str) {
        new Thread() { // from class: com.etralab.appstoreforandroid.MyImageView.2
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                try {
                    HttpURLConnection httpURLConnection = (HttpURLConnection) new URL(str).openConnection();
                    httpURLConnection.setRequestMethod(HttpGet.METHOD_NAME);
                    httpURLConnection.setConnectTimeout(10000);
                    if (httpURLConnection.getResponseCode() != 200) {
                        MyImageView.this.handler.sendEmptyMessage(3);
                    } else {
                        InputStream inputStream = httpURLConnection.getInputStream();
                        Bitmap decodeStream = BitmapFactory.decodeStream(inputStream);
                        Message obtain = Message.obtain();
                        obtain.obj = decodeStream;
                        obtain.what = 1;
                        MyImageView.this.handler.sendMessage(obtain);
                        inputStream.close();
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                    MyImageView.this.handler.sendEmptyMessage(2);
                }
            }
        }.start();
    }
}
