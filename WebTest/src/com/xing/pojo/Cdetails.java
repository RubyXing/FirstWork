package com.xing.pojo;


public class Cdetails {

    private int did;
    private int dlessons;
    private int dsmaller;
    private double dscore;
    private String dimgaddress;


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

    @Override
    public String toString() {
        return "Cdetails{" +
                "did=" + did +
                ", dlessons=" + dlessons +
                '}';
    }
}
