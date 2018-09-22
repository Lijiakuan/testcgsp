package com.equipments.management.domain;

import java.util.Date;

public class Baomi {
    //主键外键信息
    private Integer id;
    private Task taskid;
    private Staff staffid;

    //保密表基本情况
    private String buzhibie;
    private String zhiji;
    private Date jwtlbeg;
    private Date jwtlend;

   //携带涉密设备信息
    private String xddzsblx1;
    private String xddzsblx2;
    private String xddzsbxh1;
    private String xddzsbxh2;
    private String xddzsbsmdj1;
    private String xddzsbsmdj2;

    private Integer xddzsbyf;
    private String duihao1;

    //携带涉密资料信息
    private String xdsmzlmc1;
    private String xdsmzlmc2;
    private Integer xdsmzlfs1;
    private Integer xdsmzlfs2;
    private String xdsmzlsmdj1;
    private String xdsmzlsmdj2;
    private Integer xdsmzlyf;
    private String duihao2;

    public Baomi() {
    }

    public Baomi(Integer id, Task taskid, Staff staffid, String buzhibie, String zhiji, Date jwtlbeg, Date jwtlend, String xddzsblx1, String xddzsblx2, String xddzsbxh1, String xddzsbxh2, String xddzsbsmdj1, String xddzsbsmdj2, Integer xddzsbyf, String duihao1, String xdsmzlmc1, String xdsmzlmc2, Integer xdsmzlfs1, Integer xdsmzlfs2, String xdsmzlsmdj1, String xdsmzlsmdj2, Integer xdsmzlyf, String duihao2) {
        this.id = id;
        this.taskid = taskid;
        this.staffid = staffid;
        this.buzhibie = buzhibie;
        this.zhiji = zhiji;
        this.jwtlbeg = jwtlbeg;
        this.jwtlend = jwtlend;
        this.xddzsblx1 = xddzsblx1;
        this.xddzsblx2 = xddzsblx2;
        this.xddzsbxh1 = xddzsbxh1;
        this.xddzsbxh2 = xddzsbxh2;
        this.xddzsbsmdj1 = xddzsbsmdj1;
        this.xddzsbsmdj2 = xddzsbsmdj2;
        this.xddzsbyf = xddzsbyf;
        this.duihao1 = duihao1;
        this.xdsmzlmc1 = xdsmzlmc1;
        this.xdsmzlmc2 = xdsmzlmc2;
        this.xdsmzlfs1 = xdsmzlfs1;
        this.xdsmzlfs2 = xdsmzlfs2;
        this.xdsmzlsmdj1 = xdsmzlsmdj1;
        this.xdsmzlsmdj2 = xdsmzlsmdj2;
        this.xdsmzlyf = xdsmzlyf;
        this.duihao2 = duihao2;
    }

    @Override
    public String toString() {
        return "Baomi{" +
                "id=" + id +
                ", taskid=" + taskid +
                ", staffid=" + staffid +
                ", buzhibie='" + buzhibie + '\'' +
                ", zhiji='" + zhiji + '\'' +
                ", jwtlbeg=" + jwtlbeg +
                ", jwtlend=" + jwtlend +
                ", xddzsblx1='" + xddzsblx1 + '\'' +
                ", xddzsblx2='" + xddzsblx2 + '\'' +
                ", xddzsbxh1='" + xddzsbxh1 + '\'' +
                ", xddzsbxh2='" + xddzsbxh2 + '\'' +
                ", xddzsbsmdj1='" + xddzsbsmdj1 + '\'' +
                ", xddzsbsmdj2='" + xddzsbsmdj2 + '\'' +
                ", xddzsbyf=" + xddzsbyf +
                ", duihao1='" + duihao1 + '\'' +
                ", xdsmzlmc1='" + xdsmzlmc1 + '\'' +
                ", xdsmzlmc2='" + xdsmzlmc2 + '\'' +
                ", xdsmzlfs1=" + xdsmzlfs1 +
                ", xdsmzlfs2=" + xdsmzlfs2 +
                ", xdsmzlsmdj1='" + xdsmzlsmdj1 + '\'' +
                ", xdsmzlsmdj2='" + xdsmzlsmdj2 + '\'' +
                ", xdsmzlyf=" + xdsmzlyf +
                ", duihao2='" + duihao2 + '\'' +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Task getTaskid() {
        return taskid;
    }

    public void setTaskid(Task taskid) {
        this.taskid = taskid;
    }

    public Staff getStaffid() {
        return staffid;
    }

    public void setStaffid(Staff staffid) {
        this.staffid = staffid;
    }

    public String getBuzhibie() {
        return buzhibie;
    }

    public void setBuzhibie(String buzhibie) {
        this.buzhibie = buzhibie;
    }

    public String getZhiji() {
        return zhiji;
    }

    public void setZhiji(String zhiji) {
        this.zhiji = zhiji;
    }

    public Date getJwtlbeg() {
        return jwtlbeg;
    }

    public void setJwtlbeg(Date jwtlbeg) {
        this.jwtlbeg = jwtlbeg;
    }

    public Date getJwtlend() {
        return jwtlend;
    }

    public void setJwtlend(Date jwtlend) {
        this.jwtlend = jwtlend;
    }

    public String getXddzsblx1() {
        return xddzsblx1;
    }

    public void setXddzsblx1(String xddzsblx1) {
        this.xddzsblx1 = xddzsblx1;
    }

    public String getXddzsblx2() {
        return xddzsblx2;
    }

    public void setXddzsblx2(String xddzsblx2) {
        this.xddzsblx2 = xddzsblx2;
    }

    public String getXddzsbxh1() {
        return xddzsbxh1;
    }

    public void setXddzsbxh1(String xddzsbxh1) {
        this.xddzsbxh1 = xddzsbxh1;
    }

    public String getXddzsbxh2() {
        return xddzsbxh2;
    }

    public void setXddzsbxh2(String xddzsbxh2) {
        this.xddzsbxh2 = xddzsbxh2;
    }

    public String getXddzsbsmdj1() {
        return xddzsbsmdj1;
    }

    public void setXddzsbsmdj1(String xddzsbsmdj1) {
        this.xddzsbsmdj1 = xddzsbsmdj1;
    }

    public String getXddzsbsmdj2() {
        return xddzsbsmdj2;
    }

    public void setXddzsbsmdj2(String xddzsbsmdj2) {
        this.xddzsbsmdj2 = xddzsbsmdj2;
    }

    public Integer getXddzsbyf() {
        return xddzsbyf;
    }

    public void setXddzsbyf(Integer xddzsbyf) {
        this.xddzsbyf = xddzsbyf;
    }

    public String getDuihao1() {
        return duihao1;
    }

    public void setDuihao1(String duihao1) {
        this.duihao1 = duihao1;
    }

    public String getXdsmzlmc1() {
        return xdsmzlmc1;
    }

    public void setXdsmzlmc1(String xdsmzlmc1) {
        this.xdsmzlmc1 = xdsmzlmc1;
    }

    public String getXdsmzlmc2() {
        return xdsmzlmc2;
    }

    public void setXdsmzlmc2(String xdsmzlmc2) {
        this.xdsmzlmc2 = xdsmzlmc2;
    }

    public Integer getXdsmzlfs1() {
        return xdsmzlfs1;
    }

    public void setXdsmzlfs1(Integer xdsmzlfs1) {
        this.xdsmzlfs1 = xdsmzlfs1;
    }

    public Integer getXdsmzlfs2() {
        return xdsmzlfs2;
    }

    public void setXdsmzlfs2(Integer xdsmzlfs2) {
        this.xdsmzlfs2 = xdsmzlfs2;
    }

    public String getXdsmzlsmdj1() {
        return xdsmzlsmdj1;
    }

    public void setXdsmzlsmdj1(String xdsmzlsmdj1) {
        this.xdsmzlsmdj1 = xdsmzlsmdj1;
    }

    public String getXdsmzlsmdj2() {
        return xdsmzlsmdj2;
    }

    public void setXdsmzlsmdj2(String xdsmzlsmdj2) {
        this.xdsmzlsmdj2 = xdsmzlsmdj2;
    }

    public Integer getXdsmzlyf() {
        return xdsmzlyf;
    }

    public void setXdsmzlyf(Integer xdsmzlyf) {
        this.xdsmzlyf = xdsmzlyf;
    }

    public String getDuihao2() {
        return duihao2;
    }

    public void setDuihao2(String duihao2) {
        this.duihao2 = duihao2;
    }
}
