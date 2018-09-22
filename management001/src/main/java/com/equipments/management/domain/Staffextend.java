package com.equipments.management.domain;


import java.util.Date;

/**
// DROP TABLE IF EXISTS `eq_staff_extend`;
// CREATE TABLE `eq_staff_extend` (
// `extend_id` int(11) NOT NULL AUTO_INCREMENT,
// `staff_id` int(11) DEFAULT NULL,
// `task_id` int(11) DEFAULT NULL,
// `extend_nation` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_educationle` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_qkbzwhzc` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_qkbjxhjb` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_zzmianmao` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_bysjbyyx` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_wgysp` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_ywhuzhao` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_huzhaohao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_huzhaoyouxiaoqi` date DEFAULT NULL,
// `extend_gzjlsj001` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_gzjlsj002` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_gzjlsj003` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_gzjlsj004` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_gzjlsj005` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_gzjlcsgzjzw001` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_gzjlcsgzjzw002` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_gzjlcsgzjzw003` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_gzjlcsgzjzw004` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_gzjlcsgzjzw005` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_cgqksj001` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_cgqksj002` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_cgqksj003` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_cgqkgjjrw001` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_cgqkgjjrw002` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_cgqkgjjrw003` varchar(30) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_cgqkdwsf001` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_cgqkdwsf002` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_cgqkdwsf003` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_jtqkxm001` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_jtqkxm002` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_jtqkxm003` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_jtqkgx001` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_jtqkgx002` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_jtqkgx003` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_jtqkgzjzw001` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_jtqkgzjzw002` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_jtqkgzjzw003` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_jtqkgwf001` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_jtqkgwf002` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `extend_jtqkgwf003` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `staffdetail_yjfxcjgx` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
// `staffdetail_grjjgdzd` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
// `task_swscmxm` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `task_swscmdh` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
// `passport_ywhuzhao` varchar(5) COLLATE utf8_unicode_ci DEFAULT NULL,
// `passport_huzhaozhonglei` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
// `passport_huzhaohao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
// `passport_fazhaoriqi` date DEFAULT NULL,
// `passport_huzhaoyouxiaoqi` date DEFAULT NULL,
// `passport_yanqi` date DEFAULT NULL,
// `passport_beizhu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
// PRIMARY KEY (`extend_id`)
// ) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
 */


public class Staffextend {
    private Integer extendid;
    private Staff staffid;
    private Task taskid;
    //人员基本情况
    private String nation;
    private String educationle;
    private String qkbzwhzc;
    private String qkbjxhjb;
    private String zzmianmao;
    private String bysjbyyx;
    private String wgysp;

    //护照信息
    private String ywhuzhao;
    private String huzhaozhonglei;
    private String huzhaohao;
    private Date huzhaoyouxiaoqi;
    private String beizhu;
    private Date fazhaoriqi;
    private Date yanqi;


    //工作简历
    private String gzjlsj001;
    private String gzjlsj002;
    private String gzjlsj003;
    private String gzjlsj004;
    private String gzjlsj005;
    private String gzjlcsgzjzw001;
    private String gzjlcsgzjzw002;
    private String gzjlcsgzjzw003;
    private String gzjlcsgzjzw004;
    private String gzjlcsgzjzw005;

    //出国情况
    private String cgqksj001;
    private String cgqksj002;
    private String cgqksj003;
    private String cgqkgjjrw001;
    private String cgqkgjjrw002;
    private String cgqkgjjrw003;
    private String cgqkdwsf001;
    private String cgqkdwsf002;
    private String cgqkdwsf003;

    //家庭情况
    private String jtqkxm001;
    private String jtqkxm002;
    private String jtqkxm003;
    private String jtqkgx001;
    private String jtqkgx002;
    private String jtqkgx003;
    private String jtqkgzjzw001;
    private String jtqkgzjzw002;
    private String jtqkgzjzw003;
    private String jtqkgwf001;
    private String jtqkgwf002;
    private String jtqkgwf003;

    //个人研究方向，重点研究领域，突出成就和业绩贡献及尾随其后的固定废话
    private String yjfxcjgx;
    private String grjjgdzd;

    //所参谋及联系方式
    private String swscmxm;
    private String swscmdh;

    public Staffextend() {
    }

    public Staffextend(Integer extendid, Staff staffid, Task taskid, String nation, String educationle, String qkbzwhzc, String qkbjxhjb, String zzmianmao, String bysjbyyx, String wgysp, String ywhuzhao, String huzhaozhonglei, String huzhaohao, Date huzhaoyouxiaoqi, String beizhu, Date fazhaoriqi, Date yanqi, String gzjlsj001, String gzjlsj002, String gzjlsj003, String gzjlsj004, String gzjlsj005, String gzjlcsgzjzw001, String gzjlcsgzjzw002, String gzjlcsgzjzw003, String gzjlcsgzjzw004, String gzjlcsgzjzw005, String cgqksj001, String cgqksj002, String cgqksj003, String cgqkgjjrw001, String cgqkgjjrw002, String cgqkgjjrw003, String cgqkdwsf001, String cgqkdwsf002, String cgqkdwsf003, String jtqkxm001, String jtqkxm002, String jtqkxm003, String jtqkgx001, String jtqkgx002, String jtqkgx003, String jtqkgzjzw001, String jtqkgzjzw002, String jtqkgzjzw003, String jtqkgwf001, String jtqkgwf002, String jtqkgwf003, String yjfxcjgx, String grjjgdzd, String swscmxm, String swscmdh) {
        this.extendid = extendid;
        this.staffid = staffid;
        this.taskid = taskid;
        this.nation = nation;
        this.educationle = educationle;
        this.qkbzwhzc = qkbzwhzc;
        this.qkbjxhjb = qkbjxhjb;
        this.zzmianmao = zzmianmao;
        this.bysjbyyx = bysjbyyx;
        this.wgysp = wgysp;
        this.ywhuzhao = ywhuzhao;
        this.huzhaozhonglei = huzhaozhonglei;
        this.huzhaohao = huzhaohao;
        this.huzhaoyouxiaoqi = huzhaoyouxiaoqi;
        this.beizhu = beizhu;
        this.fazhaoriqi = fazhaoriqi;
        this.yanqi = yanqi;
        this.gzjlsj001 = gzjlsj001;
        this.gzjlsj002 = gzjlsj002;
        this.gzjlsj003 = gzjlsj003;
        this.gzjlsj004 = gzjlsj004;
        this.gzjlsj005 = gzjlsj005;
        this.gzjlcsgzjzw001 = gzjlcsgzjzw001;
        this.gzjlcsgzjzw002 = gzjlcsgzjzw002;
        this.gzjlcsgzjzw003 = gzjlcsgzjzw003;
        this.gzjlcsgzjzw004 = gzjlcsgzjzw004;
        this.gzjlcsgzjzw005 = gzjlcsgzjzw005;
        this.cgqksj001 = cgqksj001;
        this.cgqksj002 = cgqksj002;
        this.cgqksj003 = cgqksj003;
        this.cgqkgjjrw001 = cgqkgjjrw001;
        this.cgqkgjjrw002 = cgqkgjjrw002;
        this.cgqkgjjrw003 = cgqkgjjrw003;
        this.cgqkdwsf001 = cgqkdwsf001;
        this.cgqkdwsf002 = cgqkdwsf002;
        this.cgqkdwsf003 = cgqkdwsf003;
        this.jtqkxm001 = jtqkxm001;
        this.jtqkxm002 = jtqkxm002;
        this.jtqkxm003 = jtqkxm003;
        this.jtqkgx001 = jtqkgx001;
        this.jtqkgx002 = jtqkgx002;
        this.jtqkgx003 = jtqkgx003;
        this.jtqkgzjzw001 = jtqkgzjzw001;
        this.jtqkgzjzw002 = jtqkgzjzw002;
        this.jtqkgzjzw003 = jtqkgzjzw003;
        this.jtqkgwf001 = jtqkgwf001;
        this.jtqkgwf002 = jtqkgwf002;
        this.jtqkgwf003 = jtqkgwf003;
        this.yjfxcjgx = yjfxcjgx;
        this.grjjgdzd = grjjgdzd;
        this.swscmxm = swscmxm;
        this.swscmdh = swscmdh;
    }

    @Override
    public String toString() {
        return "Staffextend{" +
                "extendid=" + extendid +
                ", staffid=" + staffid +
                ", taskid=" + taskid +
                ", nation='" + nation + '\'' +
                ", educationle='" + educationle + '\'' +
                ", qkbzwhzc='" + qkbzwhzc + '\'' +
                ", qkbjxhjb='" + qkbjxhjb + '\'' +
                ", zzmianmao='" + zzmianmao + '\'' +
                ", bysjbyyx='" + bysjbyyx + '\'' +
                ", wgysp='" + wgysp + '\'' +
                ", ywhuzhao='" + ywhuzhao + '\'' +
                ", huzhaozhonglei='" + huzhaozhonglei + '\'' +
                ", huzhaohao='" + huzhaohao + '\'' +
                ", huzhaoyouxiaoqi=" + huzhaoyouxiaoqi +
                ", beizhu='" + beizhu + '\'' +
                ", fazhaoriqi=" + fazhaoriqi +
                ", yanqi=" + yanqi +
                ", gzjlsj001='" + gzjlsj001 + '\'' +
                ", gzjlsj002='" + gzjlsj002 + '\'' +
                ", gzjlsj003='" + gzjlsj003 + '\'' +
                ", gzjlsj004='" + gzjlsj004 + '\'' +
                ", gzjlsj005='" + gzjlsj005 + '\'' +
                ", gzjlcsgzjzw001='" + gzjlcsgzjzw001 + '\'' +
                ", gzjlcsgzjzw002='" + gzjlcsgzjzw002 + '\'' +
                ", gzjlcsgzjzw003='" + gzjlcsgzjzw003 + '\'' +
                ", gzjlcsgzjzw004='" + gzjlcsgzjzw004 + '\'' +
                ", gzjlcsgzjzw005='" + gzjlcsgzjzw005 + '\'' +
                ", cgqksj001='" + cgqksj001 + '\'' +
                ", cgqksj002='" + cgqksj002 + '\'' +
                ", cgqksj003='" + cgqksj003 + '\'' +
                ", cgqkgjjrw001='" + cgqkgjjrw001 + '\'' +
                ", cgqkgjjrw002='" + cgqkgjjrw002 + '\'' +
                ", cgqkgjjrw003='" + cgqkgjjrw003 + '\'' +
                ", cgqkdwsf001='" + cgqkdwsf001 + '\'' +
                ", cgqkdwsf002='" + cgqkdwsf002 + '\'' +
                ", cgqkdwsf003='" + cgqkdwsf003 + '\'' +
                ", jtqkxm001='" + jtqkxm001 + '\'' +
                ", jtqkxm002='" + jtqkxm002 + '\'' +
                ", jtqkxm003='" + jtqkxm003 + '\'' +
                ", jtqkgx001='" + jtqkgx001 + '\'' +
                ", jtqkgx002='" + jtqkgx002 + '\'' +
                ", jtqkgx003='" + jtqkgx003 + '\'' +
                ", jtqkgzjzw001='" + jtqkgzjzw001 + '\'' +
                ", jtqkgzjzw002='" + jtqkgzjzw002 + '\'' +
                ", jtqkgzjzw003='" + jtqkgzjzw003 + '\'' +
                ", jtqkgwf001='" + jtqkgwf001 + '\'' +
                ", jtqkgwf002='" + jtqkgwf002 + '\'' +
                ", jtqkgwf003='" + jtqkgwf003 + '\'' +
                ", yjfxcjgx='" + yjfxcjgx + '\'' +
                ", grjjgdzd='" + grjjgdzd + '\'' +
                ", swscmxm='" + swscmxm + '\'' +
                ", swscmdh='" + swscmdh + '\'' +
                '}';
    }

    public Integer getExtendid() {
        return extendid;
    }

    public void setExtendid(Integer extendid) {
        this.extendid = extendid;
    }

    public Staff getStaffid() {
        return staffid;
    }

    public void setStaffid(Staff staffid) {
        this.staffid = staffid;
    }

    public Task getTaskid() {
        return taskid;
    }

    public void setTaskid(Task taskid) {
        this.taskid = taskid;
    }

    public String getNation() {
        return nation;
    }

    public void setNation(String nation) {
        this.nation = nation;
    }

    public String getEducationle() {
        return educationle;
    }

    public void setEducationle(String educationle) {
        this.educationle = educationle;
    }

    public String getQkbzwhzc() {
        return qkbzwhzc;
    }

    public void setQkbzwhzc(String qkbzwhzc) {
        this.qkbzwhzc = qkbzwhzc;
    }

    public String getQkbjxhjb() {
        return qkbjxhjb;
    }

    public void setQkbjxhjb(String qkbjxhjb) {
        this.qkbjxhjb = qkbjxhjb;
    }

    public String getZzmianmao() {
        return zzmianmao;
    }

    public void setZzmianmao(String zzmianmao) {
        this.zzmianmao = zzmianmao;
    }

    public String getBysjbyyx() {
        return bysjbyyx;
    }

    public void setBysjbyyx(String bysjbyyx) {
        this.bysjbyyx = bysjbyyx;
    }

    public String getWgysp() {
        return wgysp;
    }

    public void setWgysp(String wgysp) {
        this.wgysp = wgysp;
    }

    public String getYwhuzhao() {
        return ywhuzhao;
    }

    public void setYwhuzhao(String ywhuzhao) {
        this.ywhuzhao = ywhuzhao;
    }

    public String getHuzhaozhonglei() {
        return huzhaozhonglei;
    }

    public void setHuzhaozhonglei(String huzhaozhonglei) {
        this.huzhaozhonglei = huzhaozhonglei;
    }

    public String getHuzhaohao() {
        return huzhaohao;
    }

    public void setHuzhaohao(String huzhaohao) {
        this.huzhaohao = huzhaohao;
    }

    public Date getHuzhaoyouxiaoqi() {
        return huzhaoyouxiaoqi;
    }

    public void setHuzhaoyouxiaoqi(Date huzhaoyouxiaoqi) {
        this.huzhaoyouxiaoqi = huzhaoyouxiaoqi;
    }

    public String getBeizhu() {
        return beizhu;
    }

    public void setBeizhu(String beizhu) {
        this.beizhu = beizhu;
    }

    public Date getFazhaoriqi() {
        return fazhaoriqi;
    }

    public void setFazhaoriqi(Date fazhaoriqi) {
        this.fazhaoriqi = fazhaoriqi;
    }

    public Date getYanqi() {
        return yanqi;
    }

    public void setYanqi(Date yanqi) {
        this.yanqi = yanqi;
    }

    public String getGzjlsj001() {
        return gzjlsj001;
    }

    public void setGzjlsj001(String gzjlsj001) {
        this.gzjlsj001 = gzjlsj001;
    }

    public String getGzjlsj002() {
        return gzjlsj002;
    }

    public void setGzjlsj002(String gzjlsj002) {
        this.gzjlsj002 = gzjlsj002;
    }

    public String getGzjlsj003() {
        return gzjlsj003;
    }

    public void setGzjlsj003(String gzjlsj003) {
        this.gzjlsj003 = gzjlsj003;
    }

    public String getGzjlsj004() {
        return gzjlsj004;
    }

    public void setGzjlsj004(String gzjlsj004) {
        this.gzjlsj004 = gzjlsj004;
    }

    public String getGzjlsj005() {
        return gzjlsj005;
    }

    public void setGzjlsj005(String gzjlsj005) {
        this.gzjlsj005 = gzjlsj005;
    }

    public String getGzjlcsgzjzw001() {
        return gzjlcsgzjzw001;
    }

    public void setGzjlcsgzjzw001(String gzjlcsgzjzw001) {
        this.gzjlcsgzjzw001 = gzjlcsgzjzw001;
    }

    public String getGzjlcsgzjzw002() {
        return gzjlcsgzjzw002;
    }

    public void setGzjlcsgzjzw002(String gzjlcsgzjzw002) {
        this.gzjlcsgzjzw002 = gzjlcsgzjzw002;
    }

    public String getGzjlcsgzjzw003() {
        return gzjlcsgzjzw003;
    }

    public void setGzjlcsgzjzw003(String gzjlcsgzjzw003) {
        this.gzjlcsgzjzw003 = gzjlcsgzjzw003;
    }

    public String getGzjlcsgzjzw004() {
        return gzjlcsgzjzw004;
    }

    public void setGzjlcsgzjzw004(String gzjlcsgzjzw004) {
        this.gzjlcsgzjzw004 = gzjlcsgzjzw004;
    }

    public String getGzjlcsgzjzw005() {
        return gzjlcsgzjzw005;
    }

    public void setGzjlcsgzjzw005(String gzjlcsgzjzw005) {
        this.gzjlcsgzjzw005 = gzjlcsgzjzw005;
    }

    public String getCgqksj001() {
        return cgqksj001;
    }

    public void setCgqksj001(String cgqksj001) {
        this.cgqksj001 = cgqksj001;
    }

    public String getCgqksj002() {
        return cgqksj002;
    }

    public void setCgqksj002(String cgqksj002) {
        this.cgqksj002 = cgqksj002;
    }

    public String getCgqksj003() {
        return cgqksj003;
    }

    public void setCgqksj003(String cgqksj003) {
        this.cgqksj003 = cgqksj003;
    }

    public String getCgqkgjjrw001() {
        return cgqkgjjrw001;
    }

    public void setCgqkgjjrw001(String cgqkgjjrw001) {
        this.cgqkgjjrw001 = cgqkgjjrw001;
    }

    public String getCgqkgjjrw002() {
        return cgqkgjjrw002;
    }

    public void setCgqkgjjrw002(String cgqkgjjrw002) {
        this.cgqkgjjrw002 = cgqkgjjrw002;
    }

    public String getCgqkgjjrw003() {
        return cgqkgjjrw003;
    }

    public void setCgqkgjjrw003(String cgqkgjjrw003) {
        this.cgqkgjjrw003 = cgqkgjjrw003;
    }

    public String getCgqkdwsf001() {
        return cgqkdwsf001;
    }

    public void setCgqkdwsf001(String cgqkdwsf001) {
        this.cgqkdwsf001 = cgqkdwsf001;
    }

    public String getCgqkdwsf002() {
        return cgqkdwsf002;
    }

    public void setCgqkdwsf002(String cgqkdwsf002) {
        this.cgqkdwsf002 = cgqkdwsf002;
    }

    public String getCgqkdwsf003() {
        return cgqkdwsf003;
    }

    public void setCgqkdwsf003(String cgqkdwsf003) {
        this.cgqkdwsf003 = cgqkdwsf003;
    }

    public String getJtqkxm001() {
        return jtqkxm001;
    }

    public void setJtqkxm001(String jtqkxm001) {
        this.jtqkxm001 = jtqkxm001;
    }

    public String getJtqkxm002() {
        return jtqkxm002;
    }

    public void setJtqkxm002(String jtqkxm002) {
        this.jtqkxm002 = jtqkxm002;
    }

    public String getJtqkxm003() {
        return jtqkxm003;
    }

    public void setJtqkxm003(String jtqkxm003) {
        this.jtqkxm003 = jtqkxm003;
    }

    public String getJtqkgx001() {
        return jtqkgx001;
    }

    public void setJtqkgx001(String jtqkgx001) {
        this.jtqkgx001 = jtqkgx001;
    }

    public String getJtqkgx002() {
        return jtqkgx002;
    }

    public void setJtqkgx002(String jtqkgx002) {
        this.jtqkgx002 = jtqkgx002;
    }

    public String getJtqkgx003() {
        return jtqkgx003;
    }

    public void setJtqkgx003(String jtqkgx003) {
        this.jtqkgx003 = jtqkgx003;
    }

    public String getJtqkgzjzw001() {
        return jtqkgzjzw001;
    }

    public void setJtqkgzjzw001(String jtqkgzjzw001) {
        this.jtqkgzjzw001 = jtqkgzjzw001;
    }

    public String getJtqkgzjzw002() {
        return jtqkgzjzw002;
    }

    public void setJtqkgzjzw002(String jtqkgzjzw002) {
        this.jtqkgzjzw002 = jtqkgzjzw002;
    }

    public String getJtqkgzjzw003() {
        return jtqkgzjzw003;
    }

    public void setJtqkgzjzw003(String jtqkgzjzw003) {
        this.jtqkgzjzw003 = jtqkgzjzw003;
    }

    public String getJtqkgwf001() {
        return jtqkgwf001;
    }

    public void setJtqkgwf001(String jtqkgwf001) {
        this.jtqkgwf001 = jtqkgwf001;
    }

    public String getJtqkgwf002() {
        return jtqkgwf002;
    }

    public void setJtqkgwf002(String jtqkgwf002) {
        this.jtqkgwf002 = jtqkgwf002;
    }

    public String getJtqkgwf003() {
        return jtqkgwf003;
    }

    public void setJtqkgwf003(String jtqkgwf003) {
        this.jtqkgwf003 = jtqkgwf003;
    }

    public String getYjfxcjgx() {
        return yjfxcjgx;
    }

    public void setYjfxcjgx(String yjfxcjgx) {
        this.yjfxcjgx = yjfxcjgx;
    }

    public String getGrjjgdzd() {
        return grjjgdzd;
    }

    public void setGrjjgdzd(String grjjgdzd) {
        this.grjjgdzd = grjjgdzd;
    }

    public String getSwscmxm() {
        return swscmxm;
    }

    public void setSwscmxm(String swscmxm) {
        this.swscmxm = swscmxm;
    }

    public String getSwscmdh() {
        return swscmdh;
    }

    public void setSwscmdh(String swscmdh) {
        this.swscmdh = swscmdh;
    }
}
