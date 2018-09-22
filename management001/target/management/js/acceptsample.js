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
            url: '/product/selectProduct',
            query:{
                pageSize: 10, //页面大小
                pageNumber: 1, //页码

                //筛选参数
                applino:$("#txt_search_applino").val(),
                specialrequire:$("#txt_search_specialrequire").val(),
                patientname:$("#txt_search_patientname").val(),
                patientdiagkind:$("#txt_search_patientdiagkind").val(),
                sampleresult:$("#txt_search_sampleresult").val(),

                sortName:"sampleno",
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

    var applino = $("#txt_search_applino");
    var specialrequire = $("#txt_search_specialrequire");
    var patientname = $("#txt_search_patientname");
    var patientdiagkind = $("#txt_search_patientdiagkind");
    var sampleresult = $("#txt_search_sampleresult");

    //制片状态
    patientdiagkind.append("<option></option>");
    patientdiagkind.append("<option>本院常规病理</option>");
    patientdiagkind.append("<option>快速冰冻</option>");
    patientdiagkind.append("<option>病理会诊</option>");
    patientdiagkind.append("<option>尸检</option>");

    //标本结果
    sampleresult.append("<option></option>");
    sampleresult.append("<option>待处理</option>");
    sampleresult.append("<option>已完成</option>");
    sampleresult.append("<option>新医嘱</option>");

    //患者列表
    $.ajax({
        type: "get",
        url: "/selectPatientinfo",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue;
            var tempStr;
            patientname.append("<option>"+"</option>");
            var datavalues = data1.rows;
            for(var i = 0;i<datavalues.length;i++){
                tempValue = JSON.stringify(datavalues[i]);
                tempStr = "<option value = " + datavalues[i].patientno + ">"+tempValue+"</option>";
                patientname.append(tempStr);
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

    var tempButton = $('#btn_add');
    var tempButtondel = $('#btn_delete');
    var tempButtonsave = $('#btn_save');
    var tempQuery = $('#btn_query');
    var tempExport = $('#btn_output');
    var newRowData = {
        sampleno:'',
        sampledesc:'',
        patientname:'',
        patientno:'',
        patientgender:'',
        diagnosisrecord:'',
        specialrequire:'',
        patientdiagkind:'',
        applino:'',
        sampleresult:''
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
        var tb_tasks = $('#tb_tasks');
        tb_tasks.bootstrapTable('append', newRowData);
        tb_tasks.bootstrapTable('scrollTo', 'bottom');
        $.ajax({
            type: "post",
            //保存数据
            url: "/acceptsample/insertNewRecord",
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
            url: "/acceptsample/updateAcceptsampleByIds",
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
            url: "/acceptsample/delAcceptsampleById",
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
            field: 'sampleno',
            values: ids
        });
    });

});

function downloadFilebyAjax() {
    var url = "/downloadExcel";

    var applino = $("#txt_search_applino");
    var specialrequire = $("#txt_search_specialrequire");
    var patientname = $("#txt_search_patientname");
    var patientdiagkind = $("#txt_search_patientdiagkind");
    var sampleresult = $("#txt_search_sampleresult");

    var form = $("<form></form>").attr("action", url).attr("method", "post");
    form.append($("<input></input>").attr("type", "hidden").attr("name", "applino").attr("value", applino));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "specialrequire").attr("value", specialrequire));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "patientname").attr("value", patientname));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "patientdiagkind").attr("value", patientdiagkind));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "sampleresult").attr("value", sampleresult));

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
        url: '/acceptsample/selectAcceptsample',
        query:{
            pageSize: 10, //页面大小
            pageNumber: 1, //页码

            //筛选参数
            applino:$("#txt_search_applino").val(),
            specialrequire:$("#txt_search_specialrequire").val(),
            patientname:$("#txt_search_patientname").val(),
            patientdiagkind:$("#txt_search_patientdiagkind").val(),
            sampleresult:$("#txt_search_sampleresult").val(),
            sortName:"sampleno",
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
            url: '/acceptsample/selectAcceptsample', //请求后台的URL（*）
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
            uniqueId: "sampleno", //每一行的唯一标识，一般为主键列
            showToggle:true, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
            showExport: true,
            exportDataType: "selected",              //'basic', 'all', 'selected'.
            columns: [
                {checkbox: true},
                {field:'sampleno',title:'ID',width:45,align:'center',sortable : true},
                {field:'pdfpath',title:'操作',width:150,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                    var temp_html001,temp_html002,temp_html003,temp_html004;
                    temp_html001 = '<button type="button" class="btn btn-xs btn-danger" data-toggle="modal" data-target="#exampleModal" onclick="transValue005('+ row.id +')">创建蜡块</button>';
                    temp_html002 = '<button type="button" class="btn btn-xs btn-success" data-toggle="modal" data-target="#exampleModal" onclick="transValue005('+ row.id +')">&nbsp&nbsp&nbsp&nbsp处理&nbsp&nbsp&nbsp&nbsp</button>';
                    temp_html003 = '<button type="button" class="btn btn-xs btn-warning" data-toggle="modal" data-target="#exampleModal" onclick="transValue005('+ row.id +')">&nbsp&nbsp&nbsp&nbsp补取&nbsp&nbsp&nbsp&nbsp</button>';
                    temp_html002 += '&nbsp';
                    temp_html002 += temp_html001;
                    temp_html002 += '&nbsp';
                    temp_html002 += temp_html003;
                    return temp_html002;
                }},
                {field:'sampledesc',title:'标本来源',width:100,align:'left',editable:true,sortable : true},
                {field:'pathologyaccept.patientappli.patientinfo.patientname',title:'患者姓名',width:90,align:'left',editable:true,sortable:true},
                {field:'pathologyaccept.patientappli.patientinfo.patientno',title:'患者编号',width:90,align:'left',editable:true,sortable:true},
                {field:'pathologyaccept.patientappli.patientinfo.gender',title:'性别',width:100,align:'left',editable:true,sortable:true},
                {field:'pathologyaccept.patientappli.diagnosisrecord',title:'临床资料',width:120,align:'left',editable:true,sortable:true},
                {field:'pathologyaccept.patientappli.specialrequire',title:'特殊要求',width:90,align:'left',editable:true,sortable:true},
                {field:'pathologyaccept.patientappli.patientdiagkind',title:'检查方法',width:90,align:'left',editable:true,sortable:true},
                {field:'pathologyaccept.patientappli.applino',title:'病理号',width:90,align:'left',editable:true,sortable:true},
                {field:'sampleresult',title:'标本状态',width:90,align:'left',editable:true,sortable:true}
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
            applino:$("#txt_search_applino").val(),
            specialrequire:$("#txt_search_specialrequire").val(),
            patientname:$("#txt_search_patientname").val(),
            patientdiagkind:$("#txt_search_patientdiagkind").val(),
            sampleresult:$("#txt_search_sampleresult").val(),
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

