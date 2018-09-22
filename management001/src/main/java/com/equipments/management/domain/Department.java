package com.equipments.management.domain;

/**
 * Created by Administrator on 2017/5/8.
 */

public class Department {
    /**
     *
     * */
    private Integer id;
    private String name;
    private String cate;


    public Department() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getCate() {
        return cate;
    }

    public void setCate(String cate) {
        this.cate = cate;
    }

    @Override
    public String toString() {
        return "Department{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", cate='" + cate + '\'' +
                '}';
    }
}
