package com.arialyy.aria.orm;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.text.TextUtils;
import android.util.SparseArray;
import com.arialyy.aria.orm.annotation.Many;
import com.arialyy.aria.orm.annotation.One;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import java.lang.reflect.Field;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class DelegateFind extends AbsDelegate {
    private final String PARENT_COLUMN_ALIAS = "p";
    private final String CHILD_COLUMN_ALIAS = "c";

    private DelegateFind() {
    }

    private Field[] getOneAndManyField(Class cls) {
        Field[] declaredFields;
        Field[] fieldArr = new Field[2];
        boolean z = false;
        boolean z2 = false;
        Field field = null;
        Field field2 = null;
        for (Field field3 : cls.getDeclaredFields()) {
            if (SqlUtil.isOne(field3)) {
                if (z) {
                    ALog.w("AbsDelegate", "查询数据失败，实体中有多个@One 注解");
                    return null;
                }
                z = true;
                field = field3;
            }
            if (SqlUtil.isMany(field3)) {
                if (z2) {
                    ALog.w("AbsDelegate", "查询数据失败，实体中有多个@Many 注解");
                    return null;
                } else if (!field3.getType().isAssignableFrom(List.class)) {
                    ALog.w("AbsDelegate", "查询数据失败，@Many 注解的类型不是List");
                    return null;
                } else {
                    z2 = true;
                    field2 = field3;
                }
            }
        }
        if (field == null || field2 == null) {
            ALog.w("AbsDelegate", "查询数据失败，实体中没有@One或@Many注解");
            return null;
        } else if (field2.getType() != List.class) {
            ALog.w("AbsDelegate", "查询数据失败，@Many注解的字段必须是List");
            return null;
        } else {
            fieldArr[0] = field;
            fieldArr[1] = field2;
            return fieldArr;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends AbsDbWrapper> List<T> findRelationData(SQLiteDatabase sQLiteDatabase, Class<T> cls, String... strArr) {
        return exeRelationSql(sQLiteDatabase, cls, 1, Integer.MAX_VALUE, strArr);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends AbsDbWrapper> List<T> findRelationData(SQLiteDatabase sQLiteDatabase, Class<T> cls, int i, int i2, String... strArr) {
        if (i < 1 || i2 < 1) {
            ALog.w("AbsDelegate", "page，num 小于1");
            return null;
        }
        return exeRelationSql(sQLiteDatabase, cls, i, i2, strArr);
    }

    private <T extends AbsDbWrapper> List<T> exeRelationSql(SQLiteDatabase sQLiteDatabase, Class<T> cls, int i, int i2, String... strArr) {
        String sb;
        boolean z;
        String str = "p";
        SQLiteDatabase checkDb = checkDb(sQLiteDatabase);
        if (SqlUtil.isWrapper(cls)) {
            Field[] oneAndManyField = getOneAndManyField(cls);
            if (oneAndManyField == null) {
                return null;
            }
            StringBuilder sb2 = new StringBuilder();
            Field field = oneAndManyField[0];
            Field field2 = oneAndManyField[1];
            try {
                Many many = (Many) field2.getAnnotation(Many.class);
                Class<?> cls2 = Class.forName(field.getType().getName());
                Class<?> cls3 = Class.forName(CommonUtil.getListParamType(field2).getName());
                SqlUtil.checkOrCreateTable(checkDb, cls2);
                SqlUtil.checkOrCreateTable(checkDb, cls3);
                String simpleName = cls2.getSimpleName();
                String simpleName2 = cls3.getSimpleName();
                List<Field> allNotIgnoreField = SqlUtil.getAllNotIgnoreField(cls2);
                List<Field> allNotIgnoreField2 = SqlUtil.getAllNotIgnoreField(cls3);
                StringBuilder sb3 = new StringBuilder();
                StringBuilder sb4 = new StringBuilder();
                if (allNotIgnoreField != null) {
                    try {
                        sb3.append(simpleName.concat(".rowid AS ").concat("p").concat("rowid,"));
                        Iterator<Field> it = allNotIgnoreField.iterator();
                        while (it.hasNext()) {
                            Field next = it.next();
                            Iterator<Field> it2 = it;
                            String concat = str.concat(next.getName());
                            sb3.append(simpleName.concat(".").concat(next.getName()));
                            sb3.append(" AS ");
                            sb3.append(concat);
                            sb3.append(",");
                            it = it2;
                            str = str;
                        }
                    } catch (ClassNotFoundException e) {
                        e = e;
                        e.printStackTrace();
                        return null;
                    }
                }
                if (allNotIgnoreField2 != null) {
                    sb3.append(simpleName2.concat(".rowid AS ").concat("c").concat("rowid,"));
                    for (Field field3 : allNotIgnoreField2) {
                        String concat2 = "c".concat(field3.getName());
                        sb4.append(simpleName2.concat(".").concat(field3.getName()));
                        sb4.append(" AS ");
                        sb4.append(concat2);
                        sb4.append(",");
                    }
                }
                String sb5 = sb3.toString();
                String sb6 = sb4.toString();
                if (!TextUtils.isEmpty(sb5)) {
                    sb5 = sb5.substring(0, sb5.length() - 1);
                }
                if (!TextUtils.isEmpty(sb6)) {
                    sb6 = sb6.substring(0, sb6.length() - 1);
                }
                sb2.append("SELECT ");
                if (!TextUtils.isEmpty(sb5)) {
                    sb2.append(sb5);
                    sb2.append(",");
                }
                if (!TextUtils.isEmpty(sb6)) {
                    sb2.append(sb6);
                }
                if (TextUtils.isEmpty(sb5) && TextUtils.isEmpty(sb6)) {
                    sb2.append(" * ");
                }
                sb2.append(" FROM ");
                sb2.append(simpleName);
                sb2.append(" INNER JOIN ");
                sb2.append(simpleName2);
                sb2.append(" ON ");
                sb2.append(simpleName.concat(".").concat(many.parentColumn()));
                sb2.append(" = ");
                sb2.append(simpleName2.concat(".").concat(many.entityColumn()));
                if (strArr != null && strArr.length > 0) {
                    if (!CommonUtil.checkSqlExpression(strArr)) {
                        return null;
                    }
                    sb2.append(" WHERE ");
                    sb2.append(strArr[0]);
                    sb2.append(" ");
                    String replace = sb2.toString().replace("?", "%s");
                    int i3 = 1;
                    int length = strArr.length - 1;
                    String[] strArr2 = new String[length];
                    int i4 = 0;
                    while (i4 < length) {
                        Object[] objArr = new Object[i3];
                        int i5 = i4 + 1;
                        objArr[0] = SqlUtil.encodeStr(strArr[i5]);
                        strArr2[i4] = String.format("'%s'", objArr);
                        i4 = i5;
                        i3 = 1;
                    }
                    sb = String.format(replace, strArr2);
                } else {
                    sb = sb2.toString();
                }
                if (i == -1 || i2 == -1) {
                    z = false;
                } else {
                    sb = sb.concat(String.format(" Group by %s LIMIT %s,%s", simpleName.concat(".").concat(many.parentColumn()), Integer.valueOf((i - 1) * i2), Integer.valueOf(i2)));
                    z = true;
                }
                Cursor rawQuery = checkDb.rawQuery(sb, null);
                List<T> newInstanceEntity = newInstanceEntity(cls, cls2, cls3, rawQuery, allNotIgnoreField, allNotIgnoreField2, z, checkDb, many.entityColumn(), many.parentColumn());
                try {
                    closeCursor(rawQuery);
                    return newInstanceEntity;
                } catch (ClassNotFoundException e2) {
                    e = e2;
                    e.printStackTrace();
                    return null;
                }
            } catch (ClassNotFoundException e3) {
                e = e3;
            }
        } else {
            ALog.e("AbsDelegate", "查询数据失败，实体类没有使用@Wrapper 注解");
            return null;
        }
    }

    private synchronized <T extends AbsDbWrapper, P extends DbEntity, C extends DbEntity> List<T> newInstanceEntity(Class<T> cls, Class<P> cls2, Class<C> cls3, Cursor cursor, List<Field> list, List<Field> list2, boolean z, SQLiteDatabase sQLiteDatabase, String str, String str2) {
        ArrayList arrayList = new ArrayList();
        SparseArray sparseArray = new SparseArray();
        SparseArray sparseArray2 = new SparseArray();
        while (cursor.moveToNext()) {
            try {
                int i = cursor.getInt(cursor.getColumnIndex("p".concat("rowid")));
                if (sparseArray.get(i) == null) {
                    sparseArray.put(i, new ArrayList());
                    sparseArray2.put(i, createParent(i, cls2, list, cursor));
                }
                if (z) {
                    List createChildren = createChildren(sQLiteDatabase, cls3, list, str, str2, (DbEntity) sparseArray2.get(i));
                    if (createChildren != null) {
                        ((List) sparseArray.get(i)).addAll(createChildren);
                    }
                } else {
                    ((List) sparseArray.get(i)).add(createChild(cls3, list2, cursor));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        List<Field> allNotIgnoreField = SqlUtil.getAllNotIgnoreField(cls);
        if (allNotIgnoreField != null && !allNotIgnoreField.isEmpty()) {
            for (int i2 = 0; i2 < sparseArray2.size(); i2++) {
                int keyAt = sparseArray2.keyAt(i2);
                T newInstance = cls.newInstance();
                boolean z2 = false;
                boolean z3 = false;
                for (Field field : allNotIgnoreField) {
                    if (!z2 && field.getAnnotation(One.class) != null) {
                        field.set(newInstance, sparseArray2.get(keyAt));
                        z2 = true;
                    }
                    if (!z3 && field.getAnnotation(Many.class) != null) {
                        field.set(newInstance, sparseArray.get(keyAt));
                        z3 = true;
                    }
                }
                newInstance.handleConvert();
                arrayList.add(newInstance);
            }
            return arrayList;
        }
        return null;
    }

    private <T extends DbEntity> List<T> createChildren(SQLiteDatabase sQLiteDatabase, Class<T> cls, List<Field> list, String str, String str2, DbEntity dbEntity) throws IllegalAccessException {
        for (Field field : list) {
            field.setAccessible(true);
            if (field.getName().equals(str2)) {
                Object obj = field.get(dbEntity);
                if (obj instanceof String) {
                    obj = URLEncoder.encode((String) obj);
                }
                return findData(sQLiteDatabase, cls, str + "='" + obj + "'");
            }
        }
        return new ArrayList();
    }

    private <T extends DbEntity> T createChild(Class<T> cls, List<Field> list, Cursor cursor) throws InstantiationException, IllegalAccessException {
        T newInstance = cls.newInstance();
        newInstance.rowID = cursor.getInt(cursor.getColumnIndex("c".concat("rowid")));
        for (Field field : list) {
            field.setAccessible(true);
            setFieldValue(field.getType(), field, cursor.getColumnIndex("c".concat(field.getName())), cursor, newInstance);
        }
        return newInstance;
    }

    private <T extends DbEntity> T createParent(int i, Class<T> cls, List<Field> list, Cursor cursor) throws InstantiationException, IllegalAccessException {
        T newInstance = cls.newInstance();
        newInstance.rowID = i;
        for (Field field : list) {
            field.setAccessible(true);
            setFieldValue(field.getType(), field, cursor.getColumnIndex("p".concat(field.getName())), cursor, newInstance);
        }
        return newInstance;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> List<T> findData(SQLiteDatabase sQLiteDatabase, Class<T> cls, String... strArr) {
        SQLiteDatabase checkDb = checkDb(sQLiteDatabase);
        if (CommonUtil.checkSqlExpression(strArr)) {
            String format = String.format("SELECT rowid, * FROM %s WHERE %s", CommonUtil.getClassName((Class) cls), strArr[0]);
            int length = strArr.length - 1;
            String[] strArr2 = new String[length];
            try {
                System.arraycopy(strArr, 1, strArr2, 0, length);
                return exeNormalDataSql(checkDb, cls, format, strArr2);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> List<T> findData(SQLiteDatabase sQLiteDatabase, Class<T> cls, int i, int i2, String... strArr) {
        if (i < 1 || i2 < 1) {
            ALog.w("AbsDelegate", "page, bum 小于1");
            return null;
        }
        SQLiteDatabase checkDb = checkDb(sQLiteDatabase);
        if (CommonUtil.checkSqlExpression(strArr)) {
            String format = String.format("SELECT rowid, * FROM %s WHERE %s LIMIT %s,%s", CommonUtil.getClassName((Class) cls), strArr[0], Integer.valueOf((i - 1) * i2), Integer.valueOf(i2));
            int length = strArr.length - 1;
            String[] strArr2 = new String[length];
            try {
                System.arraycopy(strArr, 1, strArr2, 0, length);
                return exeNormalDataSql(checkDb, cls, format, strArr2);
            } catch (Exception e) {
                e.printStackTrace();
                return null;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> List<T> findDataByFuzzy(SQLiteDatabase sQLiteDatabase, Class<T> cls, String str) {
        SQLiteDatabase checkDb = checkDb(sQLiteDatabase);
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("sql语句表达式不能为null或\"\"");
        }
        if (!str.toUpperCase().contains("LIKE")) {
            throw new IllegalArgumentException("sql语句表达式未包含LIEK");
        }
        return exeNormalDataSql(checkDb, cls, String.format("SELECT rowid, * FROM %s, WHERE %s", CommonUtil.getClassName((Class) cls), str), null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> List<T> findDataByFuzzy(SQLiteDatabase sQLiteDatabase, Class<T> cls, int i, int i2, String str) {
        if (i < 1 || i2 < 1) {
            ALog.w("AbsDelegate", "page, bum 小于1");
            return null;
        }
        SQLiteDatabase checkDb = checkDb(sQLiteDatabase);
        if (TextUtils.isEmpty(str)) {
            throw new IllegalArgumentException("sql语句表达式不能为null或\"\"");
        }
        if (!str.toUpperCase().contains("LIKE")) {
            throw new IllegalArgumentException("sql语句表达式未包含LIEK");
        }
        return exeNormalDataSql(checkDb, cls, String.format("SELECT rowid, * FROM %s WHERE %s LIMIT %s,%s", CommonUtil.getClassName((Class) cls), str, Integer.valueOf((i - 1) * i2), Integer.valueOf(i2)), null);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> List<T> findAllData(SQLiteDatabase sQLiteDatabase, Class<T> cls) {
        return exeNormalDataSql(checkDb(sQLiteDatabase), cls, String.format("SELECT rowid, * FROM %s", CommonUtil.getClassName((Class) cls)), null);
    }

    private <T extends DbEntity> List<T> exeNormalDataSql(SQLiteDatabase sQLiteDatabase, Class<T> cls, String str, String[] strArr) {
        Cursor rawQuery;
        SqlUtil.checkOrCreateTable(sQLiteDatabase, cls);
        if (strArr != null) {
            String[] strArr2 = new String[strArr.length];
            int i = 0;
            for (String str2 : strArr) {
                strArr2[i] = SqlUtil.encodeStr(str2);
                i++;
            }
            rawQuery = sQLiteDatabase.rawQuery(str, strArr2);
        } else {
            rawQuery = sQLiteDatabase.rawQuery(str, null);
        }
        List<T> newInstanceEntity = rawQuery.getCount() > 0 ? newInstanceEntity(cls, rawQuery) : null;
        closeCursor(rawQuery);
        return newInstanceEntity;
    }

    private synchronized <T extends DbEntity> List<T> newInstanceEntity(Class<T> cls, Cursor cursor) {
        ArrayList arrayList;
        List<Field> allFields = CommonUtil.getAllFields(cls);
        arrayList = new ArrayList();
        if (allFields != null && allFields.size() > 0) {
            while (cursor.moveToNext()) {
                try {
                    T newInstance = cls.newInstance();
                    String str = "";
                    for (Field field : allFields) {
                        field.setAccessible(true);
                        if (!SqlUtil.isIgnore(field)) {
                            Class<?> type = field.getType();
                            if (SqlUtil.isPrimary(field) && (type == Integer.TYPE || type == Integer.class)) {
                                str = field.getName();
                            }
                            String str2 = str;
                            int columnIndex = cursor.getColumnIndex(field.getName());
                            if (columnIndex != -1) {
                                setFieldValue(type, field, columnIndex, cursor, newInstance);
                            }
                            str = str2;
                        }
                    }
                    if (TextUtils.isEmpty(str)) {
                        str = "rowid";
                    }
                    newInstance.rowID = cursor.getInt(cursor.getColumnIndex(str));
                    arrayList.add(newInstance);
                } catch (IllegalAccessException e) {
                    e.printStackTrace();
                } catch (InstantiationException e2) {
                    e2.printStackTrace();
                }
            }
            closeCursor(cursor);
        }
        return arrayList;
    }

    private void setFieldValue(Class cls, Field field, int i, Cursor cursor, DbEntity dbEntity) throws IllegalAccessException {
        if (cursor == null || cursor.isClosed()) {
            ALog.e("AbsDelegate", "cursor没有初始化");
        } else if (cls == String.class) {
            String string = cursor.getString(i);
            if (TextUtils.isEmpty(string)) {
                return;
            }
            field.set(dbEntity, URLDecoder.decode(string));
        } else if (cls == Integer.TYPE || cls == Integer.class) {
            field.setInt(dbEntity, cursor.getInt(i));
        } else if (cls == Float.TYPE || cls == Float.class) {
            field.setFloat(dbEntity, cursor.getFloat(i));
        } else if (cls == Double.TYPE || cls == Double.class) {
            field.setDouble(dbEntity, cursor.getDouble(i));
        } else if (cls == Long.TYPE || cls == Long.class) {
            field.setLong(dbEntity, cursor.getLong(i));
        } else if (cls == Boolean.TYPE || cls == Boolean.class) {
            String string2 = cursor.getString(i);
            if (TextUtils.isEmpty(string2)) {
                field.setBoolean(dbEntity, false);
            } else {
                field.setBoolean(dbEntity, !string2.equalsIgnoreCase("false"));
            }
        } else if (cls == Date.class || cls == java.sql.Date.class) {
            field.set(dbEntity, new Date(URLDecoder.decode(cursor.getString(i))));
        } else if (cls == byte[].class) {
            field.set(dbEntity, cursor.getBlob(i));
        } else if (cls == Map.class) {
            String string3 = cursor.getString(i);
            if (TextUtils.isEmpty(string3)) {
                return;
            }
            field.set(dbEntity, SqlUtil.str2Map(URLDecoder.decode(string3)));
        } else if (cls == List.class) {
            String string4 = cursor.getString(i);
            if (TextUtils.isEmpty(string4)) {
                return;
            }
            field.set(dbEntity, SqlUtil.str2List(URLDecoder.decode(string4), field));
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int[] getRowId(SQLiteDatabase sQLiteDatabase, Class cls) {
        SQLiteDatabase checkDb = checkDb(sQLiteDatabase);
        Cursor rawQuery = checkDb.rawQuery("SELECT rowid, * FROM " + CommonUtil.getClassName(cls), null);
        int[] iArr = new int[rawQuery.getCount()];
        int i = 0;
        while (rawQuery.moveToNext()) {
            iArr[i] = rawQuery.getInt(rawQuery.getColumnIndex("rowid"));
            i++;
        }
        rawQuery.close();
        return iArr;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public int getRowId(SQLiteDatabase sQLiteDatabase, Class cls, Object[] objArr, Object[] objArr2) {
        SQLiteDatabase checkDb = checkDb(sQLiteDatabase);
        if (objArr.length <= 0 || objArr2.length <= 0) {
            ALog.e("AbsDelegate", "请输入删除条件");
            return -1;
        } else if (objArr.length != objArr2.length) {
            ALog.e("AbsDelegate", "groupHash 和 vaule 长度不相等");
            return -1;
        } else {
            StringBuilder sb = new StringBuilder();
            sb.append("SELECT rowid FROM ");
            sb.append(CommonUtil.getClassName(cls));
            sb.append(" WHERE ");
            int i = 0;
            for (Object obj : objArr) {
                sb.append(obj);
                sb.append("=");
                sb.append("'");
                sb.append(objArr2[i]);
                sb.append("'");
                sb.append(i >= objArr.length + (-1) ? "" : ",");
                i++;
            }
            Cursor rawQuery = checkDb.rawQuery(sb.toString(), null);
            int columnIndex = rawQuery.getColumnIndex("rowid");
            rawQuery.close();
            return columnIndex;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> boolean itemExist(SQLiteDatabase sQLiteDatabase, Class<T> cls, long j) {
        return itemExist(sQLiteDatabase, CommonUtil.getClassName((Class) cls), j);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean itemExist(SQLiteDatabase sQLiteDatabase, String str, long j) {
        SQLiteDatabase checkDb = checkDb(sQLiteDatabase);
        Cursor rawQuery = checkDb.rawQuery("SELECT rowid FROM " + str + " WHERE rowid=" + j, null);
        boolean z = rawQuery.getCount() > 0;
        rawQuery.close();
        return z;
    }
}
