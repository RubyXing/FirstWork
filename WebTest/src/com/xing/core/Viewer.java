package com.xing.core;

import java.util.HashMap;

public class Viewer {
    String url;
    HashMap<String, Object> hashMap = new HashMap<>();

    public Viewer(String url, HashMap<String, Object> hashMap) {
        this.url = url;
        this.hashMap = hashMap;
    }

    public Viewer(String url) {
        this.url = url;
    }

    public HashMap<String, Object> getHashMap() {
        return hashMap;
    }

    public void setHashMap(HashMap<String, Object> hashMap) {
        this.hashMap = hashMap;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
