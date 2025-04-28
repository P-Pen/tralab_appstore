package com.arialyy.aria.core.scheduler;

import android.content.Intent;
import android.os.Bundle;
import android.os.Message;
import com.arialyy.annotations.TaskEnum;
import com.arialyy.aria.core.AriaConfig;
import com.arialyy.aria.core.common.AbsEntity;
import com.arialyy.aria.core.group.GroupSendParams;
import com.arialyy.aria.core.listener.ISchedulers;
import com.arialyy.aria.core.manager.TaskWrapperManager;
import com.arialyy.aria.core.queue.DGroupTaskQueue;
import com.arialyy.aria.core.queue.DTaskQueue;
import com.arialyy.aria.core.queue.ITaskQueue;
import com.arialyy.aria.core.queue.UTaskQueue;
import com.arialyy.aria.core.task.AbsTask;
import com.arialyy.aria.core.task.DownloadGroupTask;
import com.arialyy.aria.core.task.DownloadTask;
import com.arialyy.aria.core.task.ITask;
import com.arialyy.aria.core.task.UploadTask;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import com.arialyy.aria.util.NetUtils;
import java.util.Iterator;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
/* loaded from: classes.dex */
public class TaskSchedulers<TASK extends ITask> implements ISchedulers {
    private static volatile TaskSchedulers INSTANCE;
    private static FailureTaskHandler mFailureTaskHandler;
    private final String TAG = CommonUtil.getClassName((Class) getClass());
    private Map<String, Map<TaskEnum, Object>> mObservers = new ConcurrentHashMap();
    private AriaConfig mAriaConfig = AriaConfig.getInstance();

    private TaskSchedulers() {
    }

    public static TaskSchedulers getInstance() {
        if (INSTANCE == null) {
            synchronized (TaskSchedulers.class) {
                if (INSTANCE == null) {
                    INSTANCE = new TaskSchedulers();
                    mFailureTaskHandler = FailureTaskHandler.init(INSTANCE);
                }
            }
        }
        return INSTANCE;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public ITaskQueue getQueue(int i) {
        if (i == 1) {
            return DTaskQueue.getInstance();
        }
        if (i == 3) {
            return DGroupTaskQueue.getInstance();
        }
        if (i == 2) {
            return UTaskQueue.getInstance();
        }
        throw new NullPointerException("任务类型错误，type = " + i);
    }

    public void register(Object obj, TaskEnum taskEnum) {
        String name = obj.getClass().getName();
        Map<TaskEnum, Object> map = this.mObservers.get(getKey(obj));
        if (map == null) {
            map = new ConcurrentHashMap<>();
            this.mObservers.put(getKey(obj), map);
        }
        if (hasProxyListener(map, taskEnum)) {
            return;
        }
        if (obj instanceof TaskInternalListenerInterface) {
            map.put(taskEnum, obj);
            return;
        }
        String str = name + taskEnum.proxySuffix;
        ISchedulerListener createListener = createListener(str);
        if (createListener != null) {
            createListener.setListener(obj);
            map.put(taskEnum, createListener);
            return;
        }
        ALog.e(this.TAG, "注册错误，没有【" + str + "】观察者");
    }

    private boolean hasProxyListener(Map<TaskEnum, Object> map, TaskEnum taskEnum) {
        return (map.isEmpty() || map.get(taskEnum) == null) ? false : true;
    }

    public void unRegister(Object obj) {
        if (this.mObservers.containsKey(getKey(obj))) {
            Iterator<Map.Entry<String, Map<TaskEnum, Object>>> it = this.mObservers.entrySet().iterator();
            while (it.hasNext()) {
                if (it.next().getKey().equals(getKey(obj))) {
                    it.remove();
                }
            }
        }
    }

    private String getKey(Object obj) {
        return obj.getClass().getName() + obj.hashCode();
    }

    private ISchedulerListener createListener(String str) {
        try {
            return (ISchedulerListener) Class.forName(str).newInstance();
        } catch (ClassNotFoundException e) {
            ALog.e(this.TAG, e.getMessage());
            return null;
        } catch (IllegalAccessException e2) {
            ALog.e(this.TAG, e2.getMessage());
            return null;
        } catch (InstantiationException e3) {
            ALog.e(this.TAG, e3.getMessage());
            return null;
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.os.Handler.Callback
    public boolean handleMessage(Message message) {
        if (message.what == 11) {
            handlePreFailTask(message.arg1);
            return true;
        } else if (message.arg1 == 209) {
            return handleSubEvent(message);
        } else {
            if (message.arg1 == 210) {
                return handlePeerEvent(message);
            }
            ITask iTask = (ITask) message.obj;
            if (iTask == null) {
                ALog.e(this.TAG, "请传入下载任务");
                return true;
            }
            handleNormalEvent(iTask, message.what);
            return true;
        }
    }

    private boolean handlePeerEvent(Message message) {
        M3U8PeerTaskListener m3U8PeerTaskListener;
        Bundle data = message.getData();
        if (this.mObservers.size() > 0) {
            for (String str : this.mObservers.keySet()) {
                Map<TaskEnum, Object> map = this.mObservers.get(str);
                if (map != null && !map.isEmpty() && (m3U8PeerTaskListener = (M3U8PeerTaskListener) map.get(TaskEnum.M3U8_PEER)) != null) {
                    switch (message.what) {
                        case 177:
                            m3U8PeerTaskListener.onPeerStart(data.getString(ISchedulers.DATA_M3U8_URL), data.getString(ISchedulers.DATA_M3U8_PEER_PATH), data.getInt(ISchedulers.DATA_M3U8_PEER_INDEX));
                            continue;
                        case 178:
                            m3U8PeerTaskListener.onPeerComplete(data.getString(ISchedulers.DATA_M3U8_URL), data.getString(ISchedulers.DATA_M3U8_PEER_PATH), data.getInt(ISchedulers.DATA_M3U8_PEER_INDEX));
                            continue;
                        case 179:
                            m3U8PeerTaskListener.onPeerFail(data.getString(ISchedulers.DATA_M3U8_URL), data.getString(ISchedulers.DATA_M3U8_PEER_PATH), data.getInt(ISchedulers.DATA_M3U8_PEER_INDEX));
                            continue;
                    }
                }
            }
        }
        if (this.mAriaConfig.getAConfig().isUseBroadcast()) {
            Intent intent = new Intent(ISchedulers.ARIA_TASK_INFO_ACTION);
            intent.setPackage(this.mAriaConfig.getAPP().getPackageName());
            intent.putExtras(data);
            this.mAriaConfig.getAPP().sendBroadcast(intent);
            return true;
        }
        return true;
    }

    private boolean handleSubEvent(Message message) {
        SubTaskListener subTaskListener;
        GroupSendParams groupSendParams = (GroupSendParams) message.obj;
        if (this.mObservers.size() > 0) {
            for (String str : this.mObservers.keySet()) {
                Map<TaskEnum, Object> map = this.mObservers.get(str);
                if (map != null && !map.isEmpty() && (subTaskListener = (SubTaskListener) map.get(TaskEnum.DOWNLOAD_GROUP_SUB)) != null) {
                    switch (message.what) {
                        case 161:
                            subTaskListener.onSubTaskPre(groupSendParams.groupTask, groupSendParams.entity);
                            continue;
                        case 162:
                            subTaskListener.onSubTaskStart(groupSendParams.groupTask, groupSendParams.entity);
                            continue;
                        case ISchedulers.SUB_STOP /* 163 */:
                            subTaskListener.onSubTaskStop(groupSendParams.groupTask, groupSendParams.entity);
                            continue;
                        case ISchedulers.SUB_CANCEL /* 164 */:
                            subTaskListener.onSubTaskCancel(groupSendParams.groupTask, groupSendParams.entity);
                            continue;
                        case ISchedulers.SUB_FAIL /* 165 */:
                            subTaskListener.onSubTaskFail(groupSendParams.groupTask, groupSendParams.entity, (Exception) groupSendParams.groupTask.getExpand(AbsTask.ERROR_INFO_KEY));
                            continue;
                        case ISchedulers.SUB_RUNNING /* 166 */:
                            subTaskListener.onSubTaskRunning(groupSendParams.groupTask, groupSendParams.entity);
                            continue;
                        case ISchedulers.SUB_COMPLETE /* 167 */:
                            subTaskListener.onSubTaskComplete(groupSendParams.groupTask, groupSendParams.entity);
                            continue;
                    }
                }
            }
        }
        if (this.mAriaConfig.getAConfig().isUseBroadcast()) {
            this.mAriaConfig.getAPP().sendBroadcast(createData(message.what, 4, groupSendParams.entity));
            return true;
        }
        return true;
    }

    private void handleNormalEvent(TASK task, int i) {
        ITaskQueue queue = getQueue(task.getTaskType());
        if (i != 3) {
            if (i == 4) {
                handleFailTask(queue, task);
            } else if (i == 5) {
                queue.removeTaskFormQueue(task.getKey());
                if (queue.getCurrentExePoolNum() < queue.getMaxTaskNum()) {
                    ALog.d(this.TAG, String.format("删除任务【%s】成功，尝试开始下一任务", task.getTaskName()));
                    startNextTask(queue, task.getSchedulerType());
                } else {
                    ALog.d(this.TAG, String.format("删除任务【%s】成功", task.getTaskName()));
                }
            } else if (i == 6) {
                queue.removeTaskFormQueue(task.getKey());
                ALog.d(this.TAG, String.format("任务【%s】处理完成", task.getTaskName()));
                startNextTask(queue, task.getSchedulerType());
            }
        } else if (task.getState() != 3) {
            queue.removeTaskFormQueue(task.getKey());
            if (queue.getCurrentExePoolNum() < queue.getMaxTaskNum()) {
                ALog.d(this.TAG, String.format("停止任务【%s】成功，尝试开始下一任务", task.getTaskName()));
                startNextTask(queue, task.getSchedulerType());
            } else {
                ALog.d(this.TAG, String.format("停止任务【%s】成功", task.getTaskName()));
            }
        }
        if (i == 4 || i == 11) {
            return;
        }
        if (i == 5 || i == 6) {
            TaskWrapperManager.getInstance().removeTaskWrapper(task.getTaskWrapper());
        } else if (i != 7) {
            TaskWrapperManager.getInstance().putTaskWrapper(task.getTaskWrapper());
        }
        normalTaskCallback(i, task);
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x009e A[SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:35:0x0053 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    private void handlePreFailTask(int r6) {
        /*
            r5 = this;
            com.arialyy.aria.core.queue.ITaskQueue r0 = r5.getQueue(r6)
            r1 = 1
            r5.startNextTask(r0, r1)
            com.arialyy.aria.core.AriaConfig r0 = r5.mAriaConfig
            com.arialyy.aria.core.config.AppConfig r0 = r0.getAConfig()
            boolean r0 = r0.isUseBroadcast()
            if (r0 == 0) goto L41
            android.content.Intent r0 = new android.content.Intent
            java.lang.String r2 = "ARIA_TASK_INFO_ACTION"
            r0.<init>(r2)
            com.arialyy.aria.core.AriaConfig r2 = r5.mAriaConfig
            android.content.Context r2 = r2.getAPP()
            java.lang.String r2 = r2.getPackageName()
            r0.setPackage(r2)
            android.os.Bundle r2 = new android.os.Bundle
            r2.<init>()
            java.lang.String r3 = "ARIA_TASK_TYPE"
            r2.putInt(r3, r6)
            r3 = 4
            java.lang.String r4 = "ARIA_TASK_STATE"
            r2.putInt(r4, r3)
            com.arialyy.aria.core.AriaConfig r2 = r5.mAriaConfig
            android.content.Context r2 = r2.getAPP()
            r2.sendBroadcast(r0)
        L41:
            java.util.Map<java.lang.String, java.util.Map<com.arialyy.annotations.TaskEnum, java.lang.Object>> r0 = r5.mObservers
            int r0 = r0.size()
            if (r0 <= 0) goto La4
            java.util.Map<java.lang.String, java.util.Map<com.arialyy.annotations.TaskEnum, java.lang.Object>> r0 = r5.mObservers
            java.util.Set r0 = r0.keySet()
            java.util.Iterator r0 = r0.iterator()
        L53:
            boolean r2 = r0.hasNext()
            if (r2 == 0) goto La4
            java.lang.Object r2 = r0.next()
            java.lang.String r2 = (java.lang.String) r2
            java.util.Map<java.lang.String, java.util.Map<com.arialyy.annotations.TaskEnum, java.lang.Object>> r3 = r5.mObservers
            java.lang.Object r3 = r3.get(r2)
            java.util.Map r3 = (java.util.Map) r3
            if (r3 == 0) goto L53
            boolean r4 = r3.isEmpty()
            if (r4 == 0) goto L70
            goto L53
        L70:
            java.util.Map<java.lang.String, java.util.Map<com.arialyy.annotations.TaskEnum, java.lang.Object>> r4 = r5.mObservers
            java.lang.Object r2 = r4.get(r2)
            r4 = 0
            if (r2 == 0) goto L9b
            if (r6 != r1) goto L84
            com.arialyy.annotations.TaskEnum r2 = com.arialyy.annotations.TaskEnum.DOWNLOAD
            java.lang.Object r2 = r3.get(r2)
            com.arialyy.aria.core.scheduler.NormalTaskListenerInterface r2 = (com.arialyy.aria.core.scheduler.NormalTaskListenerInterface) r2
            goto L9c
        L84:
            r2 = 3
            if (r6 != r2) goto L90
            com.arialyy.annotations.TaskEnum r2 = com.arialyy.annotations.TaskEnum.DOWNLOAD_GROUP
            java.lang.Object r2 = r3.get(r2)
            com.arialyy.aria.core.scheduler.NormalTaskListenerInterface r2 = (com.arialyy.aria.core.scheduler.NormalTaskListenerInterface) r2
            goto L9c
        L90:
            if (r6 != r2) goto L9b
            com.arialyy.annotations.TaskEnum r2 = com.arialyy.annotations.TaskEnum.UPLOAD
            java.lang.Object r2 = r3.get(r2)
            com.arialyy.aria.core.scheduler.NormalTaskListenerInterface r2 = (com.arialyy.aria.core.scheduler.NormalTaskListenerInterface) r2
            goto L9c
        L9b:
            r2 = r4
        L9c:
            if (r2 == 0) goto L53
            r3 = 11
            r5.normalTaskCallback(r3, r4, r2)
            goto L53
        La4:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: com.arialyy.aria.core.scheduler.TaskSchedulers.handlePreFailTask(int):void");
    }

    private void normalTaskCallback(int i, TASK task) {
        sendNormalBroadcast(i, task);
        if (this.mObservers.size() > 0) {
            for (String str : this.mObservers.keySet()) {
                Map<TaskEnum, Object> map = this.mObservers.get(str);
                if (map != null && !map.isEmpty()) {
                    NormalTaskListenerInterface<TASK> normalTaskListenerInterface = null;
                    if (this.mObservers.get(str) != null) {
                        if (task instanceof DownloadTask) {
                            normalTaskListenerInterface = (NormalTaskListenerInterface) map.get(TaskEnum.DOWNLOAD);
                        } else if (task instanceof DownloadGroupTask) {
                            normalTaskListenerInterface = (NormalTaskListenerInterface) map.get(TaskEnum.DOWNLOAD_GROUP);
                        } else if (task instanceof UploadTask) {
                            normalTaskListenerInterface = (NormalTaskListenerInterface) map.get(TaskEnum.UPLOAD);
                        }
                    }
                    if (normalTaskListenerInterface != null) {
                        normalTaskCallback(i, task, normalTaskListenerInterface);
                    }
                }
            }
        }
    }

    private void normalTaskCallback(int i, TASK task, NormalTaskListenerInterface<TASK> normalTaskListenerInterface) {
        if (normalTaskListenerInterface != null) {
            if (task == null && i != 11) {
                ALog.e(this.TAG, "TASK 为null，回调失败");
                return;
            }
            switch (i) {
                case 0:
                    normalTaskListenerInterface.onPre(task);
                    return;
                case 1:
                    normalTaskListenerInterface.onTaskPre(task);
                    return;
                case 2:
                    normalTaskListenerInterface.onTaskStart(task);
                    return;
                case 3:
                    normalTaskListenerInterface.onTaskStop(task);
                    return;
                case 4:
                    normalTaskListenerInterface.onTaskFail(task.getTaskType() != 6 ? task : null, (Exception) task.getExpand(AbsTask.ERROR_INFO_KEY));
                    return;
                case 5:
                    normalTaskListenerInterface.onTaskCancel(task);
                    return;
                case 6:
                    normalTaskListenerInterface.onTaskComplete(task);
                    return;
                case 7:
                    normalTaskListenerInterface.onTaskRunning(task);
                    return;
                case 8:
                    normalTaskListenerInterface.onTaskResume(task);
                    return;
                case 9:
                    normalTaskListenerInterface.onNoSupportBreakPoint(task);
                    return;
                case 10:
                    normalTaskListenerInterface.onWait(task);
                    return;
                case 11:
                    normalTaskListenerInterface.onTaskFail(null, null);
                    return;
                default:
                    return;
            }
        }
    }

    private void sendNormalBroadcast(int i, TASK task) {
        if (this.mAriaConfig.getAConfig().isUseBroadcast()) {
            int taskType = task.getTaskType();
            if (taskType == 1 || taskType == 3) {
                this.mAriaConfig.getAPP().sendBroadcast(createData(i, taskType, task.getTaskWrapper().getEntity()));
            } else if (taskType == 2) {
                this.mAriaConfig.getAPP().sendBroadcast(createData(i, taskType, task.getTaskWrapper().getEntity()));
            } else {
                ALog.w(this.TAG, "发送广播失败，没有对应的任务");
            }
        }
    }

    private Intent createData(int i, int i2, AbsEntity absEntity) {
        Intent intent = new Intent(ISchedulers.ARIA_TASK_INFO_ACTION);
        intent.setPackage(this.mAriaConfig.getAPP().getPackageName());
        Bundle bundle = new Bundle();
        bundle.putInt(ISchedulers.TASK_TYPE, i2);
        bundle.putInt(ISchedulers.TASK_STATE, i);
        bundle.putLong(ISchedulers.TASK_SPEED, absEntity.getSpeed());
        bundle.putInt(ISchedulers.TASK_PERCENT, absEntity.getPercent());
        bundle.putParcelable(ISchedulers.TASK_ENTITY, absEntity);
        intent.putExtras(bundle);
        return intent;
    }

    private void handleFailTask(ITaskQueue iTaskQueue, TASK task) {
        if (!task.isNeedRetry() || task.isStop() || task.isCancel()) {
            iTaskQueue.removeTaskFormQueue(task.getKey());
            startNextTask(iTaskQueue, task.getSchedulerType());
            normalTaskCallback(4, task);
            return;
        }
        int reTryNum = task.getTaskWrapper().getConfig().getReTryNum();
        boolean isNotNetRetry = this.mAriaConfig.getAConfig().isNotNetRetry();
        if ((!NetUtils.isConnected(this.mAriaConfig.getAPP()) && !isNotNetRetry) || task.getTaskWrapper().getEntity().getFailNum() > reTryNum) {
            iTaskQueue.removeTaskFormQueue(task.getKey());
            startNextTask(iTaskQueue, task.getSchedulerType());
            TaskWrapperManager.getInstance().removeTaskWrapper(task.getTaskWrapper());
            normalTaskCallback(4, task);
            return;
        }
        mFailureTaskHandler.offer(task);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    /* JADX WARN: Multi-variable type inference failed */
    public void startNextTask(ITaskQueue iTaskQueue, int i) {
        if (i == 2) {
            return;
        }
        ITask nextTask = iTaskQueue.getNextTask();
        if (nextTask == null) {
            if (iTaskQueue.getCurrentExePoolNum() == 0) {
                ALog.i(this.TAG, "没有等待中的任务");
            }
        } else if (nextTask.getState() == 3) {
            iTaskQueue.startTask(nextTask);
        }
    }
}
