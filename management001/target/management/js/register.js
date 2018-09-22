/**
 * Created by Administrator on 2018/6/9.
 *
 */

$(function () {
    var zhiwu = $("#zhiwu");
    var zhicheng = $("#zhicheng");
    var jishudengji = $("#jishudengji");
    var junxian = $("#junxian");
    var jsjjunxian = $("#jsjjunxian");
    var zhiwudengji = $("#zhiwudengji");
    var wenzhiji = $("#wenzhiji");
    var department = $("#department");

    zhiwu.append("<option></option>");
    zhiwu.append("<option>院长</option>");
    zhiwu.append("<option>副院长</option>");
    zhiwu.append("<option>所长</option>");
    zhiwu.append("<option>副所长</option>");
    zhiwu.append("<option>处长</option>");
    zhiwu.append("<option>副处长</option>");
    zhiwu.append("<option>政委</option>");
    zhiwu.append("<option>副政委</option>");
    zhiwu.append("<option>主任</option>");
    zhiwu.append("<option>副主任</option>");
    zhiwu.append("<option>副政委</option>");
    zhiwu.append("<option>参谋</option>");
    zhiwu.append("<option>秘书</option>");
    zhiwu.append("<option>助理员</option>");
    zhiwu.append("<option>干事</option>");

    zhicheng.append("<option></option>");
    zhicheng.append("<option>研究实习员</option>");
    zhicheng.append("<option>助理研究员</option>");
    zhicheng.append("<option>副研究员</option>");
    zhicheng.append("<option>研究员</option>");

    zhiwudengji.append("<option></option>");
    zhiwudengji.append("<option>排</option>");
    zhiwudengji.append("<option>副连</option>");
    zhiwudengji.append("<option>正连</option>");
    zhiwudengji.append("<option>副营</option>");
    zhiwudengji.append("<option>正营</option>");
    zhiwudengji.append("<option>副团</option>");
    zhiwudengji.append("<option>正团</option>");
    zhiwudengji.append("<option>副师</option>");
    zhiwudengji.append("<option>正师</option>");
    zhiwudengji.append("<option>副军</option>");
    zhiwudengji.append("<option>正军</option>");

    jishudengji.append("<option></option>");
    jishudengji.append("<option>技术一级</option>");
    jishudengji.append("<option>技术二级</option>");
    jishudengji.append("<option>技术三级</option>");
    jishudengji.append("<option>技术四级</option>");
    jishudengji.append("<option>技术五级</option>");
    jishudengji.append("<option>技术六级</option>");
    jishudengji.append("<option>技术七级</option>");
    jishudengji.append("<option>技术八级</option>");
    jishudengji.append("<option>技术九级</option>");
    jishudengji.append("<option>技术十级</option>");
    jishudengji.append("<option>技术十一级</option>");
    jishudengji.append("<option>技术十二级</option>");
    jishudengji.append("<option>技术十三级</option>");
    jishudengji.append("<option>技术十四级</option>");

    junxian.append("<option></option>");
    junxian.append("<option>少尉</option>");
    junxian.append("<option>中尉</option>");
    junxian.append("<option>上尉</option>");
    junxian.append("<option>少校</option>");
    junxian.append("<option>中校</option>");
    junxian.append("<option>上校</option>");
    junxian.append("<option>大校</option>");
    junxian.append("<option>少将</option>");
    junxian.append("<option>中将</option>");


    wenzhiji.append("<option></option>");
    wenzhiji.append("<option>文职一级</option>");
    wenzhiji.append("<option>文职二级</option>");
    wenzhiji.append("<option>文职三级</option>");
    wenzhiji.append("<option>文职四级</option>");
    wenzhiji.append("<option>文职五级</option>");
    wenzhiji.append("<option>文职六级</option>");
    wenzhiji.append("<option>文职七级</option>");
    wenzhiji.append("<option>文职八级</option>");
    wenzhiji.append("<option>文职九级</option>");

    jsjjunxian.append("<option></option>");
    jsjjunxian.append("<option>专业技术少尉</option>");
    jsjjunxian.append("<option>专业技术中尉</option>");
    jsjjunxian.append("<option>专业技术上尉</option>");
    jsjjunxian.append("<option>专业技术少校</option>");
    jsjjunxian.append("<option>专业技术中校</option>");
    jsjjunxian.append("<option>专业技术上校</option>");
    jsjjunxian.append("<option>专业技术大校</option>");
    jsjjunxian.append("<option>专业技术少将</option>");
    jsjjunxian.append("<option>专业技术中将</option>");



    $.ajax({
        type: "get",
        url: "/getAllDepartments",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            debugger;
            department.append("<option>"+"</option>");
            for(var i = 0;i<data1.length;i++){
                tempValue = data1[i];
                department.append("<option value="+ tempValue.id + ">" + tempValue.name +"</option>");
            }
        },
        error: function () {
            alert("状态Error");
        }
    });
});

