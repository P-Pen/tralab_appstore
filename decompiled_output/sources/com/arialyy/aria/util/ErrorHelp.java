package com.arialyy.aria.util;

import com.arialyy.aria.core.AriaConfig;
import java.io.File;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
/* loaded from: classes.dex */
public class ErrorHelp {
    public static void saveError(String str, String str2) {
        writeLogToFile(String.format("\nmsg【%s】\nException：%s", str, str2));
    }

    private static String getLogPath() {
        String format = String.format("%slog/AriaCrash_%s.log", CommonUtil.getAppPath(AriaConfig.getInstance().getAPP()), getData("yyyy-MM-dd_HH_mm_ss"));
        FileUtil.createFile(format);
        return format;
    }

    private static int writeLogToFile(String str) {
        PrintWriter printWriter;
        StringBuffer stringBuffer = new StringBuffer();
        stringBuffer.append(getData("yyyy-MM-dd HH:mm:ss"));
        stringBuffer.append("    ");
        stringBuffer.append(str);
        stringBuffer.append("\n\n");
        PrintWriter printWriter2 = null;
        try {
            try {
                File file = new File(getLogPath());
                if (!file.exists()) {
                    FileUtil.createFile(file);
                }
                printWriter = new PrintWriter(new FileWriter(file.getPath(), true));
            } catch (Exception e) {
                e = e;
            }
        } catch (Throwable th) {
            th = th;
        }
        try {
            printWriter.append((CharSequence) stringBuffer);
            printWriter.flush();
            printWriter.close();
            return 0;
        } catch (Exception e2) {
            e = e2;
            printWriter2 = printWriter;
            e.printStackTrace();
            if (printWriter2 != null) {
                printWriter2.close();
                return 0;
            }
            return 0;
        } catch (Throwable th2) {
            th = th2;
            printWriter2 = printWriter;
            if (printWriter2 != null) {
                printWriter2.close();
            }
            throw th;
        }
    }

    private static String getData(String str) {
        return new SimpleDateFormat(str).format(new Date(System.currentTimeMillis()));
    }
}
