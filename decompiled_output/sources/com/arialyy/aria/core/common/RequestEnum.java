package com.arialyy.aria.core.common;

import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
/* loaded from: classes.dex */
public enum RequestEnum {
    GET(HttpGet.METHOD_NAME),
    POST(HttpPost.METHOD_NAME);
    
    public String name;

    RequestEnum(String str) {
        this.name = str;
    }
}
