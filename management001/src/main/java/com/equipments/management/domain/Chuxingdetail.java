package com.equipments.management.domain;

import java.util.Date;

public class Chuxingdetail {
    //主外键信息
    private Integer chuxingdetailid;
    private Chuxing chuxingid;

    //合并记录的时间及描述
    private Date chuxingshijian;
    private String chuxingcontent;

    public Chuxingdetail() {
    }

    public Chuxingdetail(Integer chuxingdetailid, Chuxing chuxingid, Date chuxingshijian, String chuxingcontent) {
        this.chuxingdetailid = chuxingdetailid;
        this.chuxingid = chuxingid;
        this.chuxingshijian = chuxingshijian;
        this.chuxingcontent = chuxingcontent;
    }

    @Override
    public String toString() {
        return "Chuxingdetail{" +
                "chuxingdetailid=" + chuxingdetailid +
                ", chuxingid=" + chuxingid +
                ", chuxingshijian=" + chuxingshijian +
                ", chuxingcontent='" + chuxingcontent + '\'' +
                '}';
    }

    public Integer getChuxingdetailid() {
        return chuxingdetailid;
    }

    public void setChuxingdetailid(Integer chuxingdetailid) {
        this.chuxingdetailid = chuxingdetailid;
    }

    public Chuxing getChuxingid() {
        return chuxingid;
    }

    public void setChuxingid(Chuxing chuxingid) {
        this.chuxingid = chuxingid;
    }

    public Date getChuxingshijian() {
        return chuxingshijian;
    }

    public void setChuxingshijian(Date chuxingshijian) {
        this.chuxingshijian = chuxingshijian;
    }

    public String getChuxingcontent() {
        return chuxingcontent;
    }

    public void setChuxingcontent(String chuxingcontent) {
        this.chuxingcontent = chuxingcontent;
    }
}
