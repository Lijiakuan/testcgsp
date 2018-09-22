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
            url: '/product/selectProductByIds',
            query:{
                pageSize: 10, //页面大小
                pageNumber: 1, //页码

                //筛选参数
                ids:rowNums,

                sortName:"productno",
                sortOrder:"asc"
            }

        };
        $('#tb_tasks001').bootstrapTable('refresh',opt);
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
function html2Escape(sHtml) {
    return sHtml.replace(/[<>&".]/g,function(c){return {'<':'&lt;','>':'&gt;','&':'&amp;','"':'&quot;','.':'&middot;'}[c];});
}
$(function () {
    //1.初始化Table
    var oTable001 = new TableInit001();
    oTable001.Init();

    //2.初始化Button的点击事件
    var oButtonInit001 = new ButtonInit001();
    oButtonInit001.Init();


    var tempButtonsave001 = $('#btn_save001');

    var newRowData = {
        productno:'',
        drawno:'',
        productdesc:'',
        productstatus:'',
        productdoctorid:'',
        resultkind:'',
        productdate:''
    };



    //保存数据修改
    tempButtonsave001.click(function () {
        var rowLists001 = $('#tb_tasks001').bootstrapTable('getSelections');
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
                $('#tb_tasks001').bootstrapTable('load',data);
                alert("保存成功");
            },
            error: function () {
                alert("Error");
            }
        });
    });


});



function queryResults001(ids){
    var opt = {
        url: '/product/selectProductByIds?ids='+ids,
        query:{
            pageSize: 10, //页面大小
            pageNumber: 1, //页码

            //筛选参数
            sortName:"productno",
            sortOrder:"asc"
        }

    };
    $('#tb_tasks001').bootstrapTable('refresh',opt);
}

var TableInit001 = function () {
    var oTableInit001 = new Object();
    //初始化Table
    oTableInit001.Init = function () {
        $('#tb_tasks001').bootstrapTable({
            url: '/product/selectProductByIds', //请求后台的URL（*）
            //contextMenu: '#example1-context-menu',
            method: 'get', //请求方式（*）
            dataType: "json",
            toolbar: '#toolbar001', //工具按钮用哪个容器
            striped: true, //是否显示行间隔色
            cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true, //是否显示分页（*）
            sortable: true, //是否启用排序
            sortOrder: "asc", //排序方式
            queryParams: oTableInit001.queryParams,//传递参数（*）
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
            uniqueId: "productno", //每一行的唯一标识，一般为主键列
            showToggle:true, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
            showExport: true,
            exportDataType: "selected",              //'basic', 'all', 'selected'.
            columns: [
                {checkbox: true},
                {field:'productno',title:'序号',width:45,align:'center',sortable : true},
                {field:'productno',title:'切片编号',width:270,align:'left',sortable : true,formatter:function(value,row,index){
                    return "APP00-"+row.drawno.sampleno.applino.applino+"SAM00"+row.drawno.sampleno.sampleno+"-DRAW00"+row.drawno.drawno+"-PRO00"+row.productno;
                }},
                {field:'resultkind',title:'染色类型',width:90,align:'left',sortable:true},
                {field:'scandoctorid.name',title:'扫描人',width:90,align:'left',sortable:true},
                {field:'scandate',title:'扫描完毕时间',width:90,align:'left',sortable:true,formatter:function(value,row,index){
            var temp_html;
            if(value != null){
                temp_html = new Date(value).Format("yyyy-MM-dd");
                return temp_html;
            }}},
                {field:'productstatus',title:'扫描状态',width:90,align:'left',sortable : true,formatter:function(value,row,index){
                var scan_statue = "未扫描";
                if(value != "已扫描" || value != "绑定数字切片"){
                    scan_statue = "已扫描";
                }
                return scan_statue;
                }},
                {field:'productstatus',title:'绑定状态',width:90,align:'left',sortable : true,formatter:function(value,row,index){
                    var band_statue = "未绑定";
                    if(value != "绑定数字切片"){
                        band_statue = "已绑定";
                    }
                    return band_statue;
                }},

                {field:'productfile',title:'绑定文件名称',width:90,align:'left',sortable:true},
                {field:'thumbnailfile',title:'缩略图预览',width:90,align:'left',sortable:true,formatter:function(value,row,index){
                    var temp_html;
                    var b='\\\\';
                    var path_instead = row.thumbnailfile.replace(/\\/g,b);
                    temp_html = "<button type='button' class='btn btn-xs btn-success'  onclick=\"transPathValue('"+ row.productno + "\',\'" +  path_instead + "\')\">预览</button>";
                    return temp_html;
                }},
                {field:'pdfpath',title:'操作',width:150,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                    var temp_html;
                    if(row.thumbnailfile == null || row.thumbnailfile == ""){
                        temp_html = '<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="transValue('+ row.productno +')">上传</button>';
                        return temp_html;
                    }
                    else
                    {
                        var b='\\\\';
                        var path_instead = row.thumbnailfile.replace(/\\/g,b);
                        var temp_html2 = '<button type="button" class="btn btn-xs btn-primary" data-toggle="modal" data-target="#exampleModal" onclick="transValue('+ row.productno +')">上传</button>';
                        //temp_html2 += '&nbsp&nbsp' + temp_html;
                        return temp_html2;
                    }
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
    oTableInit001.queryParams = function (params) {
        var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            pageSize: params.pageSize, //页面大小
            pageNumber: params.pageNumber, //页码

            //筛选参数
            ids:rowNums,
            sortName:this.sortName,
            sortOrder:this.sortOrder
        };
        return temp;
    };
    return oTableInit001;
};


var ButtonInit001 = function () {
    var oInit001 = new Object();
    var postdata = {};

    oInit001.Init = function () {
        //初始化页面上面的按钮事件
    };

    return oInit001;
};

