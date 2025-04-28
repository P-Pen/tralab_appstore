package com.arialyy.aria.util;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.net.Uri;
import android.os.Environment;
import android.text.TextUtils;
import android.util.Base64;
import android.util.Log;
import com.arialyy.aria.core.AriaConfig;
import com.arialyy.aria.core.FtpUrlEntity;
import dalvik.system.DexFile;
import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.math.BigDecimal;
import java.math.BigInteger;
import java.net.URLEncoder;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashSet;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.apache.commons.codec.digest.MessageDigestAlgorithms;
import org.apache.http.message.TokenParser;
/* loaded from: classes.dex */
public class CommonUtil {
    public static final String SERVER_CHARSET = "ISO-8859-1";
    private static final String TAG = "CommonUtil";
    private static long lastClickTime;
    private static List<String> mFragmentClassName = new ArrayList();
    private static List<String> mDialogFragmentClassName = new ArrayList();

    static {
        mFragmentClassName.add("androidx.fragment.app.Fragment");
        mFragmentClassName.add("androidx.fragment.app.DialogFragment");
        mFragmentClassName.add("android.app.Fragment");
        mFragmentClassName.add("android.app.DialogFragment");
        mFragmentClassName.add("androidx.fragment.app.Fragment");
        mFragmentClassName.add("androidx.fragment.app.DialogFragment");
        mDialogFragmentClassName.add("androidx.fragment.app.DialogFragment");
        mDialogFragmentClassName.add("android.app.DialogFragment");
        mDialogFragmentClassName.add("androidx.fragment.app.DialogFragment");
    }

    public static Activity getFragmentActivity(Object obj) {
        try {
            return (Activity) obj.getClass().getMethod("getActivity", new Class[0]).invoke(obj, new Object[0]);
        } catch (IllegalAccessException e) {
            e.printStackTrace();
            return null;
        } catch (NoSuchMethodException e2) {
            e2.printStackTrace();
            return null;
        } catch (InvocationTargetException e3) {
            e3.printStackTrace();
            return null;
        }
    }

    public static boolean isFragment(Class cls) {
        Class superclass = cls.getSuperclass();
        if (superclass == null) {
            return false;
        }
        if (mFragmentClassName.contains(superclass.getName())) {
            return true;
        }
        return isFragment(superclass);
    }

    public static boolean isDialogFragment(Class cls) {
        Class superclass = cls.getSuperclass();
        if (superclass == null) {
            return false;
        }
        if (mDialogFragmentClassName.contains(superclass.getName())) {
            return true;
        }
        return isDialogFragment(superclass);
    }

    public static boolean isLocalOrAnonymousClass(Class cls) {
        return cls.isLocalClass() || cls.isAnonymousClass();
    }

    public static String getTargetName(Object obj) {
        if (isLocalOrAnonymousClass(obj.getClass())) {
            Log.w(TAG, String.format("%s 是匿名内部类或局部类，将使用其主类的对象", obj.getClass().getName()));
            String name = obj.getClass().getName();
            return name.substring(0, name.lastIndexOf("$"));
        }
        return obj.getClass().getName();
    }

    public static String getThreadName(String str, int i) {
        return getStrMd5(str.concat(String.valueOf(i)));
    }

    public static boolean checkSqlExpression(String... strArr) {
        if (strArr.length == 0) {
            ALog.e(TAG, "sql语句表达式不能为null");
            return false;
        }
        int i = 0;
        while (Pattern.compile("\\?").matcher(strArr[0]).find()) {
            i++;
        }
        if (i < strArr.length - 1) {
            ALog.e(TAG, String.format("条件语句的?个数不能小于参数个数，参数信息：%s", Arrays.toString(strArr)));
            return false;
        } else if (i > strArr.length - 1) {
            ALog.e(TAG, String.format("条件语句的?个数不能大于参数个数， 参数信息：%s", Arrays.toString(strArr)));
            return false;
        } else {
            return true;
        }
    }

    public static boolean isFastDoubleClick() {
        long currentTimeMillis = System.currentTimeMillis();
        long j = currentTimeMillis - lastClickTime;
        if (0 < j && j < 500) {
            ALog.i(TAG, "操作太频繁了，缓一下吧～");
            return true;
        }
        lastClickTime = currentTimeMillis;
        return false;
    }

    public static String convertFtpChar(String str, String str2) throws UnsupportedEncodingException {
        return new String(str2.getBytes(str), "ISO-8859-1");
    }

    public static String convertSFtpChar(String str, String str2) throws UnsupportedEncodingException {
        return new String(str2.getBytes(), str);
    }

    public static List<String> getPkgClassNames(Context context, String str) {
        ArrayList arrayList = new ArrayList();
        String packageCodePath = context.getPackageCodePath();
        File parentFile = new File(packageCodePath).getParentFile();
        if (parentFile.list() == null) {
            arrayList.addAll(getPkgClassName(packageCodePath, str));
        } else {
            String path = parentFile.getPath();
            for (String str2 : parentFile.list()) {
                String str3 = path + "/" + str2;
                if (str3.endsWith(".apk")) {
                    arrayList.addAll(getPkgClassName(str3, str));
                }
            }
        }
        return arrayList;
    }

    public static List<String> getPkgClassName(String str, String str2) {
        ArrayList arrayList = new ArrayList();
        try {
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (!new File(str).exists()) {
            ALog.w(TAG, String.format("路径【%s】下的Dex文件不存在", str));
            return arrayList;
        }
        DexFile dexFile = new DexFile(str);
        Enumeration<String> entries = dexFile.entries();
        while (entries.hasMoreElements()) {
            String nextElement = entries.nextElement();
            if (nextElement.contains(str2) && nextElement.contains(str2)) {
                arrayList.add(nextElement);
            }
        }
        dexFile.close();
        return arrayList;
    }

    public static String getWindowReplaceUrl(String str) {
        if (TextUtils.isEmpty(str)) {
            ALog.e(TAG, "拦截数据为null");
            return null;
        }
        Matcher matcher = Pattern.compile(Regular.REG_WINLOD_REPLACE).matcher(str);
        if (matcher.find()) {
            String group = matcher.group();
            return group.substring(9, group.length() - 2);
        }
        return null;
    }

    public static String getAppPath(Context context) {
        if ("mounted".equals(Environment.getExternalStorageState())) {
            File externalFilesDir = context.getExternalFilesDir(null);
            if (externalFilesDir != null) {
                return externalFilesDir.getPath() + "/";
            }
            return Environment.getExternalStorageDirectory().getPath() + "/Android/data/" + context.getPackageName() + "/files/";
        }
        return null;
    }

    public static Class[] getMapParamType(Field field) {
        if (!field.getType().isAssignableFrom(Map.class)) {
            ALog.d(TAG, "字段类型不是Map");
            return null;
        }
        Type genericType = field.getGenericType();
        if (genericType == null) {
            ALog.d(TAG, "该字段没有泛型参数");
            return null;
        } else if (genericType instanceof ParameterizedType) {
            Type[] actualTypeArguments = ((ParameterizedType) genericType).getActualTypeArguments();
            return new Class[]{(Class) actualTypeArguments[0], (Class) actualTypeArguments[1]};
        } else {
            return null;
        }
    }

    public static Class getListParamType(Field field) {
        if (!field.getType().isAssignableFrom(List.class)) {
            ALog.d(TAG, "字段类型不是List");
            return null;
        }
        Type genericType = field.getGenericType();
        if (genericType == null) {
            ALog.d(TAG, "该字段没有泛型参数");
            return null;
        } else if (genericType instanceof ParameterizedType) {
            return (Class) ((ParameterizedType) genericType).getActualTypeArguments()[0];
        } else {
            return null;
        }
    }

    public static FtpUrlEntity getFtpUrlInfo(String str) {
        Uri parse = Uri.parse(str);
        String userInfo = parse.getUserInfo();
        String path = parse.getPath();
        ALog.d(TAG, String.format("scheme = %s, user = %s, host = %s, port = %s, path = %s", parse.getScheme(), userInfo, parse.getHost(), Integer.valueOf(parse.getPort()), path));
        FtpUrlEntity ftpUrlEntity = new FtpUrlEntity();
        ftpUrlEntity.url = str;
        ftpUrlEntity.hostName = parse.getHost();
        ftpUrlEntity.port = parse.getPort() == -1 ? "21" : String.valueOf(parse.getPort());
        if (!TextUtils.isEmpty(userInfo)) {
            String[] split = userInfo.split(":");
            if (split.length == 2) {
                ftpUrlEntity.user = split[0];
                ftpUrlEntity.password = split[1];
            } else {
                ftpUrlEntity.user = userInfo;
            }
        }
        ftpUrlEntity.scheme = parse.getScheme();
        if (TextUtils.isEmpty(path)) {
            path = "/";
        }
        ftpUrlEntity.remotePath = path;
        return ftpUrlEntity;
    }

    public static String convertUrl(String str) {
        String uri = Uri.parse(str).toString();
        if (hasDoubleCharacter(uri)) {
            uri = uri.replaceAll(" ", "%20");
            Matcher matcher = Pattern.compile(Regular.REG_DOUBLE_CHAR_AND_SPACE).matcher(uri);
            HashSet<String> hashSet = new HashSet();
            while (matcher.find()) {
                hashSet.add(matcher.group());
            }
            try {
                for (String str2 : hashSet) {
                    uri = uri.replaceAll(str2, URLEncoder.encode(str2, "UTF-8"));
                }
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
        }
        return uri;
    }

    public static boolean hasDoubleCharacter(String str) {
        char[] charArray;
        for (char c : str.toCharArray()) {
            if ((c >= 913 && c <= 65509) || c == '\r' || c == '\n' || c == ' ') {
                return true;
            }
        }
        return false;
    }

    public static String decryptBASE64(String str) {
        return new String(Base64.decode(str.getBytes(), 0));
    }

    public static String encryptBASE64(String str) {
        return Base64.encodeToString(str.getBytes(), 0);
    }

    public static String strCharSetConvert(String str, String str2) {
        try {
            return new String(str.getBytes(), str2);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String getMd5Code(List<String> list) {
        if (list == null || list.size() < 1) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (String str : list) {
            sb.append(str);
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(MessageDigestAlgorithms.MD5);
            messageDigest.update(sb.toString().getBytes());
            return new BigInteger(1, messageDigest.digest()).toString(16);
        } catch (NoSuchAlgorithmException e) {
            ALog.e(TAG, e.getMessage());
            return "";
        }
    }

    public static String getStrMd5(String str) {
        if (TextUtils.isEmpty(str)) {
            return "";
        }
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(MessageDigestAlgorithms.MD5);
            messageDigest.update(str.getBytes());
            return new BigInteger(1, messageDigest.digest()).toString(16);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return "";
        }
    }

    public static int getCoresNum() {
        try {
            File[] listFiles = new File("/sys/devices/system/cpu/").listFiles(new FileFilter() { // from class: com.arialyy.aria.util.CommonUtil.1CpuFilter
                @Override // java.io.FileFilter
                public boolean accept(File file) {
                    return Pattern.matches("cpu[0-9]", file.getName());
                }
            });
            ALog.d(TAG, "CPU Count: " + listFiles.length);
            return listFiles.length;
        } catch (Exception e) {
            ALog.d(TAG, "CPU Count: Failed.");
            e.printStackTrace();
            return 1;
        }
    }

    public static boolean checkMD5(String str, File file) {
        if (TextUtils.isEmpty(str) || file == null) {
            ALog.e(TAG, "MD5 string empty or updateFile null");
            return false;
        }
        String fileMD5 = getFileMD5(file);
        if (fileMD5 == null) {
            ALog.e(TAG, "calculatedDigest null");
            return false;
        }
        return fileMD5.equalsIgnoreCase(str);
    }

    public static boolean checkMD5(String str, InputStream inputStream) {
        if (TextUtils.isEmpty(str) || inputStream == null) {
            ALog.e(TAG, "MD5 string empty or updateFile null");
            return false;
        }
        String fileMD5 = getFileMD5(inputStream);
        if (fileMD5 == null) {
            ALog.e(TAG, "calculatedDigest null");
            return false;
        }
        return fileMD5.equalsIgnoreCase(str);
    }

    public static String getFileMD5(File file) {
        try {
            return getFileMD5(new FileInputStream(file));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static String getFileMD5(InputStream inputStream) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(MessageDigestAlgorithms.MD5);
            byte[] bArr = new byte[8192];
            while (true) {
                try {
                    try {
                        int read = inputStream.read(bArr);
                        if (read <= 0) {
                            break;
                        }
                        messageDigest.update(bArr, 0, read);
                    } catch (Throwable th) {
                        try {
                            inputStream.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        throw th;
                    }
                } catch (IOException e2) {
                    throw new RuntimeException("Unable to process file for MD5", e2);
                }
            }
            String replace = String.format("%32s", new BigInteger(1, messageDigest.digest()).toString(16)).replace(TokenParser.SP, '0');
            try {
                inputStream.close();
            } catch (IOException e3) {
                e3.printStackTrace();
            }
            return replace;
        } catch (NoSuchAlgorithmException e4) {
            e4.printStackTrace();
            return null;
        }
    }

    public static Intent createIntent(String str, String str2) {
        Uri.Builder builder = new Uri.Builder();
        builder.scheme(str);
        Uri build = builder.build();
        Intent intent = new Intent(str2);
        intent.setData(build);
        return intent;
    }

    public static Boolean putString(String str, Context context, String str2, String str3) {
        SharedPreferences.Editor edit = context.getSharedPreferences(str, 0).edit();
        edit.putString(str2, str3);
        return Boolean.valueOf(edit.commit());
    }

    public static String getString(String str, Context context, String str2) {
        return context.getSharedPreferences(str, 0).getString(str2, "");
    }

    public static List<Field> getAllFields(Class cls) {
        ArrayList<Field> arrayList = new ArrayList();
        Class superclass = cls.getSuperclass();
        if (superclass != null) {
            Class superclass2 = superclass.getSuperclass();
            if (superclass2 != null) {
                Collections.addAll(arrayList, superclass2.getDeclaredFields());
            }
            Collections.addAll(arrayList, superclass.getDeclaredFields());
        }
        Collections.addAll(arrayList, cls.getDeclaredFields());
        ArrayList arrayList2 = new ArrayList();
        for (Field field : arrayList) {
            if (field.getName().equals(AriaConfig.IGNORE_CLASS_KLASS) || field.getName().equals(AriaConfig.IGNORE_CLASS_MONITOR)) {
                arrayList2.add(field);
            }
        }
        if (!arrayList2.isEmpty()) {
            arrayList.removeAll(arrayList2);
        }
        return arrayList;
    }

    public static Field[] getFields(Class cls) {
        Class superclass;
        Field[] declaredFields = cls.getDeclaredFields();
        return (declaredFields.length != 0 || (superclass = cls.getSuperclass()) == null) ? declaredFields : getFields(superclass);
    }

    public static Field getField(Class cls, String str) {
        Field field;
        try {
            try {
                field = cls.getDeclaredField(str);
            } catch (NoSuchFieldException unused) {
                if (cls.getSuperclass() == null) {
                    return null;
                }
                field = getField(cls.getSuperclass(), str);
            }
        } catch (NoSuchFieldException unused2) {
            field = cls.getField(str);
        }
        if (field != null) {
            field.setAccessible(true);
        }
        return field;
    }

    public static Method getMethod(Class cls, String str, Class<?>... clsArr) {
        Method method;
        try {
            try {
                method = cls.getDeclaredMethod(str, clsArr);
            } catch (NoSuchMethodException unused) {
                if (cls.getSuperclass() == null) {
                    return null;
                }
                method = getMethod(cls.getSuperclass(), str, clsArr);
            }
        } catch (NoSuchMethodException unused2) {
            method = cls.getMethod(str, clsArr);
        }
        if (method != null) {
            method.setAccessible(true);
        }
        return method;
    }

    public static int keyToHashCode(String str) {
        int i = 0;
        for (int i2 = 0; i2 < str.length(); i2++) {
            char charAt = str.charAt(i2);
            if (charAt == '-') {
                charAt = 28;
            }
            if (charAt == '\'') {
                charAt = 29;
            }
            i = (i * 33) + (charAt & 31);
        }
        return i;
    }

    public static String keyToHashKey(String str) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance(MessageDigestAlgorithms.MD5);
            messageDigest.update(str.getBytes());
            return bytesToHexString(messageDigest.digest());
        } catch (NoSuchAlgorithmException unused) {
            return String.valueOf(str.hashCode());
        }
    }

    public static String bytesToHexString(byte[] bArr) {
        StringBuilder sb = new StringBuilder("0x");
        if (bArr == null || bArr.length <= 0) {
            return null;
        }
        char[] cArr = new char[2];
        for (byte b : bArr) {
            cArr[0] = Character.forDigit((b >>> 4) & 15, 16);
            cArr[1] = Character.forDigit(b & 15, 16);
            sb.append(cArr);
        }
        return sb.toString();
    }

    public static String getClassName(Object obj) {
        String[] split = obj.getClass().getName().split("\\.");
        return split[split.length - 1];
    }

    public static String getClassName(Class cls) {
        String[] split = cls.getName().split("\\.");
        return split[split.length - 1];
    }

    public static String formatFileSize(double d) {
        if (d < 0.0d) {
            return "0kb";
        }
        double d2 = d / 1024.0d;
        if (d2 < 1.0d) {
            return d + "b";
        }
        double d3 = d2 / 1024.0d;
        if (d3 < 1.0d) {
            BigDecimal bigDecimal = new BigDecimal(Double.toString(d2));
            return bigDecimal.setScale(2, 4).toPlainString() + "kb";
        }
        double d4 = d3 / 1024.0d;
        if (d4 < 1.0d) {
            BigDecimal bigDecimal2 = new BigDecimal(Double.toString(d3));
            return bigDecimal2.setScale(2, 4).toPlainString() + "mb";
        }
        double d5 = d4 / 1024.0d;
        if (d5 < 1.0d) {
            BigDecimal bigDecimal3 = new BigDecimal(Double.toString(d4));
            return bigDecimal3.setScale(2, 4).toPlainString() + "gb";
        }
        BigDecimal bigDecimal4 = new BigDecimal(d5);
        return bigDecimal4.setScale(2, 4).toPlainString() + "tb";
    }

    public static String formatTime(int i) {
        if (i <= 0) {
            return "00:00";
        }
        if (i < 60) {
            return String.format(Locale.getDefault(), "00:%02d", Integer.valueOf(i % 60));
        }
        if (i < 3600) {
            return String.format(Locale.getDefault(), "%02d:%02d", Integer.valueOf(i / 60), Integer.valueOf(i % 60));
        }
        if (i < 86400) {
            return String.format(Locale.getDefault(), "%02d:%02d:%02d", Integer.valueOf(i / 3600), Integer.valueOf((i % 3600) / 60), Integer.valueOf(i % 60));
        }
        return i < 604800 ? String.format(Locale.getDefault(), "%dd %02d:%02d", Integer.valueOf(i / 86400), Integer.valueOf((i % 86400) / 3600), Integer.valueOf(i % 3600)) : "∞";
    }

    public static String getFileConfigPath(boolean z, String str) {
        StringBuilder sb = new StringBuilder();
        sb.append(AriaConfig.getInstance().getAPP().getFilesDir().getPath());
        sb.append(z ? AriaConfig.DOWNLOAD_TEMP_DIR : AriaConfig.UPLOAD_TEMP_DIR);
        sb.append(str);
        sb.append(".properties");
        return sb.toString();
    }
}
