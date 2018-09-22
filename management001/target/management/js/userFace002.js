/**
 * Created by Administrator on 2017/6/9.
 * 维护事件列表
 */


//$("[data-toggle='tooltip']").tooltip();

$(function () {
    //设置btn_query onClick事件
    //var btnQuery = $('#btn_query');
    //btnQuery.attachEvent("onclick",method001);


    //1.初始化Table
    var oTable001 = new TableInit001();
    oTable001.Init();

    //2.初始化Button的点击事件
    var oButtonInit001 = new ButtonInit001();
    oButtonInit001.Init();


    var tempButton001 = $('#btn_add001');
    var tempButtondel001 = $('#btn_delete001');
    var newRowData001 = {
        id:'',
        'equipment.no':'',
        startdate:'',
        finishdate:'',
        descr:'',
        status:'',
        maintainresult:''
    };


    tempButton001.click(function () {
        $('#tb_tasks001').bootstrapTable('append', newRowData001);
        $('#tb_tasks001').bootstrapTable('scrollTo', 'bottom');
        //alert("btn_add");
    });

    tempButtondel001.click(function () {
        var ids001 = $.map($('#tb_tasks001').bootstrapTable('getSelections'), function (row) {
            return row.id;
        });
        if (ids001.length < 1 ) {
            alert("请选择一行删除!");
            return;
        }
     /*
        //删除数据并同步到数据库
        $.ajax({
            type: "post",
            url: "/delSerById",  //根据ID删除维护记录EQ_MAINTAIN
            async: false,
            data: "ids001="+ids001[0],
            success: function (data) {
                alert("删除成功");
            },
            error: function () {
                alert("Error");
            }
        });
      */
        $('#tb_tasks001').bootstrapTable('remove', {
            field: 'id',
            values: ids001
        });
    });

});


//获得维修记录ID
function modalParamsInject1001(){
    var tempEventObj = event.srcElement;
    var tempID = parseInt(tempEventObj.innerHTML);
    for(var i=0;i<tempObj001.length;i++){
        if(tempObj001[i].id == tempID) {
            //alert(tempObj[i].equipment.department.name);
            modalParamsInject001(tempObj001[i]);
        }
    }

}

//生成维修明细
function modalParamsInject001(var1){

}

var TableInit001 = function () {
    var oTableInit001 = new Object();
    //初始化Table
    //debugger;
    oTableInit001.Init = function () {
        $('#tb_tasks001').bootstrapTable({
            url: '/selectMaintain', //请求后台的URL（*）
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
            queryParamsType: "undefined",
            singleSelect: true,//复选框只能选择一条记录
            sidePagination: "server", //分页方式：client客户端分页，server服务端分页（*）
            pageNumber:1, //初始化加载第一页，默认第一页
            pageSize: 10, //每页的记录行数（*）
            pageList: [10, 25, 50, 100], //可供选择的每页的行数（*）
            search: true, //是否显示表格搜索，此搜索是客户端搜索，不会进服务端
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
                {field:'id',title:'ID',width:30,align:'center',sortable : true},
                {field:'equipment.no',title:'设备ID',width:60,align:'left',sortable : true},
                {field:'startdate',title:'起始时间',width:110,align:'left',editable:true,sortable : true,formatter:function(value,row,index){
                    if(row.startdate !=null){
                        return new Date(row.startdate).Format("yyyy-MM-dd hh:mm:ss");
                    }
                    else{
                        return "";
                    }
                }},
                {field:'finishdate',title:'完成时间',width:110,align:'left',sortable : true,formatter:function(value,row,index){
                    if(row.finishdate !=null){
                        return new Date(row.finishdate).Format("yyyy-MM-dd hh:mm:ss");
                    }
                    else{
                        return "";
                    }
                },editable:true},
                {field:'descr',title:'维护描述',width:120,align:'left',editable:true,sortable:true},{field:'maintainresult',title:'结果',width:120,align:'left',editable:{
                    type: 'select',
                    title: '结果',
                    source:[{value:"正常维护完成",text:"正常维护完成"},{value:"已接未完成",text:"已接未完成"},{value:"未接",text:"未接"}]
                },sortable:true},
                {field:'status',title:'状态',width:60,align:'left',sortable:true,editable:{
                    type: 'select',
                    title: '状态',
                    source:[{value:1,text:"未接"},{value:2,text:"已接"},{value:3,text:"已接未完成"},{value:4,text:"已完成"}]}}
            ],

            onEditableSave: function (field, row, oldValue, $el) {
                $.ajax({
                    /*
                     type: "post",
                     url: "/testEquipment",
                     data: { strJson: JSON.stringify(row),strField:field,strOldValue:oldValue},
                     success: function (data, status) {
                     if (status == "success") {
                     alert("编辑成功");
                     }
                     },
                     */
                    error: function () {
                        alert("Error");
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
            departmentname: $("#txt_search_departmentname001").val(),

            sortName:this.sortName,
            sortOrder:this.sortOrder
        };
        return temp;
    };
    return oTableInit001;
};


var ButtonInit001 = function () {
    var oInit = new Object();
    var postdata = {};

    oInit.Init = function () {
        //初始化页面上面的按钮事件
    };

    return oInit;
};

