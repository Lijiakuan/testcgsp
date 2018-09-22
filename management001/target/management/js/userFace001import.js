/**
 * Created by Administrator on 2017/6/9.
 *
 */


$(function () {
    var txt_search_tablename = $("#txt_search_tablename");
    //选择导入的数据表名称
    txt_search_tablename.append("<option>" + "</option>");
    txt_search_tablename.append("<option value='huayao'>化药</option>");
    txt_search_tablename.append("<option value='zhongyao'>中药</option>");
    txt_search_tablename.append("<option value='shengyao'>生药</option>");
});

