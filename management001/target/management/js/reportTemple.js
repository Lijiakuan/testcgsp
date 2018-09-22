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


function transValueEdit(applino){
    //获得数据
    $.ajax({
        type: "get",
        url: "/selectPatientinfoByNo?patientno="+applino,
        async: false,
        dataType:"json",
        success: function (data1) {
            $("#txt_result_patientname").attr("value",data1.rows[0].patientname);
            $("#txt_result_patientgender").attr("value",data1.rows[0].gender);
            $("#txt_result_patientage").attr("value",data1.rows[0].age);
            $("#txt_result_applino").attr("value",data1.rows[0].patientappli001List[0].applino);
            $("#txt_result_inspunitname").attr("value",data1.rows[0].patientappli001List[0].inspunitname);
            $("#txt_result_inspdepartid").attr("value",data1.rows[0].patientappli001List[0].inspdepartid.name);
            $("#txt_result_bedid").attr("value",data1.rows[0].bedid);
            $("#txt_result_hospitalizetionid").attr("value",data1.rows[0].hospitalizetionid);
            $("#txt_result_outpatientid").attr("value",data1.rows[0].outpatientid);
            $("#txt_result_inspdoctid").attr("value",data1.rows[0].patientname);
            var tempDate;
            var temp_html = "";
            tempDate = data1.rows[0].patientappli001List[0].inspdate;
            if(tempDate != null){
                temp_html = new Date(tempDate).Format("yyyy-MM-dd");
            }
            $("#txt_result_inspdate").attr("value",temp_html);
            var temp,temp001;
            temp001 = "";

        },
        error: function () {
            alert("Error");
        }
    });
}

$("[data-toggle='tooltip']").tooltip();

function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var reg_rewrite = new RegExp("(^|/)" + name + "/([^/]*)(/|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    var q = window.location.pathname.substr(1).match(reg_rewrite);
    if(r != null){
        return unescape(r[2]);
    }else if(q != null){
        return unescape(q[2]);
    }else{
        return null;
    }
}

function mapValues(methodkey){
    var m = new Map();

    m.set('活检','btn btn-danger');
    m.set('免疫组化','btn btn-warning');
    m.set('快速冰冻','btn btn-success');
    m.set('细胞学','btn btn-info');
    m.set('TCT','btn btn-primary');
    m.set('免疫组化','btn btn-danger');
    m.set('FISH','btn btn-success');
    m.set('基因检测','btn btn-info');
    m.set('肿瘤DNA倍体','btn btn-primary');

    var buttonModel = '<button type="button" class="'+m.get(methodkey)+'" style="width: 130px">'+ methodkey +'</button>';
    return buttonModel;
}


$(function () {
    $.ajax({
        type: "post",
        //保存数据
        url: "/paologydraw/selectPaologydraw",
        async: false,
        //traditional: true,
        data: {'sampleno': drawno},
        dataType:"json",
        success: function (data) {
            var inspmethodStr = "";
            for(var i=0;i<data.rows[0].sampleno.applino.inspmethodList.length;i++){
                inspmethodStr+=mapValues(data.rows[0].sampleno.applino.inspmethodList[i].dicinspmethodno.disinspmethodname) + "&nbsp&nbsp";
            }

            $("#txt_search_applino").attr("value",data.rows[0].sampleno.applino.applino);

            $("#txt_search_patientage").attr("value",data.rows[0].sampleno.applino.patientinfo.patientname);
            $("#txt_search_patientname").attr("value",data.rows[0].sampleno.applino.patientinfo.age);
            $("#txt_search_biaobenbuwei").attr("value",data.rows[0].drawposition);
            $("#txt_search_lakuaibianhao").attr("value",data.rows[0].drawno);
            $("#txt_search_teshuyaoqiu").attr("value",data.rows[0].sampleno.applino.specialrequire);
            $("#id_jianchafangfa").html(inspmethodStr);


        },
        error: function () {
            alert("Error");
        }
    });
    var btn_he = $("#he");
    var btn_special = $("#special");
    var btn_immune = $("#immune");

    var formSearch002 = $("#formSearch002");
    var formSearch003 = $("#formSearch003");
    var formSearch004 = $("#formSearch004");

    formSearch002.hide();
    formSearch003.hide();
    formSearch004.hide();

    var btn_show001 = $("#btn_show001");
    var btn_sub001 = $("#btn_sub001");
    var btn_add001 = $("#btn_add001");

    var btn_show002 = $("#btn_show002");
    var btn_sub002 = $("#btn_sub002");
    var btn_add002 = $("#btn_add002");

    var btn_show003 = $("#btn_show003");
    var btn_sub003 = $("#btn_sub003");
    var btn_add003 = $("#btn_add003");

    var value_he = 0;
    var value_special = 0;
    var value_immune= 0;

    btn_show001.html(value_he);
    btn_show002.html(value_special);
    btn_show003.html(value_immune);

    var position001 = $("#position001");
    var position002 = $("#position002");
    var position003 = $("#position003");

    for(var i=0;i<10;i++){
        position001.find(".form-group").eq(i).hide();
        position002.find(".form-group").eq(i).hide();
        position003.find(".form-group").eq(i+1).hide();
    }
    //按钮1
    btn_sub001.click(function(){
        if(value_he>=1){
            value_he = value_he - 1;
            position001.find(".form-group").eq(value_he).hide();
        }
        else{
            value_he = 0;
        }
        btn_show001.html(value_he);

    });
    btn_add001.click(function(){
        value_he = value_he + 1;
        btn_show001.html(value_he);
        position001.find(".form-group").eq(value_he-1).show();
    });
    //按钮2
    btn_sub002.click(function(){
        if(value_special>=1){
            value_special = value_special - 1;
            position002.find(".form-group").eq(value_special).hide();
        }
        else{
            value_special = 0;
        }
        btn_show002.html(value_special);

    });
    btn_add002.click(function(){
        value_special = value_special + 1;
        btn_show002.html(value_special);
        position002.find(".form-group").eq(value_special-1).show();
    });
    //按钮3
    btn_sub003.click(function(){
        if(value_immune>=1){
            value_immune = value_immune - 1;
            position003.find(".form-group").eq(value_immune+2).hide();
        }
        else{
            value_immune = 0;
        }
        btn_show003.html(value_immune);

    });
    btn_add003.click(function(){
        value_immune = value_immune + 1;
        btn_show003.html(value_immune);
        position003.find(".form-group").eq(value_immune+1).show();
    });

    //按钮显示功能
    btn_he.click(function(){
       formSearch002.toggle();
    });
    btn_special.click(function(){
        formSearch003.toggle();
    });
    btn_immune.click(function(){
        formSearch004.toggle();
    });

    //2。特殊染色
    var tempControls001 = $("#home1 .btn-warning");
    for(var w=0;w<tempControls001.length;w++){
        var temp001 = tempControls001.eq(w);
        temp001.click(function(){
            if($(this).hasClass('btn btn-warning')){
                $(this).removeClass('btn btn-warning');
                $(this).addClass('btn btn-success');
                array002.push($(this).html());
            }
        });
    }
    //3.1免疫组化
    var tempControls002 = $("#home .btn-warning");
    for(w=0;w<tempControls002.length;w++){
        var temp002 = tempControls002.eq(w);
        temp002.click(function(){
            if($(this).hasClass('btn btn-warning')){
                $(this).removeClass('btn btn-warning');
                $(this).addClass('btn btn-success');
                array003.push($(this).html());
            }
        });
    }
    //3.2套餐
    var tempControls003 = $("#taocan .btn-warning");

    tempControls003.eq(0).click(function(){
        if($(this).hasClass('btn btn-warning')) {
            $(this).removeClass('btn btn-warning');
            $(this).addClass('btn btn-success');
            for(i=0;i<5;i++){
                if(tempControls002.eq(i).hasClass('btn btn-warning')){
                    tempControls002.eq(i).removeClass('btn btn-warning');
                    tempControls002.eq(i).addClass('btn btn-success');
                    array003.push(tempControls002.eq(i).html());
                }
            }
        }
    });
    tempControls003.eq(1).click(function(){
        if($(this).hasClass('btn btn-warning')) {
            $(this).removeClass('btn btn-warning');
            $(this).addClass('btn btn-success');
            for(i=23;i<27;i++){
                if(tempControls002.eq(i).hasClass('btn btn-warning')){
                    tempControls002.eq(i).removeClass('btn btn-warning');
                    tempControls002.eq(i).addClass('btn btn-success');
                    array003.push(tempControls002.eq(i).html());
                }
            }
        }
    });
    tempControls003.eq(2).click(function(){
        if($(this).hasClass('btn btn-warning')) {
            $(this).removeClass('btn btn-warning');
            $(this).addClass('btn btn-success');
            for(i=15;i<22;i++){
                if(tempControls002.eq(i).hasClass('btn btn-warning')){
                    tempControls002.eq(i).removeClass('btn btn-warning');
                    tempControls002.eq(i).addClass('btn btn-success');
                    array003.push(tempControls002.eq(i).html());
                }
            }
        }
    });

    var save003 = $('#save003');
    save003.click(function(){
        var tempStr002;
        var tempStr003='';
        var tempStr001='';
        for(tempStr002 in array003){
            tempStr001 = '<button type="button" class="btn btn-info" style="width: 130px">' + array003[tempStr002] + '</button>';
            tempStr003 += tempStr001;
            tempStr003 += '&nbsp&nbsp';
        }
        $('#ransefangfa').html(tempStr003);
    });
    var teshuranse003 = $('#teshuranse003');
    teshuranse003.click(function(){
        var tempStr002;
        var tempStr003 = '';
        var tempStr001='';
        for(tempStr002 in array002){
            tempStr001 = '<button type="button" class="btn btn-info" style="width: 130px">' + array002[tempStr002] + '</button>';
            tempStr003 += tempStr001;
            tempStr003 += '&nbsp&nbsp';
        }
        $('#teshuranseresult001').html(tempStr003);
    });

    var array_length=0;
    //保存并新建切片
    var allsave = $('#allsave');

    allsave.click(function(){
        var tempPos001_length = $('#position001 input:visible').length;
        if(tempPos001_length>0){
            for(i=0;i<tempPos001_length;i++){
                array001[i] = $('#position001 input:visible').eq(i).val();
            }
        }
        debugger;
        /*
        * 1.HE染色
        * */
        var resultkind = 'HE染色';
        for(i =0,array_length=array001.length;i<array_length;i++){
            $.ajax({
                type: "post",
                //保存数据
                url: "/product/insertNewProduct",
                async: false,
                //traditional: true,
                data: {'drawno': drawno,
                    'resultkind':resultkind,
                    'productnote':array001[i]
                },
                dataType:"json",
                success: function (data) {
                },
                error: function () {
                    alert("Error");
                }
            });
        }
        /*
        * 2.特殊染色
        * */
        resultkind = '特殊染色';
        if(array002.length>0){
            for(i=0,array_length=array002.length;i<array_length;i++){
                $.ajax({
                    type: "post",
                    //保存数据
                    url: "/product/insertNewProduct",
                    async: false,
                    //traditional: true,
                    data: {'drawno': drawno,
                        'resultkind':resultkind,
                        'productnote':array002[i]
                    },
                    dataType:"json",
                    success: function (data) {
                    },
                    error: function () {
                        alert("Error");
                    }
                });
            }
        }

        /*
         * 3.免疫组化
         * */
        resultkind = '免疫组化';
        if(array003.length>0){
            for(i=0,array_length=array003.length;i<array_length;i++){
                $.ajax({
                    type: "post",
                    //保存数据
                    url: "/product/insertNewProduct",
                    async: false,
                    //traditional: true,
                    data: {'drawno': drawno,
                        'resultkind':resultkind,
                        'productnote':array003[i]
                    },
                    dataType:"json",
                    success: function (data) {
                    },
                    error: function () {
                        alert("Error");
                    }
                });
            }
        }

    });
});



function getJsonLength(jsonData){
    var jsonLength = 0;
    for(var item in jsonData){
        jsonLength++;
    }
    return jsonLength;
}


//添加工具
/*Array.prototype.indexOf = function(val) {
    for (var i = 0; i < this.length; i++) {
        if (this[i] == val) return i;
    }
    return -1;
};
Array.prototype.remove = function(val) {
    var index = this.indexOf(val);
    if (index > -1) {
        this.splice(index, 1);
    }
};*/


