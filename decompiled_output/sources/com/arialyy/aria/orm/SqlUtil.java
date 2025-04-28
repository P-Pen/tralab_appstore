package com.arialyy.aria.orm;

import android.database.Cursor;
import android.database.SQLException;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import com.arialyy.aria.core.AriaConfig;
import com.arialyy.aria.orm.annotation.Default;
import com.arialyy.aria.orm.annotation.Foreign;
import com.arialyy.aria.orm.annotation.Ignore;
import com.arialyy.aria.orm.annotation.Many;
import com.arialyy.aria.orm.annotation.NoNull;
import com.arialyy.aria.orm.annotation.One;
import com.arialyy.aria.orm.annotation.Primary;
import com.arialyy.aria.orm.annotation.Unique;
import com.arialyy.aria.orm.annotation.Wrapper;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final class SqlUtil {
    private static final String TAG = CommonUtil.getClassName("SqlUtil");

    SqlUtil() {
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void checkOrCreateTable(SQLiteDatabase sQLiteDatabase, Class<? extends DbEntity> cls) {
        if (tableExists(sQLiteDatabase, cls)) {
            return;
        }
        createTable(sQLiteDatabase, cls);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void closeCursor(Cursor cursor) {
        synchronized (AbsDelegate.class) {
            if (cursor != null) {
                if (!cursor.isClosed()) {
                    try {
                        cursor.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean tableExists(SQLiteDatabase sQLiteDatabase, Class<? extends DbEntity> cls) {
        return tableExists(sQLiteDatabase, CommonUtil.getClassName((Class) cls));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean tableExists(SQLiteDatabase sQLiteDatabase, String str) {
        Cursor cursor = null;
        try {
            try {
                cursor = checkDb(sQLiteDatabase).rawQuery(String.format("SELECT COUNT(*) FROM sqlite_master WHERE type='table' AND name='%s'", str), null);
                if (cursor != null && cursor.moveToNext()) {
                    if (cursor.getInt(0) > 0) {
                        return true;
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return false;
        } finally {
            closeCursor(cursor);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean checkList(Field field) {
        if (CommonUtil.getListParamType(field) == String.class) {
            return true;
        }
        ALog.d(TAG, "map参数错误，支持List<String>的参数字段");
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean checkMap(Field field) {
        Class[] mapParamType = CommonUtil.getMapParamType(field);
        if (mapParamType == null || mapParamType[0] == null || mapParamType[1] == null || mapParamType[0] != String.class || mapParamType[1] != String.class) {
            ALog.d(TAG, "map参数错误，支持Map<String,String>的参数字段");
            return false;
        }
        return true;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void dropTable(SQLiteDatabase sQLiteDatabase, String str) {
        checkDb(sQLiteDatabase).execSQL(String.format("DROP TABLE IF EXISTS %s", str));
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void clean(SQLiteDatabase sQLiteDatabase, Class<? extends DbEntity> cls) {
        SQLiteDatabase checkDb = checkDb(sQLiteDatabase);
        String className = CommonUtil.getClassName((Class) cls);
        if (tableExists(checkDb, cls)) {
            checkDb.execSQL("DELETE FROM " + className);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean checkDataExist(SQLiteDatabase sQLiteDatabase, Class<? extends DbEntity> cls, String... strArr) {
        SQLiteDatabase checkDb = checkDb(sQLiteDatabase);
        if (CommonUtil.checkSqlExpression(strArr)) {
            String replace = String.format("SELECT rowid, * FROM %s WHERE %s ", CommonUtil.getClassName((Class) cls), strArr[0]).replace("?", "%s");
            int length = strArr.length - 1;
            String[] strArr2 = new String[length];
            int i = 0;
            while (i < length) {
                int i2 = i + 1;
                strArr2[i] = String.format("'%s'", encodeStr(strArr[i2]));
                i = i2;
            }
            Cursor rawQuery = checkDb.rawQuery(String.format(replace, strArr2), null);
            boolean z = rawQuery.getCount() > 0;
            closeCursor(rawQuery);
            return z;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static List<String> getColumns(Class<? extends DbEntity> cls) {
        ArrayList arrayList = new ArrayList();
        for (Field field : CommonUtil.getAllFields(cls)) {
            field.setAccessible(true);
            if (!isIgnore(field)) {
                arrayList.add(field.getName());
            }
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static SQLiteDatabase checkDb(SQLiteDatabase sQLiteDatabase) {
        return (sQLiteDatabase == null || !sQLiteDatabase.isOpen()) ? SqlHelper.getInstance().getDb() : sQLiteDatabase;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static void createTable(SQLiteDatabase sQLiteDatabase, Class<? extends DbEntity> cls) {
        Class<?> type;
        String columnType;
        SQLiteDatabase checkDb = checkDb(sQLiteDatabase);
        List<Field> allFields = CommonUtil.getAllFields(cls);
        if (allFields == null || allFields.size() <= 0) {
            return;
        }
        ArrayList<Field> arrayList = new ArrayList();
        StringBuilder sb = new StringBuilder();
        sb.append("CREATE TABLE IF NOT EXISTS ");
        sb.append(CommonUtil.getClassName((Class) cls));
        sb.append(" (");
        for (Field field : allFields) {
            field.setAccessible(true);
            if (!isIgnore(field) && (columnType = getColumnType((type = field.getType()))) != null) {
                sb.append(field.getName());
                sb.append(" ");
                sb.append(columnType);
                if (isPrimary(field)) {
                    sb.append(" PRIMARY KEY");
                    if (((Primary) field.getAnnotation(Primary.class)).autoincrement() && (type == Integer.TYPE || type == Integer.class)) {
                        sb.append(" AUTOINCREMENT");
                    }
                }
                if (isForeign(field)) {
                    arrayList.add(field);
                }
                if (isNoNull(field)) {
                    sb.append(" NOT NULL");
                }
                if (isDefault(field)) {
                    Default r4 = (Default) field.getAnnotation(Default.class);
                    if (!TextUtils.isEmpty(r4.value())) {
                        sb.append(" ERROR ");
                        sb.append("'");
                        sb.append(r4.value());
                        sb.append("'");
                    }
                }
                if (isUnique(field)) {
                    sb.append(" UNIQUE");
                }
                sb.append(",");
            }
        }
        for (Field field2 : arrayList) {
            Foreign foreign = (Foreign) field2.getAnnotation(Foreign.class);
            sb.append("FOREIGN KEY (");
            sb.append(field2.getName());
            sb.append(") REFERENCES ");
            sb.append(CommonUtil.getClassName((Class) foreign.parent()));
            sb.append("(");
            sb.append(foreign.column());
            sb.append(")");
            ActionPolicy onUpdate = foreign.onUpdate();
            ActionPolicy onDelete = foreign.onDelete();
            if (onUpdate != ActionPolicy.NO_ACTION) {
                sb.append(" ON UPDATE ");
                sb.append(onUpdate.function);
            }
            if (onDelete != ActionPolicy.NO_ACTION) {
                sb.append(" ON DELETE ");
                sb.append(onUpdate.function);
            }
            sb.append(",");
        }
        String sb2 = sb.toString();
        String str = sb2.substring(0, sb2.length() - 1) + ");";
        ALog.d(TAG, "创建表的sql：" + str);
        checkDb.execSQL(str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String getColumnTypeByFieldName(Class cls, String str) {
        for (Field field : CommonUtil.getAllFields(cls)) {
            if (field.getName().equals(str)) {
                return getColumnType(field.getType());
            }
        }
        return null;
    }

    static String getColumnType(Class cls) {
        if (cls == String.class || cls.isEnum()) {
            return "VARCHAR";
        }
        if (cls == Integer.TYPE || cls == Integer.class) {
            return "INTEGER";
        }
        if (cls == Float.TYPE || cls == Float.class) {
            return "FLOAT";
        }
        if (cls == Double.TYPE || cls == Double.class) {
            return "DOUBLE";
        }
        if (cls == Long.TYPE || cls == Long.class) {
            return "BIGINT";
        }
        if (cls == Boolean.TYPE || cls == Boolean.class) {
            return "BOOLEAN";
        }
        if (cls == Date.class || cls == java.sql.Date.class) {
            return "DATA";
        }
        if (cls == Byte.TYPE || cls == Byte.class) {
            return "BLOB";
        }
        if (cls == Map.class || cls == List.class) {
            return "TEXT";
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String encodeStr(String str) {
        return URLEncoder.encode(str.replaceAll("\\+", "%2B"));
    }

    static String getPrimaryName(Class<? extends DbEntity> cls) {
        List<Field> allFields = CommonUtil.getAllFields(cls);
        if (allFields == null || allFields.isEmpty()) {
            return null;
        }
        for (Field field : allFields) {
            field.setAccessible(true);
            if (isPrimary(field)) {
                return field.getName();
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static List<Field> getAllNotIgnoreField(Class cls) {
        List<Field> allFields = CommonUtil.getAllFields(cls);
        ArrayList arrayList = new ArrayList();
        if (allFields == null || allFields.size() <= 0) {
            return null;
        }
        for (Field field : allFields) {
            field.setAccessible(true);
            if (!isIgnore(field)) {
                arrayList.add(field);
            }
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String list2Str(DbEntity dbEntity, Field field) throws IllegalAccessException {
        List<Object> list = (List) field.get(dbEntity);
        if (list == null || list.isEmpty()) {
            return "";
        }
        StringBuilder sb = new StringBuilder();
        for (Object obj : list) {
            sb.append(obj);
            sb.append("$$");
        }
        return sb.toString();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static List str2List(String str, Field field) {
        if (TextUtils.isEmpty(str)) {
            return null;
        }
        String[] split = str.split("\\$\\$");
        ArrayList arrayList = new ArrayList();
        Class listParamType = CommonUtil.getListParamType(field);
        if (listParamType != null) {
            String name = listParamType.getName();
            for (String str2 : split) {
                arrayList.add(checkData(name, str2));
            }
        }
        return arrayList;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static Map<String, String> str2Map(String str) {
        boolean z;
        HashMap hashMap = new HashMap();
        if (TextUtils.isEmpty(str)) {
            return hashMap;
        }
        if (str.endsWith("_&_decode_&_")) {
            str = str.substring(0, str.length() - 12);
            z = true;
        } else {
            z = false;
        }
        for (String str2 : str.split(",")) {
            String[] split = str2.split("\\$");
            if (z) {
                hashMap.put(CommonUtil.decryptBASE64(split[0]), CommonUtil.decryptBASE64(split[1]));
            } else {
                hashMap.put(split[0], split[1]);
            }
        }
        return hashMap;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String map2Str(Map<String, String> map) {
        StringBuilder sb = new StringBuilder();
        for (String str : map.keySet()) {
            sb.append(CommonUtil.encryptBASE64(str));
            sb.append("$");
            sb.append(CommonUtil.encryptBASE64(map.get(str)));
            sb.append(",");
        }
        String sb2 = sb.toString();
        if (!TextUtils.isEmpty(sb2)) {
            sb2 = sb2.substring(0, sb2.length() - 1);
        }
        if (map.size() != 0) {
            return sb2 + "_&_decode_&_";
        }
        return sb2;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isIgnore(Field field) {
        Ignore ignore = (Ignore) field.getAnnotation(Ignore.class);
        int modifiers = field.getModifiers();
        String name = field.getName();
        return (ignore != null && ignore.value()) || name.equals("rowID") || name.equals(AriaConfig.IGNORE_CLASS_KLASS) || name.equals(AriaConfig.IGNORE_CLASS_MONITOR) || field.isSynthetic() || Modifier.isStatic(modifiers) || Modifier.isFinal(modifiers);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isWrapper(Class<? extends AbsDbWrapper> cls) {
        return ((Wrapper) cls.getAnnotation(Wrapper.class)) != null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isMany(Field field) {
        return ((Many) field.getAnnotation(Many.class)) != null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isOne(Field field) {
        return ((One) field.getAnnotation(One.class)) != null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean isPrimary(Field field) {
        return ((Primary) field.getAnnotation(Primary.class)) != null;
    }

    static boolean isForeign(Field field) {
        return ((Foreign) field.getAnnotation(Foreign.class)) != null;
    }

    static boolean isNoNull(Field field) {
        return ((NoNull) field.getAnnotation(NoNull.class)) != null;
    }

    static boolean isDefault(Field field) {
        return ((Default) field.getAnnotation(Default.class)) != null;
    }

    static boolean isUnique(Field field) {
        return ((Unique) field.getAnnotation(Unique.class)) != null;
    }

    private static Object checkData(String str, String str2) {
        if (str.equalsIgnoreCase("java.lang.String")) {
            return str2;
        }
        if (str.equalsIgnoreCase("int") || str.equals("java.lang.Integer")) {
            return Integer.valueOf(Integer.parseInt(str2));
        }
        if (str.equalsIgnoreCase("double") || str.equals("java.lang.Double")) {
            return Double.valueOf(Double.parseDouble(str2));
        }
        if (str.equalsIgnoreCase("float") || str.equals("java.lang.Float")) {
            return Float.valueOf(Float.parseFloat(str2));
        }
        return null;
    }
}
