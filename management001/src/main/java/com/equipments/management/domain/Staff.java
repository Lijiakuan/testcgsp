package com.equipments.management.domain;

import java.util.Date;

/**
 * Created by Administrator on 2018/8/20.
 */

public class Staff {
    private Integer id;
    private String loginname;
    private String password;
    private Department department;
    private String name;
    private String gender;
    private String zhiwu;
    private String zhicheng;
    private String jishudengji;
    private String junxian;
    private String jsjjunxian;
    private String zhiwudengji;
    private String wenzhiji;
    private String phone;
    private String state;
    private String email;
    private String jgzid;
    private Integer grade;
    private String birthplace;
    private Date birthyday;

    public Staff() {
    }

    public Staff(String loginname, String password, Department department, String name, String gender, String zhiwu, String zhicheng, String jishudengji, String junxian, String jsjjunxian, String zhiwudengji, String wenzhiji, String phone, String state, String email, String jgzid, Integer grade, String birthplace, Date birthyday) {
        this.loginname = loginname;
        this.password = password;
        this.department = department;
        this.name = name;
        this.gender = gender;
        this.zhiwu = zhiwu;
        this.zhicheng = zhicheng;
        this.jishudengji = jishudengji;
        this.junxian = junxian;
        this.jsjjunxian = jsjjunxian;
        this.zhiwudengji = zhiwudengji;
        this.wenzhiji = wenzhiji;
        this.phone = phone;
        this.state = state;
        this.email = email;
        this.jgzid = jgzid;
        this.grade = grade;
        this.birthplace = birthplace;
        this.birthyday = birthyday;
    }

    @Override
    public String toString() {
        return "Staff{" +
                "id=" + id +
                ", loginname='" + loginname + '\'' +
                ", password='" + password + '\'' +
                ", department=" + department +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", zhiwu='" + zhiwu + '\'' +
                ", zhicheng='" + zhicheng + '\'' +
                ", jishudengji='" + jishudengji + '\'' +
                ", junxian='" + junxian + '\'' +
                ", jsjjunxian='" + jsjjunxian + '\'' +
                ", zhiwudengji='" + zhiwudengji + '\'' +
                ", wenzhiji='" + wenzhiji + '\'' +
                ", phone='" + phone + '\'' +
                ", state='" + state + '\'' +
                ", email='" + email + '\'' +
                ", jgzid='" + jgzid + '\'' +
                ", grade=" + grade +
                ", birthplace='" + birthplace + '\'' +
                ", birthyday=" + birthyday +
                '}';
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Department getDepartment() {
        return department;
    }

    public void setDepartment(Department department) {
        this.department = department;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getZhiwu() {
        return zhiwu;
    }

    public void setZhiwu(String zhiwu) {
        this.zhiwu = zhiwu;
    }

    public String getZhicheng() {
        return zhicheng;
    }

    public void setZhicheng(String zhicheng) {
        this.zhicheng = zhicheng;
    }

    public String getJishudengji() {
        return jishudengji;
    }

    public void setJishudengji(String jishudengji) {
        this.jishudengji = jishudengji;
    }

    public String getJunxian() {
        return junxian;
    }

    public void setJunxian(String junxian) {
        this.junxian = junxian;
    }

    public String getJsjjunxian() {
        return jsjjunxian;
    }

    public void setJsjjunxian(String jsjjunxian) {
        this.jsjjunxian = jsjjunxian;
    }

    public String getZhiwudengji() {
        return zhiwudengji;
    }

    public void setZhiwudengji(String zhiwudengji) {
        this.zhiwudengji = zhiwudengji;
    }

    public String getWenzhiji() {
        return wenzhiji;
    }

    public void setWenzhiji(String wenzhiji) {
        this.wenzhiji = wenzhiji;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getJgzid() {
        return jgzid;
    }

    public void setJgzid(String jgzid) {
        this.jgzid = jgzid;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public String getBirthplace() {
        return birthplace;
    }

    public void setBirthplace(String birthplace) {
        this.birthplace = birthplace;
    }

    public Date getBirthyday() {
        return birthyday;
    }

    public void setBirthyday(Date birthyday) {
        this.birthyday = birthyday;
    }
}
