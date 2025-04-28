package com.arialyy.aria.orm;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public abstract class AbsDelegate {
    static final String TAG = "AbsDelegate";

    /* JADX INFO: Access modifiers changed from: package-private */
    public void closeCursor(Cursor cursor) {
        SqlUtil.closeCursor(cursor);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public SQLiteDatabase checkDb(SQLiteDatabase sQLiteDatabase) {
        return SqlUtil.checkDb(sQLiteDatabase);
    }
}
