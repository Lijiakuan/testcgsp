package com.equipments.management.util;

import sun.misc.BASE64Encoder;

import java.io.FileInputStream;
import java.io.InputStream;

/**
 * Created by Administrator on 2017/6/13.
 */
public class Image2Str {
    private String img;
    private byte[] data;

    public Image2Str(){
        data = null;
    }

    public Image2Str(String img){
        this.img = img;
        data = null;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public byte[] getData() {
        return data;
    }

    public void setData(byte[] data) {
        this.data = data;
    }

    public String getImageStr() {
        //String imgFile = "d:/aa.png";
        InputStream in = null;
        //byte[] data = null;
        try {
            in = new FileInputStream(img);
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(data);
    }
}
