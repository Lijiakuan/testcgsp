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
  <script src="js/patientinforeport.js"></script>


  <script>
      var idvalue;
      var url=window.location.search; //获取url中"?"符后的字串

      //var m = new Map(['活检','btn btn-danger'],['免疫组化','btn btn-warning'],['快速冰冻','btn btn-success'],['细胞学','btn btn-info'],['TCT','btn btn-primary'],['免疫组化','btn btn-danger'],['FISH','btn btn-success'],['基因检测','btn btn-info'],['肿瘤DNA倍体','btn btn-primary']);
      if(url.indexOf("?")!=-1) {
          idvalue = url.substr(url.indexOf("=") + 1);
      }
      var tempObj = new Array();
      var tempObj001 = new Array();
      var rowNums = new Array();
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
                  <div class="widget-content">
                    <form class="form-horizontal">
                    <div class="panel-body" style="padding-bottom:0px;">
                      <div class="container">
                        <div class="row">
                          <!-- post sidebar -->
                          <ul id="myTab" class="nav nav-tabs">
                            <li class="active"><a href="#home" data-toggle="tab">病例信息</a></li>
                            <li><a href="#nav1" data-toggle="tab">病理诊断</a></li>
                            <li><a href="#nav2" data-toggle="tab">会诊</a></li>
                            <li><a href="#nav3" data-toggle="tab">随访</a></li>
                            <li><a href="#nav4" data-toggle="tab">图像</a></li>
                            <li><a href="#nav5" data-toggle="tab">报告</a></li>
                          </ul>

                          <div id="myTabContent" class="tab-content">
                            <!--------------------------home-------------------------------->
                            <div class="tab-pane fade in active" id="home">
                              <div class="form-group" style="margin-top:15px">
                                <label class="control-label col-sm-1" for="txt_search_shenqingleixing">申请类型</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_shenqingleixing" readonly>
                                </div>
                                <label class="control-label col-sm-1" for="txt_search_binglihao1">病&nbsp&nbsp理&nbsp&nbsp号</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_binglihao1" readonly>
                                </div>
                              </div>
                              <div class="form-group" style="margin-top:15px">
                                <!--姓名name-->
                                <label class="control-label col-sm-1" for="txt_search_xingming">姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_xingming" readonly>
                                </div>
                                <!--性别gender-->
                                <label class="control-label col-sm-1" for="txt_search_gender">性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_gender" readonly>
                                </div>
                              </div>
                              <div class="form-group" style="margin-top:15px">
                                <!--年龄age-->
                                <label class="control-label col-sm-1"
                                       for="txt_search_age">年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp龄</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_age" readonly>
                                </div>
                                <!--年龄单位unit-->
                                <label class="control-label col-sm-1" for="txt_search_department"></label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_department" readonly>
                                </div>
                              </div>
                              <div class="form-group" style="margin-top:15px">
                                <!--婚否marrage-->
                                <label class="control-label col-sm-1" for="txt_search_marrage">婚&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp否</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_marrage" readonly>
                                </div>
                              </div>
                              <div class="form-group" style="margin-top:15px">
                                <!--民族minzu-->
                                <label class="control-label col-sm-1"
                                       for="txt_search_minzu">民&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp族</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_minzu" readonly>
                                </div>
                                <!--职业zhiye-->
                                <label class="control-label col-sm-1"
                                       for="txt_search_zhiye">职&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp业</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_zhiye" readonly>
                                </div>
                              </div>
                              <div class="form-group" style="margin-top:15px">
                                <!--电话tel-->
                                <label class="control-label col-sm-1"
                                       for="txt_search_tel">电&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp话</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_tel" readonly>
                                </div>
                                <!--身份证号shenfenzheng-->
                                <label class="control-label col-sm-1" for="txt_search_shenfenzheng">身份证号</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_shenfenzheng" readonly>
                                </div>
                              </div>
                              <div class="form-group" style="margin-top:15px">
                                <!--住址address-->
                                <label class="control-label col-sm-1" for="txt_search_address">住&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp址</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_address" readonly>
                                </div>
                                <label class="control-label col-sm-1" for="txt_search_address"></label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_addresscity" readonly>
                                </div>
                              </div>
                              <div class="form-group" style="margin-top:15px">
                                <label class="control-label col-sm-1" for="txt_search_address"></label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_addressdistinct" readonly>
                                </div>
                                <label class="control-label col-sm-1" for="txt_search_address"></label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_addressother" readonly>
                                </div>
                              </div>

                              <div class="form-group" style="margin-top:15px">
                                <!--就医来源source-->
                                <label class="control-label col-sm-1" for="txt_search_source">就医来源</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_source" readonly>
                                </div>
                                <!--病区bingqu-->
                                <label class="control-label col-sm-1" for="txt_search_bingqu">病&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp区</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_bingqu" readonly>
                                </div>
                              </div>
                              <div class="form-group" style="margin-top:15px">
                                <!--床号bedcode-->
                                <label class="control-label col-sm-1" for="txt_search_bedcode">床&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号</label>
                                <div class="col-sm-4">
                                  <input type="text" class="form-control" id="txt_search_bedcode" readonly>
                                </div>
                              </div>
                              <!-- Matter ends -->
                            </div>
                            <!--------------------------nav1---------------------------->
                            <div class="tab-pane fade" id="nav1">
                              <div class="form-group" style="margin-top:15px">
                                <!--症状zhengzhuang-->
                                <label class="control-label col-sm-1" for="txt_search_zhengzhuang">症&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp状</label>
                              </div>
                              <div class="form-group" style="margin-top:15px;margin-left:3px">
                                <div class="col-sm-11">
                    <textarea class="form-control" rows="3" placeholder="Textarea"
                              id="txt_search_zhengzhuang" readonly="readonly"></textarea>
                                </div>
                              </div>
                              <div class="form-group" style="margin-top:15px;margin-left:3px">
                                <!--体征tizheng-->
                                <label class="control-label col-sm-1"
                                       for="txt_search_tizheng">体&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp征</label>
                              </div>
                              <div class="form-group" style="margin-top:15px;margin-left:3px">
                                <div class="col-sm-11">
                        <textarea class="form-control" rows="3" placeholder="Textarea"
                                  id="txt_search_tizheng" readonly="readonly"></textarea>
                                </div>
                              </div>
                              <div class="form-group" style="margin-top:15px;margin-left:3px">
                                <!--临床诊断linchuangzhenduan-->
                                <label class="control-label col-sm-1" for="txt_search_linchuangzhenduan">临床诊断</label>
                              </div>
                              <div class="form-group" style="margin-top:15px;margin-left:3px">
                                <div class="col-sm-11">
                    <textarea class="form-control" rows="3" placeholder="Textarea"
                              id="txt_search_linchuangzhenduan" readonly="readonly"></textarea>
                                </div>
                              </div>
                              <div class="form-group" style="margin-top:15px;margin-left:3px">
                                <!--其它诊断qitazhenduan-->
                                <label class="control-label col-sm-1" for="txt_search_qitazhenduan"> 其它诊断</label>
                              </div>
                              <div class="form-group" style="margin-top:15px;margin-left:3px">
                                <div class="col-sm-11">
                    <textarea class="form-control" rows="3" placeholder="Textarea"
                              id="txt_search_qitazhenduan" readonly="readonly"></textarea>
                                </div>
                              </div>
                            </div>
                            <!------------------------------nav2-------------------------------->
                            <div class="tab-pane fade" id="nav2"></div>
                            <!------------------------------nav3--------------------------------->
                            <div class="tab-pane fade" id="nav3"></div>
                            <!------------------------------nav4--------------------------------->
                            <div class="tab-pane fade" id="nav4"></div>
                            <!------------------------------nav5--------------------------------->
                            <div class="tab-pane fade" id="nav5"></div>
                            <!------------------------------------------------------------------->
                          </div>
                        </div>
                      </div>
                    </div>
                    </form>
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

<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span> 

</body>
</html>