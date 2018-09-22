package com.equipments.management.controller;

//import com.alibaba.fastjson.JSONArray;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.equipments.management.domain.Department;
import com.equipments.management.domain.Staff;
import com.equipments.management.domain.Staffextend;
import com.equipments.management.dto.ExportDoc;
import freemarker.template.Configuration;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * Created by Administrator on 2018/5/2.
 */
@Controller
public class EqController {

    //添加日志器
    private static final Logger logger = LoggerFactory.getLogger(EqController.class);
    private static SqlSession sqlSession;
    private static String statement;
    private static SqlSessionFactory factory;

    private final static String DATE_FORMATE = "yyyy-MM-dd";

    static{
        String resource = "mybatis-conf.xml";
        //InputStream is = EqController.class.getClassLoader().getResourceAsStream(resource);
        InputStream is = null;
        try {
            is = Resources.getResourceAsStream(resource);
        } catch (IOException e) {
            e.printStackTrace();
        }
        if (is == null) {
            throw new IllegalArgumentException(
                    " is not visible from class loader.............................");
        }
        factory = new SqlSessionFactoryBuilder().build(is);
    }

    public EqController(){
        super();
    }

    //登录界面login.jsp
    @RequestMapping(value = "/login")
    public String loginForm(
            @RequestParam("loginname") String loginname,
            @RequestParam("password") String password,

            HttpServletRequest request){
        logger.info("登录名："+loginname+" 密码："+password);

        Map<String,Object> tempMap = new HashMap<String, Object>();
        tempMap.put("loginname",loginname);
        tempMap.put("password",password);


        sqlSession = factory.openSession(true);


        List<Staff> staffList = sqlSession.selectList("com.equipments.management.mapper.StaffMapper.getStaffByAll",tempMap);

        sqlSession.close();
        if(staffList.isEmpty()){
            //logger.info("--------------register-------------------");
            return "register";
        }
        else {
            //logger.info("-----------------index-------------------");
            HttpSession session = request.getSession();
            session.setAttribute("staff",staffList.get(0));

        /*
         * grade为1：
         * grade为2：
         * grade为3：
         * */
            if(staffList.get(0).getGrade()==3) {
                return  "cgsqy";
            }
            else{
                if(staffList.get(0).getGrade()==2){
                    return "scmy";
                }
                else{
                    return "index";
                }
                }



        }
    }

    public static Logger getLogger() {
        return logger;
    }

    public static SqlSession getSqlSession() {
        return sqlSession;
    }

    public static void setSqlSession(SqlSession sqlSession) {
        EqController.sqlSession = sqlSession;
    }

    public static String getStatement() {
        return statement;
    }

    public static void setStatement(String statement) {
        EqController.statement = statement;
    }

    public static SqlSessionFactory getFactory() {
        return factory;
    }

    public static void setFactory(SqlSessionFactory factory) {
        EqController.factory = factory;
    }

    public static String getDateFormate() {
        return DATE_FORMATE;
    }

    @Override
    public String toString() {
        return "EqController{}";
    }

    @RequestMapping(value="/registerStaff")
    public String registerStaff(
            @RequestParam("loginname") String loginname,
            @RequestParam("password") String password,
            @RequestParam(name="department",defaultValue="10") String department,
            @RequestParam("name") String name,
            @RequestParam("gender") String gender,
            @RequestParam("zhiwu") String zhiwu,
            @RequestParam("zhicheng") String zhicheng,
            @RequestParam("jishudengji") String jishudengji,
            @RequestParam("junxian") String junxian,
            @RequestParam("jsjjunxian") String jsjjunxian,
            @RequestParam("zhiwudengji") String zhiwudengji,
            @RequestParam("wenzhiji") String wenzhiji,
            @RequestParam("phone") String phone,
            @RequestParam("email") String email,
            @RequestParam("jgzid") String jgzid,
            @RequestParam(name="grade",defaultValue="3") String grade,
            @RequestParam("birthplace") String birthplace,
            @RequestParam("birthyday") String birthyday,
            Model model){
        sqlSession = factory.openSession(true);
        Staff staff = new Staff();

        logger.info("---------------------------------");
        logger.info("---------------------------------");
        logger.info("---------------------------------");
        logger.info("---------------------------------");
        logger.info(birthyday);

        staff.setLoginname(loginname);
        staff.setPassword(password);
        Department tempDepartment = new Department();
        tempDepartment.setId(Integer.valueOf(department));
        staff.setDepartment(tempDepartment);
        staff.setName(name);
        staff.setGender(gender);

        staff.setZhiwu(zhiwu);
        staff.setZhicheng(zhicheng);
        staff.setJishudengji(jishudengji);
        staff.setJunxian(junxian);
        staff.setJsjjunxian(jsjjunxian);
        staff.setZhiwudengji(zhiwudengji);
        staff.setWenzhiji(wenzhiji);
        staff.setPhone(phone);
        staff.setEmail(email);
        staff.setJgzid(jgzid);
        staff.setGrade(Integer.valueOf(grade));
        staff.setBirthplace(birthplace);

        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        try {
            Date tempDate = formatter.parse(birthyday);
            staff.setBirthyday(tempDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("loginname",staff.getLoginname());


        List<Staff> staffList = sqlSession.selectList("com.equipments.management.mapper.StaffMapper.getStaffByAll",map);


        if(staffList.isEmpty()){
            sqlSession.insert("com.equipments.management.mapper.StaffMapper.addStaff",staff);
            model.addAttribute("staff",staff);
            sqlSession.close();
            if(staff.getGrade() == 3){
                return "cgsqy";
            }
            else{
                if(staff.getGrade() == 2){
                    return "scmy";
                }
                else{
                    return "index";
                }
            }
        }
        else{
            sqlSession.close();
            return "register";
        }

    }

    /**
     * 前端判断用户名重复
     * */
    @RequestMapping("/testUserName")
    public void testUserName(HttpServletRequest request, HttpServletResponse response,
                             @RequestParam("loginname") String loginname){
        sqlSession = factory.openSession(true);
        Map<String,Object> tempMap = new HashMap<String, Object>();
        tempMap.put("loginname",loginname);
        List<Staff> staffList = sqlSession.selectList("com.equipments.management.mapper.StaffMapper.getStaffByAll",tempMap);
        sqlSession.close();

        response.reset();
        response.setContentType("text/html;charset=UTF-8");
        //业务逻辑操作查询用户
        if(staffList.isEmpty()){
            try {
                response.getWriter().print(true);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        else{
            try {
                response.getWriter().print(false);
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * getStaffByLoginname
     * *
     * */
    @RequestMapping("/getUsername")
    @ResponseBody
    public void getUsername(HttpServletResponse response,HttpServletRequest request){
        sqlSession = factory.openSession(true);
        HttpSession session = request.getSession();
        Staff staff = (Staff)session.getAttribute("staff");

        Staff staffList = sqlSession.selectOne("com.equipments.management.mapper.StaffMapper.getStaffById",staff.getId());
        sqlSession.close();

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = null;
        try{
            out = response.getWriter();
            out.println(JSON.toJSONString(staffList.getName(),SerializerFeature.DisableCircularReferenceDetect));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            out.close();
        }
    }
    @RequestMapping("/getAllDepartments")
    @ResponseBody
    public void getAllDepartments(HttpServletResponse response,HttpServletRequest request){
        sqlSession = factory.openSession(true);

        List<Department> departmentList = sqlSession.selectList("com.equipments.management.mapper.DepartmentMapper.getAllDepartments");
        sqlSession.close();

        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = null;
        try{
            out = response.getWriter();
            out.println(JSON.toJSONString(departmentList,SerializerFeature.DisableCircularReferenceDetect));
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            out.close();
        }
    }

    /**
     * 测试生成文档
     *
     * */
    @RequestMapping("/testFtl")
    public void testFtl(HttpServletResponse response,HttpServletRequest request){
        sqlSession = factory.openSession(true);

        //组装数据
        List<Staff> staffList = sqlSession.selectList("com.equipments.management.mapper.StaffMapper.getAllStaff");
        List<Staffextend> staffextendList = sqlSession.selectList("com.equipments.management.mapper.StaffextendMapper.getAllStaffextend");
        sqlSession.close();
        Staff tempStaff = staffList.get(0);
        Staffextend tempStaffextend = staffextendList.get(0);
        Map<String,Object> tempMap = new HashMap<String, Object>();
        tempMap.put("name",tempStaff.getName());
        tempMap.put("zhicheng",tempStaff.getZhicheng());
        tempMap.put("gender",tempStaff.getGender());
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy年MM月dd日");
        tempMap.put("birthyday",sdf.format(tempStaff.getBirthyday()));
        tempMap.put("birthplace",tempStaff.getBirthplace());
        tempMap.put("nation",tempStaffextend.getNation());
        tempMap.put("educationle",tempStaffextend.getEducationle());


        ExportDoc maker = new ExportDoc("UTF-8");
        logger.info("--------------------Freemarker-----------------------");
        logger.info(request.getSession().getServletContext().getRealPath(""));
        try {
            maker.exportDoc("F:\\test.doc","template.ftl",tempMap);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
