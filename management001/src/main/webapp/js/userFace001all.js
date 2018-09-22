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
            url: '/selectMedsAll',
            query:{
                pageSize: 10, //页面大小
                pageNumber: 1, //页码

                //筛选参数
                baohancanshu: $("#txt_search_baohancanshu").val(),
                laiyuan: $("#txt_search_laiyuan").val(),

                sortName:"id",
                sortOrder:"asc"
            }

        };
        $('#tb_tasks').bootstrapTable('refresh',opt);
    });
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
    var txt_search_baohancanshu = $('#txt_search_baohancanshu');
    var txt_search_laiyuan = $('#txt_search_laiyuan');

    txt_search_laiyuan.append("<option></option>");
    txt_search_laiyuan.append("<option>0</option>");
    txt_search_laiyuan.append("<option>阿</option>");

    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

    //2.初始化Button的点击事件
    var oButtonInit = new ButtonInit();
    oButtonInit.Init();

    var tempQuery = $('#btn_query');

    tempQuery.click(function(){
        queryResults();
    });
    });





function getJsonLength(jsonData){
    var jsonLength = 0;
    for(var item in jsonData){
        jsonLength++;
    }
    return jsonLength;
}


function queryResults(){
    var opt = {
        url: '/selectMedsAll',
        query:{
            pageSize: 10, //页面大小
            pageNumber: 1, //页码

            //筛选参数
            baohancanshu: $("#txt_search_baohancanshu").val(),
            laiyuan: $("#txt_search_laiyuan").val(),

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
            url: '/selectMedsAll', //请求后台的URL（*）
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
            sidePagination: "client", //分页方式：client客户端分页，server服务端分页（*）
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
                {field:'jianchaxiangmu',title:'检查项目',width:100,align:'left',editable:true,sortable:true},
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
            baohancanshu: $("#txt_search_baohancanshu").val(),
            laiyuan: $("#txt_search_laiyuan").val(),

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

