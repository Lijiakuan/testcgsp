package com.equipments.management.domain;

import java.util.Date;

public class Hbtask1 {
    private Integer taskhbid1;
    private  Hbtask2 taskhbid2;

    //所参谋需要确定选择的字段
    private String name;
    private String tarcountry;
    private String tarcity;
    private String type;
    private Date cjcfbeg;
    private Date cjggend;
    private Date lijingbeg;
    private Date rujingend;
    private String significance;

    //所参谋初审字段
    private String zhuangtai;
    private String beizhu;
    private Date cjsj;
    private Date xgsj;

    //请示件存储地址
    private String  qsjdz;

    public Hbtask1() {
    }

    public Hbtask1(Integer taskhbid1, Hbtask2 taskhbid2, String name, String tarcountry, String tarcity, String type, Date cjcfbeg, Date cjggend, Date lijingbeg, Date rujingend, String significance, String zhuangtai, String beizhu, Date cjsj, Date xgsj, String qsjdz) {
        this.taskhbid1 = taskhbid1;
        this.taskhbid2 = taskhbid2;
        this.name = name;
        this.tarcountry = tarcountry;
        this.tarcity = tarcity;
        this.type = type;
        this.cjcfbeg = cjcfbeg;
        this.cjggend = cjggend;
        this.lijingbeg = lijingbeg;
        this.rujingend = rujingend;
        this.significance = significance;
        this.zhuangtai = zhuangtai;
        this.beizhu = beizhu;
        this.cjsj = cjsj;
        this.xgsj = xgsj;
        this.qsjdz = qsjdz;
    }

    @Override
    public String toString() {
        return "Hbtask1{" +
                "taskhbid1=" + taskhbid1 +
                ", taskhbid2=" + taskhbid2 +
                ", name='" + name + '\'' +
                ", tarcountry='" + tarcountry + '\'' +
                ", tarcity='" + tarcity + '\'' +
                ", type='" + type + '\'' +
                ", cjcfbeg=" + cjcfbeg +
                ", cjggend=" + cjggend +
                ", lijingbeg=" + lijingbeg +
                ", rujingend=" + rujingend +
                ", significance='" + significance + '\'' +
                ", zhuangtai='" + zhuangtai + '\'' +
                ", beizhu='" + beizhu + '\'' +
                ", cjsj=" + cjsj +
                ", xgsj=" + xgsj +
                ", qsjdz='" + qsjdz + '\'' +
                '}';
    }

    public Integer getTaskhbid1() {
        return taskhbid1;
    }

    public void setTaskhbid1(Integer taskhbid1) {
        this.taskhbid1 = taskhbid1;
    }

    public Hbtask2 getTaskhbid2() {
        return taskhbid2;
    }

    public void setTaskhbid2(Hbtask2 taskhbid2) {
        this.taskhbid2 = taskhbid2;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTarcountry() {
        return tarcountry;
    }

    public void setTarcountry(String tarcountry) {
        this.tarcountry = tarcountry;
    }

    public String getTarcity() {
        return tarcity;
    }

    public void setTarcity(String tarcity) {
        this.tarcity = tarcity;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Date getCjcfbeg() {
        return cjcfbeg;
    }

    public void setCjcfbeg(Date cjcfbeg) {
        this.cjcfbeg = cjcfbeg;
    }

    public Date getCjggend() {
        return cjggend;
    }

    public void setCjggend(Date cjggend) {
        this.cjggend = cjggend;
    }

    public Date getLijingbeg() {
        return lijingbeg;
    }

    public void setLijingbeg(Date lijingbeg) {
        this.lijingbeg = lijingbeg;
    }

    public Date getRujingend() {
        return rujingend;
    }

    public void setRujingend(Date rujingend) {
        this.rujingend = rujingend;
    }

    public String getSignificance() {
        return significance;
    }

    public void setSignificance(String significance) {
        this.significance = significance;
    }

    public String getZhuangtai() {
        return zhuangtai;
    }

    public void setZhuangtai(String zhuangtai) {
        this.zhuangtai = zhuangtai;
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }

    public Date getCjsj() {
        return cjsj;
    }

    public void setCjsj(Date cjsj) {
        this.cjsj = cjsj;
    }

    public Date getXgsj() {
        return xgsj;
    }

    public void setXgsj(Date xgsj) {
        this.xgsj = xgsj;
    }

    public String getQsjdz() {
        return qsjdz;
    }

    public void setQsjdz(String qsjdz) {
        this.qsjdz = qsjdz;
    }
}
