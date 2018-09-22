package com.equipments.management.domain;

public class Chuxing {
    //主键外键信息
    private Integer chuxingid;
    private Task taskid;
    private Staff staffid;

    public Chuxing() {
    }

    public Chuxing(Integer chuxingid, Task taskid, Staff staffid) {
        this.chuxingid = chuxingid;
        this.taskid = taskid;
        this.staffid = staffid;
    }

    @Override
    public String toString() {
        return "Chuxing{" +
                "chuxingid=" + chuxingid +
                ", taskid=" + taskid +
                ", staffid=" + staffid +
                '}';
    }

    public Integer getChuxingid() {
        return chuxingid;
    }

    public void setChuxingid(Integer chuxingid) {
        this.chuxingid = chuxingid;
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
}
