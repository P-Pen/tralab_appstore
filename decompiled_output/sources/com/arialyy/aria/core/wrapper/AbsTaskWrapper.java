package com.arialyy.aria.core.wrapper;

import com.arialyy.aria.core.TaskOptionParams;
import com.arialyy.aria.core.common.AbsEntity;
import com.arialyy.aria.core.config.BaseTaskConfig;
import com.arialyy.aria.core.event.ErrorEvent;
import com.arialyy.aria.core.inf.ITaskOption;
import com.arialyy.aria.util.ComponentUtil;
/* loaded from: classes.dex */
public abstract class AbsTaskWrapper<ENTITY extends AbsEntity> implements ITaskWrapper {
    private int code;
    private ENTITY entity;
    private ErrorEvent errorEvent;
    private ITaskOption taskOption;
    private boolean refreshInfo = false;
    private boolean isNewTask = false;
    private int requestType = 1;
    private boolean removeFile = false;
    private boolean isSupportBP = true;
    private TaskOptionParams optionParams = new TaskOptionParams();
    private boolean ignoreFilePathOccupy = false;

    public abstract BaseTaskConfig getConfig();

    public boolean isIgnoreFilePathOccupy() {
        return this.ignoreFilePathOccupy;
    }

    public void setIgnoreFilePathOccupy(boolean z) {
        this.ignoreFilePathOccupy = z;
    }

    public void setTaskOption(ITaskOption iTaskOption) {
        this.taskOption = iTaskOption;
    }

    public ITaskOption getTaskOption() {
        return this.taskOption;
    }

    public void generateTaskOption(Class<? extends ITaskOption> cls) {
        this.taskOption = ComponentUtil.getInstance().buildTaskOption(cls, this.optionParams);
    }

    public TaskOptionParams getOptionParams() {
        if (this.optionParams == null) {
            this.optionParams = new TaskOptionParams();
        }
        return this.optionParams;
    }

    public AbsTaskWrapper(ENTITY entity) {
        this.entity = entity;
    }

    public ErrorEvent getErrorEvent() {
        return this.errorEvent;
    }

    public void setErrorEvent(ErrorEvent errorEvent) {
        this.errorEvent = errorEvent;
    }

    @Override // com.arialyy.aria.core.wrapper.ITaskWrapper
    public ENTITY getEntity() {
        return this.entity;
    }

    public int getState() {
        return getEntity().getState();
    }

    public boolean isRefreshInfo() {
        return this.refreshInfo;
    }

    public void setRefreshInfo(boolean z) {
        this.refreshInfo = z;
    }

    public boolean isNewTask() {
        return this.isNewTask;
    }

    public void setNewTask(boolean z) {
        this.isNewTask = z;
    }

    public void setState(int i) {
        this.entity.setState(i);
    }

    @Override // com.arialyy.aria.core.wrapper.ITaskWrapper
    public int getRequestType() {
        return this.requestType;
    }

    public void setRequestType(int i) {
        this.requestType = i;
    }

    public boolean isRemoveFile() {
        return this.removeFile;
    }

    public void setRemoveFile(boolean z) {
        this.removeFile = z;
    }

    public boolean isSupportBP() {
        return this.isSupportBP;
    }

    public void setSupportBP(boolean z) {
        this.isSupportBP = z;
    }

    public int getCode() {
        return this.code;
    }

    public void setCode(int i) {
        this.code = i;
    }
}
