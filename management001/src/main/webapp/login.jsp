<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>军事医学研究院因公出国(境)审批系统</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="">
  <link href="img/icons/title.png" rel="SHORTCUT ICON" />
  <!-- Stylesheets -->
  <link href="style/bootstrap.css" rel="stylesheet">
  <link rel="stylesheet" href="style/font-awesome.css">
  <link href="style/style.css" rel="stylesheet">
  <link href="style/bootstrap-responsive.css" rel="stylesheet">

  <script src="js/jquery.js"></script>
  <script src="js/bootstrap.js"></script>
  <script src="js/jquery.validate.js"></script>
  <script src="js/messages_zh.js"></script>

  <!-- HTML5 Support for IE -->
  <!--[if lt IE 9]>
  <script src="js/html5shim.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="img/favicon/favicon.png">

  <script>
      $.validator.setDefaults({
          submitHandler: function(form) {
              form.submit();
          }
      });
      $().ready(function() {body {margin:0; padding:0 10px 0 10px;height:100%;overflow:auto;background:#333;font-size:12px;}

          $("#form-hor").validate();
      });
  </script>
  <style>
    .error{
      color:red;
    }
  </style>

    <mce:style><!--
#wrap {bottom:0px;left:1px!important;left:18px;width:200px;line-height:30px;position:fixed;border:1px solid #fff;text-align:center;color:#000000; }
*html{overflow-x:auto;overflow-y:auto;}
* html #wrap {position:absolute;}
--></mce:style><style mce_bogus="1">body {margin:0; padding:0 10px 0 10px;height:100%;overflow:auto;font-size:12px;}
#wrap {bottom:0px;left:1px!important;left:18px;width:200px;line-height:30px;position:fixed;border:1px solid #fff;text-align:center;color:#000000;}
*html{overflow-x:auto;overflow-y:auto;}
* html #wrap {position:absolute;}</style>


</head>

<body>
<div id="top" style="text-align:center;margin:10px auto;" align="center"  class="login-logo">
  <a href="#" >
    <img src="img/login.jpg" width="55%" height="55%"  alt="军事医学研究院" />
  </a>
</div>
<!-- Form area -->
<div class="admin-form" style="margin-top: 7px;">
  <div class="container">


    <div class="row">
      <div class="col-md-12">
        <!-- Widget logo -->

        <!-- Widget starts -->
            <div class="widget worange">

              <!-- Widget head -->
              <div class="widget-head">
                <i class="icon-lock"></i> 登录界面 
              </div>

              <div class="widget-content">
                <div class="padd">
                  <!-- Login form -->
                  <form class="form-horizontal" action="/login" method="post" id="form-hor">
                    <!-- Email -->
                    <div class="form-group">
                      <label class="control-label col-lg-3" for="loginname">用户名称</label>
                      <div class="col-lg-9">
                        <input type="text" class="form-control" id="loginname" placeholder="LoginName" name="loginname" required>
                      </div>
                    </div>
                    <!-- Password -->
                    <div class="form-group">
                      <label class="control-label col-lg-3" for="password">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                      <div class="col-lg-9">
                        <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
                      </div>
                    </div>
                    <!-- Remember me checkbox and sign in button -->
                    <div class="form-group">
					<div class="col-lg-9 col-lg-offset-3">
                      <div class="checkbox">
                        <label>
                          <input type="checkbox"> 记住密码
                        </label>
						</div>
					</div>
					</div>
                        <div class="col-lg-9 col-lg-offset-2">
							<button type="submit" class="btn btn-danger">登录</button>
							<button type="reset" class="btn btn-default">重置</button>
						</div>
                    <br />
                  </form>
				  
				</div>
                </div>
              
                <div class="widget-foot">
                  尚未注册? <a href="register.jsp">点击注册</a>
                    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span style="color: gray; font-size: 13px; margin: 5px 5px 5px 5px;"> 首次登录需要先注册</span>
                </div>
            </div>  
      </div>
    </div>
  </div> 
</div>

  <div  id="wrap">
      <!-- Copyright info -->
      <p class="copy">Copyright &copy; 2018 | 院信息中心 </p>

  </div>



<!-- JS -->
</body>
</html>