/**
 * Created by Administrator on 2017/6/9.
 *
 */


function transValueBook006(idvalue){
    //签字
    //改变记录状态
    //updatePatientappliByAllAvaliableSeveralConditions
    var reviewstatus = "已打印";
    $.ajax({
        type: "get",
        url: "/patientappli/updatePatientappliByAllAvaliableSeveralConditions",
        async: false,
        dataType:"json",
        data:{
          'reviewstatus':reviewstatus,
            'reviewno':idvalue
        },
        success: function (data1) {
            var opt = {
                url: '/patientappli/getPatientappliByAcceptstatus006',
                query:{
                    pageSize: 10, //页面大小
                    pageNumber: 1, //页码

                    //筛选参数
                    sortName:"patientno",
                    sortOrder:"asc"
                }

            };
            $('#table006').bootstrapTable('refresh',opt);
        },
        error: function () {
            alert("Error");
        }
    });
}


$("[data-toggle='tooltip']").tooltip();

$(function () {
    //1.初始化Table
    var oTable006 = new TableInit006();
    oTable006.Init();

    //2.初始化Button的点击事件
    var oButtonInit006 = new ButtonInit006();
    oButtonInit006.Init();

});

var TableInit006 = function () {
    var oTableInit006 = new Object();
    //初始化Table
    oTableInit006.Init = function () {
        $('#table006').bootstrapTable({
            url: '/patientappli/getPatientappliByAcceptstatus006', //请求后台的URL（*）
            //contextMenu: '#example1-context-menu',
            method: 'get', //请求方式（*）
            dataType: "json",
            toolbar: '#toolbar', //工具按钮用哪个容器
            striped: true, //是否显示行间隔色
            cache: false, //是否使用缓存，默认为true，所以一般情况下需要设置一下这个属性（*）
            pagination: true, //是否显示分页（*）
            sortable: true, //是否启用排序
            sortOrder: "asc", //排序方式
            queryParams: oTableInit006.queryParams,//传递参数（*）
            queryParamsType: "undefined",//undefined
            singleSelect: false,//复选框只能选择一条记录
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1, //初始化加载第一页，默认第一页
            pageSize: 10, //每页的记录行数（*）
            pageList: [10, 25, 50, 100,500], //可供选择的每页的行数（*）
            search: false, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端
            strictSearch: true,
            showColumns: false, //是否显示所有的列
            showRefresh: false, //是否显示刷新按钮
            minimumCountColumns: 2, //最少允许的列数
            clickToSelect: true, //是否启用点击选中行
            height: 'auto', //行高，如果没有设置height属性，表格自动根据记录条数觉得表格高度
            uniqueId: "patientno", //每一行的唯一标识，一般为主键列
            showToggle:false, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
            showExport: false,
            exportDataType: "selected",              //'basic', 'all', 'selected'.
            columns: [
                {checkbox: true},
                {field:'pdfpath',title:'操作',width:100,align:'left',editable:false,sortable:true,formatter:function(value,row,index){
                var tempApplino = row.applino;
                    var temp_html006;
                    temp_html006 = '<button type="button" class="btn btn-xs btn-danger" onclick="transValueBook006('+ tempApplino +')">&nbsp&nbsp&nbsp&nbsp打印&nbsp&nbsp&nbsp&nbsp</button>';
                    return temp_html006;
                }},
                {field:'productdate',title:'制片完成时间',width:120,align:'left',sortable:true,formatter:function(value,row,index){
                    var temp_html = "";
                    var temp_date = value;
                    if(temp_date != null){
                        temp_html = new Date(temp_date).Format("yyyy-MM-dd");
                        return temp_html;
                    }}},
                {field:'applino',title:'病理号',width:80,align:'center',sortable : true},
                {field:'patientname',title:'客户姓名',width:100,align:'left',sortable : true}
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
    oTableInit006.queryParams = function (params) {
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
            inspdate006: $("#txt_search_inspdate006").val(),
            acceptdate006: $("#txt_search_acceptdate006").val(),
            sortName:this.sortName,
            sortOrder:this.sortOrder
        };
        return temp;
    };
    return oTableInit006;
};


var ButtonInit006 = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        //初始化页面上面的按钮事件
    };

    return oInit;
};

