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
function transValue(tranvalue){
    document.getElementById('idvalue').value = tranvalue;
    $("#input-b9").fileinput('destroy').fileinput({
        language : 'zh',
        uploadUrl : "/admin/upload/files",
        autoReplace : true,
        maxFileCount : 1,
        allowedFileExtensions : [ "jpg", "png", "gif", "pdf" ],
        browseClass : "btn btn-primary", //按钮样式
        previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
        uploadExtraData : function(previewId, index) {
            var obj = {};
            obj.fileid = $("#idvalue").val();
            return obj;
        }
    }).on("fileuploaded", function(e, data) {
        var res = data.response;
        var opt = {
            url: '/patientappli/getPatientinfoByAllAvaliable',
            query:{
                pageSize: 10, //页面大小
                pageNumber: 1, //页码

                //筛选参数
                patientkind: $("#txt_search_patientkind").val(),
                patientdiagkind: $("#txt_search_patientdiagkind").val(),
                applidoctorid: $("#txt_search_applidoctorid").val(),
                inspdate001: $("#txt_search_inspdate001").val(),
                inspdate002: $("#txt_search_inspdate002").val(),
                applidate001: $("#txt_search_applidate001").val(),
                applidate002: $("#txt_search_applidate002").val(),

                sortName:"applino",
                sortOrder:"asc"
            }

        };
        $('#tb_tasks').bootstrapTable('refresh',opt);
    });
}

function html2Escape(sHtml) {
    return sHtml.replace(/[<>&".]/g,function(c){return {'<':'&lt;','>':'&gt;','&':'&amp;','"':'&quot;','.':'&middot;'}[c];});
}

function transPathValue(idvalue,pdfpathvalue){
    document.getElementById('idvalue').value = idvalue;

    var index = pdfpathvalue.lastIndexOf(".");
    var file_name = pdfpathvalue.substr(0,index);
    var file_ext = pdfpathvalue.substr(index+1);

    alert(file_name);

    var temp_path;

    if(file_ext == 'pdf'){
        temp_path = '/pdf/web/viewer.html?' + 'file=/displayPDF/' + file_name + '/' + file_ext;
    }
    else{
        temp_path = '/pdf/web/' + pdfpathvalue;
    }
    //alert(temp_path);
    //window.location.href = temp_path;
    window.open(temp_path,'预览','height=400,width=400,top=0,left=0,toolbar=no,menubar=no,scrollbars=no,resizable=no,location=no, status=no,fullscreen=yes');
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

            debugger;
            var tempDate;
            $("#txt_search_xingming").val(tempDepartmentList.patientname);
            $("#txt_search_gender").val(tempDepartmentList.gender);
            $("#txt_search_age").val(tempDepartmentList.age);
            $("#txt_search_department").val();
            $("#txt_search_marrage").val(tempDepartmentList.patientmarriage);
            $("#txt_search_minzu").val(tempDepartmentList.ethnic);
            $("#txt_search_zhiye").val(tempDepartmentList.career);
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
            $("#txt_search_zlbw").val(tempDepartmentList.patientappli001List.cancerfoundplace);
            $("#txt_search_zldx").val(tempDepartmentList.patientappli001List.cancernowsize);
            $("#txt_search_zhuanyi").val(tempDepartmentList.patientappli001List.transferif);
            $("#txt_search_zhuanyiweizhi").val(tempDepartmentList.patientappli001List.transferplace);
            $("#txt_search_fanghualiao").val(tempDepartmentList.patientappli001List.cancerfoundsize);

            $("#txt_search_zhongliudaxiao").val(tempDepartmentList.patientappli001List.cancernowsize);
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
            $("#txt_search_dianjizhiliao").val(tempDepartmentList.patientappli001List.diagnosisrecord);
            $("#txt_search_lnmdzl").val(tempDepartmentList.patientappli001List.thiouraciltreatmentif);
            $("#txt_search_shoushusuojian").val(tempDepartmentList.patientappli001List.surgeryseen);
            $("#txt_search_cjbbzlbw").val(tempDepartmentList.patientappli001List.transferplace);
            $("#txt_search_huayanjieguo").val(tempDepartmentList.patientappli001List.labresult);
            $("#txt_search_youfoubiyun").val(tempDepartmentList.patientappli001List.contraceptionif);
            $("#txt_search_qitafangfa").val(tempDepartmentList.patientappli001List.otherdiagnosis);
            $("#txt_search_teshuyaoqiu").val(tempDepartmentList.patientappli001List.specialrequire);
            $("#txt_search_shenqingyishi").val(tempDepartmentList.patientappli001List.applidoctorid.name);
            tempDate = new Date(tempDepartmentList.patientappli001List.applidate).Format("yyyy-MM-dd");
            $("#txt_search_shenqingriqi").val(tempDate);
            $("#txt_search_songjianyishi").val(tempDepartmentList.patientappli001List.inspdoctid.name);
            tempDate = new Date(tempDepartmentList.patientappli001List.inspdate).Format("yyyy-MM-dd");
            $("#txt_search_songjianriqi").val(tempDate);

            $("#txt_search_lnmfghdzl").val();
            $("#txt_search_shenqingleixing").val(tempDepartmentList.patientappli001List.advicestatus);
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
function transValueDetail(idvalue){
    //患者明细
    //改变记录状态
    window.location.href="patientinforeport.jsp?idvalue="+encodeURI(idvalue);
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
function transPathValue001(idvalue,pdfpathvalue){
    //test
    var change_pdfpathvalue = '<embed class="kv-preview-data file-preview-pdf" src="../pdf/web' + '/' + pdfpathvalue + '\" type="application/pdf">';
    var tempfileinput = $('#input-b9');
    tempfileinput.fileinput('destroy').fileinput({
        initialPreview:change_pdfpathvalue,
        language : 'zh',
        uploadUrl : "/admin/upload/files",
        autoReplace : true,
        maxFileCount : 1,
        allowedFileExtensions : [ "jpg", "png", "gif", "pdf" ],
        browseClass : "btn btn-primary", //按钮样式
        previewFileIcon : "<i class='glyphicon glyphicon-king'></i>",
        uploadExtraData : function(previewId, index) {
            var obj = {};
            obj.fileid = $("#idvalue").val();
            return obj;
        }
    });
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

    //特殊要求
    specialrequire.append("<option></option>");
    specialrequire.append("<option>有</option>");
    specialrequire.append("<option>无</option>");


    //申请单类型
    patientdiagkind.append("<option></option>");
    patientdiagkind.append("<option>本院常规病理</option>");
    patientdiagkind.append("<option>快速冰冻</option>");
    patientdiagkind.append("<option>病理会诊</option>");
    patientdiagkind.append("<option>尸检</option>");

    //检查方法
    inspmethod.append("<option></option>");
    inspmethod.append("<option>活检</option>");
    inspmethod.append("<option>快速冰冻</option>");
    inspmethod.append("<option>细胞学</option>");
    inspmethod.append("<option>TCT</option>");
    inspmethod.append("<option>免疫组化</option>");
    inspmethod.append("<option>肿瘤DNA倍体</option>");
    inspmethod.append("<option>FISH</option>");
    inspmethod.append("<option>基因检测</option>");

    var search_gender = $("#txt_search_gender");
    search_gender.append("<option></option>");
    search_gender.append("<option>女</option>");
    search_gender.append("<option>男</option>");

    //送检科室
    $.ajax({
        type: "get",
        url: "/selectAllDepartments",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            var tempStr;
            var tempDepartmentList = data1.rows;
            inspdepartid.append("<option>"+"</option>");
            for(var i = 0;i<tempDepartmentList.length;i++){
                tempValue = tempDepartmentList[i];
                tempStr = '<option value="'+ tempValue.no +'">'+tempValue.name+'</option>';
                inspdepartid.append(tempStr);
            }
        },
        error: function () {
            alert("Error");
        }
    });

    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

    //2.初始化Button的点击事件
    var oButtonInit = new ButtonInit();
    oButtonInit.Init();
    var tempChange = $('#btn_change');
    var tempButton = $('#btn_add');
    var tempButtondel = $('#btn_delete');
    var tempButtonsave = $('#btn_save');
    var tempQuery = $('#btn_query');
    var tempExport = $('#btn_output');
    var newRowData = {
        //need to modify-----------------------------------------------
        applino:'',
        patientinfo:'',
        inspunitname:'',
        inspdepartid:'',
        inspdoctid:'',
        patientkind:'',
        chargekind:'',
        chargenum:'',
        specimentkind:'',
        patientdiagkind:'',
        specimentname:'',
        diagnosisrecord:'',
        applidate:'',
        inspdate:'',
        applisymptom:'',
        applisigns:'',
        otherdiagnosis:'',
        pathologyexamif:'',
        cancerfounddate:'',
        cancerfoundplace:'',
        cancerfoundsize:'',
        transferif:'',
        transferplace:'',
        chemotherapyif:'',
        cancernowdate:'',
        cancernowsize:'',
        menstrualcycle:'',
        menstrualduration:'',
        lastmenstrualdate:'',
        cycletreatmentif:'',
        cycletreatmenttime:'',
        cycletreatmentdose:'',
        birthnum:'',
        productnum:'',
        contraceptionif:'',
        contraceptionmethod:'',
        iodinetreatmentif:'',
        thiouraciltreatmentif:'',
        labresult:'',
        surgeryseen:'',
        specialrequire:'',
        applidoctorid:''
    };

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

    //送检科室
    $.ajax({
        type: "get",
        url: "/selectAllDepartments",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            var tempStr;
            var tempDepartmentList = data1.rows;
            search_department.append("<option>"+"</option>");
            search_lnmfghdzl.append("<option>"+"</option>");
            for(var i = 0;i<tempDepartmentList.length;i++){
                tempValue = tempDepartmentList[i];
                tempStr = '<option value="'+ tempValue.no +'">'+tempValue.name+'</option>';
                search_department.append(tempStr);
                search_lnmfghdzl.append(tempStr);
            }
        },
        error: function () {
            alert("Error");
        }
    });
    search_marrage.append("<option></option>");
    search_marrage.append("<option>已婚</option>");
    search_marrage.append("<option>未婚</option>");
    search_minzu.append("<option></option>");
    search_minzu.append("<option>汉族</option>");
    search_minzu.append("<option>回族</option>");
    search_minzu.append("<option>蒙古族</option>");
    search_minzu.append("<option>维吾尔族</option>");
    search_minzu.append("<option>满族</option>");
    search_minzu.append("<option>藏族</option>");
    search_minzu.append("<option>其它</option>");

    search_source.append("<option></option>");
    search_source.append("<option>门诊</option>");
    search_source.append("<option>住院</option>");
    search_source.append("<option>外院会诊</option>");

    search_bingqu.append("<option></option>");
    search_bingqu.append("<option>1</option>");
    search_bingqu.append("<option>2</option>");
    search_bingqu.append("<option>3</option>");
    search_bingqu.append("<option>4</option>");

    search_sfczby.append("<option></option>");
    search_sfczby.append("<option>是</option>");
    search_sfczby.append("<option>否</option>");

    search_dianjizhiliao.append("<option></option>");
    search_dianjizhiliao.append("<option>是</option>");
    search_dianjizhiliao.append("<option>否</option>");

    search_lnmdzl.append("<option></option>");
    search_lnmdzl.append("<option>是</option>");
    search_lnmdzl.append("<option>否</option>");

    var search_youfoubiyun = $("#txt_search_youfoubiyun");
    search_youfoubiyun.append("<option></option>");
    search_youfoubiyun.append("<option>是</option>");
    search_youfoubiyun.append("<option>否</option>");

    search_zqzl.append("<option></option>");
    search_zqzl.append("<option>是</option>");
    search_zqzl.append("<option>否</option>");

    search_zhuanyi.append("<option></option>");
    search_zhuanyi.append("<option>是</option>");
    search_zhuanyi.append("<option>否</option>");

    search_fanghualiao.append("<option></option>");
    search_fanghualiao.append("<option>是</option>");
    search_fanghualiao.append("<option>否</option>");

    search_zqzl.append("<option></option>");
    search_zqzl.append("<option>是</option>");
    search_zqzl.append("<option>否</option>");

    search_biyunfangshi.append("<option></option>");
    search_biyunfangshi.append("<option>避孕套</option>");
    search_biyunfangshi.append("<option>节育环</option>");
    search_biyunfangshi.append("<option>服用药物</option>");

    var search_shenqingleixing = $("#txt_search_shenqingleixing");
    search_shenqingleixing.append("<option></option>");
    search_shenqingleixing.append("<option>本院常规病理</option>");
    search_shenqingleixing.append("<option>快速冰冻</option>");
    search_shenqingleixing.append("<option>病理会诊</option>");
    search_shenqingleixing.append("<option>尸检</option>");
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

    //getStaffName
    $.ajax({
        type: "get",
        url: "/getStaffName",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            var tempStr;
            search_shenqingyishi.append("<option>"+"</option>");
            search_songjianyishi.append("<option>"+"</option>");
            for(var i = 0;i<data1.length;i++){
                tempValue = data1[i];
                tempStr = '<option value="'+ tempValue.id +'">'+tempValue.name+'</option>';
                search_shenqingyishi.append(tempStr);
                search_songjianyishi.append(tempStr);
            }
        },
        error: function () {
            alert("Error");
        }
    });

    addressInit('txt_search_address','txt_search_addresscity','txt_search_addressdistinct');

    tempChange.click(function(){
        $("#tb_tasks").bootstrapTable('destroy');
        temp_change = !temp_change;
        if(temp_change){
            var oTable = new TableInit();
            oTable.Init();
        }
        else{
            var oTable = new TableInitCanEditable();
            oTable.Init();
        }

    });
    tempQuery.click(function(){
        queryResults();
    });


    tempExport.click(function(){
        //筛选参数
        downloadFilebyAjax();
    });

    //新建数据记录
    tempButton.click(function () {
        var tb_tasks = $('#tb_tasks');
        tb_tasks.bootstrapTable('append', newRowData);
        tb_tasks.bootstrapTable('scrollTo', 'bottom');
        $.ajax({
            type: "post",
            //保存数据
            url: "/patientappli/insertNewRecord",
            async: false,
            dataType:"json",
            success: function (data) {
                tb_tasks.bootstrapTable('load',data);
                //alert("保存成功");
            },
            error: function () {
                alert("Error");
            }
        });
    });

    var btn_save = $("#btn-save");


    btn_save.click(function(){

    });

    //保存数据修改
    tempButtonsave.click(function () {
        var rowLists = $('#tb_tasks').bootstrapTable('getSelections');
        if (rowLists.length < 1 ) {
            alert("请至少选择一行保存!");
            return;
        }

        //保存数据并同步到数据库
        $.ajax({
            type: "post",
            //保存数据
            url: "/patientappli/updatePatientappliByIds",
            async: false,
            //traditional: true,
            data: {'rowLists': JSON.stringify(rowLists),'lengthRecords':rowLists.length},
            dataType:"json",
            success: function (data) {
                $('#tb_tasks').bootstrapTable('load',data);
                alert("保存成功");
            },
            error: function () {
                alert("Error");
            }
        });
    });
    tempButtondel.click(function () {
        var ids = $.map($('#tb_tasks').bootstrapTable('getSelections'), function (row) {
            return row.patientno;
        });
        if (ids.length < 1 ) {
            alert("请选择一行删除!");
            return;
        }

        //删除数据并同步到数据库
        $.ajax({
            type: "post",
            url: "/patientappli/delPatientappliById",
            async: false,
            data: "ids="+ids,
            success: function (data) {
                queryResults();
                alert("删除成功");
            },
            error: function () {
                alert("Error");
            }
        });


        $('#tb_tasks').bootstrapTable('remove', {
            field: 'patientno',
            values: ids
        });
    });

});

function downloadFilebyAjax() {
    var url = "/downloadExcel";

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

    var form = $("<form></form>").attr("action", url).attr("method", "post");
    form.append($("<input></input>").attr("type", "hidden").attr("name", "hospitalizetionid").attr("value", hospitalizetionid));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "applino").attr("value", applino));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "inspmethod").attr("value", inspmethod));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "patientdiagkind").attr("value", patientdiagkind));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "inspdepartid").attr("value", inspdepartid));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "specialrequire").attr("value", specialrequire));

    form.append($("<input></input>").attr("type", "hidden").attr("name", "inspdate001").attr("value", inspdate001));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "inspdate002").attr("value", inspdate002));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "acceptdate001").attr("value", acceptdate001));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "acceptdate002").attr("value", acceptdate002));

    form.appendTo('body').submit().remove();
    }

function getJsonLength(jsonData){
    var jsonLength = 0;
    for(var item in jsonData){
        jsonLength++;
    }
    return jsonLength;
}


function queryResults(){
    var opt = {
        url: '/patientappli/getPatientinfoByAllAvaliable',
        query:{
            pageSize: 10, //页面大小
            pageNumber: 1, //页码

            //筛选参数
            hospitalizetionid: $("#txt_search_hospitalizetionid").val(),
            applino: $("#txt_search_applino").val(),
            inspmethod: $("#txt_search_inspmethod").val(),
            patientdiagkind: $("#txt_search_patientdiagkind").val(),
            inspdepartid: $("#txt_search_inspdepartid").val(),
            specialrequire: $("#txt_search_specialrequire").val(),
            inspdate001: $("#txt_search_inspdate001").val(),
            inspdate002: $("#txt_search_inspdate002").val(),
            acceptdate001: $("#txt_search_acceptdate001").val(),
            acceptdate002: $("#txt_search_acceptdate002").val(),
            sortName:"patientno",
            sortOrder:"asc"
        }

    };
    $('#tb_tasks').bootstrapTable('refresh',opt);
}

var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_tasks').bootstrapTable({
            url: '/patientappli/getPatientinfoByAllAvaliable', //请求后台的URL（*）
            //contextMenu: '#example1-context-menu',
            method: 'get', //请求方式（*）
            dataType: "json",
            toolbar: '#toolbar', //工具按钮用哪个容器
            striped: true, //是否显示行间隔色
            cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true, //是否显示分页（*）
            sortable: true, //是否启用排序
            sortOrder: "asc", //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            queryParamsType: "undefined",//undefined
            singleSelect: false,//复选框只能选择一条记录
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1, //初始化加载第一页，默认第一页
            pageSize: 10, //每页的记录行数（*）
            pageList: [10, 25, 50, 100,500], //可供选择的每页的行数（*）
            search: false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端
            strictSearch: true,
            showColumns: true, //是否显示所有的列
            showRefresh: true, //是否显示刷新按钮
            minimumCountColumns: 2, //最少允许的列数
            clickToSelect: true, //是否启用点击选中行
            height: 'auto', //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "patientno", //每一行的唯一标识，一般为主键列
            showToggle:true, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
            showExport: true,
            exportDataType: "selected",              //'basic', 'all', 'selected'.
            columns: [
                {checkbox: true},
                {field:'applino',title:'病理号',width:60,align:'center',sortable : true,formatter:function(value,row,index){
                    return row.patientappli001List[0].applino;
                }},
                {field:'patientname',title:'姓名',width:100,align:'left',sortable : true},
                {field:'age',title:'年龄',width:70,align:'left',sortable : true},
                {field:'hospitalizetionid',title:'住院号',width:80,align:'left',sortable:true},
                {field:'diagnosisrecord',title:'临床信息',width:100,align:'left',sortable:true,formatter:function(value,row,index){
                    return row.patientappli001List[0].diagnosisrecord;
                }},
                {field:'collectanatomyList',title:'标本数量',width:100,align:'left',sortable:true,formatter:function(value,row,index){
                var tempValue;
                tempValue = row.patientappli001List[0].collectanatomy001List;
                    return tempValue.length;
                }},
                {field:'patientdiagkind',title:'申请单类型',width:100,align:'left',sortable:true,formatter:function(value,row,index){
                    var tempValue;
                    tempValue = row.patientappli001List[0].diagnosisrecord;
                    return tempValue;
                }},
                {field:'inspmethodlist',title:'检查方法',width:400,align:'left',sortable:true,formatter:function(value,row,index){
                    var tempValue;
                    tempValue = row.patientappli001List[0].inspmethodlist;
                    return tempValue;
                }},
                {field:'specialrequire',title:'特殊要求',width:90,align:'left',sortable:true,formatter:function(value,row,index){
                    var tempValue;
                    tempValue = row.patientappli001List[0].specialrequire;
                    return tempValue;
                }},
                {field:'inspdepartid',title:'送检科室',width:100,align:'left',sortable:true,formatter:function(value,row,index){
                    var tempValue;
                    tempValue = row.patientappli001List[0].inspdepartid.name;
                    return tempValue;
                }},
                {field:'inspdoctid.name',title:'送检医生',width:100,align:'left',sortable:true,formatter:function(value,row,index){
                    var tempValue;
                    tempValue = row.patientappli001List[0].inspdoctid.name;
                    return tempValue;
                }},
                {field:'inspdate',title:'送检日期',width:100,align:'left',sortable:true,formatter:function(value,row,index){
                    var temp_html = "";
                    var temp_date = row.patientappli001List[0].inspdate;
                    if(temp_date != null){
                        temp_html = new Date(temp_date).Format("yyyy-MM-dd");
                        return temp_html;
                    }}},
                {field:'acceptdoctorid.name',title:'样本签收人',width:100,align:'left',sortable:true,formatter:function(value,row,index){
                    var temp_html = "";
                    temp_html = row.patientappli001List[0].acceptdoctorid.name;
                    return temp_html;
                    }},
                {field:'acceptdate',title:'签收日期',width:100,align:'left',sortable:true,formatter:function(value,row,index){
                    var temp_html = "";
                    var temp_date = row.patientappli001List[0].acceptdate;
                    if(temp_date != null){
                        temp_html = new Date(temp_date).Format("yyyy-MM-dd");
                        return temp_html;
                    }}},
                {field:'acceptresult',title:'状态',width:100,align:'left',sortable:true,formatter:function(value,row,index){
                    var temp_html = "";
                    temp_html = row.patientappli001List[0].acceptresult;
                    return temp_html;
                }},
                {field:'pdfpath',title:'操作',width:200,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                var tempResult = row.patientappli001List[0].acceptresult;
                var tempApplino = row.patientappli001List[0].applino;
                var temp_html001,temp_html002,temp_html003,temp_html004,temp_html005;
                    temp_html001 = '<button type="button" class="btn btn-xs btn-danger" data-toggle="modal" data-target="#myModal1" onclick="transValueEdit('+ tempApplino +')">&nbsp&nbsp&nbsp&nbsp编辑&nbsp&nbsp&nbsp&nbsp</button>';
                    temp_html002 = '<button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#myModal1" onclick="transValuePrint('+ tempApplino +')">&nbsp&nbsp&nbsp&nbsp打印&nbsp&nbsp&nbsp&nbsp</button>';
                    temp_html003 = '<button type="button" class="btn btn-xs btn-warning" data-toggle="modal" data-target="#myModal1" onclick="transValueBook('+ tempApplino +')">&nbsp&nbsp&nbsp&nbsp签收&nbsp&nbsp&nbsp&nbsp</button>';
                    temp_html004 = '<button type="button" class="btn btn-xs btn-success" onclick="transValueRefuse('+ tempApplino +')">&nbsp&nbsp&nbsp&nbsp拒收&nbsp&nbsp&nbsp&nbsp</button>';
                    temp_html005 = '<button type="button" class="btn btn-xs btn-success" onclick="transValueDetail('+ tempApplino +')">&nbsp&nbsp&nbsp&nbsp查看&nbsp&nbsp&nbsp&nbsp</button>';

            if(tempResult == "未提交"){
                temp_html002 = temp_html001;
                }
            if(tempResult == "等待签收"){
                temp_html002 = temp_html003 + '&nbsp' + temp_html004;
            }
            if(tempResult == "已打印"){
                temp_html002 = temp_html005;
            }
            if(tempResult == "已签收"){
             }
            return temp_html002;
            }}
            ],

            onEditableSave: function (field, row, oldValue, $el) {
                $.ajax({
                    error: function () {
                        //alert("Error");
                    },
                    complete: function () {

                    }

                });
            }
        });
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
        var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            pageSize: params.pageSize, //页面大小
            pageNumber: params.pageNumber, //页码

            //筛选参数
            hospitalizetionid: $("#txt_search_hospitalizetionid").val(),
            applino: $("#txt_search_applino").val(),
            inspmethod: $("#txt_search_inspmethod").val(),
            patientdiagkind: $("#txt_search_patientdiagkind").val(),
            inspdepartid: $("#txt_search_inspdepartid").val(),
            specialrequire: $("#txt_search_specialrequire").val(),
            inspdate001: $("#txt_search_inspdate001").val(),
            inspdate002: $("#txt_search_inspdate002").val(),
            acceptdate001: $("#txt_search_acceptdate001").val(),
            acceptdate002: $("#txt_search_acceptdate002").val(),
            sortName:this.sortName,
            sortOrder:this.sortOrder
        };
        return temp;
    };
    return oTableInit;
};

var TableInitCanEditable = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_tasks').bootstrapTable({
            url: '/patientappli/getPatientinfoByAllAvaliable', //请求后台的URL（*）
            //contextMenu: '#example1-context-menu',
            method: 'get', //请求方式（*）
            dataType: "json",
            toolbar: '#toolbar', //工具按钮用哪个容器
            striped: true, //是否显示行间隔色
            cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true, //是否显示分页（*）
            sortable: true, //是否启用排序
            sortOrder: "asc", //排序方式
            queryParams: oTableInit.queryParams,//传递参数（*）
            queryParamsType: "undefined",//undefined
            singleSelect: false,//复选框只能选择一条记录
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1, //初始化加载第一页，默认第一页
            pageSize: 10, //每页的记录行数（*）
            pageList: [10, 25, 50, 100,500], //可供选择的每页的行数（*）
            search: false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端
            strictSearch: true,
            showColumns: true, //是否显示所有的列
            showRefresh: true, //是否显示刷新按钮
            minimumCountColumns: 2, //最少允许的列数
            clickToSelect: true, //是否启用点击选中行
            height: 'auto', //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "patientno", //每一行的唯一标识，一般为主键列
            showToggle:true, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
            showExport: true,
            exportDataType: "selected",              //'basic', 'all', 'selected'.
            columns: [
                {checkbox: true},
                {field:'patientappli001List[0].applino',title:'病理号',width:45,align:'center',sortable : true},
                {field:'patientinfo.patientname',title:'姓名',width:100,align:'left',editable:true,sortable : true},
                {field:'patientinfo.age',title:'年龄',width:100,align:'left',editable:true,sortable : true},
                {field:'patientinfo.hospitalizetionid',title:'住院号',width:100,align:'left',editable:true,sortable:true},
                {field:'diagnosisrecord',title:'临床信息',width:100,align:'left',editable:true,sortable:true},
                {field:'collectanatomyList',title:'标本数量',width:100,align:'left',editable:true,sortable:true,formatter:function(value,row,index){
                    var temp_html = value.length;
                    return temp_html;
                }},
                {field:'patientdiagkind',title:'申请单类型',width:100,align:'left',editable:true,sortable:true},
                {field:'inspmethodList',title:'检查方法',width:300,align:'left',editable:true,sortable:true,formatter:function(value,row,index){
                    var temp_html = "";
                    var temp_add = "";
                    for(var i = 0;i<value.length;i++){
                        temp_add = "";
                        if(i == (value.length -1)){
                            temp_add = value[i].dicinspmethodno.disinspmethodname;
                        }else{
                            temp_add = value[i].dicinspmethodno.disinspmethodname + ",";
                        }

                        if(temp_add != "undefined"){
                            temp_html = temp_html.concat(temp_add);
                        }
                    }
                    return temp_html;
                }},
                {field:'specialrequire',title:'特殊要求',width:200,align:'left',editable:true,sortable:true},
                {field:'inspdepartid.name',title:'送检科室',width:100,align:'left',editable:true,sortable:true},
                {field:'inspdoctid.name',title:'送检医生',width:100,align:'left',editable:true,sortable:true},
                {field:'inspdate',title:'送检日期',width:100,align:'left',editable:true,sortable:true,formatter:function(value,row,index){
                    var temp_html = "";
                    if(value != null){
                        temp_html = new Date(value).Format("yyyy-MM-dd");
                        return temp_html;
                    }}},
                {field:'acceptdoctorid.name',title:'样本签收人',width:100,align:'left',editable:true,sortable:true},
                {field:'acceptdate',title:'签收日期',width:100,align:'left',editable:true,sortable:true,formatter:function(value,row,index){
                    var temp_html;
                    if(value != null){
                        temp_html = new Date(value).Format("yyyy-MM-dd");
                        return temp_html;
                    }}},
                {field:'acceptresult',title:'状态',width:100,align:'left',editable:true,sortable:true},
                {field:'pdfpath',title:'操作',width:250,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                    var temp_html001,temp_html002,temp_html003,temp_html004,temp_html005,temp_html006;
                    var tempApplino = 1;
                    var tempDrawno = patientappli001List[0].applino;
                    temp_html001 = '<button type="button" class="btn btn-xs btn-danger" data-toggle="modal" data-target="#exampleModal" onclick="transValueEdit('+ tempApplino +')">&nbsp&nbsp&nbsp&nbsp编辑&nbsp&nbsp&nbsp&nbsp</button>';
                    temp_html002 = '<button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="transValuePrint('+ row +')">&nbsp&nbsp&nbsp&nbsp打印&nbsp&nbsp&nbsp&nbsp</button>';
                    temp_html003 = '<button type="button" class="btn btn-xs btn-warning" onclick="transValueBook('+ row +')">&nbsp&nbsp&nbsp&nbsp签收&nbsp&nbsp&nbsp&nbsp</button>';
                    temp_html004 = '<button type="button" class="btn btn-xs btn-success" onclick="transValueRefuse('+ row +')">&nbsp&nbsp&nbsp&nbsp拒收&nbsp&nbsp&nbsp&nbsp</button>';
                    //temp_html005 = '<button type="button" class="btn btn-xs btn-info" data-toggle="modal" data-target="#exampleModal" onclick="transValueLook('+ row +')">&nbsp&nbsp&nbsp&nbsp查看&nbsp&nbsp&nbsp&nbsp</button>';

                    temp_html005 = '<button type="button" class="btn btn-xs btn-success" onclick="transValueDetail(tempDrawno)">&nbsp&nbsp&nbsp&nbsp查看&nbsp&nbsp&nbsp&nbsp</button>';

                    if(row.acceptresult == "未提交"){
                        temp_html002 = temp_html001;
                    }
                    if(row.acceptresult == "等待签收"){
                        temp_html002 = temp_html003 + '&nbsp' + temp_html004;
                    }
                    if(row.acceptresult == "已打印"){
                        temp_html002 = temp_html005;
                    }
                    if(row.acceptresult == "已签收"){
                        temp_html002 = temp_html005;
                    }
                    return temp_html002;
                }}
            ],

            onEditableSave: function (field, row, oldValue, $el) {
                $.ajax({
                    error: function () {
                        //alert("Error");
                    },
                    complete: function () {

                    }

                });
            }
        });
    };

    //得到查询的参数
    oTableInit.queryParams = function (params) {
        var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            pageSize: params.pageSize, //页面大小
            pageNumber: params.pageNumber, //页码

            //筛选参数
            hospitalizetionid: $("#txt_search_hospitalizetionid").val(),
            applino: $("#txt_search_applino").val(),
            inspmethod: $("#txt_search_inspmethod").val(),
            patientdiagkind: $("#txt_search_patientdiagkind").val(),
            inspdepartid: $("#txt_search_inspdepartid").val(),
            specialrequire: $("#txt_search_specialrequire").val(),
            inspdate001: $("#txt_search_inspdate001").val(),
            inspdate002: $("#txt_search_inspdate002").val(),
            acceptdate001: $("#txt_search_acceptdate001").val(),
            acceptdate002: $("#txt_search_acceptdate002").val(),
            sortName:this.sortName,
            sortOrder:this.sortOrder
        };
        return temp;
    };
    return oTableInit;
};

var ButtonInit = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        //初始化页面上面的按钮事件
    };

    return oInit;
};

