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


function transValueRefuse(drawno){
    window.location.href="reportTemple.jsp?drawno="+encodeURI(drawno);
}
function transValueRefuse123(drawno){
    //window.location.href="reportTemple.jsp?drawno="+encodeURI(drawno);
    $("#idvalue").attr("value",drawno);
    var beizhu = $("#txt_beizhu").val();

    $.ajax({
        type: "post",
        //保存数据
        url: "/product/updateProductNote",
        async: false,
        //traditional: true,
        data: {'drawno': drawno,
            'drawnote':drawnote
        },
        dataType:"json",
        success: function (data) {
            alert(data);
        },
        error: function () {
            alert("Error");
        }
    });
}

$("[data-toggle='tooltip']").tooltip();

$(function () {
    var tempDrawno;
    //1.初始化Table
    var oTable003 = new TableInit003();
    oTable003.Init();

    //2.初始化Button的点击事件
    var oButtonInit003 = new ButtonInit003();
    oButtonInit003.Init();
});


var TableInit003 = function () {
    var oTableInit3 = new Object();
    //初始化Table
    oTableInit3.Init = function () {
        $('#tb_tasks003').bootstrapTable({
            url: null, //请求后台的URL（*）
            //contextMenu: '#example1-context-menu',
            method: 'get', //请求方式（*）
            dataType: "json",
            toolbar003: '#toolbar003', //工具按钮用哪个容器
            striped: true, //是否显示行间隔色
            cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true, //是否显示分页（*）
            sortable: true, //是否启用排序
            sortOrder: "asc", //排序方式
            queryParams: oTableInit3.queryParams,//传递参数（*）
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
            uniqueId: "drawno", //每一行的唯一标识，一般为主键列
            showToggle:true, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
            showExport: true,
            exportDataType: "selected",              //'basic', 'all', 'selected'.
            columns: [
                {checkbox: true},
                {field:'drawno',title:'序号',width:45,align:'center',sortable : true},
                {field:'patientinfo.patientname',title:'蜡块编号',width:220,align:'left',sortable : true,formatter:function(value,row,index){
                return "APP00-"+row.sampleno.applino.applino+"SAM00"+row.sampleno.sampleno+"-DRAW00"+row.drawno;
                }},
                {field:'drawposition',title:'取材部位',width:150,align:'left',sortable:true},
                {field:'drawkind',title:'固定',width:100,align:'left',sortable:true,formatter:function(value,row,index){
                var temp_html001;
                if(value == '固定'){
                        temp_html001 = '<button type="button" class="btn btn-xs btn-default" onclick="transValueEdit('+ row.id +')">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>';
                    }
                    else{
                    temp_html001 = '<button type="button" class="btn btn-xs btn-danger" onclick="transValue005('+ row.id +')">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>';
                }
                    return temp_html001;
                }},
                {field:'drawkind',title:'脱水',width:100,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                    var temp_html001;
                    if(value == '固定' || value == '脱水'){
                        temp_html001 = '<button type="button" class="btn btn-xs btn-default"  onclick="transValueEdit('+ row.drawno +')">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>';
                    }
                    else{
                        temp_html001 = '<button type="button" class="btn btn-xs btn-danger"  onclick="transValueEdit('+ row.drawno +')">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>';
                    }

                    return temp_html001;
                }},
                {field:'drawkind',title:'透明',width:100,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                    var temp_html001;
                    if(value == '固定' || value == '脱水' || value == '透明'){
                        temp_html001 = '<button type="button" class="btn btn-xs btn-default" onclick="transValueEdit('+ row.drawno +')">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>';
                    }
                    else {
                        temp_html001 = '<button type="button" class="btn btn-xs btn-danger" onclick="transValueEdit(' + row.drawno + ')">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>';
                    }
                    return temp_html001;
                }},
                {field:'drawkind',title:'浸蜡',width:100,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                    var temp_html001;
                    if(value == '固定' || value == '脱水' || value == '透明' || value == '浸蜡'){
                        temp_html001 = '<button type="button" class="btn btn-xs btn-default" onclick="transValueEdit('+ row.drawno +')">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>';
                    }
                    else{
                        temp_html001 = '<button type="button" class="btn btn-xs btn-danger" onclick="transValueEdit('+ row.drawno +')">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>';
                    }

                    return temp_html001;
                }},
                {field:'drawkind',title:'包埋',width:100,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                    var temp_html001;
                    if(value == '固定' || value == '脱水' || value == '透明' || value == '浸蜡' || value == '包埋'){
                        temp_html001 = '<button type="button" class="btn btn-xs btn-default" onclick="transValue005('+ row.id +')">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>';
                    }
                    else{
                        temp_html001 = '<button type="button" class="btn btn-xs btn-danger" onclick="transValueEdit('+ row.drawno +')">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</button>';
                    }
                    return temp_html001;
                }},
                {field:'specialrequire',title:'备注',width:100,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                    var temp_html001;
                    tempDrawno = row.drawno;
                    temp_html001 = '<button type="button" class="btn btn-xs btn-info" data-toggle="modal" data-target="#exampleModal" onclick="transValueRefuse123(tempDrawno)">&nbsp&nbsp&nbsp&nbsp添加备注&nbsp&nbsp&nbsp&nbsp</button>';
                    return temp_html001;
                }},
                {field:'pdfpath',title:'切片设计',width:100,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                    var temp_html001;
                    tempDrawno = row.drawno;
                    temp_html001 = '<button type="button" class="btn btn-xs btn-success" onclick="transValueRefuse(tempDrawno)">&nbsp&nbsp&nbsp&nbsp切片设计&nbsp&nbsp&nbsp&nbsp</button>';
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
    oTableInit3.queryParams = function (params) {
        var temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
            pageSize: params.pageSize, //页面大小
            pageNumber: params.pageNumber, //页码

            //筛选参数
            hospitalizetionid: $("#txt_search_hospitalizetionid").val(),
            sortName:this.sortName,
            sortOrder:this.sortOrder
        };
        return temp;
    };
    return oTableInit3;
};


var ButtonInit003 = function () {
    var oInit3 = new Object();
    var postdata = {};

    oInit3.Init = function () {
        //初始化页面上面的按钮事件
    };

    return oInit3;
};

