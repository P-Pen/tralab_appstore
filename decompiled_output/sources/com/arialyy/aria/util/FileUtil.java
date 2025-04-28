package com.arialyy.aria.util;

import android.app.ActivityManager;
import android.content.Context;
import android.os.Build;
import android.os.Environment;
import android.os.StatFs;
import android.os.storage.StorageManager;
import android.os.storage.StorageVolume;
import android.text.TextUtils;
import com.arialyy.aria.core.AriaConfig;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.io.Serializable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Properties;
import java.util.Scanner;
import java.util.regex.Pattern;
/* loaded from: classes.dex */
public class FileUtil {
    private static final Pattern DIR_SEPORATOR = Pattern.compile("/");
    private static final String EXTERNAL_STORAGE_PATH = Environment.getExternalStorageDirectory().getPath();
    private static final String TAG = "FileUtil";

    public static String getFileExtensionName(String str) {
        int lastIndexOf;
        if (!TextUtils.isEmpty(str) && (lastIndexOf = str.lastIndexOf(".")) > -1) {
            return str.substring(lastIndexOf + 1);
        }
        return null;
    }

    public static void createFileFormInputStream(InputStream inputStream, String str) {
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(str);
            byte[] bArr = new byte[1024];
            while (true) {
                int read = inputStream.read(bArr);
                if (read > 0) {
                    fileOutputStream.write(bArr, 0, read);
                } else {
                    inputStream.close();
                    fileOutputStream.flush();
                    fileOutputStream.close();
                    return;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String getTsCacheDir(String str, int i) {
        if (TextUtils.isEmpty(str)) {
            throw new NullPointerException("m3u8文保存路径为空");
        }
        File file = new File(str);
        return String.format("%s/.%s_%s", file.getParent(), file.getName(), Integer.valueOf(i));
    }

    public static boolean createDir(String str) {
        File file = new File(str);
        if (file.exists()) {
            return false;
        }
        if (file.mkdirs()) {
            return true;
        }
        ALog.d(TAG, "创建失败，请检查路径和是否配置文件权限！");
        return false;
    }

    public static boolean createFile(String str) {
        if (TextUtils.isEmpty(str)) {
            ALog.e(TAG, "文件路径不能为null");
            return false;
        }
        return createFile(new File(str));
    }

    public static boolean createFile(File file) {
        if (file.getParentFile() == null || !file.getParentFile().exists()) {
            ALog.d(TAG, "目标文件所在路径不存在，准备创建……");
            if (!createDir(file.getParent())) {
                ALog.d(TAG, "创建目录文件所在的目录失败！文件路径【" + file.getPath() + "】");
            }
        }
        deleteFile(file);
        try {
            return file.createNewFile();
        } catch (IOException e) {
            e.printStackTrace();
            return false;
        }
    }

    public static String createFileName(String str) {
        int indexOf = str.indexOf("?");
        String str2 = "";
        if (indexOf > 0) {
            String substring = str.substring(0, indexOf);
            int lastIndexOf = substring.lastIndexOf("/");
            if (lastIndexOf > 0) {
                str2 = substring.substring(lastIndexOf + 1);
            }
        } else {
            int lastIndexOf2 = str.lastIndexOf("/");
            if (lastIndexOf2 > 0) {
                str2 = str.substring(lastIndexOf2 + 1);
            }
        }
        return TextUtils.isEmpty(str2) ? CommonUtil.keyToHashKey(str) : str2;
    }

    public static boolean deleteFile(String str) {
        if (TextUtils.isEmpty(str)) {
            ALog.e(TAG, "删除文件失败，路径为空");
            return false;
        }
        return deleteFile(new File(str));
    }

    public static boolean deleteFile(File file) {
        if (file.exists()) {
            File file2 = new File(file.getAbsolutePath() + System.currentTimeMillis());
            if (file.renameTo(file2)) {
                return file2.delete();
            }
            return file.delete();
        }
        return false;
    }

    public static boolean deleteDir(File file) {
        if (file.exists()) {
            if (file.isFile()) {
                return file.delete();
            }
            for (File file2 : file.listFiles()) {
                deleteDir(file2);
            }
            return file.delete();
        }
        return false;
    }

    public static void writeObjToFile(String str, Object obj) {
        if (!(obj instanceof Serializable)) {
            ALog.e(TAG, "对象写入文件失败，data数据必须实现Serializable接口");
            return;
        }
        FileOutputStream fileOutputStream = null;
        try {
            try {
                try {
                } catch (IOException e) {
                    e.printStackTrace();
                    return;
                }
            } catch (FileNotFoundException e2) {
                e = e2;
            } catch (IOException e3) {
                e = e3;
            }
            if (createFile(str)) {
                FileOutputStream fileOutputStream2 = new FileOutputStream(str);
                try {
                    new ObjectOutputStream(fileOutputStream2).writeObject(obj);
                    fileOutputStream2.close();
                } catch (FileNotFoundException e4) {
                    e = e4;
                    fileOutputStream = fileOutputStream2;
                    e.printStackTrace();
                    if (fileOutputStream != null) {
                        fileOutputStream.close();
                    }
                } catch (IOException e5) {
                    e = e5;
                    fileOutputStream = fileOutputStream2;
                    e.printStackTrace();
                    if (fileOutputStream != null) {
                        fileOutputStream.close();
                    }
                } catch (Throwable th) {
                    th = th;
                    fileOutputStream = fileOutputStream2;
                    if (fileOutputStream != null) {
                        try {
                            fileOutputStream.close();
                        } catch (IOException e6) {
                            e6.printStackTrace();
                        }
                    }
                    throw th;
                }
            }
        } catch (Throwable th2) {
            th = th2;
        }
    }

    /* JADX WARN: Type inference failed for: r0v2, types: [boolean] */
    public static Object readObjFromFile(String str) {
        FileInputStream fileInputStream;
        FileInputStream fileInputStream2 = null;
        if (TextUtils.isEmpty(str)) {
            ALog.e(TAG, "文件路径为空");
            return null;
        }
        ?? exists = new File(str).exists();
        try {
            try {
                if (exists == 0) {
                    ALog.e(TAG, String.format("文件【%s】不存在", str));
                    return null;
                }
                try {
                    fileInputStream = new FileInputStream(str);
                    try {
                        Object readObject = new ObjectInputStream(fileInputStream).readObject();
                        try {
                            fileInputStream.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                        return readObject;
                    } catch (FileNotFoundException e2) {
                        e = e2;
                        e.printStackTrace();
                        if (fileInputStream != null) {
                            fileInputStream.close();
                        }
                        return null;
                    } catch (IOException e3) {
                        e = e3;
                        e.printStackTrace();
                        if (fileInputStream != null) {
                            fileInputStream.close();
                        }
                        return null;
                    } catch (ClassNotFoundException e4) {
                        e = e4;
                        e.printStackTrace();
                        if (fileInputStream != null) {
                            fileInputStream.close();
                        }
                        return null;
                    }
                } catch (FileNotFoundException e5) {
                    e = e5;
                    fileInputStream = null;
                } catch (IOException e6) {
                    e = e6;
                    fileInputStream = null;
                } catch (ClassNotFoundException e7) {
                    e = e7;
                    fileInputStream = null;
                } catch (Throwable th) {
                    th = th;
                    if (fileInputStream2 != null) {
                        try {
                            fileInputStream2.close();
                        } catch (IOException e8) {
                            e8.printStackTrace();
                        }
                    }
                    throw th;
                }
            } catch (IOException e9) {
                e9.printStackTrace();
            }
        } catch (Throwable th2) {
            th = th2;
            fileInputStream2 = exists;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:64:0x0105 A[Catch: IOException -> 0x0101, TRY_LEAVE, TryCatch #0 {IOException -> 0x0101, blocks: (B:60:0x00fd, B:64:0x0105), top: B:68:0x00fd }] */
    /* JADX WARN: Removed duplicated region for block: B:68:0x00fd A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r1v1 */
    /* JADX WARN: Type inference failed for: r1v3, types: [java.io.FileOutputStream] */
    /* JADX WARN: Type inference failed for: r1v6 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean mergeFile(java.lang.String r21, java.util.List<java.lang.String> r22) {
        /*
            Method dump skipped, instructions count: 269
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.arialyy.aria.util.FileUtil.mergeFile(java.lang.String, java.util.List):boolean");
    }

    /* JADX WARN: Removed duplicated region for block: B:68:0x011e A[Catch: IOException -> 0x011a, TRY_LEAVE, TryCatch #0 {IOException -> 0x011a, blocks: (B:64:0x0116, B:68:0x011e), top: B:72:0x0116 }] */
    /* JADX WARN: Removed duplicated region for block: B:72:0x0116 A[EXC_TOP_SPLITTER, SYNTHETIC] */
    /* JADX WARN: Type inference failed for: r4v0, types: [java.io.FileOutputStream, java.nio.channels.FileChannel] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public static boolean mergeSFtpFile(java.lang.String r23, java.util.List<java.lang.String> r24, long r25) {
        /*
            Method dump skipped, instructions count: 294
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: com.arialyy.aria.util.FileUtil.mergeSFtpFile(java.lang.String, java.util.List, long):boolean");
    }

    public static void splitFile(String str, int i) {
        File file;
        long j;
        int i2 = i;
        try {
            File file2 = new File(str);
            long length = file2.length();
            FileInputStream fileInputStream = new FileInputStream(file2);
            FileChannel channel = fileInputStream.getChannel();
            long j2 = 0;
            long j3 = length / i2;
            int i3 = 0;
            while (i3 < i2) {
                int i4 = i2 - 1;
                if (i3 == i4) {
                    j3 = length - (j3 * i4);
                }
                ALog.d(TAG, String.format("block = %s", Long.valueOf(j3)));
                File file3 = new File(file2.getPath() + "." + i3 + ".part");
                if (!file3.exists()) {
                    createFile(file3);
                }
                FileOutputStream fileOutputStream = new FileOutputStream(file3);
                FileChannel channel2 = fileOutputStream.getChannel();
                ByteBuffer allocate = ByteBuffer.allocate(8196);
                while (true) {
                    int read = channel.read(allocate);
                    file = file2;
                    if (read == -1) {
                        j = length;
                        break;
                    }
                    allocate.flip();
                    channel2.write(allocate);
                    allocate.compact();
                    j = length;
                    j2 += read;
                    if (j2 >= (i3 + 1) * j3) {
                        break;
                    }
                    file2 = file;
                    length = j;
                }
                ALog.d(TAG, String.format("len = %s", Long.valueOf(file3.length())));
                fileOutputStream.close();
                channel2.close();
                i3++;
                i2 = i;
                file2 = file;
                length = j;
            }
            fileInputStream.close();
            channel.close();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e2) {
            e2.printStackTrace();
        }
    }

    public static boolean checkMemorySpace(String str, long j) {
        File file = new File(str);
        if (!file.exists()) {
            if (!file.getParentFile().exists()) {
                createDir(file.getParentFile().getPath());
            }
            str = file.getParentFile().getPath();
        }
        StatFs statFs = new StatFs(str);
        return j <= ((long) statFs.getAvailableBlocks()) * ((long) statFs.getBlockSize());
    }

    public static Properties loadConfig(File file) {
        FileInputStream fileInputStream;
        Properties properties = new Properties();
        if (!file.exists()) {
            createFile(file.getPath());
        }
        FileInputStream fileInputStream2 = null;
        try {
            try {
                try {
                    fileInputStream = new FileInputStream(file);
                } catch (Throwable th) {
                    th = th;
                }
            } catch (Exception e) {
                e = e;
            }
        } catch (IOException e2) {
            e2.printStackTrace();
        }
        try {
            properties.load(fileInputStream);
            fileInputStream.close();
        } catch (Exception e3) {
            e = e3;
            fileInputStream2 = fileInputStream;
            e.printStackTrace();
            if (fileInputStream2 != null) {
                fileInputStream2.close();
            }
            return properties;
        } catch (Throwable th2) {
            th = th2;
            fileInputStream2 = fileInputStream;
            if (fileInputStream2 != null) {
                try {
                    fileInputStream2.close();
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
            }
            throw th;
        }
        return properties;
    }

    public static void saveConfig(File file, Properties properties) {
        FileOutputStream fileOutputStream;
        FileOutputStream fileOutputStream2 = null;
        try {
            try {
                try {
                    fileOutputStream = new FileOutputStream(file, false);
                } catch (IOException e) {
                    e.printStackTrace();
                    return;
                }
            } catch (Exception e2) {
                e = e2;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            properties.store(fileOutputStream, (String) null);
            fileOutputStream.flush();
            fileOutputStream.close();
        } catch (Exception e3) {
            e = e3;
            fileOutputStream2 = fileOutputStream;
            e.printStackTrace();
            if (fileOutputStream2 != null) {
                fileOutputStream2.flush();
                fileOutputStream2.close();
            }
        } catch (Throwable th2) {
            th = th2;
            fileOutputStream2 = fileOutputStream;
            if (fileOutputStream2 != null) {
                try {
                    fileOutputStream2.flush();
                    fileOutputStream2.close();
                } catch (IOException e4) {
                    e4.printStackTrace();
                }
            }
            throw th;
        }
    }

    @Deprecated
    private static boolean checkSDMemorySpace(String str, long j) {
        List<String> sDPathList = getSDPathList(AriaConfig.getInstance().getAPP());
        if (sDPathList != null && !sDPathList.isEmpty()) {
            for (String str2 : sDPathList) {
                if (str.contains(str2) && j > 0 && j > getAvailableExternalMemorySize(str2)) {
                    return false;
                }
            }
        }
        return true;
    }

    private static long getAvailableExternalMemorySize(String str) {
        StatFs statFs = new StatFs(str);
        return statFs.getAvailableBlocks() * statFs.getBlockSize();
    }

    private static long getTotalExternalMemorySize(String str) {
        StatFs statFs = new StatFs(str);
        return statFs.getBlockCount() * statFs.getBlockSize();
    }

    private static List<String> getSDPathList(Context context) {
        if (Build.VERSION.SDK_INT >= 17) {
            try {
                return getVolumeList(context);
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
        return compareMountsWithVold(readMountsFile(), readVoldFile());
    }

    private static List<String> getVolumeList(Context context) throws NoSuchMethodException, InvocationTargetException, IllegalAccessException {
        ArrayList<String> arrayList = new ArrayList();
        if (Build.VERSION.SDK_INT >= 24) {
            List<StorageVolume> storageVolumes = ((StorageManager) context.getSystemService("storage")).getStorageVolumes();
            Method declaredMethod = StorageVolume.class.getDeclaredMethod("getPath", new Class[0]);
            declaredMethod.setAccessible(true);
            for (StorageVolume storageVolume : storageVolumes) {
                if (storageVolume.getState().equals("mounted")) {
                    arrayList.add((String) declaredMethod.invoke(storageVolume, new Object[0]));
                }
            }
        } else {
            arrayList.addAll(getStorageDirectories());
        }
        if (arrayList.isEmpty()) {
            arrayList = new ArrayList();
            arrayList.add(EXTERNAL_STORAGE_PATH);
        }
        LinkedHashMap linkedHashMap = new LinkedHashMap();
        for (String str : arrayList) {
            File file = new File(str);
            if (file.exists() && file.isDirectory() && canWrite(str)) {
                int hashCode = (file.getTotalSpace() + "-" + file.getUsableSpace()).hashCode();
                String str2 = (String) linkedHashMap.get(Integer.valueOf(hashCode));
                if (TextUtils.isEmpty(str2) || str2.length() >= str.length()) {
                    linkedHashMap.put(Integer.valueOf(hashCode), str);
                }
            }
        }
        ArrayList arrayList2 = new ArrayList();
        for (Integer num : linkedHashMap.keySet()) {
            arrayList2.add(linkedHashMap.get(num));
        }
        return arrayList2;
    }

    public static boolean canWrite(String str) {
        File file;
        boolean z = true;
        if (new File(str).canWrite()) {
            return true;
        }
        File file2 = null;
        try {
            try {
                try {
                    file = new File(str, "tw.txt");
                } catch (Throwable th) {
                    th = th;
                }
            } catch (Exception e) {
                e = e;
            }
        } catch (Exception e2) {
            e2.printStackTrace();
        }
        try {
            if (file.exists()) {
                file.delete();
            }
            file.createNewFile();
            FileWriter fileWriter = new FileWriter(file);
            fileWriter.write(1);
            fileWriter.close();
            if (file.exists()) {
                file.delete();
            }
        } catch (Exception e3) {
            e = e3;
            file2 = file;
            e.printStackTrace();
            z = false;
            if (file2 != null) {
                if (file2.exists()) {
                    file2.delete();
                }
            }
            return z;
        } catch (Throwable th2) {
            th = th2;
            file2 = file;
            if (file2 != null) {
                try {
                    if (file2.exists()) {
                        file2.delete();
                    }
                } catch (Exception e4) {
                    e4.printStackTrace();
                }
            }
            throw th;
        }
        return z;
    }

    private static List<String> getStorageDirectories() {
        ArrayList arrayList = new ArrayList();
        String str = System.getenv("EXTERNAL_STORAGE");
        String str2 = System.getenv("SECONDARY_STORAGE");
        String str3 = System.getenv("EMULATED_STORAGE_TARGET");
        if (TextUtils.isEmpty(str3)) {
            if (TextUtils.isEmpty(str)) {
                arrayList.add("/storage/sdcard0");
            } else {
                arrayList.add(str);
            }
        } else {
            String[] split = DIR_SEPORATOR.split(Environment.getExternalStorageDirectory().getAbsolutePath());
            String str4 = split[split.length - 1];
            boolean z = false;
            if (!TextUtils.isEmpty(str4) && TextUtils.isDigitsOnly(str4)) {
                z = true;
            }
            if (!z) {
                str4 = "";
            }
            if (TextUtils.isEmpty(str4)) {
                arrayList.add(str);
            } else {
                arrayList.add(str3 + File.separator + str4);
            }
        }
        if (!TextUtils.isEmpty(str2)) {
            Collections.addAll(arrayList, str2.split(File.pathSeparator));
        }
        for (int size = arrayList.size() - 1; size >= 0; size--) {
            String str5 = (String) arrayList.get(size);
            File file = new File(str5);
            if (!file.exists() || !file.isDirectory() || !canWrite(str5)) {
                arrayList.remove(size);
            }
        }
        return arrayList;
    }

    private static List<String> readMountsFile() {
        ArrayList arrayList = new ArrayList();
        arrayList.add(EXTERNAL_STORAGE_PATH);
        try {
            Scanner scanner = new Scanner(new File("/proc/mounts"));
            while (scanner.hasNext()) {
                String nextLine = scanner.nextLine();
                if (nextLine.startsWith("/dev/block/vold/") || nextLine.startsWith("/dev/block//vold/")) {
                    String str = nextLine.split(" ")[1];
                    if (!str.equals(EXTERNAL_STORAGE_PATH)) {
                        arrayList.add(str);
                    }
                }
            }
            scanner.close();
        } catch (Exception unused) {
        }
        return arrayList;
    }

    private static List<String> readVoldFile() {
        Scanner scanner;
        ArrayList arrayList = null;
        try {
            try {
                scanner = new Scanner(new File("/system/etc/vold.fstab"));
            } catch (Exception unused) {
                return arrayList;
            }
        } catch (FileNotFoundException unused2) {
            scanner = new Scanner(new File("/system/etc/vold.conf"));
        }
        ArrayList arrayList2 = new ArrayList();
        try {
            arrayList2.add(EXTERNAL_STORAGE_PATH);
            while (scanner.hasNext()) {
                String nextLine = scanner.nextLine();
                if (!TextUtils.isEmpty(nextLine)) {
                    String trim = nextLine.trim();
                    if (trim.startsWith("dev_mount")) {
                        String[] split = trim.split(" ");
                        if (split.length >= 3) {
                            String str = split[2];
                            if (str.contains(":")) {
                                str = str.substring(0, str.indexOf(":"));
                            }
                            if (!str.equals(EXTERNAL_STORAGE_PATH)) {
                                arrayList2.add(str);
                            }
                        }
                    } else if (trim.startsWith("mount_point")) {
                        String trim2 = trim.replaceAll("mount_point", "").trim();
                        if (!trim2.equals(EXTERNAL_STORAGE_PATH)) {
                            arrayList2.add(trim2);
                        }
                    }
                }
            }
            return arrayList2;
        } catch (Exception unused3) {
            arrayList = arrayList2;
            return arrayList;
        }
    }

    private static List<String> compareMountsWithVold(List<String> list, List<String> list2) {
        for (int size = list.size() - 1; size >= 0; size--) {
            String str = list.get(size);
            File file = new File(str);
            if (!file.exists() || !file.isDirectory() || !file.canWrite()) {
                list.remove(size);
            } else if (list2 != null && !list2.contains(str)) {
                list.remove(size);
            }
        }
        if (list2 != null) {
            list2.clear();
        }
        return list;
    }

    public static long getTotalMemory() {
        long j = 0;
        try {
            BufferedReader bufferedReader = new BufferedReader(new FileReader("/proc/meminfo"), 8192);
            j = Integer.valueOf(bufferedReader.readLine().split("\\s+")[1]).intValue() * 1024;
            bufferedReader.close();
            return j;
        } catch (IOException e) {
            e.printStackTrace();
            return j;
        }
    }

    public static long getAvailMemory(Context context) {
        ActivityManager.MemoryInfo memoryInfo = new ActivityManager.MemoryInfo();
        ((ActivityManager) context.getSystemService("activity")).getMemoryInfo(memoryInfo);
        return memoryInfo.availMem;
    }
}
