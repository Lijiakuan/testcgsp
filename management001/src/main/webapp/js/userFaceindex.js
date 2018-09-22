/**
 * Created by Administrator on 2017/6/9.
 *
 */


$(function () {

    //状态显示用户名
    $.ajax({
        type: "get",
        url: "/getUsername",
        async: false,
        dataType:"json",
        success: function (data1) {
            var tempValue = " " + JSON.stringify(data1) + " ";
            tempValue = tempValue.replace("\"","").replace("\"","");
            txt_user_name.text(tempValue);
        },
        error: function () {
            txt_user_name.text(' 临时用户 ');
        }
    });
});



