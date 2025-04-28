package com.arialyy.aria.core.scheduler;
/* loaded from: classes.dex */
public interface M3U8PeerTaskListener extends TaskInternalListenerInterface {
    void onPeerComplete(String str, String str2, int i);

    void onPeerFail(String str, String str2, int i);

    void onPeerStart(String str, String str2, int i);
}
