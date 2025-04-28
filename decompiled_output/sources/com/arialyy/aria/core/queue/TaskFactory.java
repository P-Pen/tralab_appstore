package com.arialyy.aria.core.queue;

import com.arialyy.aria.core.download.DGTaskWrapper;
import com.arialyy.aria.core.download.DTaskWrapper;
import com.arialyy.aria.core.listener.ISchedulers;
import com.arialyy.aria.core.task.DownloadGroupTask;
import com.arialyy.aria.core.task.DownloadTask;
import com.arialyy.aria.core.task.ITask;
import com.arialyy.aria.core.task.UploadTask;
import com.arialyy.aria.core.upload.UTaskWrapper;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public class TaskFactory {
    private static volatile TaskFactory INSTANCE;

    private TaskFactory() {
    }

    public static TaskFactory getInstance() {
        if (INSTANCE == null) {
            synchronized (TaskFactory.class) {
                INSTANCE = new TaskFactory();
            }
        }
        return INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public <TASK_ENTITY extends AbsTaskWrapper, SCHEDULER extends ISchedulers> ITask createTask(TASK_ENTITY task_entity, SCHEDULER scheduler) {
        if (task_entity instanceof DTaskWrapper) {
            return createDownloadTask((DTaskWrapper) task_entity, scheduler);
        }
        if (task_entity instanceof UTaskWrapper) {
            return createUploadTask((UTaskWrapper) task_entity, scheduler);
        }
        if (task_entity instanceof DGTaskWrapper) {
            return createDownloadGroupTask((DGTaskWrapper) task_entity, scheduler);
        }
        return null;
    }

    private DownloadGroupTask createDownloadGroupTask(DGTaskWrapper dGTaskWrapper, ISchedulers iSchedulers) {
        DownloadGroupTask.Builder builder = new DownloadGroupTask.Builder(dGTaskWrapper);
        builder.setOutHandler(iSchedulers);
        return builder.build();
    }

    private UploadTask createUploadTask(UTaskWrapper uTaskWrapper, ISchedulers iSchedulers) {
        UploadTask.Builder builder = new UploadTask.Builder();
        builder.setUploadTaskEntity(uTaskWrapper);
        builder.setOutHandler(iSchedulers);
        return builder.build();
    }

    private DownloadTask createDownloadTask(DTaskWrapper dTaskWrapper, ISchedulers iSchedulers) {
        DownloadTask.Builder builder = new DownloadTask.Builder(dTaskWrapper);
        builder.setOutHandler(iSchedulers);
        return builder.build();
    }
}
