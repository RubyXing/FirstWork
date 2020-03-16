package com.xing.pojo;

public class SimpleBean {
    private int anInt;
    private double aDouble;
    private String str;
    private boolean bool;

    @Override
    public String toString() {
        return "SimpleBean{" +
                "anInt=" + anInt +
                ", aDouble=" + aDouble +
                ", str='" + str + '\'' +
                ", bool=" + bool +
                '}';
    }

    public int getAnInt() {
        return anInt;
    }

    public void setAnInt(int anInt) {
        this.anInt = anInt;
    }

    public double getADouble() {
        return aDouble;
    }

    public void setADouble(double aDouble) {
        this.aDouble = aDouble;
    }

    public String getStr() {
        return str;
    }

    public void setStr(String str) {
        this.str = str;
    }

    public boolean isBool() {
        return bool;
    }

    public void setBool(boolean bool) {
        this.bool = bool;
    }
}
