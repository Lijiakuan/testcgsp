<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>出国(境)申请详情页</title>
  <link href="img/icons/title.png" rel="SHORTCUT ICON" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="">

  <link href="style/bootstrap.css" rel="stylesheet">
  <!--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet">-->
  <link href="style/fileinput.css" rel="stylesheet" type="text/css"/>
  <link href="style/font-awesome.css" media="all" rel="stylesheet" type="text/css"/>
  <link href="img/icons/title.png" rel="SHORTCUT ICON" />

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
  <script src="js/patientappli.js"></script>
  <script src="js/address.js"></script>

  <script>
      var tempObj = new Array();
      var tempObj001 = new Array();
      var temp_change = true;
      var tempJianchafangfa = "";
  </script>
</head>


<div class="navbar navbar-fixed-top bs-docs-nav" role="banner">
<div class="conjtainer">
  <!-- Menu button for smallar screens -->
  <div class="navbar-header">
    <button class="navbar-toggle btn-navbar" type="button" data-toggle="collapse" data-target=".bs-navbar-collapse">
      <span>菜单</span>
    </button>
    <!-- Site name for smallar screens -->
    <a href="index.jsp" class="navbar-brand hidden-lg">军事医学研究院出国人员审批系统</a>
  </div>



  <!-- Navigation starts -->
  <nav class="collapse navbar-collapse bs-navbar-collapse" role="navigation">

    <ul class="nav navbar-nav navbar-left">

      <!-- Upload to server link. Class "dropdown-big" creates big dropdown -->
      <%--<li class="dropdown dropdown-big">--%>
        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="label label-success"><i class="icon-cloud-upload"></i></span> 上传到云服务器</a>--%>
        <%--<!-- Dropdown -->--%>
        <%--<ul class="dropdown-menu">--%>
          <%--<li>--%>
            <%--<!-- Progress bar -->--%>
            <%--<p>电子档案上传进度</p>--%>
            <%--<!-- Bootstrap progress bar -->--%>
            <%--<div class="progress progress-striped active">--%>
              <%--<div class="progress-bar progress-bar-info"  role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">--%>
                <%--<span class="sr-only">完成40%</span>--%>
              <%--</div>--%>
            <%--</div>--%>

            <%--<hr />--%>

            <%--<!-- Progress bar -->--%>
            <%--<p>数字切片上传进度</p>--%>
            <%--<!-- Bootstrap progress bar -->--%>
            <%--<div class="progress progress-striped active">--%>
              <%--<div class="progress-bar progress-bar-success"  role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">--%>
                <%--<span class="sr-only">完成80%</span>--%>
              <%--</div>--%>
            <%--</div>--%>

            <%--<hr />--%>

            <%--<!-- Dropdown menu footer -->--%>
            <%--<div class="drop-foot">--%>
              <%--<a href="#">查看所有</a>--%>
            <%--</div>--%>

          <%--</li>--%>
        <%--</ul>--%>
      <%--</li>--%>

      <%--<!-- Sync to server link -->--%>
      <%--<li class="dropdown dropdown-big">--%>
        <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="label label-danger"><i class="icon-refresh"></i></span> 同步到服务器</a>--%>
        <%--<!-- Dropdown -->--%>
        <%--<ul class="dropdown-menu">--%>
          <%--<li>--%>
            <%--<!-- Using "icon-spin" class to rotate icon. -->--%>
            <%--<p><span class="label label-info"><i class="icon-cloud"></i></span>同步数字切片到服务器</p>--%>
            <%--<hr />--%>
            <%--<p><span class="label label-warning"><i class="icon-cloud"></i></span>同步数字切片到云端</p>--%>

            <%--<hr />--%>

            <%--<!-- Dropdown menu footer -->--%>
            <%--<div class="drop-foot">--%>
              <%--<a href="#">查看所有</a>--%>
            <%--</div>--%>

          <%--</li>--%>
        <%--</ul>--%>
      <%--</li>--%>

    </ul>

    <%--<!-- Search form -->--%>
    <%--<form class="navbar-form navbar-left" role="search">--%>
      <%--<div class="form-group">--%>
        <%--<input type="text" class="form-control" placeholder="Search">--%>
      <%--</div>--%>
    <%--</form>--%>
    <!-- Links -->
    <ul class="nav navbar-nav pull-right">
      <li class="dropdown pull-right">
        <a data-toggle="dropdown" class="dropdown-toggle" href="#" id="dropdown_user_name">
          <i class="icon-user"></i><span></span><b class="caret"></b>
        </a>

        <!-- Dropdown menu -->
        <ul class="dropdown-menu">
          <li><a href="#"><i class="icon-user"></i> 资料</a></li>
          <%--<li><a href="#"><i class="icon-cogs"></i> 设置</a></li>--%>
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
          <h3>军事医学研究院出国(境)人员申请系统<span class="bold"></span></h3>
          <%--<p class="meta">业务流管理系统</p>--%>
        </div>
        <!-- Logo ends -->
      </div>

      <!-- Button section -->
      <div class="col-md-4">

        <%--<!-- Buttons -->--%>
        <%--<ul class="nav nav-pills">--%>

          <%--<!-- Comment button with number of latest comments count -->--%>
          <%--<li class="dropdown dropdown-big">--%>
            <%--<a class="dropdown-toggle" href="#" data-toggle="dropdown">--%>
              <%--<i class="icon-comments"></i> 留言 <span class="label label-info">6</span>--%>
            <%--</a>--%>

            <%--<ul class="dropdown-menu">--%>
              <%--<li>--%>
                <%--<!-- Heading - h5 -->--%>
                <%--<h5><i class="icon-comments"></i> 留言</h5>--%>
                <%--<!-- Use hr tag to add border -->--%>
                <%--<hr />--%>
              <%--</li>--%>
              <%--<li>--%>
                <%--<!-- List item heading h6 -->--%>
                <%--<h6><a href="#">你好 :)</a> <span class="label label-warning pull-right">10:42</span></h6>--%>
                <%--<div class="clearfix"></div>--%>
                <%--<hr />--%>
              <%--</li>--%>
              <%--<li>--%>
                <%--<h6><a href="#">你怎么样?</a> <span class="label label-warning pull-right">20:42</span></h6>--%>
                <%--<div class="clearfix"></div>--%>
                <%--<hr />--%>
              <%--</li>--%>
              <%--<li>--%>
                <%--<h6><a href="#">你在干撒呢?</a> <span class="label label-warning pull-right">14:42</span></h6>--%>
                <%--<div class="clearfix"></div>--%>
                <%--<hr />--%>
              <%--</li>--%>
              <%--<li>--%>
                <%--<div class="drop-foot">--%>
                  <%--<a href="#">查看所有</a>--%>
                <%--</div>--%>
              <%--</li>--%>
            <%--</ul>--%>
          <%--</li>--%>

          <%--<!-- Message button with number of latest messages count-->--%>
          <%--<li class="dropdown dropdown-big">--%>
            <%--<a class="dropdown-toggle" href="#" data-toggle="dropdown">--%>
              <%--<i class="icon-envelope-alt"></i> 收件箱 <span class="label label-primary">6</span>--%>
            <%--</a>--%>

            <%--<ul class="dropdown-menu">--%>
              <%--<li>--%>
                <%--<!-- Heading - h5 -->--%>
                <%--<h5><i class="icon-envelope-alt"></i> 消息</h5>--%>
                <%--<!-- Use hr tag to add border -->--%>
                <%--<hr />--%>
              <%--</li>--%>
              <%--<li>--%>
                <%--<!-- List item heading h6 -->--%>
                <%--<h6><a href="#">你好啊?</a></h6>--%>
                <%--<!-- List item para -->--%>
                <%--<p>最近咋样啊...</p>--%>
                <%--<hr />--%>
              <%--</li>--%>
              <%--<li>--%>
                <%--<h6><a href="#">今天很好啊?</a></h6>--%>
                <%--<p>相当好...</p>--%>
                <%--<hr />--%>
              <%--</li>--%>
              <%--<li>--%>
                <%--<div class="drop-foot">--%>
                  <%--<a href="#">查看所有</a>--%>
                <%--</div>--%>
              <%--</li>--%>
            <%--</ul>--%>
          <%--</li>--%>

          <%--<!-- Members button with number of latest members count -->--%>
          <%--<li class="dropdown dropdown-big">--%>
            <%--<a class="dropdown-toggle" href="#" data-toggle="dropdown">--%>
              <%--<i class="icon-user"></i> 用户 <span class="label label-success">6</span>--%>
            <%--</a>--%>

            <%--<ul class="dropdown-menu">--%>
              <%--<li>--%>
                <%--<!-- Heading - h5 -->--%>
                <%--<h5><i class="icon-user"></i> 用户</h5>--%>
                <%--<!-- Use hr tag to add border -->--%>
                <%--<hr />--%>
              <%--</li>--%>
              <%--<li>--%>
                <%--<!-- List item heading h6-->--%>
                <%--<h6><a href="#">Ravi Kumar</a> <span class="label label-warning pull-right">免费</span></h6>--%>
                <%--<div class="clearfix"></div>--%>
                <%--<hr />--%>
              <%--</li>--%>
              <%--<li>--%>
                <%--<h6><a href="#">Balaji</a> <span class="label label-important pull-right">高级</span></h6>--%>
                <%--<div class="clearfix"></div>--%>
                <%--<hr />--%>
              <%--</li>--%>
              <%--<li>--%>
                <%--<h6><a href="#">Kumarasamy</a> <span class="label label-warning pull-right">免费</span></h6>--%>
                <%--<div class="clearfix"></div>--%>
                <%--<hr />--%>
              <%--</li>--%>
              <%--<li>--%>
                <%--<div class="drop-foot">--%>
                  <%--<a href="#">查看所有</a>--%>
                <%--</div>--%>
              <%--</li>--%>
            <%--</ul>--%>
          <%--</li>--%>

        <%--</ul>--%>

      </div>

      <!-- Data section -->

      <%--<div class="col-md-4">--%>
        <%--<div class="header-data">--%>

          <%--<!-- Traffic data -->--%>
          <%--<div class="hdata">--%>
            <%--<div class="mcol-left">--%>
              <%--<!-- Icon with red background -->--%>
              <%--<i class="icon-signal bred"></i>--%>
            <%--</div>--%>
            <%--<div class="mcol-right">--%>
              <%--<!-- Number of visitors -->--%>
              <%--<p><a href="#">7000</a> <em>诊断</em></p>--%>
            <%--</div>--%>
            <%--<div class="clearfix"></div>--%>
          <%--</div>--%>

          <%--<!-- Members data -->--%>
          <%--<div class="hdata">--%>
            <%--<div class="mcol-left">--%>
              <%--<!-- Icon with blue background -->--%>
              <%--<i class="icon-user bblue"></i>--%>
            <%--</div>--%>
            <%--<div class="mcol-right">--%>
              <%--<!-- Number of visitors -->--%>
              <%--<p><a href="#">3000</a> <em>图片</em></p>--%>
            <%--</div>--%>
            <%--<div class="clearfix"></div>--%>
          <%--</div>--%>

          <%--<!-- revenue data -->--%>
          <%--<div class="hdata">--%>
            <%--<div class="mcol-left">--%>
              <%--<!-- Icon with green background -->--%>
              <%--<i class="icon-money bgreen"></i>--%>
            <%--</div>--%>
            <%--<div class="mcol-right">--%>
              <%--<!-- Number of visitors -->--%>
              <%--<p><a href="#">5000</a><em>样本</em></p>--%>
            <%--</div>--%>
            <%--<div class="clearfix"></div>--%>
          <%--</div>--%>

        <%--</div>--%>
      <%--</div>--%>

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
      <li><a href="#" class="has_sub"><i class="icon-list-alt"></i> 公告 </a></li>
      <%--<li><a href="index.jsp" class="open"><i class="icon-home"></i> 首页 </a></li>--%>

      <li class="has_sub"><a href="#"><i class="icon-list-alt"></i> 出国(境)申请 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
      <ul>
        <li><a href="patientappli.jsp"><i class="icon-list-alt"></i> 出国(境)申请登记表 </a></li>
      <%--<li><a href="widgets2.html"><i class="icon-list-alt"></i> 病历详情 </a></li>--%>
      </ul>
      </li>
      <%--<li class="has_sub"><a href="#"><i class="icon-file-alt"></i> 列表信息 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>--%>
        <%--<ul>--%>
          <%--<li><a href="eqpatientinfo.jsp"><i class="icon-list-alt"></i> 患者列表 </a></li>--%>
          <%--<li><a href="patientappli.jsp"><i class="icon-list-alt"></i> 申请列表 </a></li>--%>
          <%--<li><a href="acceptsample.jsp"><i class="icon-list-alt"></i> 样本列表 </a></li>--%>
          <%--<li><a href="product.jsp"><i class="icon-list-alt"></i> 切片列表 </a></li>--%>
        <%--</ul>--%>
      <%--</li>--%>
      <%--<li class="has_sub"><a href="#"><i class="icon-file-alt"></i> 取材制片<span class="pull-right"><i class="icon-chevron-right"></i></span></a>--%>
        <%--<ul>--%>
          <%--<li><a href="patientsample.jsp"><i class="icon-list-alt"></i> 取材及组织处理 </a></li>--%>
          <%--<li><a href="product.jsp"><i class="icon-list-alt"></i> 切片管理 </a></li>--%>
        <%--</ul>--%>
      <%--</li>--%>
      <%--<li class="has_sub"><a href="#"><i class="icon-bar-chart"></i> 扫描管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>--%>
        <%--<ul>--%>
          <%--<li><a href="scan.jsp"><i class="icon-list-alt"></i> 扫描管理 </a></li>--%>
        <%--</ul>--%>
      <%--</li>--%>
      <%--<li class="has_sub"><a href="#"><i class="icon-table"></i> 诊断管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>--%>
        <%--<ul>--%>
          <%--<li><a href="diagnosis.jsp"><i class="icon-list-alt"></i> 阅片诊断 </a></li>--%>
          <%--<li><a href="#"><i class="icon-list-alt"></i> 诊断详情 </a></li>--%>
        <%--</ul>--%>
      <%--</li>--%>
      <%--<li class="has_sub"><a href="#"><i class="icon-tasks"></i> 报告管理 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>--%>
        <%--<ul>--%>
          <%--<li><a href="report.jsp"><i class="icon-list-alt"></i> 报告管理 </a></li>--%>
        <%--</ul>--%>
      <%--</li>--%>
    </ul>
  </div>

  <!-- Sidebar ends -->

  <!-- Main bar -->
  <div class="mainbar">

    <!-- Page heading -->
    <%--<div class="page-head">--%>
      <%--<h2 class="pull-left"><i class="icon-home"></i> 首页</h2>--%>

      <%--<!-- Breadcrumb -->--%>
      <%--<div class="bread-crumb pull-right">--%>
        <%--<a href="index.jsp"><i class="icon-home"></i> 首页</a>--%>
        <%--<!-- Divider -->--%>
        <%--<span class="divider">/</span>--%>
        <%--<a href="#" class="bread-current">患者列表</a>--%>
      <%--</div>--%>

      <%--<div class="clearfix"></div>--%>
    <%--</div>--%>
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
                    <div class="pull-left">出国(境)申请表</div>
                    <div class="widget-icons pull-right">
                      <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                      <a href="#" class="wclose"><i class="icon-remove"></i></a>
                    </div>
                    <div class="clearfix"></div>
                  </div>



                  <div class="widget-content">
                    <div class="panel-body" style="padding-bottom:0px;">
                      <div class="widget">
                        <!--<div class="widget-head">
                          <div class="pull-left">检索条件</div>
                          <div class="widget-icons pull-right">
                            <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                            <a href="#" class="wclose"><i class="icon-remove"></i></a>
                          </div>
                          <div class="clearfix"></div>
                        </div>-->
                        <div class="widget-content">
                          <form id="formSearch001" class="form-horizontal">
                            <div class="form-group" style="margin-top:15px">
                              <label class="control-label col-sm-1" for="txt_search_hospitalizetionid">任&nbsp&nbsp务&nbsp&nbspID</label>
                              <div class="col-sm-3">
                                <input type="text" class="form-control" id="txt_search_hospitalizetionid">
                              </div>
                              <label class="control-label col-sm-1" for="txt_search_applino">任&nbsp&nbsp务&nbsp&nbsp名</label>
                              <div class="col-sm-3">
                                <input type="text" class="form-control" id="txt_search_applino">
                              </div>
                              <label class="control-label col-sm-1" for="txt_search_inspmethod">同&nbsp&nbsp行&nbsp&nbsp人</label>
                              <div class="col-sm-3">
                                <select id="txt_search_inspmethod" data-first-option="false" data-live-search="true" class="selectpicker form-control show-tick" title='请输入同行人'></select>
                              </div>
                            </div>
                            <div class="form-group" style="margin-top:15px">
                              <label class="control-label col-sm-1" for="txt_search_patientdiagkind">申请类型</label>
                              <div class="col-sm-3">
                                <select id="txt_search_patientdiagkind" data-first-option="false" data-live-search="true" class="selectpicker form-control show-tick" title='请输入申请单类型'></select>
                              </div>
                              <label class="control-label col-sm-1" for="txt_search_inspdepartid">出国期限</label>
                              <div class="col-sm-3">
                                <select id="txt_search_inspdepartid" data-first-option="false" data-live-search="true" class="selectpicker form-control show-tick" title='请输入出国期限'></select>
                              </div>
                              <label class="control-label col-sm-1" for="txt_search_specialrequire">特殊要求</label>
                              <div class="col-sm-3">
                                <select id="txt_search_specialrequire" data-first-option="false" data-live-search="true" class="selectpicker form-control show-tick" title='是否存在特殊要求'></select>
                              </div>
                            </div>
                            <div class="form-group" style="margin-top:15px">

                              <label class="control-label col-sm-1" for="datetimepicker1">申请日期</label>
                              <div id="datetimepicker1" class="input-append col-sm-2">
                                <input data-format="yyyy-MM-dd" type="text" class="form-control dtpicker" id="txt_search_inspdate001">
                                <span class="add-on">
                                  <i data-time-icon="icon-time" data-date-icon="icon-calendar" class="btn btn-info btn-lg"></i>
                                </span>
                              </div>
                              <div id="datetimepicker3" class="input-append col-sm-2">
                                <input data-format="yyyy-MM-dd" type="text" class="form-control dtpicker" id="txt_search_inspdate002">
                                <span class="add-on">
                                  <i data-time-icon="icon-time" data-date-icon="icon-calendar" class="btn btn-info btn-lg"></i>
                                </span>
                              </div>

                              <%--<label class="control-label col-sm-1" for="datetimepicker3">签收日期</label>--%>
                              <%--<div id="datetimepicker2" class="input-append col-sm-2">--%>
                                <%--<input data-format="yyyy-MM-dd" type="text" class="form-control dtpicker" id="txt_search_acceptdate001">--%>
                                <%--<span class="add-on">--%>
                                  <%--<i data-time-icon="icon-time" data-date-icon="icon-calendar" class="btn btn-info btn-lg"></i>--%>
                                <%--</span>--%>
                              <%--</div>--%>
                              <%--<div id="datetimepicker4" class="input-append col-sm-2">--%>
                                <%--<input data-format="yyyy-MM-dd" type="text" class="form-control dtpicker" id="txt_search_acceptdate002">--%>
                                <%--<span class="add-on">--%>
                                  <%--<i data-time-icon="icon-time" data-date-icon="icon-calendar" class="btn btn-info btn-lg"></i>--%>
                                <%--</span>--%>
                              <%--</div>--%>
                            </div>


                            <div class="form-group" style="margin-top:15px">
                              <div class="btn-group">
                                <button type="button" style="margin-left:50px" id="btn_query" class="btn btn-primary">查询</button>
                                <button type="button" id="btn_output" class="btn btn-success">导出</button>
                                <button type="button" id="btn_print" class="btn btn-danger">打印</button>
                                <button type="button" id="btn_change" class="btn btn-warning">编辑</button>
                              </div>
                            </div>

                          </form>
                        </div>
                      </div>
                      <div id="toolbar" class="btn-group">
                        <button id="btn_add" type="button" class="btn btn-default">
                          <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
                        </button>
                        <button id="btn_save" type="button" class="btn btn-default">
                          <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>保存
                        </button>
                        <button id="btn_delete" type="button" class="btn btn-default">
                          <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除
                        </button>
                      </div>
                      <table id="tb_tasks"></table>
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
            <p class="copy">Copyright &copy; 2018 | <a href="#">院办信息中心</a> </p>
      </div>
    </div>
  </div>
</footer> 	

<!-- Footer ends -->

<!--弹出对话框-->
<div id="myModal1" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">申请单</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
          <!-- Matter -->
          <div class="matter">
            <div class="container">
              <div class="row">
                <!-- post sidebar -->
                <ul id="myTab" class="nav nav-tabs">
                  <li class="active"><a href="#home" data-toggle="tab">患者信息</a></li>
                  <li><a href="#nav1" data-toggle="tab">临床信息</a></li>
                  <li><a href="#nav2" data-toggle="tab">送检标本信息</a></li>
                  <li><a href="#nav3" data-toggle="tab">肿瘤患者填写</a></li>
                  <li><a href="#nav4" data-toggle="tab">妇科患者填写</a></li>
                  <li><a href="#nav5" data-toggle="tab">甲状腺标本填写</a></li>
                  <li><a href="#nav6" data-toggle="tab">手术标本送检</a></li>
                  <li><a href="#nav7" data-toggle="tab">采集标本解剖</a></li>
                </ul>

                <div id="myTabContent" class="tab-content">
                  <!--------------------------home-------------------------------->
                  <div class="tab-pane fade in active" id="home">
                    <div class="form-group" style="margin-top:15px">
                      <!--避孕youfoubiyun-->
                      <label class="control-label col-sm-1" for="txt_search_shenqingleixing">申请类型</label>
                      <div class="col-sm-4">
                        <select id="txt_search_shenqingleixing" data-first-option="false"
                                data-live-search="true"
                                class="selectpicker form-control show-tick" title='申请类型'></select>
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
                        <input type="text" class="form-control" id="txt_search_xingming">
                      </div>
                      <!--性别gender-->
                      <label class="control-label col-sm-1" for="txt_search_gender">性&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp别</label>
                      <div class="col-sm-4">
                        <select id="txt_search_gender" data-first-option="false" data-live-search="true"
                                class="selectpicker form-control show-tick" title='请选择性别'></select>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--年龄age-->
                      <label class="control-label col-sm-1"
                             for="txt_search_age">年&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp龄</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_age">
                      </div>
                      <!--年龄单位unit-->
                      <label class="control-label col-sm-1" for="txt_search_department"></label>
                      <div class="col-sm-4">
                        <select id="txt_search_department" data-first-option="false" data-live-search="true"
                                class="selectpicker form-control show-tick" title='请选择单位'></select>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--婚否marrage-->
                      <label class="control-label col-sm-1" for="txt_search_marrage">婚&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp否</label>
                      <div class="col-sm-4">
                        <select id="txt_search_marrage" data-first-option="false" data-live-search="true"
                                class="selectpicker form-control show-tick" title='请选择婚否'></select>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--民族minzu-->
                      <label class="control-label col-sm-1"
                             for="txt_search_minzu">民&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp族</label>
                      <div class="col-sm-4">
                        <select id="txt_search_minzu" data-first-option="false" data-live-search="true"
                                class="selectpicker form-control show-tick" title='请选择民族'></select>
                      </div>
                      <!--职业zhiye-->
                      <label class="control-label col-sm-1"
                             for="txt_search_zhiye">职&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp业</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_zhiye">
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--电话tel-->
                      <label class="control-label col-sm-1"
                             for="txt_search_tel">电&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp话</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_tel">
                      </div>
                      <!--身份证号shenfenzheng-->
                      <label class="control-label col-sm-1" for="txt_search_shenfenzheng">身份证号</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_shenfenzheng">
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--住址address-->
                      <label class="control-label col-sm-1" for="txt_search_address">住&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp址</label>
                      <div class="col-sm-4">
                        <select id="txt_search_address" data-first-option="false" data-live-search="true"
                                class="selectpicker form-control show-tick" title='请输入省'></select>
                      </div>
                      <label class="control-label col-sm-1" for="txt_search_address"></label>
                      <div class="col-sm-4">
                        <select id="txt_search_addresscity" data-first-option="false"
                                data-live-search="true" class="selectpicker form-control show-tick"
                                title='请输入市'></select>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <label class="control-label col-sm-1" for="txt_search_address"></label>
                      <div class="col-sm-4">
                        <select id="txt_search_addressdistinct" data-first-option="false"
                                data-live-search="true" class="selectpicker form-control show-tick"
                                title='请输入区'></select>
                      </div>
                      <label class="control-label col-sm-1" for="txt_search_address"></label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_addressother">
                      </div>
                    </div>

                    <div class="form-group" style="margin-top:15px">
                      <!--就医来源source-->
                      <label class="control-label col-sm-1" for="txt_search_source">就医来源</label>
                      <div class="col-sm-4">
                        <select id="txt_search_source" data-first-option="false" data-live-search="true"
                                class="selectpicker form-control show-tick" title='请选择就医来源'></select>
                      </div>
                      <!--病区bingqu-->
                      <label class="control-label col-sm-1" for="txt_search_bingqu">病&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp区</label>
                      <div class="col-sm-4">
                        <select id="txt_search_bingqu" data-first-option="false" data-live-search="true"
                                class="selectpicker form-control show-tick" title='请选择病区'></select>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--床号bedcode-->
                      <label class="control-label col-sm-1" for="txt_search_bedcode">床&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp号</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_bedcode">
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
                              id="txt_search_zhengzhuang"></textarea>
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
                                  id="txt_search_tizheng"></textarea>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px;margin-left:3px">
                      <!--临床诊断linchuangzhenduan-->
                      <label class="control-label col-sm-1" for="txt_search_linchuangzhenduan">临床诊断</label>
                    </div>
                    <div class="form-group" style="margin-top:15px;margin-left:3px">
                      <div class="col-sm-11">
                    <textarea class="form-control" rows="3" placeholder="Textarea"
                              id="txt_search_linchuangzhenduan"></textarea>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px;margin-left:3px">
                      <!--其它诊断qitazhenduan-->
                      <label class="control-label col-sm-1" for="txt_search_qitazhenduan"> 其它诊断</label>
                    </div>
                    <div class="form-group" style="margin-top:15px;margin-left:3px">
                      <div class="col-sm-11">
                    <textarea class="form-control" rows="3" placeholder="Textarea"
                              id="txt_search_qitazhenduan"></textarea>
                      </div>
                    </div>
                  </div>
                  <!------------------------------nav2-------------------------------->
                  <div class="tab-pane fade" id="nav2">
                    <div class="form-group" style="margin-top:15px">
                      <label class="col-sm-4">注意事项</label>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--是否曾在本院做过病理检查sfczby-->
                      <label class="col-sm-4" for="txt_search_sfczby">是否曾在本院做过病理检查</label>
                      <div class="col-sm-5">
                        <select id="txt_search_sfczby" data-first-option="false" data-live-search="true"
                                class="selectpicker form-control show-tick" title='是否曾在本院做过病理检查'></select>
                      </div>
                    </div>
                  </div>
                  <!------------------------------nav3--------------------------------->
                  <div class="tab-pane fade" id="nav3">
                    <div class="form-group" style="margin-top:15px">
                      <!--肿瘤发现时间zlfxsj-->
                      <label class="control-label col-sm-1" for="txt_search_zlfxsj">发现时间</label>
                      <div id="txt_search_zlfxsj1" class="input-append col-sm-3">
                        <input data-format="yyyy-MM-dd" type="text" class="form-control dtpicker" id="txt_search_zlfxsj">
                        <span class="add-on">
                            <i data-time-icon="icon-time" data-date-icon="icon-calendar" class="btn btn-info btn-lg"></i>
                        </span>
                      </div>
                      <label class="control-label col-sm-1" for="txt_search_year">年</label>
                      <div class="col-sm-3">
                        <input type="text" class="form-control" id="txt_search_year">
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--肿瘤部位zlbw-->
                      <label class="control-label col-sm-1" for="txt_search_zlbw">肿瘤部位</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_zlbw">
                      </div>
                      <!--肿瘤大小zldx-->
                      <label class="control-label col-sm-1" for="txt_search_zldx">肿瘤大小</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_zldx">
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--转移zhuanyi-->
                      <label class="control-label col-sm-1" for="txt_search_zhuanyi">有无转移</label>
                      <div class="col-sm-4">
                        <select id="txt_search_zhuanyi" data-first-option="false" data-live-search="true"
                                class="selectpicker form-control show-tick" title='有无转移'></select>
                      </div>
                      <!--转移位置zhuanyiweizhi-->
                      <label class="control-label col-sm-1" for="txt_search_zhuanyiweizhi">转移位置</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_zhuanyiweizhi">
                      </div>
                    </div>

                    <div class="form-group" style="margin-top:15px">
                      <!--放化疗fanghualiao-->
                      <label class="control-label col-sm-1" for="txt_search_fanghualiao">放化疗？</label>
                      <div class="col-sm-4">
                        <select id="txt_search_fanghualiao" data-first-option="false" data-live-search="true"
                                class="selectpicker form-control show-tick" title='有无放化疗'></select>
                      </div>
                      <!--肿瘤大小zhongliudaxiao-->
                      <label class="control-label col-sm-1" for="txt_search_zhongliudaxiao">肿瘤大小</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_zhongliudaxiao">
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--肿瘤大小对应时间-->
                      <div id="datetimepicker12" class="input-append col-sm-5">
                        <input data-format="yyyy-MM-dd'" type="text" class="form-control dtpicker"
                               id="txt_search_zldxdysj">
                        <span class="add-on">
                              <i data-time-icon="icon-time" data-date-icon="icon-calendar"
                                 class="btn btn-info btn-lg"></i>
                            </span>
                      </div>
                    </div>
                  </div>

                  <div class="tab-pane fade" id="nav4">
                    <div class="form-group" style="margin-top:15px">
                      <!--月经周期yjzq-->
                      <label class="control-label col-sm-1" for="txt_search_yjzq">月经周期</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_yjzq">
                      </div>
                      <!--月经持续时间yjcxsj-->
                      <label class="control-label col-sm-1" for="txt_search_yjcxsj">持续时间</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_yjcxsj">
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--上次月经scyj-->
                      <label class="control-label col-sm-1" for="txt_search_scyj">上次月经</label>
                      <div id="datetimepicker42" class="input-append col-sm-4">
                        <input data-format="yyyy-MM-dd'" type="text" class="form-control dtpicker"
                               id="txt_search_scyj">
                        <span class="add-on">
                              <i data-time-icon="icon-time" data-date-icon="icon-calendar"
                                 class="btn btn-info btn-lg"></i>
                            </span>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--周期治疗？zqzl-->
                      <label class="control-label col-sm-1" for="txt_search_zqzl">周期治疗</label>
                      <div class="col-sm-4">
                        <select id="txt_search_zqzl" data-first-option="false" data-live-search="true"
                                class="selectpicker form-control show-tick" title='是否施行周期治疗'></select>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--周期治疗时间zqzlsj-->
                      <label class="control-label col-sm-1" for="txt_search_zqzlsj">时&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp间</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_zqzlsj">
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--剂量zqzljl-->
                      <label class="control-label col-sm-1" for="txt_search_zqzljl">剂&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp量</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_zqzljl">
                      </div>
                    </div>


                    <div class="form-group" style="margin-top:15px">
                      <!--生产史shengchanshi-->
                      <label class="control-label col-sm-1" for="txt_search_shengchanshi">生&nbsp&nbsp产&nbsp&nbsp史</label>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_shengchanshi">
                      </div>
                      <!--剂量zqzljl-->
                      <label class="control-label col-sm-1" for="txt_search_shengchanshi">胎</label>
                      <div class="col-sm-3">
                        <input type="text" class="form-control" id="txt_search_shengchanshichan">
                      </div>
                      <label class="control-label col-sm-1" for="txt_search_shengchanshi">产</label>
                    </div>

                    <div class="form-group" style="margin-top:15px">
                      <!--避孕youfoubiyun-->
                      <label class="control-label col-sm-1" for="txt_search_youfoubiyun">有否避孕</label>
                      <div class="col-sm-4">
                        <select id="txt_search_youfoubiyun" data-first-option="false"
                                data-live-search="true"
                                class="selectpicker form-control show-tick" title='有否避孕'></select>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--避孕方式biyunfangshi-->
                      <label class="control-label col-sm-1" for="txt_search_biyunfangshi">避孕方式</label>
                      <div class="col-sm-4">
                        <select id="txt_search_biyunfangshi" data-first-option="false"
                                data-live-search="true"
                                class="selectpicker form-control show-tick" title='避孕方式'></select>
                      </div>
                    </div>
                  </div>
                  <!---->
                  <div class="tab-pane fade" id="nav5">
                    <div class="form-group" style="margin-top:15px">
                      <label class="control-label col-sm-2"
                             for="txt_search_dianjizhiliao">如为甲状腺标本请填写</label>
                    </div>

                    <div class="form-group" style="margin-top:15px">
                      <!--碘剂治疗dianjizhiliao-->
                      <div class="col-sm-11">
                        <select id="txt_search_dianjizhiliao" data-first-option="false"
                                data-live-search="true"
                                class="selectpicker form-control show-tick" title='是否接受过碘剂治疗'></select>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--硫尿嘧啶类治疗lnmdzl-->
                      <div class="col-sm-11">
                        <select id="txt_search_lnmdzl" data-first-option="false" data-live-search="true"
                                class="selectpicker form-control show-tick"
                                title='是否接受过硫尿嘧啶类治疗'></select>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <label class="control-label col-sm-1" for="txt_search_shoushusuojian">手术标本</label>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <!--手术所见shoushusuojian-->
                      <label class="control-label col-sm-1" for="txt_search_shoushusuojian">手术所见</label>
                      <div class="col-sm-10">
                  <textarea class="form-control" rows="3" placeholder="Textarea"
                            id="txt_search_shoushusuojian"></textarea>
                      </div>
                    </div>
                  </div>
                  <!---->
                  <!-----------------------------nav6------------------------------------->
                  <div class="tab-pane fade" id="nav6">
                    <div class="form-group" style="margin-top:15px">
                      <!--碘剂治疗dianjizhiliao-->
                      <label class="control-label col-sm-3"
                             for="txt_search_dianjizhiliao">标本位置</label>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_cjbbzlbw">
                      </div>
                      <div class="col-sm-4">
                        <input type="text" class="form-control" id="txt_search_zlfj1">
                      </div>
                      <div class="col-sm-2">
                        <button id="btn_addjpbw" type="button" class="btn btn-default">+</button>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <div class="col-sm-4">
                        <label class="control-label col-sm-3"
                               for="txt_search_huayanjieguo">化验结果</label>
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:15px">
                      <div class="col-sm-10">
                  <textarea class="form-control" rows="3" placeholder="Textarea"
                            id="txt_search_huayanjieguo"></textarea>
                      </div>
                    </div>
                  </div>
                  <!---->
                  <div class="tab-pane fade" id="nav7">
                    <div class="form-group" style="margin-top:15px">
                      <!--碘剂治疗dianjizhiliao-->
                      <label class="control-label col-sm-4"
                             for="txt_search_dianjizhiliao">检查方法</label>
                    </div>
                    <div class="form-group" style="margin-top:5px;margin-left:10px">
                      <button type="button" id="btn-1" class="btn btn-warning" style="width:130px">活检</button>
                      <button type="button" id="btn-2" class="btn btn-warning" style="width:130px">快速冰冻</button>
                      <button type="button" id="btn-3" class="btn btn-warning" style="width:130px">细胞学</button>
                      <button type="button" id="btn-4" class="btn btn-warning" style="width:130px">TCT</button>
                    </div>
                    <div class="form-group" style="margin-top:5px;margin-left:10px">
                      <button type="button" id="btn-5" class="btn btn-warning" style="width:130px">免疫组化</button>
                      <button type="button" id="btn-6" class="btn btn-warning" style="width:130px">细胞DNA倍体</button>
                      <button type="button" id="btn-7" class="btn btn-warning" style="width:130px">FISH</button>
                      <button type="button" id="btn-8" class="btn btn-warning" style="width:130px">基因检测</button>
                    </div>
                    <div class="form-group" style="margin-top:5px;margin-left:10px">
                      <label class="control-label col-sm-3"
                             for="txt_search_qitafangfa">其它方法</label>
                    </div>
                    <div class="form-group" style="margin-top:5px;margin-left:10px">
                      <div class="col-sm-10">
                        <input type="text" class="form-control" id="txt_search_qitafangfa">
                      </div>
                    </div>
                    <div class="form-group" style="margin-top:5px;margin-left:10px">
                      <label class="control-label col-sm-1"
                             for="txt_search_teshuyaoqiu">特殊要求</label>
                    </div>
                    <div class="form-group" style="margin-top:5px;margin-left:10px">
                      <div class="col-sm-10">
                  <textarea class="form-control" rows="3" placeholder="Textarea"
                            id="txt_search_teshuyaoqiu"></textarea>
                      </div>
                    </div>
                    <hr/>
                    <div class="form-group" style="margin-top:5px;margin-left:10px">
                      <label class="control-label col-sm-1"
                             for="txt_search_dianjizhiliao">申请医师</label>
                      <div class="col-sm-4">
                        <select id="txt_search_shenqingyishi" data-first-option="false" data-live-search="true"
                                class="selectpicker form-control show-tick"
                                title='请选择申请医师'>
                        </select>
                      </div>
                      <label class="control-label col-sm-1"
                             for="txt_search_sheniqngriqi">申请日期</label>
                        <div id="datetimepickerer42" class="input-append col-sm-4">
                        <input data-format="yyyy-MM-dd'" type="text" class="form-control dtpicker"
                               id="txt_search_sheniqngriqi">
                        <span class="add-on">
                              <i data-time-icon="icon-time" data-date-icon="icon-calendar"
                                 class="btn btn-info btn-lg"></i>
                        </span>
                      </div>
                    </div>

                      <div class="form-group" style="margin-top:5px;margin-left:10px">
                        <label class="control-label col-sm-1"
                               for="txt_search_songjianyishi">送检医师</label>
                        <div class="col-sm-4">
                          <select id="txt_search_songjianyishi" data-first-option="false" data-live-search="true"
                                  class="selectpicker form-control show-tick"
                                  title='选择送检医师'>
                          </select>
                        </div>
                        <label class="control-label col-sm-1"
                               for="txt_search_songjianriqi">送检日期</label>
                        <div id="datetimepickerera42" class="input-append col-sm-4">
                          <input data-format="yyyy-MM-dd'" type="text" class="form-control dtpicker"
                                 id="txt_search_songjianriqi">
                          <span class="add-on">
                              <i data-time-icon="icon-time" data-date-icon="icon-calendar"
                                 class="btn btn-info btn-lg"></i>
                        </span>
                        </div>
                      </div>
                      <div class="form-group" style="margin-top:5px;margin-left:10px">
                        <label class="control-label col-sm-1"
                               for="txt_search_dianjizhiliao">送检科室</label>
                        <div class="col-sm-4">
                          <select id="txt_search_lnmfghdzl" data-first-option="false" data-live-search="true"
                                  class="selectpicker form-control show-tick"
                                  title='选择送检科室'>
                          </select>
                        </div>
                      </div>
                      <div class="form-group" style="margin-top:5px;margin-left:10px">
                        <label class="control-label col-sm-1" for="txt_search_dianjizhiliao"></label>
                        <div class="col-sm-3">
                          <button type="button" id="btn-save" class="btn btn-primary" style="width:130px">保存</button>
                        </div>
                        <div class="col-sm-3">
                          <button type="button" id="btn-submit" class="btn btn-info" style="width:130px">提交</button>
                        </div>
                      </div>
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
        debugger;
        var opt = {
            url: '/selectPatientinfo',
            query:{
                pageSize: 10, //页面大小
                pageNumber: 1, //页码

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
                sortName:"applino",
                sortOrder:"asc"
            }

        };
        $('#tb_tasks').bootstrapTable('refresh',opt);
    });
</script>
</body>
</html>