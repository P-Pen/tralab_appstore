package com.arialyy.aria.core.group;

import com.arialyy.aria.core.inf.IUtil;
/* loaded from: classes.dex */
interface ISubQueue<Fileer extends IUtil> {
    void addTask(Fileer fileer);

    void clear();

    Fileer getNextTask();

    void modifyMaxExecNum(int i);

    void removeAllTask();

    void removeTask(Fileer fileer);

    void removeTaskFromExecQ(Fileer fileer);

    void startTask(Fileer fileer);

    void stopAllTask();

    void stopTask(Fileer fileer);
}
