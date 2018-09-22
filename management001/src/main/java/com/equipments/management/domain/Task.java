package com.equipments.management.domain;

import java.util.Date;

/**
 * Created by Administrator on 2018/9/19.
 DROP TABLE IF EXISTS `hb_task1`;
 CREATE TABLE `hb_task1` (
 `taskhb_id1` int(11) NOT NULL AUTO_INCREMENT,
 `taskhb_id2` int(11) DEFAULT NULL,
 `taskhb_tarcountry` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
 `taskhb_tarcity` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
 `taskhb_type` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
 `taskhb_cjcfbeg` date DEFAULT NULL,
 `taskhb_cjggend` date DEFAULT NULL,
 `taskhb_qsjdz` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
 `taskhb_significance` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
 `taskhb_zhuangtai` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
 `taskhb_beizhu` varchar(700) COLLATE utf8_unicode_ci DEFAULT NULL,
 `taskhb_cjsj` date DEFAULT NULL,
 `taskhb_xgsj` date DEFAULT NULL,
 PRIMARY KEY (`taskhb_id1`)
 ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

 */
public class Task {
    private Integer id;
    private Hbtask1 taskhbid1;

    //任务基本情况
    private String name;
    private String tarcountry;
    private String tarcity;
    private String type;
    private String purposemap;
    private Date cjcfbeg;
    private Date cjggend;
    private Date lijingshijian;
    private Date rujingshijian;
    private String jiaoliutimu;

    //会议的影响力，参会的背景、意义、重要性
    private String significance;

    //4类附件地址
    private String cgryqkbaddr;
    private String bmzrsaddr;
    private String yqhaddrzw;
    private String yqhaddryw;
    private String xcapzw;
    private String xcapyw;

    //任务状态信息及描述
    private String zhuangtai;
    private String beizhu;
    private Date cjsj;
    private Date xgsj;


    public Task() {
    }

    public Task(Integer id, Hbtask1 taskhbid1, String name, String tarcountry, String tarcity, String type, String purposemap, Date cjcfbeg, Date cjggend, Date lijingshijian, Date rujingshijian, String jiaoliutimu, String significance, String cgryqkbaddr, String bmzrsaddr, String yqhaddrzw, String yqhaddryw, String xcapzw, String xcapyw, String zhuangtai, String beizhu, Date cjsj, Date xgsj) {
        this.id = id;
        this.taskhbid1 = taskhbid1;
        this.name = name;
        this.tarcountry = tarcountry;
        this.tarcity = tarcity;
        this.type = type;
        this.purposemap = purposemap;
        this.cjcfbeg = cjcfbeg;
        this.cjggend = cjggend;
        this.lijingshijian = lijingshijian;
        this.rujingshijian = rujingshijian;
        this.jiaoliutimu = jiaoliutimu;
        this.significance = significance;
        this.cgryqkbaddr = cgryqkbaddr;
        this.bmzrsaddr = bmzrsaddr;
        this.yqhaddrzw = yqhaddrzw;
        this.yqhaddryw = yqhaddryw;
        this.xcapzw = xcapzw;
        this.xcapyw = xcapyw;
        this.zhuangtai = zhuangtai;
        this.beizhu = beizhu;
        this.cjsj = cjsj;
        this.xgsj = xgsj;
    }

    @Override
    public String toString() {
        return "Task{" +
                "id=" + id +
                ", taskhbid1=" + taskhbid1 +
                ", name='" + name + '\'' +
                ", tarcountry='" + tarcountry + '\'' +
                ", tarcity='" + tarcity + '\'' +
                ", type='" + type + '\'' +
                ", purposemap='" + purposemap + '\'' +
                ", cjcfbeg=" + cjcfbeg +
                ", cjggend=" + cjggend +
                ", lijingshijian=" + lijingshijian +
                ", rujingshijian=" + rujingshijian +
                ", jiaoliutimu='" + jiaoliutimu + '\'' +
                ", significance='" + significance + '\'' +
                ", cgryqkbaddr='" + cgryqkbaddr + '\'' +
                ", bmzrsaddr='" + bmzrsaddr + '\'' +
                ", yqhaddrzw='" + yqhaddrzw + '\'' +
                ", yqhaddryw='" + yqhaddryw + '\'' +
                ", xcapzw='" + xcapzw + '\'' +
                ", xcapyw='" + xcapyw + '\'' +
                ", zhuangtai='" + zhuangtai + '\'' +
                ", beizhu='" + beizhu + '\'' +
                ", cjsj=" + cjsj +
                ", xgsj=" + xgsj +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Hbtask1 getTaskhbid1() {
        return taskhbid1;
    }

    public void setTaskhbid1(Hbtask1 taskhbid1) {
        this.taskhbid1 = taskhbid1;
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

    public String getPurposemap() {
        return purposemap;
    }

    public void setPurposemap(String purposemap) {
        this.purposemap = purposemap;
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

    public Date getLijingshijian() {
        return lijingshijian;
    }

    public void setLijingshijian(Date lijingshijian) {
        this.lijingshijian = lijingshijian;
    }

    public Date getRujingshijian() {
        return rujingshijian;
    }

    public void setRujingshijian(Date rujingshijian) {
        this.rujingshijian = rujingshijian;
    }

    public String getJiaoliutimu() {
        return jiaoliutimu;
    }

    public void setJiaoliutimu(String jiaoliutimu) {
        this.jiaoliutimu = jiaoliutimu;
    }

    public String getSignificance() {
        return significance;
    }

    public void setSignificance(String significance) {
        this.significance = significance;
    }

    public String getCgryqkbaddr() {
        return cgryqkbaddr;
    }

    public void setCgryqkbaddr(String cgryqkbaddr) {
        this.cgryqkbaddr = cgryqkbaddr;
    }

    public String getBmzrsaddr() {
        return bmzrsaddr;
    }

    public void setBmzrsaddr(String bmzrsaddr) {
        this.bmzrsaddr = bmzrsaddr;
    }

    public String getYqhaddrzw() {
        return yqhaddrzw;
    }

    public void setYqhaddrzw(String yqhaddrzw) {
        this.yqhaddrzw = yqhaddrzw;
    }

    public String getYqhaddryw() {
        return yqhaddryw;
    }

    public void setYqhaddryw(String yqhaddryw) {
        this.yqhaddryw = yqhaddryw;
    }

    public String getXcapzw() {
        return xcapzw;
    }

    public void setXcapzw(String xcapzw) {
        this.xcapzw = xcapzw;
    }

    public String getXcapyw() {
        return xcapyw;
    }

    public void setXcapyw(String xcapyw) {
        this.xcapyw = xcapyw;
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
}
