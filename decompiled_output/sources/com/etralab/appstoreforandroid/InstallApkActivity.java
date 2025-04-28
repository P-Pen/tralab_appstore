package com.etralab.appstoreforandroid;

import android.app.Activity;
import android.content.Intent;
import android.graphics.drawable.AnimationDrawable;
import android.os.Bundle;
import android.os.Handler;
import android.os.Message;
import android.widget.ImageView;
import android.widget.TextView;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.channels.FileChannel;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.util.Scanner;
import org.apache.commons.codec.binary.Base64;
/* loaded from: classes.dex */
public class InstallApkActivity extends Activity {
    AdbConnection adb;
    AdbCrypto crypto;
    TextView debug;
    ImageView iv_loading_anim;
    Socket sock;
    TextView state;
    AdbStream stream;
    Scanner in = new Scanner(System.in);
    Handler handler = new Handler() { // from class: com.etralab.appstoreforandroid.InstallApkActivity.3
        @Override // android.os.Handler
        public void handleMessage(Message message) {
            String regular;
            super.handleMessage(message);
            if (message.obj != null && (regular = InstallApkActivity.this.regular(message.obj.toString())) != null) {
                TextView textView = InstallApkActivity.this.debug;
                textView.append(regular + "\n");
            }
            if (message.what == 2000) {
                InstallApkActivity.this.iv_loading_anim.setVisibility(8);
                InstallApkActivity.this.state.setText("安装应用成功！");
            } else if (message.what == 3000) {
                String obj = message.obj.toString();
                InstallApkActivity.this.iv_loading_anim.setVisibility(8);
                TextView textView2 = InstallApkActivity.this.state;
                textView2.setText("安装应用失败：" + obj);
            }
            if (message.what == 2000 || message.what == 3000) {
                new Thread(new Runnable() { // from class: com.etralab.appstoreforandroid.InstallApkActivity.3.1
                    @Override // java.lang.Runnable
                    public void run() {
                        try {
                            Thread.sleep(5000L);
                            InstallApkActivity.this.finish();
                        } catch (InterruptedException unused) {
                        }
                    }
                }).start();
            }
        }
    };

    /* JADX WARN: Type inference failed for: r0v10, types: [com.etralab.appstoreforandroid.InstallApkActivity$1] */
    @Override // android.app.Activity
    protected void onCreate(Bundle bundle) {
        super.onCreate(bundle);
        requestWindowFeature(1);
        setContentView(R.layout.activity_install_apk);
        getWindow().setFlags(128, 128);
        Intent intent = getIntent();
        if (intent == null) {
            finish();
            return;
        }
        this.debug = (TextView) findViewById(R.id.debug);
        this.state = (TextView) findViewById(R.id.state);
        this.iv_loading_anim = (ImageView) findViewById(R.id.iv_loading_anim);
        new Thread() { // from class: com.etralab.appstoreforandroid.InstallApkActivity.1
            @Override // java.lang.Thread, java.lang.Runnable
            public void run() {
                super.run();
                if (InstallApkActivity.this.iv_loading_anim != null) {
                    ((AnimationDrawable) InstallApkActivity.this.iv_loading_anim.getBackground()).start();
                }
            }
        }.start();
        final String stringExtra = intent.getStringExtra("apkPath");
        final File file = new File(stringExtra);
        String str = String.valueOf(System.currentTimeMillis()) + ".apk";
        final File file2 = new File(file.getParent() + "/" + str);
        StringBuilder sb = new StringBuilder();
        sb.append("/data/local/tmp/");
        sb.append(str);
        final File file3 = new File(sb.toString());
        try {
            this.crypto = setupCrypto("pub.key", "priv.key", getFilesDir().getAbsolutePath() + "/");
            new Thread(new Runnable() { // from class: com.etralab.appstoreforandroid.InstallApkActivity.2
                @Override // java.lang.Runnable
                public void run() {
                    try {
                        InstallApkActivity.this.sock = new Socket("127.0.0.1", 5555);
                        try {
                            InstallApkActivity installApkActivity = InstallApkActivity.this;
                            installApkActivity.adb = AdbConnection.create(installApkActivity.sock, InstallApkActivity.this.crypto);
                            System.out.println("ADB connecting...");
                            InstallApkActivity.this.debug("ADB connecting...");
                            try {
                                InstallApkActivity.this.adb.connect();
                                System.out.println("ADB connected");
                                InstallApkActivity.this.debug("ADB connected");
                                try {
                                    Thread.sleep(1000L);
                                } catch (InterruptedException unused) {
                                }
                                try {
                                    InstallApkActivity installApkActivity2 = InstallApkActivity.this;
                                    installApkActivity2.stream = installApkActivity2.adb.open("shell:");
                                    try {
                                        if (!file.renameTo(file2)) {
                                            InstallApkActivity.this.stream.write(" cp " + file.getAbsoluteFile().toString() + " " + file3.getAbsoluteFile().toString() + '\n');
                                        } else {
                                            InstallApkActivity.this.stream.write(" cp " + file2.getAbsoluteFile().toString() + " " + file3.getAbsoluteFile().toString() + '\n');
                                        }
                                    } catch (IOException e) {
                                        InstallApkActivity.this.fail(e.toString());
                                    } catch (InterruptedException e2) {
                                        InstallApkActivity.this.fail(e2.toString());
                                    }
                                    String str2 = "";
                                    boolean z = false;
                                    while (!InstallApkActivity.this.stream.isClosed()) {
                                        try {
                                            String str3 = new String(InstallApkActivity.this.stream.read(), "US-ASCII");
                                            if (str3.contains("\n")) {
                                                String[] split = str3.split("\n");
                                                for (int i = 0; i < split.length; i++) {
                                                    if (i == 0) {
                                                        InstallApkActivity.this.debug(str2 + split[0]);
                                                    } else if (i == split.length - 1) {
                                                        str2 = str2 + split[i];
                                                    } else {
                                                        InstallApkActivity.this.debug(split[i]);
                                                    }
                                                    str2 = "";
                                                }
                                            } else {
                                                str2 = str2 + str3;
                                            }
                                            if (str3.contains("cp")) {
                                                if (z) {
                                                    InstallApkActivity.this.stream.write(" pm install -r " + file3.getAbsoluteFile() + '\n');
                                                } else {
                                                    z = true;
                                                }
                                            }
                                            if (str3.contains("Success")) {
                                                InstallApkActivity.this.handler.sendEmptyMessage(2000);
                                                file2.renameTo(new File(stringExtra));
                                                InstallApkActivity.this.stream.write(" rm -rf " + file3.getAbsolutePath() + "\n");
                                                InstallApkActivity.this.stream.write(" exit\n");
                                                file3.delete();
                                            } else if (str3.contains("Error") | str3.contains("error") | str3.contains("fail") | str3.contains("Fail")) {
                                                file2.renameTo(new File(stringExtra));
                                                InstallApkActivity.this.stream.write(" rm -rf" + file3.getAbsolutePath() + "\n");
                                                InstallApkActivity.this.stream.write(" exit\n");
                                                InstallApkActivity.this.fail(str3);
                                            }
                                        } catch (UnsupportedEncodingException e3) {
                                            InstallApkActivity.this.fail(e3.toString());
                                            return;
                                        } catch (IOException unused2) {
                                            return;
                                        } catch (InterruptedException e4) {
                                            InstallApkActivity.this.fail(e4.toString());
                                            return;
                                        }
                                    }
                                } catch (UnsupportedEncodingException e5) {
                                    InstallApkActivity.this.fail(e5.toString());
                                } catch (IOException e6) {
                                    InstallApkActivity.this.fail(e6.toString());
                                } catch (InterruptedException e7) {
                                    InstallApkActivity.this.fail(e7.toString());
                                }
                            } catch (IOException e8) {
                                InstallApkActivity.this.fail(e8.toString());
                            } catch (InterruptedException e9) {
                                InstallApkActivity.this.debug(e9.toString());
                            }
                        } catch (IOException e10) {
                            InstallApkActivity.this.fail(e10.toString());
                        }
                    } catch (UnknownHostException e11) {
                        InstallApkActivity.this.fail(e11.toString());
                    } catch (IOException e12) {
                        InstallApkActivity.this.fail(e12.toString());
                    }
                }
            }).start();
        } catch (IOException e) {
            fail(e.toString());
        } catch (NoSuchAlgorithmException e2) {
            fail(e2.toString());
        } catch (InvalidKeySpecException e3) {
            fail(e3.toString());
        }
    }

    @Override // android.app.Activity
    protected void onDestroy() {
        super.onDestroy();
        try {
            AdbConnection adbConnection = this.adb;
            if (adbConnection != null) {
                adbConnection.close();
            }
        } catch (IOException unused) {
        }
    }

    String regular(String str) {
        if (str == null) {
            return str;
        }
        if (str.equals("^@")) {
            return null;
        }
        if (str.contains("^@")) {
            str = str.replaceAll("^@", "");
        }
        if (str.contains("\n")) {
            str = str.replaceAll("\n", "");
        }
        if (str.contains("$")) {
            str = str.replaceAll("^.*?\\$", "");
        }
        if (str.contains(" ")) {
            str = str.replace("^ *", "");
        }
        if (str.contains("<")) {
            str = str.replace(" *<*", "").replace("", "");
        }
        return str.trim();
    }

    public static AdbBase64 getBase64Impl() {
        return new AdbBase64() { // from class: com.etralab.appstoreforandroid.InstallApkActivity.4
            @Override // com.etralab.appstoreforandroid.AdbBase64
            public String encodeToString(byte[] bArr) {
                return Base64.encodeBase64(bArr).toString();
            }
        };
    }

    private static AdbCrypto setupCrypto(String str, String str2, String str3) throws NoSuchAlgorithmException, InvalidKeySpecException, IOException {
        File file = new File(str3 + str);
        File file2 = new File(str3 + str2);
        AdbCrypto generateAdbKeyPair = AdbCrypto.generateAdbKeyPair(getBase64Impl());
        generateAdbKeyPair.saveAdbKeyPair(file2, file);
        System.out.println("Generated new keypair");
        return generateAdbKeyPair;
    }

    void debug(Object obj) {
        Message message = new Message();
        message.obj = obj;
        this.handler.sendMessage(message);
    }

    void fail(Object obj) {
        Message message = new Message();
        message.obj = obj.toString();
        message.what = 3000;
        this.handler.sendMessage(message);
    }

    static void close(FileChannel fileChannel) {
        if (fileChannel != null) {
            try {
                fileChannel.close();
            } catch (IOException unused) {
            }
        }
    }

    static void close(FileInputStream fileInputStream) {
        if (fileInputStream != null) {
            try {
                fileInputStream.close();
            } catch (IOException unused) {
            }
        }
    }

    static void close(FileOutputStream fileOutputStream) {
        if (fileOutputStream != null) {
            try {
                fileOutputStream.close();
            } catch (IOException unused) {
            }
        }
    }
}
