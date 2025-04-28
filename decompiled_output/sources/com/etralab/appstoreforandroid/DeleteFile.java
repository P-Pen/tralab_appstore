package com.etralab.appstoreforandroid;

import java.io.File;
/* loaded from: classes.dex */
public class DeleteFile {
    public static void DeleteDir(String str) {
        DeleteDirWithFile(new File(str));
    }

    public static void DeleteDirWithFile(File file) {
        File[] listFiles;
        if (file != null && file.exists() && file.isDirectory()) {
            for (File file2 : file.listFiles()) {
                if (file2.isFile()) {
                    file2.delete();
                } else if (file2.isDirectory()) {
                    DeleteDirWithFile(file2);
                }
            }
            file.delete();
        }
    }
}
