package com.arialyy.aria.core.group;

import android.os.Handler;
import android.os.Looper;
import com.arialyy.aria.core.config.Configuration;
import com.arialyy.aria.core.download.DGTaskWrapper;
import com.arialyy.aria.core.download.DTaskWrapper;
import com.arialyy.aria.core.download.DownloadGroupEntity;
import com.arialyy.aria.core.inf.IThreadStateManager;
import com.arialyy.aria.core.listener.IDGroupListener;
import com.arialyy.aria.core.listener.IEventListener;
import com.arialyy.aria.core.loader.IInfoTask;
import com.arialyy.aria.core.loader.ILoader;
import com.arialyy.aria.core.loader.ILoaderVisitor;
import com.arialyy.aria.core.loader.IRecordHandler;
import com.arialyy.aria.core.loader.IThreadTaskBuilder;
import com.arialyy.aria.core.wrapper.AbsTaskWrapper;
import com.arialyy.aria.exception.AriaException;
import com.arialyy.aria.util.ALog;
import com.arialyy.aria.util.CommonUtil;
import java.io.File;
import java.util.Map;
import java.util.Objects;
import java.util.WeakHashMap;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
/* loaded from: classes.dex */
public abstract class AbsGroupLoader implements ILoaderVisitor, ILoader {
    private DGTaskWrapper mGTWrapper;
    protected IInfoTask mInfoTask;
    private IDGroupListener mListener;
    private Handler mScheduler;
    private GroupRunState mState;
    private ScheduledThreadPoolExecutor mTimer;
    protected final String TAG = CommonUtil.getClassName((Class) getClass());
    private long mCurrentLocation = 0;
    private boolean isStop = false;
    private boolean isCancel = false;
    private SimpleSubQueue mSubQueue = SimpleSubQueue.newInstance();
    private Map<String, AbsSubDLoadUtil> mExeLoader = new WeakHashMap();
    private Map<String, DTaskWrapper> mCache = new WeakHashMap();
    private long mUpdateInterval = Configuration.getInstance().downloadCfg.getUpdateInterval();

    @Override // com.arialyy.aria.core.loader.ILoaderVisitor
    @Deprecated
    public void addComponent(IThreadStateManager iThreadStateManager) {
    }

    @Override // com.arialyy.aria.core.loader.ILoaderVisitor
    @Deprecated
    public void addComponent(IRecordHandler iRecordHandler) {
    }

    @Override // com.arialyy.aria.core.loader.ILoaderVisitor
    @Deprecated
    public void addComponent(IThreadTaskBuilder iThreadTaskBuilder) {
    }

    protected abstract AbsSubDLoadUtil createSubLoader(DTaskWrapper dTaskWrapper, boolean z);

    protected abstract void handlerTask(Looper looper);

    /* JADX INFO: Access modifiers changed from: protected */
    public AbsGroupLoader(AbsTaskWrapper absTaskWrapper, IEventListener iEventListener) {
        this.mListener = (IDGroupListener) iEventListener;
        this.mGTWrapper = (DGTaskWrapper) absTaskWrapper;
    }

    protected IDGroupListener getListener() {
        return this.mListener;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public DGTaskWrapper getWrapper() {
        return this.mGTWrapper;
    }

    protected GroupRunState getState() {
        return this.mState;
    }

    public Handler getScheduler() {
        return this.mScheduler;
    }

    private void initState(Looper looper) {
        this.mState = new GroupRunState(getWrapper().getKey(), this.mListener, this.mSubQueue);
        for (DTaskWrapper dTaskWrapper : this.mGTWrapper.getSubTaskWrapper()) {
            long checkFileExists = checkFileExists(dTaskWrapper.getEntity().getFilePath());
            if (dTaskWrapper.getEntity().getState() == 1 && checkFileExists > 0 && checkFileExists == dTaskWrapper.getEntity().getFileSize()) {
                this.mCurrentLocation += dTaskWrapper.getEntity().getFileSize();
            } else {
                if (checkFileExists <= 0) {
                    dTaskWrapper.getEntity().setCurrentProgress(0L);
                }
                dTaskWrapper.getEntity().setState(6);
                this.mCache.put(dTaskWrapper.getKey(), dTaskWrapper);
                this.mCurrentLocation += dTaskWrapper.getEntity().getCurrentProgress();
            }
        }
        if (getWrapper().getSubTaskWrapper().size() != this.mState.getCompleteNum()) {
            getWrapper().setState(6);
        }
        this.mState.updateProgress(this.mCurrentLocation);
        this.mScheduler = new Handler(looper, SimpleSchedulers.newInstance(this.mState, this.mGTWrapper.getKey()));
    }

    private long checkFileExists(String str) {
        File file = new File(str);
        if (file.exists()) {
            return file.length();
        }
        File file2 = new File(String.format(IRecordHandler.SUB_PATH, str, 0));
        if (file2.exists()) {
            return file2.length();
        }
        return -1L;
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public String getKey() {
        return this.mGTWrapper.getKey();
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void startSubTask(String str) {
        if (checkSubTask(str, "开始")) {
            if (!this.mState.isRunning.get()) {
                startTimer();
            }
            AbsSubDLoadUtil downloader = getDownloader(str, false);
            if (downloader == null || downloader.isRunning()) {
                return;
            }
            this.mSubQueue.startTask(downloader);
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void stopSubTask(String str) {
        AbsSubDLoadUtil downloader;
        if (checkSubTask(str, "停止") && (downloader = getDownloader(str, false)) != null && downloader.isRunning()) {
            this.mSubQueue.stopTask(downloader);
        }
    }

    private boolean checkSubTask(String str, String str2) {
        DTaskWrapper dTaskWrapper = this.mCache.get(str);
        if (dTaskWrapper != null) {
            if (dTaskWrapper.getState() == 1) {
                String str3 = this.TAG;
                ALog.w(str3, "任务【" + str + "】已完成，" + str2 + "失败");
                return false;
            }
            return true;
        }
        String str4 = this.TAG;
        ALog.w(str4, "任务组中没有该任务【" + str + "】，" + str2 + "失败");
        return false;
    }

    private AbsSubDLoadUtil getDownloader(String str, boolean z) {
        AbsSubDLoadUtil absSubDLoadUtil = this.mExeLoader.get(str);
        return absSubDLoadUtil == null ? createSubLoader(this.mCache.get(str), z) : absSubDLoadUtil;
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public boolean isRunning() {
        GroupRunState groupRunState = this.mState;
        return groupRunState != null && groupRunState.isRunning.get();
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public void cancel() {
        this.isCancel = true;
        closeTimer();
        this.mSubQueue.removeAllTask();
        this.mListener.onCancel();
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public void stop() {
        this.isStop = true;
        this.mSubQueue.stopAllTask();
        closeTimer();
    }

    @Override // java.lang.Runnable
    public void run() {
        checkComponent();
        if (this.isStop || this.isCancel) {
            closeTimer();
        } else {
            startRunningFlow();
        }
    }

    private void startRunningFlow() {
        closeTimer();
        Looper.prepare();
        Looper myLooper = Looper.myLooper();
        if (myLooper == Looper.getMainLooper()) {
            throw new IllegalThreadStateException("不能在主线程程序中调用Loader");
        }
        initState(myLooper);
        getState().setSubSize(getWrapper().getSubTaskWrapper().size());
        if (getState().getCompleteNum() != 0 && getState().getCompleteNum() == getState().getSubSize()) {
            this.mListener.onComplete();
            return;
        }
        startTimer();
        handlerTask(myLooper);
        Looper.loop();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void onPostStart() {
        if (isBreak()) {
            return;
        }
        getListener().onPostPre(((DownloadGroupEntity) getWrapper().getEntity()).getFileSize());
        if (((DownloadGroupEntity) getWrapper().getEntity()).getFileSize() > 0) {
            getListener().onResume(((DownloadGroupEntity) getWrapper().getEntity()).getCurrentProgress());
        } else {
            getListener().onStart(((DownloadGroupEntity) getWrapper().getEntity()).getCurrentProgress());
        }
    }

    private synchronized void startTimer() {
        this.mState.isRunning.set(true);
        ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = new ScheduledThreadPoolExecutor(1);
        this.mTimer = scheduledThreadPoolExecutor;
        scheduledThreadPoolExecutor.scheduleWithFixedDelay(new Runnable() { // from class: com.arialyy.aria.core.group.AbsGroupLoader.1
            @Override // java.lang.Runnable
            public void run() {
                long currentProgress;
                if (!AbsGroupLoader.this.mState.isRunning.get()) {
                    AbsGroupLoader.this.closeTimer();
                    return;
                }
                long j = 0;
                if (AbsGroupLoader.this.mCurrentLocation >= 0) {
                    for (DTaskWrapper dTaskWrapper : AbsGroupLoader.this.mGTWrapper.getSubTaskWrapper()) {
                        if (dTaskWrapper.getState() == 1) {
                            currentProgress = dTaskWrapper.getEntity().getFileSize();
                        } else {
                            currentProgress = dTaskWrapper.getEntity().getCurrentProgress();
                        }
                        j += currentProgress;
                    }
                    AbsGroupLoader.this.mCurrentLocation = j;
                    AbsGroupLoader.this.mState.updateProgress(AbsGroupLoader.this.mCurrentLocation);
                    AbsGroupLoader.this.mListener.onProgress(j);
                }
            }
        }, 0L, this.mUpdateInterval, TimeUnit.MILLISECONDS);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void startSubLoader(AbsSubDLoadUtil absSubDLoadUtil) {
        this.mExeLoader.put(absSubDLoadUtil.getKey(), absSubDLoadUtil);
        this.mSubQueue.startTask(absSubDLoadUtil);
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public boolean isBreak() {
        if (this.isCancel || this.isStop) {
            ALog.d(this.TAG, String.format("任务【%s】已停止或取消了", this.mGTWrapper.getKey()));
            return true;
        }
        return false;
    }

    /* JADX INFO: Access modifiers changed from: private */
    public synchronized void closeTimer() {
        ScheduledThreadPoolExecutor scheduledThreadPoolExecutor = this.mTimer;
        if (scheduledThreadPoolExecutor != null && !scheduledThreadPoolExecutor.isShutdown()) {
            this.mTimer.shutdown();
        }
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public void fail(AriaException ariaException, boolean z) {
        closeTimer();
        getListener().onFail(z, ariaException);
    }

    @Override // com.arialyy.aria.core.loader.ILoader
    public long getCurrentProgress() {
        return this.mCurrentLocation;
    }

    private void checkComponent() {
        Objects.requireNonNull(this.mInfoTask, "文件信息组件为空");
    }
}
