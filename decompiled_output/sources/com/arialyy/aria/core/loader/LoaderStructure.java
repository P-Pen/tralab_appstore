package com.arialyy.aria.core.loader;

import java.util.ArrayList;
import java.util.List;
/* loaded from: classes.dex */
public class LoaderStructure {
    private List<ILoaderComponent> parts = new ArrayList();

    public void accept(ILoaderVisitor iLoaderVisitor) {
        for (ILoaderComponent iLoaderComponent : this.parts) {
            iLoaderComponent.accept(iLoaderVisitor);
        }
    }

    public LoaderStructure addComponent(ILoaderComponent iLoaderComponent) {
        this.parts.add(iLoaderComponent);
        return this;
    }
}
