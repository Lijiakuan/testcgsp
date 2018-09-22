package com.equipments.management.dao;

/**
 * Created by Administrator on 2017/10/27.
 */

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONException;
import com.alibaba.fastjson.JSONObject;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.sql.*;
import java.util.Map;
import java.util.Properties;


//Kylin数据库连接工具类
public class KylinUtil {
    Driver driver = null;
    Properties info = null;
    Connection conn = null;
    Statement state = null;
    ResultSet resultSet = null;

    //配置参数
    String encoding;
    String baseURL;
    String jdbcURL;
    String userStr = "ADMIN";
    String passwordStr = "KYLIN";
    String kylinIp = "192.168.1.105";
    String kylinProject = "learn_kylin";
    String kylinPort = "7070";

    public KylinUtil() throws Exception {
    }



    //JDBC方式
    //开启数据库连接
    public boolean connKylin(){
        //初始化字符串
        //baseURL = "http://" + kylinIp + ":" + kylinPort +"/kylin/api";
        jdbcURL = "jdbc:kylin://" + kylinIp + ":" + kylinPort + "/" + kylinProject;

        try {
            driver = (Driver) Class.forName("org.apache.kylin.jdbc.Driver").newInstance();
            info = new Properties();
            info.put("user",userStr);
            info.put("password",passwordStr);
            try {
                conn = driver.connect(jdbcURL,info);
            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }
            try {
                state = conn.createStatement();
            } catch (SQLException e) {
                e.printStackTrace();
                return false;
            }
        } catch (InstantiationException e) {
            e.printStackTrace();
            return false;
        } catch (IllegalAccessException e) {
            e.printStackTrace();
            return false;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }
    //关闭数据库连接
    public boolean closeKylin(){
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        conn = null;
        return true;
    }
    //执行查询任务
    public ResultSet QueryWork(String executeSQL)throws Exception {
        if(this.conn==null){
            this.connKylin();
        }
        resultSet = state.executeQuery(executeSQL);
        return this.resultSet;
    }
    //rs2json
    public JSONArray resultSetToJson(ResultSet rs) throws SQLException,JSONException {
        JSONArray array = new JSONArray();

        ResultSetMetaData metaData = rs.getMetaData();
        int columnCount = metaData.getColumnCount();

        while (rs.next()) {
            JSONObject jsonObj = new JSONObject();

            for (int i = 1; i <= columnCount; i++) {
                String columnName =metaData.getColumnLabel(i);
                String value = rs.getString(columnName);
                jsonObj.put(columnName, value);
            }
            array.add(jsonObj);
        }
        return array;
    }


    //以下为RESTFUL API方式
    //执行RESTFUL函数
    public StringBuffer excute(String kylinIp, String para, String method, String params) {
        StringBuffer out = new StringBuffer();
        try {
            URL url = new URL("http://" + kylinIp + ":7070" + "/kylin/api" + para);
            System.out.println(url);
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod(method);
            connection.setDoOutput(true);
            connection.setRequestProperty("Authorization", "Basic " + encoding);
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setConnectTimeout(1000*30);
            if (params != null) {
                byte[] outputInBytes = params.getBytes("UTF-8");
                OutputStream os = connection.getOutputStream();
                os.write(outputInBytes);
                os.close();
            }
            InputStream content = (InputStream) connection.getInputStream();
            // 解决乱码问题
            BufferedReader in  = new BufferedReader (new InputStreamReader (content));
            String line;
            while ((line = in.readLine()) != null) {
                out.append(line);
            }
            in.close();
            connection.disconnect();

        } catch (Exception e) {
            e.printStackTrace();
        }
        return out;
    }
    //获得数据库连接

    public String testWork(String user,String passwd){
        String para = "/user/authentication";
        byte[] key = (user+":"+passwd).getBytes();
        encoding = new sun.misc.BASE64Encoder().encode(key);
        return encoding;
    }

    public StringBuffer login(String user,String passwd){
        String method = "POST";
        String para = "/user/authentication";
        byte[] key = (user+":"+passwd).getBytes();
        encoding = new sun.misc.BASE64Encoder().encode(key);
        return excute(kylinIp,para,method,null);
    }
    public StringBuffer getJob(String cubeName, String params) {
        //判断是否连接

        String method = "GET";
        String para = "/api/jobs" + cubeName;
        return excute(kylinIp, para, method, params);
    }
    public StringBuffer getSeg(String cubeName, String params) {
        String method = "GET";
        String para = "/cubes/" + cubeName;
        return excute(kylinIp, para, method, params);
    }
    /**
     * 获取所有的cube名称 
     *
     * @param params
     * @return
     */
    public StringBuffer getList(String params) {
        String method = "GET";
        String para = "/cubes";
        return excute(kylinIp, para, method, params);
    }

    /**
     * Rebuild Cube 
     *
     * @param cubeName
     * @param params
     * @return
     */
    public StringBuffer buildCube(String cubeName, String params) {
        String method = "PUT";
        String para = "/cubes/" + cubeName + "/rebuild";
        return excute(kylinIp, para, method, params);
    }

    /**
     * discard掉某个job 
     *
     * @param jobId
     * @param params
     */
    public void discard(String jobId, String params) {
        String method = "PUT";
        String para = "/jobs" + jobId + "/cancel";
        excute(kylinIp, para, method, params);
    }

    /**
     * refresh Cube 
     *
     * @param startTime
     * @param endTime
     * @param refreshCube
     * @return
     */
    public StringBuffer refresh(Date startTime, Date endTime, String refreshCube) {
        String body = "{\"startTime\":\"" + startTime.getTime() + "\", \"endTime\":\"" + endTime.getTime()
                + "\", \"buildType\":\"REFRESH\"}";
        StringBuffer refreshResult = new StringBuffer();
        refreshResult.append(buildCube(refreshCube, body));
        return refreshResult;
    }

    /**
     * add Segment 
     *
     * @param startTime
     * @param endTime
     * @param addCube
     * @return
     */
    public StringBuffer add(Date startTime, Date endTime, String addCube) {
        String body = "{\"startTime\":\"" + startTime.getTime() + "\", \"endTime\":\"" + endTime.getTime()
                + "\", \"buildType\":\"BUILD\"}";
        StringBuffer addResult = new StringBuffer();
        addResult.append(buildCube(addCube, body));
        return addResult;
    }  

     /**
     * 通过kylin进行查询 
     *
     * @param params
     * @return
     */
    public StringBuffer query(String params) {
        String method = "POST";
        String para = "/query";
        return excute(kylinIp, para, method, params);
    }

    /**
     * kylin查询主体信息 
     *
     * @param sql
     * @param lookupId
     * @param projectName
     * @return
     */
    public StringBuffer getTableTime(String sql, String lookupId, String projectName,Integer kylinLimit) {
        String body = "{\"sql\": \"" + sql + lookupId + "\",\"offset\":0,\"limit\":" + kylinLimit
                + ",\"acceptPartial\":false, \"project\":\"" + projectName + "\"}";
        StringBuffer queryResult = query(body);
        return queryResult;
    }


}
