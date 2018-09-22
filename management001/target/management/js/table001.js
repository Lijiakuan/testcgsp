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


function transValueBook(idvalue){
    //签字
    //改变记录状态
    //updatePatientappliByAllAvaliableSeveralConditions
    var status = "已签收";
    $.ajax({
        type: "get",
        url: "/patientappli/updatePatientappliByAllAvaliableSeveralConditions",
        async: false,
        dataType:"json",
        data:{
          'acceptresult':status,
            'applino':idvalue
        },
        success: function (data1) {
            var opt = {
                url: '/patientappli/getPatientappliByAcceptstatus001',
                query:{
                    pageSize: 10, //页面大小
                    pageNumber: 1, //页码

                    //筛选参数
                    sortName:"applino",
                    sortOrder:"asc"
                }

            };
            $('#table001').bootstrapTable('refresh',opt);
        },
        error: function () {
            alert("Error");
        }
    });
}


function transValueLook(idvalue){
    //查看记录
    //打开 不可编辑明细窗体
}


$("[data-toggle='tooltip']").tooltip();

$(function () {
    //0.初始化badge
    $.ajax({
        type: "get",
        url: "/patientappli/selectCount001",
        async: false,
        dataType:"json",
        success: function (data1) {
            $('#shenqingdaichuli').html(data1.count);
        },
        error: function () {
            alert("Error");
        }
    });
    $.ajax({
        type: "get",
        url: "/patientappli/selectCount002",
        async: false,
        dataType:"json",
        success: function (data1) {
            $('#bingdongdaichuli').html(data1.count);
        },
        error: function () {
            alert("Error");
        }
    });
    $.ajax({
        type: "get",
        url: "/patientappli/selectCount003",
        async: false,
        dataType:"json",
        success: function (data1) {
            $('#huiyishenqing').html(data1.count);
        },
        error: function () {
            alert("Error");
        }
    });
    $.ajax({
        type: "get",
        url: "/patientappli/selectCount004",
        async: false,
        dataType:"json",
        success: function (data1) {
            $('#weiwanchengbaogao').html(data1.count);
        },
        error: function () {
            alert("Error");
        }
    });
    $.ajax({
        type: "get",
        url: "/patientappli/selectCount005",
        async: false,
        dataType:"json",
        success: function (data1) {
            $('#weishenhebaogao').html(data1.count);
        },
        error: function () {
            alert("Error");
        }
    });
    $.ajax({
        type: "get",
        url: "/patientappli/selectCount006",
        async: false,
        dataType:"json",
        success: function (data1) {
            $('#weidayinbaogao').html(data1.count);
        },
        error: function () {
            alert("Error");
        }
    });

    //1.初始化Table
    var oTable001 = new TableInit001();
    oTable001.Init();

    //2.初始化Button的点击事件
    var oButtonInit001 = new ButtonInit001();
    oButtonInit001.Init();

});


function getJsonLength(jsonData){
    var jsonLength = 0;
    for(var item in jsonData){
        jsonLength++;
    }
    return jsonLength;
}

var TableInit001 = function () {
    var oTableInit001 = new Object();
    //初始化Table
    oTableInit001.Init = function () {
        $('#table001').bootstrapTable({
            url: '/patientappli/getPatientappliByAcceptstatus001', //请求后台的URL（*）
            //contextMenu: '#example1-context-menu',
            method: 'get', //请求方式（*）
            dataType: "json",
            toolbar: '#toolbar', //工具按钮用哪个容器
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
                    var temp_html003;
                    temp_html003 = '<button type="button" class="btn btn-xs btn-danger" onclick="transValueBook('+ tempApplino +')">&nbsp&nbsp&nbsp&nbsp样本签收&nbsp&nbsp&nbsp&nbsp</button>';
                    return temp_html003;
                }},
                {field:'applidate',title:'申请日期',width:100,align:'left',sortable:true,formatter:function(value,row,index){
                    var temp_html = "";
                    var temp_date = value;
                    if(temp_date != null){
                        temp_html = new Date(temp_date).Format("yyyy-MM-dd");
                        return temp_html;
                    }}},
                {field:'applino',title:'病理号',width:80,align:'center',sortable : true},
                {field:'patientinfo.patientname',title:'患者姓名',width:100,align:'left',sortable : true},
                {field:'inspmethodList',title:'检查方法',width:400,align:'left',sortable:true,formatter:function(value,row,index){
                var templist = row.inspmethodList;
                    var tempString = '';
                    var methodStr = '';
                    for(var i=0;i<templist.length;i++){
                        if(i != templist.length-1){
                            tempString = templist[i].dicinspmethodno.disinspmethodname + ','
                        }else{
                            tempString = templist[i].dicinspmethodno.disinspmethodname;
                        }
                        methodStr = methodStr + tempString;
                    }
                    return methodStr;
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
            hospitalizetionid: $("#txt_search_hospitalizetionid").val(),
            applino: $("#txt_search_applino").val(),
            inspmethod: $("#txt_search_inspmethod").val(),
            patientdiagkind: $("#txt_search_patientdiagkind").val(),
            inspdepartid: $("#txt_search_inspdepartid").val(),
            specialrequire: $("#txt_search_specialrequire").val(),
            inspdate001: $("#txt_search_inspdate001").val(),
            inspdate002: $("#txt_search_inspdate002").val(),
            acceptdate001: $("#txt_search_acceptdate001").val(),
            acceptdate002: $("#txt_search_acceptdate002").val(),
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

