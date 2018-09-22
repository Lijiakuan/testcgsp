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
function transValue005(tranvalue){
    document.getElementById('idvalue').value = tranvalue;
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
    var txt_search_patientno = $('#txt_search_patientno');
    var txt_search_treatno = $('#txt_search_treatno');
    var txt_search_patientname = $('#txt_search_patientname');
    var txt_search_gender = $('#txt_search_gender');
    var txt_search_patientmarriage = $('#txt_search_patientmarriage');
    var txt_search_age = $('#txt_search_age');
    var txt_search_outpatientid = $('#txt_search_outpatientid');
    var txt_search_hospitalizetionid = $('#txt_search_hospitalizetionid');
    var txt_search_bedid = $('#txt_search_bedid');

    //性别
    txt_search_gender.append("<option></option>");
    txt_search_gender.append("<option>男</option>");
    txt_search_gender.append("<option>女</option>");

    //婚姻状况
    txt_search_patientmarriage.append("<option></option>");
    txt_search_patientmarriage.append("<option>未婚</option>");
    txt_search_patientmarriage.append("<option>已婚</option>");

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
        patientno:'',
        treatno:'',
        patientname:'',
        gender:'',
        age:'',
        patientmarriage:'',
        outpatientid:'',
        hospitalizetionid:'',
        departmentid:'',
        bedid:'',
        contactinfoaddr:'',
        contactinfotel:'',
        contactinfoemail:'',
        menstrulast:'',
        menopausestatus:'',
        advicedictor:'',
        inforclinical:'',

        ethnic:'',
        career:'',
        identinumber:'',
        source:'',
        ward:'',
        contactinfoaddrprovince:'',
        contactinfoaddrcity:'',
        contactinfoaddrdistinct:''
    };

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
            url: "/insertNewPatientinfo",
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
            url: "/updatePatientinfoByIds",
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
            url: "/delPatientinfoById",
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

    var patientno = $("#txt_search_patientno").val();
    var treatno = $("#txt_search_treatno").val();
    var patientname = $("#txt_search_patientname").val();
    var gender = $("#txt_search_gender").val();
    var patientmarriage = $("#txt_search_patientmarriage").val();
    var age = $("#txt_search_age").val();
    var outpatientid = $("#txt_search_outpatientid").val();
    var hospitalizetionid = $("#txt_search_hospitalizetionid").val();
    var bedid = $("#txt_search_bedid").val();

    var form = $("<form></form>").attr("action", url).attr("method", "post");
    form.append($("<input></input>").attr("type", "hidden").attr("name", "patientno").attr("value", patientno));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "treatno").attr("value", treatno));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "patientname").attr("value", patientname));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "gender").attr("value", gender));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "patientmarriage").attr("value", patientmarriage));

    form.append($("<input></input>").attr("type", "hidden").attr("name", "age").attr("value", age));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "outpatientid").attr("value", outpatientid));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "hospitalizetionid").attr("value", hospitalizetionid));
    form.append($("<input></input>").attr("type", "hidden").attr("name", "bedid").attr("value", bedid));

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
        url: '/selectPatientinfo',
        query:{
            pageSize: 10, //页面大小
            pageNumber: 1, //页码

            //筛选参数
            patientno: $("#txt_search_patientno").val(),
            treatno: $("#txt_search_treatno").val(),
            patientname: $("#txt_search_patientname").val(),
            gender: $("#txt_search_gender").val(),
            patientmarriage: $("#txt_search_patientmarriage").val(),
            age: $("#txt_search_age").val(),
            outpatientid: $("#txt_search_outpatientid").val(),
            hospitalizetionid: $("#txt_search_hospitalizetionid").val(),
            bedid: $("#txt_search_bedid").val(),
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
            url: '/selectPatientinfo', //请求后台的URL（*）
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
                {field:'patientno',title:'ID',width:45,align:'center',sortable:true},
                {field:'pdfpath',title:'操作',width:150,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                    var temp_html001,temp_html002;
                    temp_html001 = '<button type="button" class="btn btn-xs btn-danger" data-toggle="modal" data-target="#exampleModal" onclick="transValue005('+ row.id +')">添加申请</button>';
                    temp_html002 = '<button type="button" class="btn btn-xs btn-success" data-toggle="modal" data-target="#exampleModal" onclick="transValue005('+ row.id +')">病历详情</button>';
                    temp_html002 += '&nbsp&nbsp';
                    temp_html002 += temp_html001;
                    return temp_html002;
                }},
                {field:'treatno',title:'就诊ID',width:50,align:'left',editable:false,sortable:true},
                {field:'patientname',title:'患者姓名',width:100,align:'left',editable:false,sortable:true},
                {field:'gender',title:'性别',width:50,align:'left',editable:false,sortable:true},
                {field:'age',title:'年龄',width:50,align:'left',editable:false,sortable:true},
                {field:'ethnic',title:'民族',width:100,align:'left',editable:false,sortable:true},
                {field:'career',title:'职业',width:100,align:'left',editable:false,sortable:true},
                {field:'identinumber',title:'身份证号',width:180,align:'left',editable:false,sortable:true},
                {field:'patientmarriage',title:'婚姻状况',width:100,align:'left',editable:false,sortable:true},
                {field:'outpatientid',title:'门诊ID',width:50,align:'left',editable:false,sortable:true},
                {field:'hospitalizetionid',title:'住院ID',width:50,align:'left',editable:false,sortable:true},
                {field:'source',title:'患者来源',width:80,align:'left',editable:false,sortable:true},
                {field:'departmentid',title:'科室ID',width:50,align:'left',editable:false,sortable:true},
                {field:'ward',title:'病区',width:50,align:'left',editable:false,sortable:true},
                {field:'bedid',title:'病床ID',width:50,align:'left',editable:false,sortable:true},
                {field:'contactinfoaddrprovince',title:'省',width:70,align:'left',editable:false,sortable:true},
                {field:'contactinfoaddrcity',title:'市',width:70,align:'left',editable:false,sortable:true},
                {field:'contactinfoaddrdistinct',title:'区',width:100,align:'left',editable:false,sortable:true},
                {field:'contactinfoaddr',title:'详细地址',width:150,align:'left',editable:false,sortable:true},
                {field:'contactinfotel',title:'联系信息电话',width:100,align:'left',editable:false,sortable:true},
                {field:'contactinfoemail',title:'联系信息邮箱',width:150,align:'left',editable:false,sortable:true},
                {field:'menopausestatus',title:'是否绝经',width:100,align:'left',editable:false,sortable:true},
                {field:'advicedictor',title:'医嘱项目',width:200,align:'left',editable:false,sortable:true},
                {field:'inforclinical',title:'临床资料',width:200,align:'left',editable:false,sortable:true},
                {field:'menstrulast',title:'末次月经',width:100,align:'left',sortable:true,formatter:function(value,row,index){
            var temp_html;
            if(value != null){
                temp_html = new Date(value).Format("yyyy-MM-dd");
                return temp_html;
            }},editable:false}
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
            patientno: $("#txt_search_patientno").val(),
            treatno: $("#txt_search_treatno").val(),
            patientname: $("#txt_search_patientname").val(),
            gender: $("#txt_search_gender").val(),
            patientmarriage: $("#txt_search_patientmarriage").val(),
            age: $("#txt_search_age").val(),
            outpatientid: $("#txt_search_outpatientid").val(),
            hospitalizetionid: $("#txt_search_hospitalizetionid").val(),
            bedid: $("#txt_search_bedid").val(),
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
            url: '/selectPatientinfo', //请求后台的URL（*）
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
                {field:'patientno',title:'ID',width:45,align:'center',sortable:true},
                {field:'pdfpath',title:'操作',width:150,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                    var temp_html001,temp_html002;
                    temp_html001 = '<button type="button" class="btn btn-xs btn-danger" data-toggle="modal" data-target="#exampleModal" onclick="transValue005('+ row.id +')">添加申请</button>';
                    temp_html002 = '<button type="button" class="btn btn-xs btn-success" data-toggle="modal" data-target="#exampleModal" onclick="transValue005('+ row.id +')">病历详情</button>';
                    temp_html002 += '&nbsp&nbsp';
                    temp_html002 += temp_html001;
                    return temp_html002;
                }},
                {field:'treatno',title:'就诊ID',width:50,align:'left',editable:true,sortable:true},
                {field:'patientname',title:'患者姓名',width:100,align:'left',editable:true,sortable:true},
                {field:'gender',title:'性别',width:50,align:'left',editable:{type:'select',title:'婚姻状况',source:["男","女"]},sortable:true},
                {field:'age',title:'年龄',width:50,align:'left',editable:{
                    type: 'text',
                    title: '年龄',
                    validate: function (v) {
                        if (isNaN(v)) return '年龄必须是数字';
                        var age = parseInt(v);
                        if (age <= 0) return '年龄必须是正整数';
                    }
                },sortable:true},
                {field:'ethnic',title:'民族',width:100,align:'left',editable:true,sortable:true},
                {field:'career',title:'职业',width:100,align:'left',editable:true,sortable:true},
                {field:'identinumber',title:'身份证号',width:180,align:'left',editable:true,sortable:true},
                {field:'patientmarriage',title:'婚姻状况',width:100,align:'left',editable:{type:'select',title:'婚姻状况',source:["已婚","未婚"]},sortable:true},
                {field:'outpatientid',title:'门诊ID',width:50,align:'left',editable:true,sortable:true},
                {field:'hospitalizetionid',title:'住院ID',width:50,align:'left',editable:true,sortable:true},
                {field:'source',title:'患者来源',width:80,align:'left',editable:{type:'select',title:'婚姻状况',source:["住院","门诊","急诊","体检","转院"]},sortable:true},
                {field:'departmentid',title:'科室ID',width:50,align:'left',editable:true,sortable:true},
                {field:'ward',title:'病区',width:50,align:'left',editable:true,sortable:true},
                {field:'bedid',title:'病床ID',width:50,align:'left',editable:true,sortable:true},
                {field:'contactinfoaddrprovince',title:'省',width:70,align:'left',editable:true,sortable:true},
                {field:'contactinfoaddrcity',title:'市',width:70,align:'left',editable:true,sortable:true},
                {field:'contactinfoaddrdistinct',title:'区',width:100,align:'left',editable:true,sortable:true},
                {field:'contactinfoaddr',title:'详细地址',width:150,align:'left',editable:true,sortable:true},
                {field:'contactinfotel',title:'联系信息电话',width:100,align:'left',editable:true,sortable:true},
                {field:'contactinfoemail',title:'联系信息邮箱',width:150,align:'left',editable:true,sortable:true},
                {field:'menopausestatus',title:'是否绝经',width:100,align:'left',editable:{type:'select',title:'是否绝经',source:["是","否"]},sortable:true},
                {field:'advicedictor',title:'医嘱项目',width:200,align:'left',editable:true,sortable:true},
                {field:'inforclinical',title:'临床资料',width:200,align:'left',editable:true,sortable:true},
                {field:'menstrulast',title:'末次月经',width:100,align:'left',sortable:true,formatter:function(value,row,index){
                    var temp_html;
                    if(value != null){
                        temp_html = new Date(value).Format("yyyy-MM-dd");
                        return temp_html;
                    }},editable:{type:'date',title:'末次月经'}}
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
            patientno: $("#txt_search_patientno").val(),
            treatno: $("#txt_search_treatno").val(),
            patientname: $("#txt_search_patientname").val(),
            gender: $("#txt_search_gender").val(),
            patientmarriage: $("#txt_search_patientmarriage").val(),
            age: $("#txt_search_age").val(),
            outpatientid: $("#txt_search_outpatientid").val(),
            hospitalizetionid: $("#txt_search_hospitalizetionid").val(),
            bedid: $("#txt_search_bedid").val(),
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

