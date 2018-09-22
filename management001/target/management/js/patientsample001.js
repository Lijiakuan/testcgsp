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

function transValueEdit(idvalue){
    //打开明细页面
    //改变记录状态 放在 编辑明细窗体“提交”按钮
}
function transValuePrint(idvalue){
    //打印记录报表
    //改变记录状态
}
function transValueBook(idvalue){
    //签字
    //改变记录状态
}
function transValueRefuse(idvalue){
    //拒收
    //改变记录状态
}
function transValueLook(idvalue){
    //查看记录
    //打开 不可编辑明细窗体
}


$("[data-toggle='tooltip']").tooltip();

$(function () {
    var inspmethod = $("#txt_search_inspmethod");
    var specialrequire = $("#txt_search_specialrequire");
    var advicestatus = $("#txt_search_advicestatus");
    //状态
    advicestatus.append("<option></option>");
    advicestatus.append("<option>新医嘱</option>");
    advicestatus.append("<option>待处理</option>");
    advicestatus.append("<option>已完成</option>");

    //特殊要求
    specialrequire.append("<option></option>");
    specialrequire.append("<option>有</option>");
    specialrequire.append("<option>无</option>");



    //检查方法
    inspmethod.append("<option></option>");
    inspmethod.append("<option>活检</option>");
    inspmethod.append("<option>快速冰冻</option>");
    inspmethod.append("<option>细胞学</option>");
    inspmethod.append("<option>TCT</option>");
    inspmethod.append("<option>免疫组化</option>");
    inspmethod.append("<option>肿瘤DNA倍体</option>");
    inspmethod.append("<option>FISH</option>");
    inspmethod.append("<option>基因检测</option>");



    //1.初始化Table
    var oTable = new TableInit();
    oTable.Init();

    //2.初始化Button的点击事件
    var oButtonInit = new ButtonInit();
    oButtonInit.Init();

    var tempQuery = $('#btn_query');
    var tempExport = $('#btn_output');

    tempQuery.click(function(){
        queryResults();
    });

    //移动数据
    var btn_trans001 = $("#btn_trans001");
    var trans = new Array();
    btn_trans001.click(function () {
        var rowLists = $('#tb_tasks').bootstrapTable('getSelections');
        if (rowLists.length < 1 ) {
            alert("请至少选择一行保存!");
            return;
        }
        else{
            for(var i = 0;i<rowLists.length;i++){
                trans.push(rowLists[i].applino);
            }
        }
        //移动数据


        queryResultsNextBy001(trans);
    });

    tempExport.click(function(){
        //筛选参数
        downloadFilebyAjax();
    });
});


function getJsonLength(jsonData){
    var jsonLength = 0;
    for(var item in jsonData){
        jsonLength++;
    }
    return jsonLength;
}

function queryResultsNextBy001(ids){
    var opt = {
        url: '/acceptsample/selectAcceptsamplebyIds?ids='+ids,
        query:{
            pageSize: 10, //页面大小
            pageNumber: 1, //页码

            //筛选参数
            patientname:ids,//需要查询的病理号数组
            sortName:"sampleno",
            sortOrder:"asc"
        }

    };
    $('#tb_tasks002').bootstrapTable('refresh',opt);
}
function queryResults(){
    var opt = {
        url: '/patientappli/selectPatientInfoDetail',
        query:{
            pageSize: 10, //页面大小
            pageNumber: 1, //页码

            //筛选参数
            patientname:$("#txt_search_patientname").val(),
            advicestatus:$("#txt_search_advicestatus").val(),
            applino: $("#txt_search_applino").val(),
            inspmethod: $("#txt_search_inspmethod").val(),
            specialrequire: $("#txt_search_specialrequire").val(),
            sortName:"applino",
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
            url: '/patientappli/selectPatientInfoDetail', //请求后台的URL（*）
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
            uniqueId: "applino", //每一行的唯一标识，一般为主键列
            showToggle:true, //是否显示详细视图和列表视图的切换按钮
            cardView: false, //是否显示详细视图
            detailView: false, //是否显示父子表
            showExport: true,
            exportDataType: "selected",              //'basic', 'all', 'selected'.
            columns: [
                {checkbox: true},
                {field:'patientinfo.patientname',title:'姓名',width:100,align:'left',editable:false,sortable : true},
                {field:'patientinfo.age',title:'年龄',width:70,align:'left',editable:false,sortable : true},
                {field:'applino',title:'病理号',width:80,align:'center',sortable : true},
                {field:'patientdiagkind',title:'申请单类型',width:100,align:'left',editable:false,sortable:true},
                {field:'inspmethodlist',title:'检查方法',width:400,align:'left',editable:false,sortable:true},
                {field:'specialrequire',title:'特殊要求',width:70,align:'left',editable:false,sortable:true},
                {field:'samplenum',title:'送检标本数',width:120,align:'left',editable:false,sortable:true},
                {field:'advicestatus',title:'状态',width:100,align:'left',editable:false,sortable:true}
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
            hospitalizetionid: $("#txt_search_hospitalizetionid").val(),
            applino: $("#txt_search_applino").val(),
            inspmethod: $("#txt_search_inspmethod").val(),
            patientdiagkind: $("#txt_search_patientdiagkind").val(),
            inspdepartid: $("#txt_search_inspdepartid").val(),
            specialrequire: $("#txt_search_specialrequire").val(),
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

