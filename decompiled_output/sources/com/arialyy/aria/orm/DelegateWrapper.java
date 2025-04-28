package com.arialyy.aria.orm;

import android.content.Context;
import android.database.sqlite.SQLiteDatabase;
import java.util.List;
import java.util.Objects;
/* loaded from: classes.dex */
public class DelegateWrapper {
    private static volatile DelegateWrapper INSTANCE = null;
    private static final String TAG = "DelegateWrapper";
    private DelegateManager mDManager;
    private SQLiteDatabase mDb;

    private DelegateWrapper() {
    }

    private DelegateWrapper(Context context) {
        this.mDb = SqlHelper.init(context.getApplicationContext()).getDb();
        this.mDManager = DelegateManager.getInstance();
    }

    public static DelegateWrapper init(Context context) {
        if (INSTANCE == null) {
            synchronized (DelegateWrapper.class) {
                if (INSTANCE == null) {
                    INSTANCE = new DelegateWrapper(context);
                }
            }
        }
        return INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static DelegateWrapper getInstance() {
        Objects.requireNonNull(INSTANCE, "请在Application中调用init进行数据库工具注册注册");
        return INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends AbsDbWrapper> List<T> findRelationData(Class<T> cls, String... strArr) {
        return ((DelegateFind) this.mDManager.getDelegate(DelegateFind.class)).findRelationData(this.mDb, cls, strArr);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends AbsDbWrapper> List<T> findRelationData(Class<T> cls, int i, int i2, String... strArr) {
        return ((DelegateFind) this.mDManager.getDelegate(DelegateFind.class)).findRelationData(this.mDb, cls, i, i2, strArr);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public boolean checkDataExist(Class cls, String... strArr) {
        return SqlUtil.checkDataExist(this.mDb, cls, strArr);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> void clean(Class<T> cls) {
        SqlUtil.clean(this.mDb, cls);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void exeSql(String str) {
        this.mDb.execSQL(str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> void delData(Class<T> cls, String... strArr) {
        ((DelegateUpdate) this.mDManager.getDelegate(DelegateUpdate.class)).delData(this.mDb, cls, strArr);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void updateData(DbEntity dbEntity) {
        ((DelegateUpdate) this.mDManager.getDelegate(DelegateUpdate.class)).updateData(this.mDb, dbEntity);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> void updateManyData(List<T> list) {
        ((DelegateUpdate) this.mDManager.getDelegate(DelegateUpdate.class)).updateManyData(this.mDb, list);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> List<T> findAllData(Class<T> cls) {
        return ((DelegateFind) this.mDManager.getDelegate(DelegateFind.class)).findAllData(this.mDb, cls);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> List<T> findData(Class<T> cls, String... strArr) {
        return ((DelegateFind) this.mDManager.getDelegate(DelegateFind.class)).findData(this.mDb, cls, strArr);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> List<T> findData(Class<T> cls, int i, int i2, String... strArr) {
        return ((DelegateFind) this.mDManager.getDelegate(DelegateFind.class)).findData(this.mDb, cls, i, i2, strArr);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> List<T> findDataByFuzzy(Class<T> cls, String str) {
        return ((DelegateFind) this.mDManager.getDelegate(DelegateFind.class)).findDataByFuzzy(this.mDb, cls, str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> List<T> findDataByFuzzy(Class<T> cls, int i, int i2, String str) {
        return ((DelegateFind) this.mDManager.getDelegate(DelegateFind.class)).findDataByFuzzy(this.mDb, cls, i, i2, str);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> boolean isExist(Class<T> cls, long j) {
        return ((DelegateFind) this.mDManager.getDelegate(DelegateFind.class)).itemExist(this.mDb, cls, j);
    }

    boolean isExist(String str, long j) {
        return ((DelegateFind) this.mDManager.getDelegate(DelegateFind.class)).itemExist(this.mDb, str, j);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void insertData(DbEntity dbEntity) {
        ((DelegateUpdate) this.mDManager.getDelegate(DelegateUpdate.class)).insertData(this.mDb, dbEntity);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <T extends DbEntity> void insertManyData(List<T> list) {
        ((DelegateUpdate) this.mDManager.getDelegate(DelegateUpdate.class)).insertManyData(this.mDb, list);
    }

    public boolean tableExists(Class cls) {
        return SqlUtil.tableExists(this.mDb, cls);
    }

    int[] getRowId(Class cls) {
        return ((DelegateFind) this.mDManager.getDelegate(DelegateFind.class)).getRowId(this.mDb, cls);
    }

    int getRowId(Class cls, Object[] objArr, Object[] objArr2) {
        return ((DelegateFind) this.mDManager.getDelegate(DelegateFind.class)).getRowId(this.mDb, cls, objArr, objArr2);
    }
}
