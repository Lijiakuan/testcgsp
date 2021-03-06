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
                reviewdate002:$("#txt_search_reviewdate002").val(),
                reviewdate001:$("#txt_search_reviewdate001").val(),
                applino:$("#txt_search_applino").val(),
                patientname:$("#txt_search_patientname").val(),
                reviewstatus:$("#txt_search_reviewstatus").val(),
                patientdiagkind:$("#txt_search_patientdiagkind").val(),

                sortName:"reviewno",
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

            $("#txt_result_diagnosispathology").attr("value",data1.rows[0].patientappli001List[0].inforclinical);
            for(var i = 0;i<data1.rows[0].patientappli001List[0].acceptsample001List.length;i++){
                temp = data1.rows[0].patientappli001List[0].acceptsample001List.pop();
                temp001 = temp001 + temp.visualobservation;
            }

            //$("#txt_result_visualobservation").attr("value",temp001);
            $("#txt_result_visualobservation").val(temp001);
            temp001 = "";
            for(var i = 0;i<data1.rows[0].patientappli001List[0].acceptsample001List.length;i++){
                temp = data1.rows[0].patientappli001List[0].acceptsample001List.pop();
                temp001 = temp001 + temp.pathologydiagnosis.diagnosismicroscope;
                debugger;
            }
            $("#txt_result_diagnosismicroscope").val(temp001);
            temp001 = "";
            for(var i = 0;i<data1.rows[0].patientappli001List[0].acceptsample001List.length;i++){
                temp = data1.rows[0].patientappli001List[0].acceptsample001List.pop();
                temp001 = temp001 + temp.pathologydiagnosis.diagnosisspecial;
            }
            $("#txt_result_diagnosisspecial").val(temp001);

            //$("#txt_result_frozendiagnosisspecial").attr("value",data1.rows[0].patientinfo.patientname);
            //$("#txt_result_consultation").attr("value",data1.rows[0].patientinfo.patientname);
            //$("#txt_result_aidiagnosis").attr("value",data1.rows[0].patientinfo.patientname);
            //diagnosispathology
            temp001 = "";
            for(var i = 0;i<data1.rows[0].patientappli001List[0].acceptsample001List.length;i++){
                temp = data1.rows[0].patientappli001List[0].acceptsample001List.pop();
                temp001 = temp001 + temp.pathologydiagnosis.diagnosispathology;
            }
            //$("#txt_result_diagnosis").value = "jingbin is a good boy";
            $("#txt_result_diagnosis").val(temp001);
        },
        error: function () {
            alert("Error");
        }
    });
}

$("[data-toggle='tooltip']").tooltip();

$(function () {

    var reviewdate002 = $("#txt_search_reviewdate002");
    var reviewdate001 =$("#txt_search_reviewdate001");
    var applino = $("#txt_search_applino");
    var patientname = $("#txt_search_patientname");
    var reviewstatus = $("#txt_search_reviewstatus");
    var patientdiagkind = $("#txt_search_patientdiagkind");

    //复片状态
    reviewstatus.append("<option></option>");
    reviewstatus.append("<option>已打印</option>");
    reviewstatus.append("<option>未打印</option>");
    //病理检查类型：1、常规病理；2、快速冰冻；3、会诊；4、尸检
    patientdiagkind.append("<option></option>");
    patientdiagkind.append("<option>本院常规病理</option>");
    patientdiagkind.append("<option>快速冰冻</option>");
    patientdiagkind.append("<option>会诊</option>");
    patientdiagkind.append("<option>尸检</option>");

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
                tempStr = "<option>"+datavalues[i].patientname+"</option>";
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
        productno:'',
        drawno:'',
        productdesc:'',
        productstatus:'',
        productdoctorid:'',
        resultkind:'',
        productdate:''
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
            url: "/product/insertNewRecord",
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
            url: "/product/updateProductByIds",
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
            url: "/product/delProductById",
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
            field: 'productno',
            values: ids
        });
    });

});

function downloadFilebyAjax() {
    var url = "/downloadExcel";

    var reviewdate002 = $("#txt_search_reviewdate002");
    var reviewdate001 =$("#txt_search_reviewdate001");
    var applino = $("#txt_search_applino");
    var patientname = $("#txt_search_patientname");
    var reviewstatus = $("#txt_search_reviewstatus");
    var patientdiagkind = $("#txt_search_patientdiagkind");

    var form = $("<form></form>").attr("action", url).attr("method", "post");
    form.append($("<input></input>").attr("type", "hidden").attr("name", "applino").attr("value", applino));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "patientname").attr("value", patientname));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "reviewstatus").attr("value", reviewstatus));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "patientdiagkind").attr("value", patientdiagkind));

    form.append($("<input></input>").attr("type", "hidden").attr("name", "reviewdate001").attr("value", reviewdate001));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "reviewdate002").attr("value", reviewdate002));

    form.appendTo('body').submit().remove();
    }

function getJsonLength(jsonData){
    var jsonLength = 0;
    for(var item in jsonData){
        jsonLength++;
    }
    return jsonLength;
}

//----------------------------------
function queryResults(){
    var opt = {
        url: '/dignosis/selectDignosisreportDetail',
        query:{
            pageSize: 10, //页面大小
            pageNumber: 1, //页码

            //筛选参数
            reviewdate002:$("#txt_search_reviewdate002").val(),
            reviewdate001:$("#txt_search_reviewdate001").val(),
            applino:$("#txt_search_applino").val(),
            patientname:$("#txt_search_patientname").val(),
            reviewstatus:$("#txt_search_reviewstatus").val(),
            patientdiagkind:$("#txt_search_patientdiagkind").val(),
            sortName:"reviewno",
            sortOrder:"asc"
        }

    };
    $('#tb_tasks').bootstrapTable('refresh',opt);
}

//添加工具
Array.prototype.indexOf = function(val) {
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
};

var TableInit = function () {
    var oTableInit = new Object();
    //初始化Table
    oTableInit.Init = function () {
        $('#tb_tasks').bootstrapTable({
            url: '/dignosis/selectAllDignosisreportDetail', //请求后台的URL（*）
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
            uniqueId: "reviewno", //每一行的唯一标识，一般为主键列
            showToggle:true, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
            showExport: true,
            exportDataType: "selected",              //'basic', 'all', 'selected'.
            columns: [
                {checkbox: true},
                {field:'patientname',title:'姓名',width:80,align:'left',sortable:true},
                {field:'patientage',title:'年龄',width:100,align:'left',sortable:true},
                {field:'patientdiagkind',title:'申请类型',width:100,align:'left',sortable:true},
                {field:'applino',title:'病理号',width:100,align:'left',sortable:true},
                {field:'reviewdoctorid',title:'诊断医师',width:90,align:'left',sortable:true},
                {field:'reviewdate',title:'诊断时间',width:90,align:'left',sortable:true,formatter:function(value,row,index){
                    var temp_html;
                    if(value != null){
                        temp_html = new Date(value).Format("yyyy-MM-dd");
                        return temp_html;
                    }}},
                {field:'printdate',title:'打印时间',width:90,align:'left',sortable:true,formatter:function(value,row,index){
                var temp_html;
            if(value != null){
                temp_html = new Date(value).Format("yyyy-MM-dd");
                return temp_html;
            }}},
                {field:'productstatus',title:'操作',width:120,align:'left',sortable:true,formatter:function(value,row,index){
                    var temp_html='<button type="button" class="btn btn-xs btn-danger" data-toggle="modal" data-target="#exampleModal" onclick="transValueEdit('+ row.applino +')">&nbsp&nbsp&nbsp&nbsp预览&nbsp&nbsp&nbsp&nbsp</button>';
                    return temp_html;
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
            previewdate002:$("#txt_search_reviewdate002").val(),
            reviewdate001:$("#txt_search_reviewdate001").val(),
            applino:$("#txt_search_applino").val(),
            patientname:$("#txt_search_patientname").val(),
            reviewstatus:$("#txt_search_reviewstatus").val(),
            patientdiagkind:$("#txt_search_patientdiagkind").val(),
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

