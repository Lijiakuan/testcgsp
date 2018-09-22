<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>病理申请信息页</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="">

  <link href="style/bootstrap.css" rel="stylesheet">
  <!--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet">-->
  <link href="style/fileinput.css" rel="stylesheet" type="text/css"/>
  <link href="style/font-awesome.css" media="all" rel="stylesheet" type="text/css"/>

  <link rel="stylesheet" href="style/bootstrap-select.css">
  <!-- Stylesheets -->
  <!--<link href="style/bootstrap.css" rel="stylesheet">-->
  <!-- Font awesome icon -->
  <link rel="stylesheet" href="style/font-awesome.css">

  <!-- Main stylesheet -->
  <link href="style/style.css" rel="stylesheet">
  <!-- Widgets stylesheet -->
  <link href="style/widgets.css" rel="stylesheet">

  <!--将表格列宽设置为可定制-->
  <style type="text/css">
    table {
      table-layout: fixed;
    }
    .vertical-align-center {
      /* To center vertically */
      display: table-cell;
      vertical-align: middle;
      pointer-events:none;
    }
    .modal-content {
      /* Bootstrap sets the size of the modal in the modal-dialog class, we need to inherit it */
      width:inherit;
      max-width:inherit; /* For Bootstrap 4 - to avoid the modal window stretching full width */
      height:inherit;
      /* To center horizontally */
      margin: 0 auto;
      pointer-events: all;
    }
  </style>

  <!-- HTML5 Support for IE -->
  <!--[if lt IE 9]>
  <script src="js/html5shim.js"></script>
  <![endif]-->

  <!-- Favicon -->
  <link rel="shortcut icon" href="img/favicon/favicon.png">
  <link rel="stylesheet" href="style/bootstrap.css">
  <link rel="stylesheet" href="style/bootstrap-table.css">
  <link rel="stylesheet" href="style/bootstrap-editable.css">
  <link href="style/style.css" rel="stylesheet">
  <link rel="stylesheet" href="style/bootstrap-datetimepicker.min.css">


  <script src="js/jquery.js"></script> <!-- jQuery -->
  <script src="js/sortable.js" type="text/javascript"></script>
  <script src="js/fileinput.js" type="text/javascript"></script>
  <script src="js/popper.js" type="text/javascript"></script>

  <script src="js/bootstrap-select.js"></script>
  <script src="js/bootstrap.js"></script> <!-- Bootstrap -->

  <script src="js/bootstrap-table.js"></script>
  <script src="js/bootstrap-table-zh-CN.js"></script>
  <script src="js/bootstrap-editable.js"></script>
  <script src="js/bootstrap-table-editable.js"></script>
  <script src="js/bootstrap-table-export.js"></script>
  <script src="js/bootstrap-datetimepicker.min.js"></script>

  <script src="js/custom.js"></script>
  <script src="js/fullcalendar.min.js"></script> <!-- Full Google Calendar - Calendar -->
  <script src="js/jquery-ui-1.9.2.custom.min.js"></script> <!-- jQuery UI -->

  <script src="js/tableExport.js"></script>
  <script src="js/reportTemple.js"></script>


  <script>
      var tempObj = new Array();
      var tempObj001 = new Array();
      var rowNums = new Array();
      var drawno;
      var url=window.location.search; //获取url中"?"符后的字串

      //var m = new Map(['活检','btn btn-danger'],['免疫组化','btn btn-warning'],['快速冰冻','btn btn-success'],['细胞学','btn btn-info'],['TCT','btn btn-primary'],['免疫组化','btn btn-danger'],['FISH','btn btn-success'],['基因检测','btn btn-info'],['肿瘤DNA倍体','btn btn-primary']);
      if(url.indexOf("?")!=-1) {
          drawno = url.substr(url.indexOf("=") + 1);
      }

      var array002 = new Array();
      var array001 = new Array();
      var array003 = new Array();
  </script>
</head>


<body>
<div class="navbar navbar-fixed-top bs-docs-nav" role="banner">
<div class="conjtainer">
  <!-- Menu button for smallar screens -->
  <div class="navbar-header">
    <button class="navbar-toggle btn-navbar" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
      <span>菜单</span>
    </button>
    <!-- Site name for smallar screens -->
    <a href="index.jsp" class="navbar-brand hidden-lg">APIS</a>
  </div>



  <!-- Navigation starts -->
  <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">

    <ul class="nav navbar-nav navbar-left">

      <!-- Upload to server link. Class "dropdown-big" creates big dropdown -->
      <li class="dropdown dropdown-big">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="label label-success"><i class="icon-cloud-upload"></i></span> 上传到云服务器</a>
        <!-- Dropdown -->
        <ul class="dropdown-menu">
          <li>
            <!-- Progress bar -->
            <p>电子档案上传进度</p>
            <!-- Bootstrap progress bar -->
            <div class="progress progress-striped active">
              <div class="progress-bar progress-bar-info"  role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                <span class="sr-only">完成40%</span>
              </div>
            </div>

            <hr />

            <!-- Progress bar -->
            <p>数字切片上传进度</p>
            <!-- Bootstrap progress bar -->
            <div class="progress progress-striped active">
              <div class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                <span class="sr-only">完成80%</span>
              </div>
            </div>

            <hr />

            <!-- Dropdown menu footer -->
            <div class="drop-foot">
              <a href="#">查看所有</a>
            </div>

          </li>
        </ul>
      </li>

      <!-- Sync to server link -->
      <li class="dropdown dropdown-big">
        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="label label-danger"><i class="icon-refresh"></i></span> 同步到服务器</a>
        <!-- Dropdown -->
        <ul class="dropdown-menu">
          <li>
            <!-- Using "icon-spin" class to rotate icon. -->
            <p><span class="label label-info"><i class="icon-cloud"></i></span>同步数字切片到服务器</p>
            <hr />
            <p><span class="label label-warning"><i class="icon-cloud"></i></span>同步数字切片到云端</p>

            <hr />

            <!-- Dropdown menu footer -->
            <div class="drop-foot">
              <a href="#">查看所有</a>
            </div>

          </li>
        </ul>
      </li>

    </ul>

    <!-- Search form -->
    <form class="navbar-form navbar-left" role="search">
      <div class="form-group">
        <input type="text" class="form-control" placeholder="Search">
      </div>
    </form>
    <!-- Links -->
    <ul class="nav navbar-nav pull-right">
      <li class="dropdown pull-right">
        <a data-toggle="dropdown" class="dropdown-toggle" href="#" id="dropdown_user_name">
          <i class="icon-user"></i><span></span><b class="caret"></b>
        </a>

        <!-- Dropdown menu -->
        <ul class="dropdown-menu">
          <li><a href="#"><i class="icon-user"></i> 资料</a></li>
          <li><a href="#"><i class="icon-cogs"></i> 设置</a></li>
          <li><a href="login.jsp"><i class="icon-off"></i> 退出</a></li>
        </ul>
      </li>

    </ul>
  </nav>

</div>
</div>


<!-- Header starts -->
<header>
  <div class="container">
    <div class="row">

      <!-- Logo section -->
      <div class="col-md-4">
        <!-- Logo. -->
        <div class="logo">
          <h1><a href="#">APIS<span class="bold"></span></a></h1>
          <p class="meta">业务流管理系统</p>
        </div>
        <!-- Logo ends -->
      </div>

      <!-- Button section -->
      <div class="col-md-4">

        <!-- Buttons -->
        <ul class="nav nav-pills">

          <!-- Comment button with number of latest comments count -->
          <li class="dropdown dropdown-big">
            <a class="dropdown-toggle" href="#" data-toggle="dropdown">
              <i class="icon-comments"></i> 留言 <span class="label label-info">6</span>
            </a>

            <ul class="dropdown-menu">
              <li>
                <!-- Heading - h5 -->
                <h5><i class="icon-comments"></i> 留言</h5>
                <!-- Use hr tag to add border -->
                <hr />
              </li>
              <li>
                <!-- List item heading h6 -->
                <h6><a href="#">你好 :)</a> <span class="label label-warning pull-right">10:42</span></h6>
                <div class="clearfix"></div>
                <hr />
              </li>
              <li>
                <h6><a href="#">你怎么样?</a> <span class="label label-warning pull-right">20:42</span></h6>
                <div class="clearfix"></div>
                <hr />
              </li>
              <li>
                <h6><a href="#">你在干撒呢?</a> <span class="label label-warning pull-right">14:42</span></h6>
                <div class="clearfix"></div>
                <hr />
              </li>
              <li>
                <div class="drop-foot">
                  <a href="#">查看所有</a>
                </div>
              </li>
            </ul>
          </li>

          <!-- Message button with number of latest messages count-->
          <li class="dropdown dropdown-big">
            <a class="dropdown-toggle" href="#" data-toggle="dropdown">
              <i class="icon-envelope-alt"></i> 收件箱 <span class="label label-primary">6</span>
            </a>

            <ul class="dropdown-menu">
              <li>
                <!-- Heading - h5 -->
                <h5><i class="icon-envelope-alt"></i> 消息</h5>
                <!-- Use hr tag to add border -->
                <hr />
              </li>
              <li>
                <!-- List item heading h6 -->
                <h6><a href="#">你好啊?</a></h6>
                <!-- List item para -->
                <p>最近咋样啊...</p>
                <hr />
              </li>
              <li>
                <h6><a href="#">今天很好啊?</a></h6>
                <p>相当好...</p>
                <hr />
              </li>
              <li>
                <div class="drop-foot">
                  <a href="#">查看所有</a>
                </div>
              </li>
            </ul>
          </li>

          <!-- Members button with number of latest members count -->
          <li class="dropdown dropdown-big">
            <a class="dropdown-toggle" href="#" data-toggle="dropdown">
              <i class="icon-user"></i> 用户 <span class="label label-success">6</span>
            </a>

            <ul class="dropdown-menu">
              <li>
                <!-- Heading - h5 -->
                <h5><i class="icon-user"></i> 用户</h5>
                <!-- Use hr tag to add border -->
                <hr />
              </li>
              <li>
                <!-- List item heading h6-->
                <h6><a href="#">Ravi Kumar</a> <span class="label label-warning pull-right">免费</span></h6>
                <div class="clearfix"></div>
                <hr />
              </li>
              <li>
                <h6><a href="#">Balaji</a> <span class="label label-important pull-right">高级</span></h6>
                <div class="clearfix"></div>
                <hr />
              </li>
              <li>
                <h6><a href="#">Kumarasamy</a> <span class="label label-warning pull-right">免费</span></h6>
                <div class="clearfix"></div>
                <hr />
              </li>
              <li>
                <div class="drop-foot">
                  <a href="#">查看所有</a>
                </div>
              </li>
            </ul>
          </li>

        </ul>

      </div>

      <!-- Data section -->

      <div class="col-md-4">
        <div class="header-data">

          <!-- Traffic data -->
          <div class="hdata">
            <div class="mcol-left">
              <!-- Icon with red background -->
              <i class="icon-signal bred"></i>
            </div>
            <div class="mcol-right">
              <!-- Number of visitors -->
              <p><a href="#">7000</a> <em>诊断</em></p>
            </div>
            <div class="clearfix"></div>
          </div>

          <!-- Members data -->
          <div class="hdata">
            <div class="mcol-left">
              <!-- Icon with blue background -->
              <i class="icon-user bblue"></i>
            </div>
            <div class="mcol-right">
              <!-- Number of visitors -->
              <p><a href="#">3000</a> <em>图片</em></p>
            </div>
            <div class="clearfix"></div>
          </div>

          <!-- revenue data -->
          <div class="hdata">
            <div class="mcol-left">
              <!-- Icon with green background -->
              <i class="icon-money bgreen"></i>
            </div>
            <div class="mcol-right">
              <!-- Number of visitors -->
              <p><a href="#">5000</a><em>样本</em></p>
            </div>
            <div class="clearfix"></div>
          </div>

        </div>
      </div>

    </div>
  </div>
</header>

<!-- Header ends -->

<!-- Main content starts -->

<div class="content">

  <!-- Sidebar -->
  <div class="sidebar">
    <div class="sidebar-dropdown"><a href="#">导航</a></div>

    <!--- Sidebar navigation -->
    <!-- If the main navigation has sub navigation, then add the class "has_sub" to "li" of main navigation. -->
    <ul id="nav">
      <!-- Main menu with font awesome icon -->
      <li><a href="index.jsp" class="open"><i class="icon-home"></i> 首页 </a></li>
      <li class="has_sub"><a href="#"><i class="icon-list-alt"></i> 登记管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
        <ul>
          <li><a href="patientappli.jsp"><i class="icon-list-alt"></i> 申请签收登记 </a></li>
          <li><a href="widgets2.html"><i class="icon-list-alt"></i> 病历详情 </a></li>
        </ul>
      </li>
      <li class="has_sub"><a href="#"><i class="icon-file-alt"></i> 列表信息 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
        <ul>
          <li><a href="eqpatientinfo.jsp"><i class="icon-list-alt"></i> 患者列表 </a></li>
          <li><a href="patientappli.jsp"><i class="icon-list-alt"></i> 申请列表 </a></li>
          <li><a href="acceptsample.jsp"><i class="icon-list-alt"></i> 样本列表 </a></li>
          <li><a href="product.jsp"><i class="icon-list-alt"></i> 切片列表 </a></li>
        </ul>
      </li>
      <li class="has_sub"><a href="#"><i class="icon-file-alt"></i> 取材制片<span class="pull-right"><i class="icon-chevron-right"></i></span></a>
        <ul>
          <li><a href="patientsample.jsp"><i class="icon-list-alt"></i> 取材及组织处理 </a></li>
          <li><a href="product.jsp"><i class="icon-list-alt"></i> 切片管理 </a></li>
        </ul>
      </li>
      <li class="has_sub"><a href="#"><i class="icon-bar-chart"></i> 扫描管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
        <ul>
          <li><a href="scan.jsp"><i class="icon-list-alt"></i> 扫描管理 </a></li>
        </ul>
      </li>
      <li class="has_sub"><a href="#"><i class="icon-table"></i> 诊断管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
        <ul>
          <li><a href="diagnosis.jsp"><i class="icon-list-alt"></i> 阅片诊断 </a></li>
          <li><a href="#"><i class="icon-list-alt"></i> 诊断详情 </a></li>
        </ul>
      </li>
      <li class="has_sub"><a href="#"><i class="icon-tasks"></i> 报告管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
        <ul>
          <li><a href="report.jsp"><i class="icon-list-alt"></i> 报告管理 </a></li>
        </ul>
      </li>
    </ul>
  </div>

  <!-- Sidebar ends -->

  <!-- Main bar -->
  <div class="mainbar">

    <!-- Page heading -->
    <div class="page-head">
      <h2 class="pull-left"><i class="icon-home"></i> 首页</h2>

      <!-- Breadcrumb -->
      <div class="bread-crumb pull-right">
        <a href="index.jsp"><i class="icon-home"></i> 首页</a>
        <!-- Divider -->
        <span class="divider">/</span>
        <a href="#" class="bread-current">患者列表</a>
      </div>

      <div class="clearfix"></div>
    </div>
      <!-- Page heading ends -->

	    <!-- Matter -->

	    <div class="matter">
        <div class="container">
          <!-- Table -->

<!--宽度更换为col-12-->
<!--界面中任务列表显示-->
          <!--维修事件列表-->
            <div class="row">
              <div class="col-md-12">
                <div class="widget">
                  <div class="widget-head">
                    <div class="pull-left">切片设计</div>
                    <div class="widget-icons pull-right">
                      <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                      <a href="#" class="wclose"><i class="icon-remove"></i></a>
                    </div>
                    <div class="clearfix"></div>
                  </div>

                  <div class="widget-content">
                    <div class="panel-body" style="padding-bottom:0px;">
                      <div class="matter">
                        <div class="container">
                          <div class="row">
                            <div class="col-md-12">
                              <div class="widget">
                                <div class="widget-content">
                                  <div class="panel-body" style="padding-bottom:0px;">

                                      <div class="widget-content">
                                        <form id="formSearch001" class="form-horizontal">
                                          <div class="form-group" style="margin-top:15px">
                                            <label class="control-label col-sm-1" for="txt_search_applino">病&nbsp&nbsp理&nbsp号</label>
                                            <div class="col-sm-3">
                                              <input type="text" class="form-control" id="txt_search_applino" readonly>
                                            </div>
                                            <label class="control-label col-sm-1" for="txt_search_patientname">姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名</label>
                                            <div class="col-sm-3">
                                              <input type="text" class="form-control" id="txt_search_patientage" readonly></div>
                                            <label class="control-label col-sm-1" for="txt_search_patientage">年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp龄</label>
                                            <div class="col-sm-3">
                                              <input type="text" class="form-control" id="txt_search_patientname" readonly>
                                            </div>
                                          </div>
                                          <div class="form-group" style="margin-top:15px">
                                            <label class="control-label col-sm-1" for="txt_search_biaobenbuwei">标本部位</label>
                                            <div class="col-sm-3">
                                              <input type="text" class="form-control" id="txt_search_biaobenbuwei" readonly>
                                            </div>
                                            <label class="control-label col-sm-1" for="txt_search_lakuaibianhao">蜡块编号</label>
                                            <div class="col-sm-3">
                                              <input type="text" class="form-control" id="txt_search_lakuaibianhao" readonly>
                                            </div>
                                          </div>
                                          <br>
                                          <div class="form-group" style="margin-top:15px">
                                            <label class="control-label col-sm-1" for="txt_search_biaobenbuwei">检查方法</label>
                                            <div class="col-sm-11">
                                              <div  id="id_jianchafangfa">
                                              <button type="button" class="btn btn-danger" style="width: 130px">活检</button>
                                              <button type="button" class="btn btn-warning" style="width: 130px">免疫组化</button>
                                              </div>
                                              </div>
                                          </div>
                                          <div class="form-group" style="margin-top:15px">
                                            <label class="control-label col-sm-1" for="txt_search_teshuyaoqiu">特殊要求</label>
                                            <div class="col-sm-11">
                                              <textarea class="form-control" rows="5" id="txt_search_teshuyaoqiu"></textarea>
                                            </div>
                                          </div>
                                          <br>
                                          <div class="form-group" style="margin-top:15px">
                                            <label class="control-label col-sm-1">染色类型</label>
                                            <div class="col-sm-5">
                                                <button type="button" class="btn btn-danger" id="he" style="width: 130px">&nbsp&nbsp+HE染色&nbsp&nbsp</button>
                                                <button type="button" class="btn btn-warning" id="special" style="width: 130px">&nbsp+特殊染色&nbsp</button>
                                              <button type="button" class="btn btn-success" id="immune" style="width: 130px">&nbsp+免疫组化&nbsp</button>
                                            </div>
                                          </div>
                                          <!--+HE染色-->
                                          <div class="widget" id="formSearch002">
                                            <div class="widget-content">
                                              <div class="panel-body" style="padding-bottom:0px;">
                                                <div class="widget-content" id="workplace">
                                                  <form class="form-horizontal">
                                                    <div class="form-group" style="margin-top:15px">
                                                      <label class="control-label col-sm-1">HE&nbsp染色</label>
                                                      <div class="col-sm-10">
                                                        <div id="toolbar001" class="btn-group">
                                                          <button id="btn_sub001" type="button" class="btn btn-default">
                                                            <span class="glyphicon glyphicon-minus" aria-hidden="true"></span>
                                                          </button>
                                                          <button id="btn_show001" type="button" class="btn btn-default">
                                                            <span class="glyphicon" aria-hidden="true">&nbsp&nbsp&nbsp&nbsp</span>
                                                          </button>
                                                          <button id="btn_add001" type="button" class="btn btn-default">
                                                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                                                          </button>
                                                        </div>
                                                        <div id="position001">
                                                          <div class="form-group" style="margin-top:15px"  id="txt_line1">
                                                            <label class="control-label col-sm-1">切片编号</label>
                                                            <div class="col-sm-3">
                                                              <input type="text" class="form-control" id="input_1">
                                                            </div>
                                                          </div>
                                                          <div class="form-group" style="margin-top:15px"  id="txt_line2">
                                                            <label class="control-label col-sm-1">切片编号</label>
                                                            <div class="col-sm-3">
                                                              <input type="text" class="form-control" id = "input_2">
                                                            </div>
                                                          </div>
                                                          <div class="form-group" style="margin-top:15px"  id="txt_line3">
                                                            <label class="control-label col-sm-1">切片编号</label>
                                                            <div class="col-sm-3">
                                                              <input type="text" class="form-control" id = "input_3">
                                                            </div>
                                                          </div>
                                                          <div class="form-group" style="margin-top:15px"  id="txt_line4">
                                                            <label class="control-label col-sm-1">切片编号</label>
                                                            <div class="col-sm-3">
                                                              <input type="text" class="form-control" id = "input_4">
                                                            </div>
                                                          </div>
                                                          <div class="form-group" style="margin-top:15px"  id="txt_line5">
                                                            <label class="control-label col-sm-1">切片编号</label>
                                                            <div class="col-sm-3">
                                                              <input type="text" class="form-control" id = "input_5">
                                                            </div>
                                                          </div>
                                                          <div class="form-group" style="margin-top:15px"  id="txt_line6">
                                                            <label class="control-label col-sm-1">切片编号</label>
                                                            <div class="col-sm-3">
                                                              <input type="text" class="form-control" id = "input_6">
                                                            </div>
                                                          </div>
                                                          <div class="form-group" style="margin-top:15px"  id="txt_line7">
                                                            <label class="control-label col-sm-1">切片编号</label>
                                                            <div class="col-sm-3">
                                                              <input type="text" class="form-control" id = "input_7">
                                                            </div>
                                                          </div>
                                                          <div class="form-group" style="margin-top:15px"  id="txt_line8">
                                                            <label class="control-label col-sm-1">切片编号</label>
                                                            <div class="col-sm-3">
                                                              <input type="text" class="form-control" id = "input_8">
                                                            </div>
                                                          </div>
                                                          <div class="form-group" style="margin-top:15px"  id="txt_line9">
                                                            <label class="control-label col-sm-1">切片编号</label>
                                                            <div class="col-sm-3">
                                                              <input type="text" class="form-control" id = "input_9">
                                                            </div>
                                                          </div>
                                                          <div class="form-group" style="margin-top:15px"  id="txt_line10">
                                                            <label class="control-label col-sm-1">切片编号</label>
                                                            <div class="col-sm-3">
                                                              <input type="text" class="form-control" id = "input_10">
                                                            </div>
                                                          </div>
                                                        </div>
                                                      </div>
                                                    </div>

                                                    <br>
                                                  </form>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                          <!--特殊染色染色-->
                                          <!--免疫组化-->
                                          <div class="widget" id="formSearch003">
                                            <div class="widget-content">
                                              <div class="panel-body" style="padding-bottom:0px;">
                                                <div class="widget-content">
                                                  <form class="form-horizontal">
                                                    <div class="form-group" style="margin-top:15px">
                                                      <label class="control-label col-sm-1">特殊染色</label>
                                                      <div class="col-sm-2">
                                                        <button type="button" class="btn btn-primary" id="teshuranse001"  data-toggle="modal" data-target="#myModal1">选择染色方法</button>
                                                      </div>
                                                    </div>
                                                    <div class="form-group" style="margin-top:15px">
                                                      <label class="control-label col-sm-1">&nbsp&nbsp&nbsp&nbsp</label>
                                                    <div id="teshuranseresult001"></div>
                                                    </div>
                                                    <br>
                                                  </form>
                                                </div>
                                              </div>
                                            </div>
                                          </div>

                                          <!--免疫组化-->
                                          <div class="widget" id="formSearch004">
                                            <div class="widget-content">
                                              <div class="panel-body" style="padding-bottom:0px;">
                                                <div class="widget-content">
                                                  <form class="form-horizontal">
                                                    <div class="form-group" style="margin-top:15px">
                                                      <label class="control-label col-sm-1">免疫组化</label>
                                                      <div class="col-sm-2">
                                                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">选择标记物</button>
                                                      </div>
                                                    </div>
                                                    <div class="form-group" style="margin-top:15px">
                                                      <label class="control-label col-sm-1">&nbsp&nbsp&nbsp&nbsp</label>
                                                        <div id="ransefangfa"></div>
                                                    </div>
                                                    <br>
                                                  </form>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        </form>
                                      </div>
                                  </div>
                                </div>
                              </div>
                              <div class="form-group" style="margin-top:15px">
                                <label class="control-label col-sm-1"></label>
                                <div class="col-sm-5">
                                  <button type="button" class="btn btn-primary" style="width: 130px" id="allsave">&nbsp&nbsp&nbsp&nbsp保&nbsp&nbsp&nbsp&nbsp存&nbsp&nbsp&nbsp</button>
                                  <button type="button" class="btn btn-success" style="width: 130px">&nbsp&nbsp&nbsp&nbsp取&nbsp&nbsp&nbsp&nbsp消&nbsp&nbsp&nbsp</button>
                                </div>
                              </div>
                            </div>

                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>


            </div>
        </div>
		  </div>

		<!-- Matter ends -->

    </div>

   <!-- Mainbar ends -->	    	
   <div class="clearfix"></div>

</div>
<!-- Content ends -->


<!-- Footer starts -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
            <!-- Copyright info -->
            <p class="copy">Copyright &copy; 2018 | <a href="#">蓝创公司</a> </p>
      </div>
    </div>
  </div>
</footer> 	

<!-- Footer ends -->
<!-- 病例诊断报告 模态框 -->
<div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">免疫组化选择</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
          <div class="row">
            <div class="col-md-12"></div>
          </div>
          <div class="row">
            <div class="col-md-12">
            <ul id="myTab" class="nav nav-tabs">
              <li class="active"><a href="#home" data-toggle="tab">标记物选择</a></li>
              <li><a href="#taocan" data-toggle="tab">套餐选择</a></li>
            </ul>
            <div class="tab-content">
              <div class="tab-pane fade in active" id="home">
                    <!--<div class="widget">-->
                      <div class="form-group" style="margin-top:5px;margin-left:10px">
                        <button type="button" class="btn btn-warning" style="width:85px">AFP</button>
                        <button type="button" class="btn btn-warning" style="width:85px">ALK(1A4) </button>
                        <button type="button" class="btn btn-warning" style="width:85px">AR</button>
                        <button type="button" class="btn btn-warning" style="width:85px">bcl-2</button>
                        <button type="button" class="btn btn-warning" style="width:85px">Calponin</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CK8</button>
                      </div>
                      <div class="form-group" style="margin-top:5px;margin-left:10px">
                        <button type="button" class="btn btn-warning" style="width:85px">Ber-EP4</button>
                        <button type="button" class="btn btn-warning" style="width:85px">BOB.1</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CA125</button>
                        <button type="button" class="btn btn-warning" style="width:85px">Calcitonin</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD43</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CK18</button>
                      </div>
                      <div class="form-group" style="margin-top:5px;margin-left:10px">
                        <button type="button" class="btn btn-warning" style="width:85px">Calcitonin</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CK7</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CgA</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD68</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD99</button>
                        <button type="button" class="btn btn-warning" style="width:85px">PAS</button>
                      </div>
                      <div class="form-group" style="margin-top:5px;margin-left:10px">
                        <button type="button" class="btn btn-warning" style="width:85px">CD7</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD79a</button>
                        <button type="button" class="btn btn-warning" style="width:85px">Calponin</button>
                        <button type="button" class="btn btn-warning" style="width:85px">34βE12</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD31</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD34</button>
                      </div>
                      <div class="form-group" style="margin-top:5px;margin-left:10px">
                        <button type="button" class="btn btn-warning" style="width:85px">CD138</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CK5/6</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CEA</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CK20</button>
                        <button type="button" class="btn btn-warning" style="width:85px">bcl-6</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CK8/18</button>
                      </div>
                      <div class="form-group" style="margin-top:5px;margin-left:10px">
                        <button type="button" class="btn btn-warning" style="width:85px">Calretinin</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CAM5.2</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD10</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD117</button>
                        <button type="button" class="btn btn-warning" style="width:85px">AE1/AE3</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD8</button>
                      </div>
                      <div class="form-group" style="margin-top:5px;margin-left:10px">
                        <button type="button" class="btn btn-warning" style="width:85px">CD146</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD15</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD163</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD1a</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD45RO</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD5</button>
                      </div>
                      <div class="form-group" style="margin-top:5px;margin-left:10px">
                        <button type="button" class="btn btn-warning" style="width:85px">CD2</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CDX-2</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD30</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CK19</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD44</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD45</button>
                      </div>
                      <div class="form-group" style="margin-top:5px;margin-left:10px">
                        <button type="button" class="btn btn-warning" style="width:85px">CD20</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD21</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD23</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD3</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD38</button>
                        <button type="button" class="btn btn-warning" style="width:85px">CD4</button>
                      </div>
                  </div>

                <div class="tab-pane fade" id="taocan">
                      <!--<div class="widget">-->
                      <div class="form-group" style="margin-top:5px;margin-left:10px">
                        <button type="button" class="btn btn-warning" style="width:170px">胃肠道间质瘤（GIST）</button>
                        <button type="button" class="btn btn-warning" style="width:170px">鼻咽癌</button>
                        <button type="button" class="btn btn-warning" style="width:170px">恶性黑色素瘤</button>
                      </div>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <hr>
              <div class="form-group" style="margin-top:5px;margin-left:10px">
                <button type="button" class="btn btn-primary" style="width:85px" id="save003">保存</button>
                <button type="button" class="btn btn-primary" style="width:85px">取消</button>
              </div>
            </div>
          </div>
        </form>
      </div>
      </div>
    </div>
  </div>


<!--染色方法-->
<div id="myModal1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">染色方法选择</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
          <div class="row">
            <div class="col-md-12">
              <ul id="myTab3" class="nav nav-tabs">
                <li class="active"><a href="#home1" data-toggle="tab">染色方法选择</a></li>
              </ul>
              <div class="tab-content">
                <div class="tab-pane fade in active" id="home1">
                  <!--<div class="widget">-->
                  <div class="form-group" style="margin-top:5px;margin-left:10px">
                    <button type="button" class="btn btn-warning" style="width:130px">AB-PAS染色</button>
                    <button type="button" class="btn btn-warning" style="width:130px">网状纤维染色</button>
                    <button type="button" class="btn btn-warning" style="width:130px">抗酸染色</button>
                    <button type="button" class="btn btn-warning" style="width:130px">Masson三色染色</button>
                  </div>
                  <div class="form-group" style="margin-top:5px;margin-left:10px">
                    <button type="button" class="btn btn-warning" style="width:130px">PAS染色</button>
                    <button type="button" class="btn btn-warning" style="width:130px">铜染色</button>
                    <button type="button" class="btn btn-warning" style="width:130px">铁染色</button>
                    <button type="button" class="btn btn-warning" style="width:130px">幽门螺杆菌</button>
                  </div>
                  <div class="form-group" style="margin-top:5px;margin-left:10px">
                    <button type="button" class="btn btn-warning" style="width:130px">AB染色</button>
                    <button type="button" class="btn btn-warning" style="width:130px">巴氏染色</button>
                    <button type="button" class="btn btn-warning" style="width:130px">PASD染色</button>
                    <button type="button" class="btn btn-warning" style="width:130px">六胺银染色</button>
                  </div>
                  <div class="form-group" style="margin-top:5px;margin-left:10px">
                    <button type="button" class="btn btn-warning" style="width:130px">刚果红</button>
                    <button type="button" class="btn btn-warning" style="width:130px">粘液卡红染色</button>
                  </div>
                  <hr>
                  <div class="form-group" style="margin-top:5px;margin-left:10px">
                    <button type="button" class="btn btn-primary" style="width:130px" id="teshuranse003">保存</button>
                    <button type="button" class="btn btn-primary" style="width:130px" data-dismiss="modal">取消</button>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>


<hr />
<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span> 


<script>
    //初始化fileinput

    $("#input-b9").fileinput({
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
            //alert(obj.fileid);
            return obj;
        }
    }).on("fileuploaded", function(e, data) {
        var res = data.response;
        var opt = {
            url: '/selectPatientinfo',
            query:{
                pageSize: 10, //页面大小
                pageNumber: 1, //页码

                //筛选参数
                productno:$("#txt_search_productno").val(),
                applino:$("#txt_search_applino").val(),
                patientname:$("#txt_search_patientname").val(),
                specialrequire:$("#txt_search_specialrequire").val(),
                productstatus:$("#txt_search_productstatus").val(),
                productdate001:$("#txt_search_productdate001").val(),
                productdate002:$("#txt_search_productdate002").val(),
                sortName:"productno",
                sortOrder:"asc"
            }

        };
        $('#tb_tasks').bootstrapTable('refresh',opt);
    });
</script>
</body>
</html>