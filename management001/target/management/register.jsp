<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta charset="utf-8">
    <!-- Title and other stuffs -->
    <title>用户注册页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="author" content="">
    <link href="img/icons/title.png" rel="SHORTCUT ICON" />
    <!-- Stylesheets -->
    <link href="style/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="style/bootstrap-table.css">
    <link rel="stylesheet" href="style/bootstrap-editable.css">
    <link rel="stylesheet" href="style/font-awesome.css">
    <link href="style/style.css" rel="stylesheet">
    <link rel="stylesheet" href="style/bootstrap-datetimepicker.min.css">
    <link href="style/bootstrap-responsive.css" rel="stylesheet">



    <!-- HTML5 Support for IE -->
    <!--[if lt IE 9]>
    <script src="js/html5shim.js"></script>
    <![endif]-->

    <!-- Favicon -->
    <link rel="shortcut icon" href="img/favicon/favicon.png">

    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.js"></script>
    <script src="js/jquery.validate.js"></script>
    <script src="js/bootstrap-editable.js"></script>
    <script src="js/messages_zh.js"></script>
    <script src="js/bootstrap-datetimepicker.min.js"></script>
    <script src="js/fullcalendar.min.js"></script>
    <script src="js/register.js"></script>


    <script>
        $().ready(function() {

            $.validator.setDefaults({
            /**
                 submitHandler: function(form) {
                    form.submit();
                }
            */
            });

            $("#form-reg").validate({
                //设置为调试模式
                //debug:true,
                rules:{
                    email:{
                        required:true,
                        email:true
                    },
                    jgzid:{
                        required:true,
                        jgzbh:true
                    },
                    birthyday:{
                        dateISO:true,
                        required:true
                    },
                    grade:{
                        required:true
                    },
                    password:{
                        required:true,
                        minlength:6
                    },
                    department:{
                        required:true
                    },
                    gender:{
                        required:true
                    },
                    birthplace:{
                        required:true
                    },
                    name:{
                        required:true
                    },
                    xieyi:{
                        required:true
                    },
                    // phone:{
                    //     required:true,
                    //     rangelength:[11,11]
                    // },
                    phone:{
                        required:true,
                        phone:true
                    },
                    loginname:{
                        required:true,
                        minlength:3,
                        // email:true,
                        remote:{
                            type:"POST",
                            url:"/testUserName",
                            data:{
                                loginname:function(){
                                    return $("#loginname").val();
                                }
                            },
                            dataType:"html",
                            dataFilter:function(data,type){
                                if(data == "true")
                                    return true;
                                else
                                    return false;
                            }
                        }

                    }
                },
                messages:{
                    loginname:{
                        required:'用户名，必填',
                        minlength:'用户名最少3字符',
                        remote:'用户名已经被注册！'
                    },
                    phone:{
                        required:'手机号，必填',
                        phone:'不符合手机号要求'
                    },
                    jgzid:{
                        required:'军官证或文职证编号，必填',
                        jgzbh:"请按提示输入正确格式的军官证或文职证编号"
                    },
                    birthplace:{
                        required:"出生地，必填",
                    },
                    birthyday:{
                        required:"出生年月，必填",
                        remote:'请输入正确的日期格式！'
                    },
                    department:{
                        required:'所属单位，必填'
                    },
                    name:{
                        required:'姓名，必填'
                    },
                    gender:{
                        required:'性别，必填'
                    },
                    /*
                    age:{
                        maxlength:'不符合年龄格式'
                    },
                    */
                    password:{
                        required:'必填',
                        minlength:'密码最少6字符'
                    },
                    email:{
                        required:'必填',
                        email:'不符合邮箱格式'
                     },
                    grade:{
                        required:'必填'
                    },
                    xieyi:{
                        required:'必填'
                    }
                }

            });

        });
    </script>
    <style>
        .error{
            color:red;
        }
    </style>

</head>

<body>

<div class="admin-form">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <!-- Widget starts -->
                <div class="widget wred">
                    <div class="widget-head">
                        <i class="icon-lock"></i> Register
                    </div>
                    <div class="widget-content">
                        <div class="padd">

                            <form class="form-horizontal" action="/registerStaff" method="post" id="form-reg">
                                <!-- Registration form starts -->
                                <!-- Username -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="loginname">用&nbsp&nbsp&nbsp户&nbsp&nbsp&nbsp名</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" id="loginname" name="loginname" placeholder="请输入用户名，登陆系统时用">
                                    </div>
                                </div>
                                <!-- Password -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="password">密&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp码</label>
                                    <div class="col-lg-9">
                                        <input type="password" class="form-control" id="password" name="password">
                                    </div>
                                </div>
                                <!-- Select box department-->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="department">人&nbsp员&nbsp归&nbsp属</label>
                                    <div class="col-lg-9">
                                        <select class="form-control" id="department" name="department" placeholder="请选择人员所属单位">
                                        </select>
                                    </div>
                                </div>
                                <!-- Name -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="name">姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" id="name" name="name" placeholder="请填真实姓名">
                                    </div>
                                </div>
                                <!-- Select box gender-->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="gender">性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别</label>
                                    <div class="col-lg-9">
                                        <select class="form-control" id="gender" name="gender">
                                            <option></option>
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </div>
                                </div>
                                <!-- zhicheng -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="zhicheng">职&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp称</label>
                                    <div class="col-lg-9">
                                        <select class="form-control" id="zhicheng" name="zhicheng" placeholder="请根据实际情况选择">
                                        </select>
                                    </div>
                                </div>
                                <!-- zhiwudengji -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="zhiwudengji">职&nbsp务&nbsp等&nbsp级</label>
                                    <div class="col-lg-9">
                                        <select class="form-control" id="zhiwudengji" name="zhiwudengji">
                                        </select>
                                    </div>
                                </div>
                                <!-- junxian -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="junxian">军&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp衔</label>
                                    <div class="col-lg-9">
                                        <select class="form-control" id="junxian" name="junxian">
                                        </select>
                                    </div>
                                </div>
                                <!-- jsjjunxian -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="jsjjunxian">技术级军衔</label>
                                    <div class="col-lg-9">
                                        <select class="form-control" id="jsjjunxian" name="jsjjunxian">
                                        </select>
                                    </div>
                                </div>
                                <!-- zhiwu -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="zhiwu">职&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp务</label>
                                    <div class="col-lg-9">
                                        <select class="form-control" id="zhiwu" name="zhiwu">
                                        </select>
                                    </div>
                                </div>
                                <!-- jishudengji -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="jishudengji">技&nbsp术&nbsp等&nbsp级</label>
                                    <div class="col-lg-9">
                                        <select class="form-control" id="jishudengji" name="jishudengji">
                                        </select>
                                    </div>
                                </div>
                                <!-- wenzhiji -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="wenzhiji">文&nbsp&nbsp&nbsp职&nbsp&nbsp&nbsp级</label>
                                    <div class="col-lg-9">
                                        <select class="form-control" id="wenzhiji" name="wenzhiji">
                                        </select>
                                    </div>
                                </div>

                                <!-- Phone -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="phone">手&nbsp机&nbsp号&nbsp码</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" id="phone" name="phone">
                                    </div>
                                </div>
                                <!-- email -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="email">电&nbsp子&nbsp邮&nbsp箱</label>
                                    <div class="col-lg-9">
                                        <input type="email" class="form-control" id="email" name="email" placeholder="请输入互联网邮箱，如example@126.com">
                                    </div>
                                </div>
                                <!-- 出生地址 -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="birthplace">出&nbsp&nbsp&nbsp生&nbsp&nbsp&nbsp地</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" id="birthplace" name="birthplace" placeholder="请输入出生地址,如北京，需与籍贯区分">
                                    </div>
                                </div>

                                <!-- 出生日期 -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="birthyday">出&nbsp生&nbsp日&nbsp期</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" id="birthyday" name="birthyday" placeholder="日期格式1988-03-24">
                                    </div>
                                </div>

                                <!-- 证件号码 -->
                                <div class="form-group">
                                    <label class="control-label col-lg-3" for="jgzid">证&nbsp件&nbsp编&nbsp号</label>
                                    <div class="col-lg-9">
                                        <input type="text" class="form-control" id="jgzid" name="jgzid" placeholder="军官证或文职证编号，如 军字第1908183号">
                                    </div>
                                </div>
                                <!-- Accept box and button s-->
                                <div class="form-group">
                                    <div class="col-lg-9 col-lg-offset-3">
                                        <div class="checkbox">
                                            <label>
                                                <input type="checkbox" id="xieyi" name="xieyi"> 接受协议
                                            </label>
                                        </div>
                                        <br />
                                        <button type="submit" class="btn btn-danger">注册</button>
                                        <button type="reset" class="btn btn-success">重置</button>
                                    </div>
                                </div>
                                <br />
                            </form>

                        </div>
                    </div>
                    <div class="widget-foot">
                        已经注册? <a href="login.jsp">登录</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!-- JS -->

</body>
</html>