package com.arialyy.aria.core.wrapper;

import com.arialyy.aria.core.TaskRecord;
import com.arialyy.aria.core.ThreadRecord;
import com.arialyy.aria.orm.AbsDbWrapper;
import com.arialyy.aria.orm.annotation.Many;
import com.arialyy.aria.orm.annotation.One;
import com.arialyy.aria.orm.annotation.Wrapper;
import java.util.ArrayList;
import java.util.List;
@Wrapper
/* loaded from: classes.dex */
public class RecordWrapper extends AbsDbWrapper {
    @One
    public TaskRecord taskRecord;
    @Many(entityColumn = "taskKey", parentColumn = "filePath")
    public List<ThreadRecord> threadRecords;

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // com.arialyy.aria.orm.AbsDbWrapper
    public void handleConvert() {
        List<ThreadRecord> list = this.threadRecords;
        if (list != null && !list.isEmpty()) {
            this.taskRecord.threadRecords = this.threadRecords;
            return;
        }
        this.taskRecord.threadRecords = new ArrayList();
    }
}
