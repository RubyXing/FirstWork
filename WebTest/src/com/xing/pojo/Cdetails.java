package com.xing.pojo;


public class Cdetails {

    private int did;
    private int dlessons;
    private int dsmaller;
    private double dscore;
    private String dimgaddress;
    private String lessonpage;


    public int getDid() {
        return did;
    }

    public void setDid(int did) {
        this.did = did;
    }


    public int getDlessons() {
        return dlessons;
    }

    public void setDlessons(int dlessons) {
        this.dlessons = dlessons;
    }


    public int getDsmaller() {
        return dsmaller;
    }

    public void setDsmaller(int dsmaller) {
        this.dsmaller = dsmaller;
    }


    public double getDscore() {
        return dscore;
    }

    public void setDscore(double dscore) {
        this.dscore = dscore;
    }


    public String getDimgaddress() {
        return dimgaddress;
    }

    public void setDimgaddress(String dimgaddress) {
        this.dimgaddress = dimgaddress;
    }

    public String getLessonpage() {
        return lessonpage;
    }

    public void setLessonpage(String lessonpage) {
        this.lessonpage = lessonpage;
    }

    @Override
    public String toString() {
        return "Cdetails{" +
                "did=" + did +
                ", dlessons=" + dlessons +
                ", dsmaller=" + dsmaller +
                ", dscore=" + dscore +
                ", dimgaddress='" + dimgaddress + '\'' +
                ", lessonpage='" + lessonpage + '\'' +
                '}';
    }
}
