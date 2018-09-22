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
            url: '/selectMeds',
            query:{
                pageSize: 10, //页面大小
                pageNumber: 1, //页码

                //筛选参数
                tongyongmingcheng: $("#txt_search_tongyongmingcheng").val(),
                yingwenming: $("#txt_search_yingwenming").val(),
                laiyuan: $("#txt_search_laiyuan").val(),
                yuanliao: $("#txt_search_yuanliao").val(),
                zhuangtai: $("#txt_search_zhuangtai").val(),
                leibie001: $("#txt_search_leibie001").val(),
                leibie002: $("#txt_search_leibie002").val(),
                leibie003: $("#txt_search_leibie003").val(),
                guanlileibie: $("#txt_search_guanlileibie").val(),
                chufangyao: $("#txt_search_chufangyao").val(),
                chengfen: $("#txt_search_chengfen").val(),
                biaozhunguidingguige: $("#txt_search_biaozhunguidingguige").val(),
                biaozhunwaiguige: $("#txt_search_biaozhunwaiguige").val(),
                shiyongduixiang: $("#txt_search_shiyongduixiang").val(),
                yongtu: $("#txt_search_yongtu").val(),
                xianlianghuoxiuyao: $("#txt_search_xianlianghuoxiuyao").val(),
                pizhunshijian: $("#txt_search_pizhunshijian").val(),
                biaozhunyange: $("#txt_search_biaozhunyange").val(),
                beizhu: $("#txt_search_beizhu").val(),

                shenbaodanwei: $("#txt_search_shenbaodanwei").val(),
                baocuntiaojian: $("#txt_search_baocuntiaojian").val(),
                zhijileibie: $("#txt_search_zhijileibie").val(),
                fufangyufou: $("#txt_search_fufangyufou").val(),
                yuliu001: $("#txt_search_yuliu001").val(),
                yuliu002: $("#txt_search_yuliu002").val(),
                jinkouyuguochan: $("#txt_search_jinkouyuguochan").val(),

                xiuyaoqi:$("#txt_search_xiuyaoqi").val(),

                pizhunriqi1:$("#txt_search_pizhunriqi1").val(),
                pizhunriqi2:$("#txt_search_pizhunriqi2").val(),

                sortName:"id",
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
    var txt_search_tongyongmingcheng = $('#txt_search_tongyongmingcheng');
    var txt_search_yingwenming = $('#txt_search_yingwenming');
    var txt_search_laiyuan = $('#txt_search_laiyuan');
    var txt_search_yuanliao = $('#txt_search_yuanliao');
    var txt_search_zhuangtai = $('#txt_search_zhuangtai');
    var txt_search_leibie001 = $('#txt_search_leibie001');
    var txt_search_leibie002 = $('#txt_search_leibie002');
    var txt_search_leibie003 = $('#txt_search_leibie003');
    var txt_search_guanlileibie = $('#txt_search_guanlileibie');
    var txt_search_chufangyao = $('#txt_search_chufangyao');
    var txt_search_chengfen = $('#txt_search_chengfen');
    var txt_search_biaozhunguidingguige = $('#txt_search_biaozhunguidingguige');
    var txt_search_biaozhunwaiguige = $('#txt_search_biaozhunwaiguige');
    var txt_search_shiyongduixiang = $('#txt_search_shiyongduixiang');
    var txt_search_yongtu = $('#txt_search_yongtu');
    var txt_search_xianlianghuoxiuyao = $('#txt_search_xianlianghuoxiuyao');
    var txt_search_pizhunshijian = $('#txt_search_pizhunshijian');
    var txt_search_biaozhunyange = $('#txt_search_biaozhunyange');

    var txt_search_shenbaodanwei = $('#txt_search_shenbaodanwei');
    var txt_search_baocuntiaojian = $("#txt_search_baocuntiaojian");
    var txt_search_zhijileibie = $("#txt_search_zhijileibie");
    var txt_search_fufangyufou = $("#txt_search_fufangyufou");
    var txt_search_yuliu001 = $("#txt_search_yuliu001");
    var txt_search_yuliu002 = $("#txt_search_yuliu002");
    var txt_search_jinkouyuguochan = $("#txt_search_jinkouyuguochan");

    var txt_search_xiuyaoqi = $("#txt_search_xiuyaoqi");

    var txt_search_pizhunriqi1 = $("#txt_search_pizhunriqi1");
    var txt_search_pizhunriqi2 = $("#txt_search_pizhunriqi2");
    //进口或国产
    txt_search_jinkouyuguochan.append("<option></option>");
    txt_search_jinkouyuguochan.append("<option>进口</option>");
    txt_search_jinkouyuguochan.append("<option>国产</option>");
    //原料
    $.ajax({
        type: "get",
        url: "/getDistYuanliao",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            txt_search_yuanliao.append("<option>"+"</option>");
            for(var i = 0;i<data1.length;i++){
                tempValue = data1[i];
                txt_search_yuanliao.append("<option>"+tempValue+"</option>");
            }
        },
        error: function () {
            alert("原料Error");
        }
    });
    //状态
    $.ajax({
        type: "get",
        url: "/getDistZhuangtai",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            txt_search_zhuangtai.append("<option>"+"</option>");
            for(var i = 0;i<data1.length;i++){
                tempValue = data1[i];
                txt_search_zhuangtai.append("<option>"+tempValue+"</option>");
            }
        },
        error: function () {
            alert("状态Error");
        }
    });
    //一类类别
    $.ajax({
        type: "get",
        url: "/getDistLeibie001",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            txt_search_leibie001.append("<option>"+"</option>");
            for(var i = 0;i<data1.length;i++){
                tempValue = data1[i];
                txt_search_leibie001.append("<option>"+tempValue+"</option>");
            }
        },
        error: function () {
            alert("一类类别Error");
        }
    });
    //二类类别
    $.ajax({
        type: "get",
        url: "/getDistLeibie002",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            txt_search_leibie002.append("<option>"+"</option>");
            for(var i = 0;i<data1.length;i++){
                tempValue = data1[i];
                txt_search_leibie002.append("<option>"+tempValue+"</option>");
            }
        },
        error: function () {
            alert("二类类别Error");
        }
    });
    //三类类别
    $.ajax({
        type: "get",
        url: "/getDistLeibie003",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            txt_search_leibie003.append("<option>"+"</option>");
            for(var i = 0;i<data1.length;i++){
                tempValue = data1[i];
                txt_search_leibie003.append("<option>"+tempValue+"</option>");
            }
        },
        error: function () {
            alert("三类类别Error");
        }
    });
    //管理类别
    $.ajax({
        type: "get",
        url: "/getDistGuanlileibie",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            txt_search_guanlileibie.append("<option>"+"</option>");
            for(var i = 0;i<data1.length;i++){
                tempValue = data1[i];
                txt_search_guanlileibie.append("<option>"+tempValue+"</option>");
            }
        },
        error: function () {
            alert("管理类别Error");
        }
    });
    //处方药
    $.ajax({
        type: "get",
        url: "/getDistChufangyao",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            txt_search_chufangyao.append("<option>"+"</option>");
            for(var i = 0;i<data1.length;i++){
                tempValue = data1[i];
                txt_search_chufangyao.append("<option>"+tempValue+"</option>");
            }
        },
        error: function () {
            alert("处方药Error");
        }
    });
    //标外规格
    $.ajax({
        type: "get",
        url: "/getDistBiaozhunwaiguige",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            txt_search_biaozhunwaiguige.append("<option>"+"</option>");
            for(var i = 0;i<data1.length;i++){
                tempValue = data1[i];
                txt_search_biaozhunwaiguige.append("<option>"+tempValue+"</option>");
            }
        },
        error: function () {
            alert("标外规格Error");
        }
    });
    //批准时间
    $.ajax({
        type: "get",
        url: "/getDistPizhunshijian",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            txt_search_pizhunshijian.append("<option>"+"</option>");
            for(var i = 0;i<data1.length;i++){
                tempValue = data1[i];
                txt_search_pizhunshijian.append("<option>"+tempValue+"</option>");
            }
        },
        error: function () {
            alert("批准时间Error");
        }
    });

    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

    //2.初始化Button的点击事件
    var oButtonInit = new ButtonInit();
    oButtonInit.Init();

    var tempButton = $('#btn_add');
    var tempButtondel = $('#btn_delete');
    var tempButtonsave = $('#btn_save');
    var tempQuery = $('#btn_query');
    var tempExport = $('#btn_output');
    var newRowData = {
        id:'',
        tongyongmingcheng:'',
        yingwenming:'',
        laiyuan:'',
        yuanliao:'',
        zhuangtai:'',
        leibie001:'',
        leibie002:'',
        leibie003:'',
        guanlileibie:'',
        chufangyao:'',
        chengfen:'',
        biaozhunguidingguige:'',
        biaozhunwaiguige:'',
        shiyongduixiang:'',
        yongtu:'',
        xianlianghuoxiuyao:'',
        pizhunshijian:'',
        biaozhunyange:'',
        beizhu:'',
        shenbaodanwei:'',
        baocuntiaojian:'',
        zhijileibie:'',
        fufangyufou:'',
        yuliu001:'',
        yuliu002:'',
        jinkouyuguochan:'',
        xiuyaoqi:'',
        pizhunriqi:''
    };

    tempQuery.click(function(){
        queryResults();
    });


    tempExport.click(function(){
        //筛选参数
        downloadFilebyAjax();
    });

    //新建数据记录
    tempButton.click(function () {
        $('#tb_tasks').bootstrapTable('append', newRowData);
        $('#tb_tasks').bootstrapTable('scrollTo', 'bottom');
        $.ajax({
            type: "post",
            //保存数据
            url: "/insertNewRecord",
            async: false,
            dataType:"json",
            success: function (data) {
                $('#tb_tasks').bootstrapTable('load',data);
                //alert("保存成功");
            },
            error: function () {
                alert("Error");
            }
        });
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
            url: "/updateMedsByIds",
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
            return row.id;
        });
        if (ids.length < 1 ) {
            alert("请选择一行删除!");
            return;
        }

        //删除数据并同步到数据库
        $.ajax({
            type: "post",
            url: "/delMedById",
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
            field: 'id',
            values: ids
        });
    });

});

function downloadFilebyAjax() {
    var url = "/downloadExcel";

    var tongyongmingcheng=$("#txt_search_tongyongmingcheng").val();
    var yingwenming=$("#txt_search_yingwenming").val();
    var laiyuan=$("#txt_search_laiyuan").val();
    var yuanliao=$("#txt_search_yuanliao").val();
    var zhuangtai=$("#txt_search_zhuangtai").val();
    var leibie001=$("#txt_search_leibie001").val();
    var leibie002=$("#txt_search_leibie002").val();
    var leibie003=$("#txt_search_leibie003").val();
    var guanlileibie=$("#txt_search_guanlileibie").val();
    var chufangyao=$("#txt_search_chufangyao").val();
    var chengfen=$("#txt_search_chengfen").val();
    var biaozhunguidingguige=$("#txt_search_biaozhunguidingguige").val();
    var biaozhunwaiguige=$("#txt_search_biaozhunwaiguige").val();
    var shiyongduixiang=$("#txt_search_shiyongduixiang").val();
    var yongtu=$("#txt_search_yongtu").val();
    var xianlianghuoxiuyao=$("#txt_search_xianlianghuoxiuyao").val();
    var pizhunshijian=$("#txt_search_pizhunshijian").val();
    var biaozhunyange=$("#txt_search_biaozhunyange").val();
    var beizhu=$("#txt_search_beizhu").val();

    var shenbaodanwei=$("#txt_search_shenbaodanwei").val();
    var baocuntiaojian=$("#txt_search_baocuntiaojian").val();
    var zhijileibie=$("#txt_search_zhijileibie").val();
    var fufangyufou=$("#txt_search_fufangyufou").val();
    var yuliu001=$("#txt_search_yuliu001").val();
    var yuliu002=$("#txt_search_yuliu002").val();
    var jinkouyuguochan=$("#txt_search_jinkouyuguochan").val();

    var xiuyaoqi=$("#txt_search_xiuyaoqi").val();

    var pizhunriqi1=$("#txt_search_pizhunriqi1").val();
    var pizhunriqi2=$("#txt_search_pizhunriqi2").val();

    var form = $("<form></form>").attr("action", url).attr("method", "post");
    form.append($("<input></input>").attr("type", "hidden").attr("name", "tongyongmingcheng").attr("value", tongyongmingcheng));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "yingwenming").attr("value", yingwenming));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "laiyuan").attr("value", laiyuan));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "yuanliao").attr("value", yuanliao));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "zhuangtai").attr("value", zhuangtai));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "leibie001").attr("value", leibie001));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "leibie002").attr("value", leibie002));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "leibie003").attr("value", leibie003));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "guanlileibie").attr("value", guanlileibie));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "chufangyao").attr("value", chufangyao));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "chengfen").attr("value", chengfen));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "biaozhunguidingguige").attr("value", biaozhunguidingguige));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "biaozhunwaiguige").attr("value", biaozhunwaiguige));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "shiyongduixiang").attr("value", shiyongduixiang));

    form.append($("<input></input>").attr("type", "hidden").attr("name", "yongtu").attr("value", yongtu));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "xianlianghuoxiuyao").attr("value", xianlianghuoxiuyao));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "pizhunshijian").attr("value", pizhunshijian));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "biaozhunyange").attr("value", biaozhunyange));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "beizhu").attr("value", beizhu));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "shenbaodanwei").attr("value", shenbaodanwei));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "baocuntiaojian").attr("value", baocuntiaojian));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "zhijileibie").attr("value", zhijileibie));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "fufangyufou").attr("value", fufangyufou));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "yuliu001").attr("value", yuliu001));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "yuliu002").attr("value", yuliu002));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "jinkouyuguochan").attr("value", jinkouyuguochan));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "xiuyaoqi").attr("value", xiuyaoqi));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "pizhunriqi1").attr("value", pizhunriqi1));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "pizhunriqi2").attr("value", pizhunriqi2));

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
        url: '/selectMeds',
        query:{
            pageSize: 10, //页面大小
            pageNumber: 1, //页码

            //筛选参数
            tongyongmingcheng: $("#txt_search_tongyongmingcheng").val(),
            yingwenming: $("#txt_search_yingwenming").val(),
            laiyuan: $("#txt_search_laiyuan").val(),
            yuanliao: $("#txt_search_yuanliao").val(),
            zhuangtai: $("#txt_search_zhuangtai").val(),
            leibie001: $("#txt_search_leibie001").val(),
            leibie002: $("#txt_search_leibie002").val(),
            leibie003: $("#txt_search_leibie003").val(),
            guanlileibie: $("#txt_search_guanlileibie").val(),
            chufangyao: $("#txt_search_chufangyao").val(),
            chengfen: $("#txt_search_chengfen").val(),
            biaozhunguidingguige: $("#txt_search_biaozhunguidingguige").val(),
            biaozhunwaiguige: $("#txt_search_biaozhunwaiguige").val(),
            shiyongduixiang: $("#txt_search_shiyongduixiang").val(),
            yongtu: $("#txt_search_yongtu").val(),
            xianlianghuoxiuyao: $("#txt_search_xianlianghuoxiuyao").val(),
            pizhunshijian: $("#txt_search_pizhunshijian").val(),
            biaozhunyange: $("#txt_search_biaozhunyange").val(),
            beizhu: $("#txt_search_beizhu").val(),

            shenbaodanwei: $("#txt_search_shenbaodanwei").val(),
            baocuntiaojian: $("#txt_search_baocuntiaojian").val(),
            zhijileibie: $("#txt_search_zhijileibie").val(),
            fufangyufou: $("#txt_search_fufangyufou").val(),
            yuliu001: $("#txt_search_yuliu001").val(),
            yuliu002: $("#txt_search_yuliu002").val(),
            jinkouyuguochan: $("#txt_search_jinkouyuguochan").val(),

            xiuyaoqi:$("#txt_search_xiuyaoqi").val(),

            pizhunriqi1:$("#txt_search_pizhunriqi1").val(),
            pizhunriqi2:$("#txt_search_pizhunriqi2").val(),
            sortName:"id",
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
            url: '/selectMeds', //请求后台的URL（*）
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
            uniqueId: "id", //每一行的唯一标识，一般为主键列
            showToggle:true, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
            showExport: true,
            exportDataType: "selected",              //'basic', 'all', 'selected'.
            columns: [
                {checkbox: true},
                {field:'id',title:'ID',width:45,align:'center',sortable : true},
                {field:'pdfpath',title:'文件地址',width:150,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                    var temp_html;
                    if(value == null || value == ""){
                        temp_html = '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="transValue('+ row.id +')">上传</button>';
                        return temp_html;
                    }
                    else
                    {
                        var b='\\\\';
                        var path_instead = row.pdfpath.replace(/\\/g,b);
                        var temp_html2 = '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="transValue('+ row.id +')">上传</button>';
                        temp_html = "<button type='button' class='btn btn-success'  onclick=\"transPathValue('"+ row.id + "\',\'" +  path_instead + "\')\">预览</button>";
                        temp_html2 += '&nbsp&nbsp' + temp_html;
                        return temp_html2;
                    }
                }},
                {field:'tongyongmingcheng',title:'通用名称',width:200,align:'left',editable:true,sortable : true},
                {field:'yingwenming',title:'英文名',width:100,align:'left',editable:true,sortable:true},
                {field:'laiyuan',title:'来源',width:70,align:'left',editable:true,sortable:true},
                {field:'yuanliao',title:'原料',width:70,align:'left',editable:true,sortable:true},
                {field:'zhuangtai',title:'状态',width:70,align:'left',editable:true,sortable:true},
                {field:'leibie001',title:'一类类别',width:150,align:'left',editable:true,sortable:true},
                {field:'leibie002',title:'二类类别',width:150,align:'left',editable:true,sortable:true},
                {field:'leibie003',title:'三类类别',width:150,align:'left',editable:true,sortable:true},
                {field:'guanlileibie',title:'管理类别',width:100,align:'left',editable:true,sortable:true},
                {field:'chufangyao',title:'处方药',width:100,align:'left',editable:true,sortable:true},
                {field:'chengfen',title:'成分',width:200,align:'left',editable:true,sortable:true},
                {field:'biaozhunguidingguige',title:'标准规定规格',width:350,align:'left',editable:true,sortable:true},
                {field:'biaozhunwaiguige',title:'标准外规格',width:120,align:'left',editable:true,sortable:true},
                {field:'shiyongduixiang',title:'适用对象',width:200,align:'left',editable:true,sortable:true},
                {field:'yongtu',title:'用途',width:400,align:'left',editable:true,sortable:true},
                {field:'xianlianghuoxiuyao',title:'限量或休药',width:400,align:'left',editable:true,sortable:true},
                {field:'pizhunshijian',title:'批准时间',width:100,align:'left',editable:true,sortable:true},
                {field:'biaozhunyange',title:'标准沿革',width:500,align:'left',editable:true,sortable:true},
                {field:'shenbaodanwei',title:'申报单位',width:100,align:'left',editable:true,sortable:true},
                {field:'baocuntiaojian',title:'保存条件',width:100,align:'left',editable:true,sortable:true},
                {field:'zhijileibie',title:'制剂类别',width:100,align:'left',editable:true,sortable:true},
                {field:'fufangyufou',title:'复方与否',width:100,align:'left',editable:true,sortable:true},
                {field:'yuliu001',title:'预留一',width:100,align:'left',editable:true,sortable:true},
                {field:'yuliu002',title:'预留二',width:100,align:'left',editable:true,sortable:true},
                {field:'jinkouyuguochan',title:'进口或国产',width:150,align:'left',editable:true,sortable:true},
                {field:'xiuyaoqi',title:'休药期',width:100,align:'left',editable:true,sortable:true},
                {field:'pizhunriqi',title:'批准日期',width:100,align:'left',editable:true,sortable:true,formatter:function(value,row,index){
            var temp_html;
            if(value != null){
                temp_html = new Date(value).Format("yyyy-MM-dd");
                //var temp_str = temp_html.getYear() + '-' + temp_html.getMonth() + '-' + temp_html.getDay();
                return temp_html;
            }}},
                {field:'beizhu',title:'备注',width:300,align:'left',editable:true,sortable:true}
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
            tongyongmingcheng: $("#txt_search_tongyongmingcheng").val(),
            yingwenming: $("#txt_search_yingwenming").val(),
            laiyuan: $("#txt_search_laiyuan").val(),
            yuanliao: $("#txt_search_yuanliao").val(),
            zhuangtai: $("#txt_search_zhuangtai").val(),
            leibie001: $("#txt_search_leibie001").val(),
            leibie002: $("#txt_search_leibie002").val(),
            leibie003: $("#txt_search_leibie003").val(),
            guanlileibie: $("#txt_search_guanlileibie").val(),
            chufangyao: $("#txt_search_chufangyao").val(),
            chengfen: $("#txt_search_chengfen").val(),
            biaozhunguidingguige: $("#txt_search_biaozhunguidingguige").val(),
            biaozhunwaiguige: $("#txt_search_biaozhunwaiguige").val(),
            shiyongduixiang: $("#txt_search_shiyongduixiang").val(),
            yongtu: $("#txt_search_yongtu").val(),
            xianlianghuoxiuyao: $("#txt_search_xianlianghuoxiuyao").val(),
            pizhunshijian: $("#txt_search_pizhunshijian").val(),
            biaozhunyange: $("#txt_search_biaozhunyange").val(),
            beizhu: $("#txt_search_beizhu").val(),
            shenbaodanwei: $("#txt_search_shenbaodanwei").val(),
            baocuntiaojian: $("#txt_search_baocuntiaojian").val(),
            zhijileibie: $("#txt_search_zhijileibie").val(),
            fufangyufou: $("#txt_search_fufangyufou").val(),
            yuliu001: $("#txt_search_yuliu001").val(),
            yuliu002: $("#txt_search_yuliu002").val(),
            jinkouyuguochan: $("#txt_search_jinkouyuguochan").val(),
            xiuyaoqi:$("#txt_search_xiuyaoqi").val(),
            pizhunriqi1:$("#txt_search_pizhunriqi1").val(),
            pizhunriqi2:$("#txt_search_pizhunriqi2").val(),
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

