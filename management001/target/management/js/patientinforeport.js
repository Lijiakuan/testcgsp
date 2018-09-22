/**
 * Created by Administrator on 2017/6/9.
 *
 */

Date.prototype.Format = function (fmt) {
    var o = {
        "M+": this.getMonth() + 1, //月份
        "d+": this.getDate(), //日
        "h+": this.getHours(), //小时
        "m+": this.getMinutes(), //分
        "s+": this.getSeconds(), //秒
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度
        "S": this.getMilliseconds() //毫秒
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
        if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
};

function html2Escape(sHtml) {
    return sHtml.replace(/[<>&".]/g,function(c){return {'<':'&lt;','>':'&gt;','&':'&amp;','"':'&quot;','.':'&middot;'}[c];});
}

function transValueEdit(idvalue){
    //打开明细页面
    //改变记录状态 放在 编辑明细窗体“提交”按钮
    var edit_binglihao1 = $("#txt_search_binglihao1");
    edit_binglihao1.val(idvalue);

    $.ajax({
        type: "get",
        url: "/patientappli/getPatientinfoByAllAvaliable?applino="+idvalue,
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            var tempStr;
            var tempDepartmentList = data1.rows[0];

            $("#txt_search_xingming").val(tempDepartmentList.patientname);
            $("#txt_search_gender").val(tempDepartmentList.gender);
            $("#txt_search_age").val(tempDepartmentList.age);
            $("#txt_search_department").val();
            $("#txt_search_marrage").val(tempDepartmentList.patientmarriage);
            $("#txt_search_minzu").val(tempDepartmentList.ethnic);
            $("#txt_search_zhiye").val();
            $("#txt_search_tel").val(tempDepartmentList.contactinfotel);
            $("#txt_search_shenfenzheng").val(tempDepartmentList.identinumber);

            $("#txt_search_address").val(tempDepartmentList.contactinfoaddrprovince);
            $("#txt_search_addresscity").val(tempDepartmentList.contactinfoaddrcity);
            $("#txt_search_addressdistinct").val(tempDepartmentList.contactinfoaddrdistinct);
            $("#txt_search_addressother").val(tempDepartmentList.contactinfoaddr);

            $("#txt_search_source").val(tempDepartmentList.soource);
            $("#txt_search_bingqu").val(tempDepartmentList.ward);
            $("#txt_search_bedcode").val(tempDepartmentList.bedid);
            $("#txt_search_zhengzhuang").val(tempDepartmentList.patientappli001List.applisymptom);
            $("#txt_search_tizheng").val(tempDepartmentList.patientappli001List.applisigns);
            $("#txt_search_linchuangzhenduan").val(tempDepartmentList.inforclinical);
            $("#txt_search_qitazhenduan").val(tempDepartmentList.patientappli001List.otherdiagnosis);
            $("#txt_search_sfczby").val(tempDepartmentList.patientappli001List.pathologyexamif);//是否做过病理检查
            $("#txt_search_zlfxsj").val(tempDepartmentList.patientappli001List.cancerfounddate);
            $("#txt_search_year").val();
            $("#txt_search_zlbw").val();
            $("#txt_search_zldx").val();
            $("#txt_search_zhuanyi").val(tempDepartmentList.patientappli001List.transferif);
            $("#txt_search_zhuanyiweizhi").val(tempDepartmentList.patientappli001List.transferplace);
            $("#txt_search_fanghualiao").val(tempDepartmentList.patientappli001List.cancerfoundsize);

            $("#txt_search_zhongliudaxiao").val();
            $("#txt_search_zldxdysj").val(tempDepartmentList.patientappli001List.lastmenstrualdate);
            $("#txt_search_yjzq").val(tempDepartmentList.patientappli001List.menstrualcycle);
            $("#txt_search_yjcxsj").val(tempDepartmentList.patientappli001List.menstrualduration);
            $("#txt_search_scyj").val();
            $("#txt_search_zqzl").val(tempDepartmentList.patientappli001List.cycletreatmentif);

            $("#txt_search_zqzlsj").val(tempDepartmentList.patientappli001List.cycletreatmenttime);
            $("#txt_search_zqzljl").val(tempDepartmentList.patientappli001List.cycletreatmentdose);
            $("#txt_search_shengchanshi").val(tempDepartmentList.patientappli001List.productnum);
            $("#txt_search_shengchanshichan").val(tempDepartmentList.patientappli001List.productsnum);
            $("#txt_search_biyunfangshi").val(tempDepartmentList.patientappli001List.contraceptionmethod);
            $("#txt_search_dianjizhiliao").val();
            $("#txt_search_lnmdzl").val(tempDepartmentList.patientappli001List.thiouraciltreatmentif);
            $("#txt_search_shoushusuojian").val();
            $("#txt_search_cjbbzlbw").val();
            $("#txt_search_huayanjieguo").val();
            $("#txt_search_youfoubiyun").val();
            $("#txt_search_qitafangfa").val();
            $("#txt_search_teshuyaoqiu").val();
            $("#txt_search_shenqingyishi").val();
            $("#txt_search_sheniqngriqi").val();
            $("#txt_search_songjianyishi").val();
            $("#txt_search_songjianriqi").val();

            $("#txt_search_lnmfghdzl").val();
            $("#txt_search_shenqingleixing").val();
        },
        error: function () {
            alert("Error");
        }
    });

}
function transValuePrint(idvalue){
    //打印记录报表
    //改变记录状态
}
function transValueBook(idvalue){
    //签字
    //改变记录状态
    //updatePatientappliByAllAvaliableSeveralConditions
    var status = "已签收";
    $.ajax({
        type: "get",
        url: "/patiengappli/updatePatientappliByAllAvaliableSeveralConditions",
        async: false,
        dataType:"json",
        data:{
          'acceptresult':status,
            'applino':idvalue
        },
        success: function (data1) {
        },
        error: function () {
            alert("Error");
        }
    });
}
function transValueRefuse(idvalue){
    //拒收
    //改变记录状态
    //updatePatientappliByAllAvaliableSeveralConditions
    var status = "已拒收";
    $.ajax({
        type: "get",
        url: "/patiengappli/updatePatientappliByAllAvaliableSeveralConditions",
        async: false,
        dataType:"json",
        data:{
            'acceptresult':status,
            'applino':idvalue
        },
        success: function (data1) {
        },
        error: function () {
            alert("Error");
        }
    });
}
function transValueLook(idvalue){
    //查看记录
    //打开 不可编辑明细窗体
}

$("[data-toggle='tooltip']").tooltip();

$(function () {

    var hospitalizetionid = $("#txt_search_hospitalizetionid");
    var applino = $("#txt_search_applino");
    var inspmethod = $("#txt_search_inspmethod");
    var patientdiagkind = $("#txt_search_patientdiagkind");
    var inspdepartid = $("#txt_search_inspdepartid");
    var specialrequire = $("#txt_search_specialrequire");
    var inspdate001 = $("#txt_search_inspdate001");
    var inspdate002 = $("#txt_search_inspdate002");
    var acceptdate001 = $("#txt_search_acceptdate001");
    var acceptdate002 = $("#txt_search_acceptdate002");

    var search_gender = $("#txt_search_gender");

    /*
    * 初始化代码
    *
    * */
    var search_xingming = $("#txt_search_xingming");
    var search_gender = $("#txt_search_gender");
    var search_age = $("#txt_search_age");
    var search_department = $("#txt_search_department");
    var search_marrage = $("#txt_search_marrage");
    var search_minzu = $("#txt_search_minzu");
    var search_zhiye = $("#txt_search_zhiye");
    var search_tel = $("#txt_search_tel");
    var search_shenfenzheng = $("#txt_search_shenfenzheng");
    var search_address = $("#txt_search_address");
    var search_addresscity = $("#txt_search_addresscity");
    var search_addressdistinct = $("#txt_search_addressdistinct");
    var search_addressother = $("#txt_search_addressother");
    var search_source = $("#txt_search_source");
    var search_bingqu = $("#txt_search_bingqu");
    var search_bedcode = $("#txt_search_bedcode");
    var search_zhengzhuang = $("#txt_search_zhengzhuang");
    var search_tizheng = $("#txt_search_tizheng");
    var search_linchuangzhenduan = $("#txt_search_linchuangzhenduan");
    var search_qitazhenduan = $("#txt_search_qitazhenduan");
    var search_sfczby = $("#txt_search_sfczby");
    var search_zlfxsj = $("#txt_search_zlfxsj");
    var search_year = $("#txt_search_year");
    var search_zlbw = $("#txt_search_zlbw");
    var search_zldx = $("#txt_search_zldx");
    var search_zhuanyi = $("#txt_search_zhuanyi");
    var search_zhuanyiweizhi = $("#txt_search_zhuanyiweizhi");
    var search_fanghualiao = $("#txt_search_fanghualiao");
    var search_zhongliudaxiao = $("#txt_search_zhongliudaxiao");
    var search_zldxdysj = $("#txt_search_zldxdysj");
    var search_yjcxsj = $("#txt_search_yjcxsj");
    var search_scyj = $("#txt_search_scyj");
    var search_zqzl = $("#txt_search_zqzl");
    var search_zqzlsj = $("#txt_search_zqzlsj");

    var search_zqzljl = $("#txt_search_zqzljl");
    var search_shengchanshi = $("#txt_search_shengchanshi");
    var search_shengchanshichan = $("#txt_search_shengchanshichan");
    var search_biyunfangshi = $("#txt_search_biyunfangshi");
    var search_dianjizhiliao = $("#txt_search_dianjizhiliao");
    var search_lnmdzl = $("#txt_search_lnmdzl");
    var search_shoushusuojian = $("#txt_search_shoushusuojian");
    var search_cjbbzlbw = $("#txt_search_cjbbzlbw");
    var search_huayanjieguo = $("#txt_search_huayanjieguo");
    var search_qitafangfa = $("#txt_search_qitafangfa");
    var search_teshuyaoqiu = $("#txt_search_teshuyaoqiu");
    var search_shenqingyishi = $("#txt_search_shenqingyishi");
    var search_sheniqngriqi = $("#txt_search_sheniqngriqi");
    var search_songjianyishi = $("#txt_search_songjianyishi");
    var search_songjianriqi = $("#txt_search_songjianriqi");
    var search_lnmfghdzl = $("#txt_search_lnmfghdzl");


    var search_youfoubiyun = $("#txt_search_youfoubiyun");


    var search_shenqingleixing = $("#txt_search_shenqingleixing");

    //tempJianchafangfa
    var btn_1 = $("#btn-1");
    var btn_2 = $("#btn-2");
    var btn_3 = $("#btn-3");
    var btn_4 = $("#btn-4");
    var btn_5 = $("#btn-5");
    var btn_6 = $("#btn-6");
    var btn_7 = $("#btn-7");
    var btn_8 = $("#btn-8");

    btn_1.click(function(){
        tempJianchafangfa += "活检";
        btn_1.addClass("btn-danger");
    });
    btn_2.click(function(){
        tempJianchafangfa += "快速冰冻";
        btn_2.addClass("btn-danger");
    });
    btn_3.click(function(){
        tempJianchafangfa += "细胞学";
        btn_3.addClass("btn-danger");
    });
    btn_4.click(function(){
        tempJianchafangfa += "TCT";
        btn_4.addClass("btn-danger");
    });
    btn_5.click(function(){
        tempJianchafangfa += "免疫组化";
        btn_5.addClass("btn-danger");
    });
    btn_6.click(function(){
        tempJianchafangfa += "细胞DNA倍体";
        btn_6.addClass("btn-danger");
    });
    btn_7.click(function(){
        tempJianchafangfa += "FISH";
        btn_7.addClass("btn-danger");
    });
    btn_8.click(function(){
        tempJianchafangfa += "基因检测";
        btn_8.addClass("btn-danger");
    });

    transValueEdit(idvalue);
});

function getJsonLength(jsonData){
    var jsonLength = 0;
    for(var item in jsonData){
        jsonLength++;
    }
    return jsonLength;
}

