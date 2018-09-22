package com.equipments.management.domain;

import java.util.Date;

public class News {
    //主键信息
    private Integer newsid;
    private String newstitle;
    private String newcontent;
    private Date newstime;

    public News() {
    }

    public News(Integer newsid, String newstitle, String newcontent, Date newstime) {
        this.newsid = newsid;
        this.newstitle = newstitle;
        this.newcontent = newcontent;
        this.newstime = newstime;
    }

    @Override
    public String toString() {
        return "News{" +
                "newsid=" + newsid +
                ", newstitle='" + newstitle + '\'' +
                ", newcontent='" + newcontent + '\'' +
                ", newstime=" + newstime +
                '}';
    }

    public Integer getNewsid() {
        return newsid;
    }

    public void setNewsid(Integer newsid) {
        this.newsid = newsid;
    }

    public String getNewstitle() {
        return newstitle;
    }

    public void setNewstitle(String newstitle) {
        this.newstitle = newstitle;
    }

    public String getNewcontent() {
        return newcontent;
    }

    public void setNewcontent(String newcontent) {
        this.newcontent = newcontent;
    }

    public Date getNewstime() {
        return newstime;
    }

    public void setNewstime(Date newstime) {
        this.newstime = newstime;
    }
}
