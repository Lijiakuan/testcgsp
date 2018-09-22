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

function transValueEdit(parameterDesc,parameterNo){
    if(parameterNo !=null){
        //var biaobenchuli = txt_search_biaobenchuli.val();
        //var rouyanguancha = txt_search_rouyanguancha.val();
        $('#txt_search_biaobenbuwei').attr("value",parameterDesc);
        $('#idsample').attr("value",parameterNo);
    }
}

$("[data-toggle='tooltip']").tooltip();

$(function () {
    //控制控件
    var btn_show001 = $("#btn_show001");
    var btn_sub001 = $("#btn_sub001");
    var btn_add001 = $("#btn_add001");



    //初始化隐藏控件
    for(var i = 0; i<9;i++){
        $("#home").find(".form-group").eq(i+4).hide();
    }

    /*
    for(i = 0;i<10;i++){
        $("#nav1").find(".form-group").eq(i+1).hide();
    }
    */

    for(i = 1;i<91;i++){
       $("#nav1").find(".form-group").eq(i).hide();
    }

    for(i = 0;i<10;i++){
        pic_groups[i] = 0;
    }

    //按钮
    //btn_add0
    $("#btn_add0").click(function(){
        $("#nav1").find(".form-group").eq(pic_groups[0]*10+1).show();
        pic_groups[0] = pic_groups[0] + 1;
    });
    $("#btn_sub0").click(function(){
        if(pic_groups[0]>=1){
            pic_groups[0] = pic_groups[0] - 1;
            $("#nav1").find(".form-group").eq(pic_groups[0]*10+1).hide();
        }
        else{
            pic_groups[0] = 0;
        }
    });

    var j,k;
    for(i = 0;i<10;i++){
        //+
        $("#nav1").find(".form-group").eq(i*10+1).find(".btn").eq(0).click(function(){
            for(j = 0;j<9;j++){
                $("#nav1").find(".form-group").eq(i*10+j+2).show();
            }
        });
        //-
    }

    //按钮功能
    $("#btn_add1").click(function(){
        $("#nav1").find(".form-group").eq(pic_groups[1]+2).show();
        pic_groups[1] = pic_groups[1] + 1;
    });

    $("#btn_sub1").click(function(){
        if(pic_groups[1]>=1){
            pic_groups[1] = pic_groups[1] - 1;
            $("#nav1").find(".form-group").eq(pic_groups[1]+2).hide();
        }
        else{
            pic_groups[1] = 0;
        }
    });
    $("#btn_add2").click(function(){
        $("#nav1").find(".form-group").eq(pic_groups[2]+12).show();
        pic_groups[2] = pic_groups[2] + 1;
    });

    $("#btn_sub2").click(function(){
        if(pic_groups[2]>=1){
            pic_groups[2] = pic_groups[2] - 1;
            $("#nav1").find(".form-group").eq(pic_groups[2]+12).hide();
        }
        else{
            pic_groups[2] = 0;
        }
    });
    $("#btn_add3").click(function(){
        $("#nav1").find(".form-group").eq(pic_groups[3]+22).show();
        pic_groups[3] = pic_groups[3] + 1;
    });

    $("#btn_sub3").click(function(){
        if(pic_groups[3]>=1){
            pic_groups[3] = pic_groups[3] - 1;
            $("#nav1").find(".form-group").eq(pic_groups[3]+22).hide();
        }
        else{
            pic_groups[3] = 0;
        }
    });
    $("#btn_add4").click(function(){
        $("#nav1").find(".form-group").eq(pic_groups[4]+32).show();
        pic_groups[4] = pic_groups[4] + 1;
    });

    $("#btn_sub4").click(function(){
        if(pic_groups[4]>=1){
            pic_groups[4] = pic_groups[4] - 1;
            $("#nav1").find(".form-group").eq(pic_groups[4]+32).hide();
        }
        else{
            pic_groups[4] = 0;
        }
    });
    $("#btn_add5").click(function(){
        $("#nav1").find(".form-group").eq(pic_groups[5]+42).show();
        pic_groups[5] = pic_groups[5] + 1;
    });

    $("#btn_sub5").click(function(){
        if(pic_groups[5]>=1){
            pic_groups[5] = pic_groups[5] - 1;
            $("#nav1").find(".form-group").eq(pic_groups[5]+42).hide();
        }
        else{
            pic_groups[5] = 0;
        }
    });
    $("#btn_add6").click(function(){
        $("#nav1").find(".form-group").eq(pic_groups[6]+52).show();
        pic_groups[6] = pic_groups[6] + 1;
    });

    $("#btn_sub6").click(function(){
        if(pic_groups[6]>=1){
            pic_groups[6] = pic_groups[6] - 1;
            $("#nav1").find(".form-group").eq(pic_groups[6]+52).hide();
        }
        else{
            pic_groups[6] = 0;
        }
    });
    $("#btn_add7").click(function(){
        $("#nav1").find(".form-group").eq(pic_groups[7]+62).show();
        pic_groups[7] = pic_groups[7] + 1;
    });

    $("#btn_sub7").click(function(){
        if(pic_groups[7]>=1){
            pic_groups[7] = pic_groups[7] - 1;
            $("#nav1").find(".form-group").eq(pic_groups[7]+62).hide();
        }
        else{
            pic_groups[7] = 0;
        }
    });
    $("#btn_add8").click(function(){
        $("#nav1").find(".form-group").eq(pic_groups[8]+72).show();
        pic_groups[8] = pic_groups[8] + 1;
    });

    $("#btn_sub8").click(function(){
        if(pic_groups[8]>=1){
            pic_groups[8] = pic_groups[8] - 1;
            $("#nav1").find(".form-group").eq(pic_groups[8]+72).hide();
        }
        else{
            pic_groups[8] = 0;
        }
    });
    $("#btn_add9").click(function(){
        $("#nav1").find(".form-group").eq(pic_groups[9]+82).show();
        pic_groups[9] = pic_groups[9] + 1;
    });
    $("#btn_sub9").click(function(){
        if(pic_groups[9]>=1){
            pic_groups[9] = pic_groups[9] - 1;
            $("#nav1").find(".form-group").eq(pic_groups[9]+82).hide();
        }
        else{
            pic_groups[9] = 0;
        }
    });

    $("#btn_add").click(function(){
        main = main + 1;
        $("#home").find(".form-group").eq(main+3).show();
    });
    $("#btn_sub").click(function(){
        if(main>=1){
            main = main - 1;
            $("#home").find(".form-group").eq(main+4).hide();
        }
        else{
            main = 0;
        }
    });

    //标本处理
    var txt_search_biaobenchuli = $("#txt_search_biaobenchuli");
    txt_search_biaobenchuli.append("<option></option>");
    txt_search_biaobenchuli.append("<option>常规保留</option>");
    txt_search_biaobenchuli.append("<option>永久保留</option>");
    txt_search_biaobenchuli.append("<option>教学标本</option>");
    txt_search_biaobenchuli.append("<option>科研标本</option>");
    txt_search_biaobenchuli.append("<option>全埋</option>");
    txt_search_biaobenchuli.append("<option>脱钙</option>");
    txt_search_biaobenchuli.append("<option>已用完</option>");
    txt_search_biaobenchuli.append("<option>销毁</option>");


    //数据上传submit功能
    $("#btn_submit").click(function() {

        var tempSampleId = $('#idsample').val();
        var biaobenchuli = $("#txt_search_biaobenchuli").val();
        var rouyanguancha = $('#txt_search_rouyanguancha').val();

        var tempSamplePicUploadValue;
        var tempSamplePicDescValue;

        var homeNode = $("#home");
        var tempSamplePicDescList = homeNode.find(".form-group div").find("textarea:visible");
        var tempSamplePicUploadList = homeNode.find(".form-group div").find("input:visible");

        /*
         * @RequestParam("sampleno") String sampleno
         * @RequestParam("applino") String applino
         * @RequestParam("sampledesc") String sampledesc
         * @RequestParam("sampleresult") String sampleresult
         * @RequestParam("advicekind") String advicekind
         * @RequestParam("visualobservation") String visualobservation
         * @RequestParam("deelresult") String deelresult
         * @RequestParam("drawnum") String drawnum
         * */

        var tempSamplePicUploadValueNum = tempSamplePicUploadList.length - 1;


        //插入蜡块及蜡块图像
        var nav1 = $('#nav1');
        var tempDrawPicDescList = nav1.find(".form-group").find("textarea:visible");
        var tempDrawPicList = nav1.find(".form-group").find("input.file:visible");
        var numDraw = pic_groups[0];
        var j, k;
        var tempDrawNo;
        var tempDrawPicUploadValue;
        var tempDrawPicDescUploadValue;
        k = 0;
        $.ajax({
            type: "post",
            url: "/acceptsample/updateAcceptsampleByIds",
            async: false,
            dataType: "json",
            data: {
                'sampleno': tempSampleId,
                'visualobservation': rouyanguancha,
                'deelresult': biaobenchuli,
                'drawnum': numDraw
            },
            success: function (data1) {
                //alert('组织保存成功！');
            },
            error: function () {
                //alert('组织保存错误！');
            }
        });

        if (tempSamplePicUploadList.length > 1) {
            for (i = 1; i < tempSamplePicUploadList.length; i++) {
                tempSamplePicUploadValue = tempSamplePicUploadList[i].value;
                tempSamplePicDescValue = tempSamplePicDescList[i].value;
                $.ajax({
                    type: "post",
                    url: "/acceptsample/insertSamplePhoto",
                    async: false,
                    dataType: "json",
                    data: {
                        'sampleno': tempSampleId,
                        'filepath': tempSamplePicUploadValue,
                        'filedesc': tempSamplePicDescValue
                    },
                    success: function (data1) {
                        //alert('组织照片插入成功！');
                    },
                    error: function () {
                        //alert('组织照片保存错误！');
                    }
                });
            }
        }


        for (i = 0; i < numDraw; i++) {
            $.ajax({
                type: "post",
                url: "/paologydraw/insertPathologyDraw",
                async: false,
                dataType: "json",
                data: {
                    'sampleno': tempSampleId
                },
                success: function (data1) {
                    //查询新插入ID
                    //getTopNPathologydraw

                    for (j = 1; j < pic_groups[i+1]; j++) {

                        tempDrawNo = data1.success.drawno;
                        debugger;
                        tempDrawPicUploadValue = tempDrawPicList[k + j + i].value;
                        tempDrawPicDescUploadValue = tempDrawPicDescList[k + j + i].value;
                        $.ajax({
                            type: "post",
                            url: "/paologydraw/insertDrawPhoto",
                            async: false,
                            dataType: "json",
                            data: {
                                'drawno': tempDrawNo,
                                'filepath': tempDrawPicUploadValue,
                                'filedesc': tempDrawPicDescUploadValue
                            },
                            success: function (data1) {
                                //alert('蜡块照片成功');
                            },
                            error: function () {
                                //alert('蜡块照片错误！');
                            }
                        });
                        k += pic_groups[i+1];
                    }
                },
                error: function () {
                    //alert('蜡块保存错误！');
                }
            });

        }
    });

    //1.初始化Table
    var oTable002 = new TableInit002();
    oTable002.Init();

    //2.初始化Button的点击事件
    var oButtonInit002 = new ButtonInit002();
    oButtonInit002.Init();

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
        cancerfoundsize:''
    };


    //移动数据
    var btn_trans002 = $("#btn_trans002");
    var trans002 = new Array();
    btn_trans002.click(function () {
        var rowLists002 = $('#tb_tasks002').bootstrapTable('getSelections');
        if (rowLists002.length < 1 ) {
            alert("请至少选择一行保存!");
            return;
        }
        else{
            for(var i = 0;i<rowLists002.length;i++){
                trans002.push(rowLists002[i].sampleno);
            }
        }
        //移动数据


        queryResultsNextBy002(trans002);
    });
});

function getJsonLength(jsonData){
    var jsonLength = 0;
    for(var item in jsonData){
        jsonLength++;
    }
    return jsonLength;
}

function queryResultsNextBy002(ids){
    var opt = {
        url: '/paologydraw/selectPathologydrawbyIds?ids='+ids,
        query:{
            pageSize: 10, //页面大小
            pageNumber: 1, //页码

            //筛选参数
            patientname:ids,//需要查询的病理号数组
            sortName:"drawno",
            sortOrder:"asc"
        }

    };
    $('#tb_tasks003').bootstrapTable('refresh',opt);
}

var TableInit002 = function () {
    var oTableInit002 = new Object();
    //初始化Table
    oTableInit002.Init = function () {
        $('#tb_tasks002').bootstrapTable({
            url: null, //请求后台的URL（*）
            //contextMenu: '#example1-context-menu',
            method: 'get', //请求方式（*）
            dataType: "json",
            toolbar002: '#toolbar002', //工具按钮用哪个容器
            striped: true, //是否显示行间隔色
            cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true, //是否显示分页（*）
            sortable: true, //是否启用排序
            sortOrder: "asc", //排序方式
            queryParams: oTableInit002.queryParams,//传递参数（*）
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
            uniqueId: "applino", //每一行的唯一标识，一般为主键列
            showToggle:true, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
            showExport: true,
            exportDataType: "selected",              //'basic', 'all', 'selected'.
            columns: [
                {checkbox: true},
                {field:'sampleno',title:'标本编号',width:150,align:'center',sortable:true,formatter:function(value,row,index){
                return "APP"+"-"+"00"+row.applino.applino+"-SAM00"+row.sampleno;
        }},
                {field:'sampledesc',title:'标本名称',width:100,align:'left',sortable : true},
                {field:'advicekind',title:'医嘱类型',width:100,align:'left',sortable : true},
                {field:'drawnum',title:'取材块数',width:100,align:'left',sortable:true},
                {field:'diagnosisrecord',title:'状态',width:100,align:'left',sortable:true},
                {field:'pdfpath',title:'操作',width:100,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
            var temp_html001;
                    parameterDesc = row.sampledesc;
                    parameterNo = row.sampleno;
                    temp_html001 = '<button type="button" class="btn btn-xs btn-danger" data-toggle="modal" data-target="#myModal1" onclick="transValueEdit(parameterDesc,parameterNo)">&nbsp&nbsp&nbsp&nbsp记录&nbsp&nbsp&nbsp&nbsp</button>';
            return temp_html001;
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
    oTableInit002.queryParams = function (params) {
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
    return oTableInit002;
};


var ButtonInit002 = function () {
    var oInit002 = new Object();
    var postdata = {};

    oInit002.Init = function () {
        //初始化页面上面的按钮事件
    };

    return oInit002;
};

