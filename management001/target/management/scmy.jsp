<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <!-- Title and other stuffs -->
  <title>出国申报审批</title>
  <link href="img/icons/title.png" rel="SHORTCUT ICON" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="author" content="">
  <link href="img/icons/title.png" rel="SHORTCUT ICON" />

  <link href="style/bootstrap.css" rel="stylesheet">
  <!--<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css" rel="stylesheet">-->
  <link href="style/fileinput.css" rel="stylesheet" type="text/css">
  <link href="style/font-awesome.css" media="all" rel="stylesheet" type="text/css">

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
  <script src="js/table001.js"></script>
  <script src="js/table002.js"></script>
  <script src="js/table003.js"></script>
  <script src="js/table004.js"></script>
  <script src="js/table005.js"></script>
  <script src="js/table006.js"></script>
  <!--
  <script src="js/table002.js"></script>
  <script src="js/table003.js"></script>
  <script src="js/table004.js"></script>
  <script src="js/table005.js"></script>
  <script src="js/table006.js"></script>
  -->
</head>

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

        <!-- Search form -->
        <!-- Links -->
        <ul class="nav navbar-nav pull-right">
          <li class="dropdown pull-right">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#" id="dropdown_user_name">
              <i class="icon-user"></i><span></span><b class="caret"></b>
            </a>

            <!-- Dropdown menu -->
            <ul class="dropdown-menu">
              <%--<li><a href="#"><i class="icon-user"></i> 资料</a></li>--%>
              <%--<li><a href="#"><i class="icon-cogs"></i> 设置</a></li>--%>
              <li><a href="login.jsp"><i class="icon-off"></i> 退出</a></li>
            </ul>
          </li>

        </ul>
    </nav>

  </div>
</div>

<body>


<!-- Header starts -->

<header>
  <div class="container">
    <div class="row">

      <!-- Logo section -->
      <div class="col-md-4">
        <!-- Logo. -->
        <div class="logo">
          <%--<h1><a href="#">APIS<span class="bold"></span></a></h1>--%>
          <h3><p class="meta">军事医学研究院出国(境)人员审核</p></h3>
        </div>
        <!-- Logo ends -->
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
      <li><a href="#" class="has_sub"><i class="icon-list-alt"></i> 指南 </a>
        <ul>
          <li><a href="JSP_DB/news/pub.jsp"><i class="icon-list-alt"></i> 指南发布 </a></li>
          <li><a href="JSP_DB/news/pub_do.jsp"><i class="icon-list-alt"></i> 指南查看 </a></li>
        </ul>
      </li>
      <li><a href="index.jsp" class="open"><i class="icon-home"></i> 出国(境)审核 </a></li>
      <li class="has_sub"><a href="#"><i class="icon-list-alt"></i> 出国(境)申请 <span class="pull-right"><i class="icon-chevron-right"></i></span></a>
        <ul>
          <li><a href="patientappli.jsp"><i class="icon-list-alt"></i> 出国(境)申请登记表 </a></li>
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

    <%--<!-- Page heading -->--%>
    <%--<div class="page-head">--%>
    <%--<h2 class="pull-left"><i class="icon-home"></i> 首页</h2>--%>

    <%--<!-- Breadcrumb -->--%>
    <%--&lt;%&ndash;<div class="bread-crumb pull-right">&ndash;%&gt;--%>
    <%--&lt;%&ndash;<a href="index.jsp"><i class="icon-home"></i> 首页</a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;<!-- Divider -->&ndash;%&gt;--%>
    <%--&lt;%&ndash;<span class="divider">/</span> &ndash;%&gt;--%>
    <%--&lt;%&ndash;<a href="#" class="bread-current">控制台</a>&ndash;%&gt;--%>
    <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

    <%--<div class="clearfix"></div>--%>
    <%--</div>--%>
    <!-- Page heading ends -->



    <!-- Matter -->

    <div class="matter">
      <div class="container">

        <!-- Today status. jQuery Sparkline plugin used. -->


        <%--<div class="row">--%>
        <%--<div class="col-md-12">--%>
        <%--<ul class="today-datas">--%>
        <%--<li class="dropdown dropdown-big">--%>
        <%--<a class="dropdown-toggle" href="#" data-toggle="dropdown">--%>
        <%--<h3><i class="icon-file"></i> 申请待处理 <span class="label label-danger" id="shenqingdaichuli">16</span></h3>--%>
        <%--</a>--%>
        <%--</li>--%>
        <%--<li class="dropdown dropdown-big">--%>
        <%--<a class="dropdown-toggle" href="#" data-toggle="dropdown">--%>
        <%--<h3><i class="icon-instagram"></i> 冰冻待处理 <span class="label label-success" id="bingdongdaichuli">16</span></h3>--%>
        <%--</a>--%>
        <%--</li>--%>
        <%--<li class="dropdown dropdown-big">--%>
        <%--<a class="dropdown-toggle" href="#" data-toggle="dropdown">--%>
        <%--<h3><i class="icon-dropbox"></i> 会诊申请 <span class="label label-warning" id="huiyishenqing">16</span></h3>--%>
        <%--</a>--%>
        <%--</li>--%>
        <%--<li class="dropdown dropdown-big">--%>
        <%--<a class="dropdown-toggle" href="#" data-toggle="dropdown">--%>
        <%--<h3><i class="icon-keyboard"></i> 未完成报告 <span class="label label-info" id="weiwanchengbaogao">6</span></h3>--%>
        <%--</a>--%>
        <%--</li>--%>
        <%--<li class="dropdown dropdown-big">--%>
        <%--<a class="dropdown-toggle" href="#" data-toggle="dropdown">--%>
        <%--<h3><i class="icon-eye-open"></i> 未审核报告 <span class="label label-danger" id="weishenhebaogao">6</span></h3>--%>
        <%--</a>--%>
        <%--</li>--%>
        <%--<li class="dropdown dropdown-big">--%>
        <%--<a class="dropdown-toggle" href="#" data-toggle="dropdown">--%>
        <%--<h3><i class="icon-file-text"></i> 未打印报告 <span class="label label-primary" id="weidayinbaogao">8</span></h3>--%>
        <%--</a>--%>
        <%--</li>--%>
        <%--</ul>--%>
        <%--</div>--%>
        <%--</div>--%>

        <!-- Today status ends -->

        <!-- Dashboard Graph starts -->

        <!-- Dashboard graph ends -->

        <!-- Chats, File upload and Recent Comments -->
        <div class="row">
          <div class="col-md-12">
            <div class="widget">
              <div class="widget-head">
                <div class="pull-left">出国(境)审核</div>
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
                          <label class="control-label col-sm-1" for="txt_search_hospitalizetionid">填&nbsp&nbsp报&nbsp&nbsp人</label>
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
                            <%--<button type="button" id="btn_output" class="btn btn-success">导出</button>--%>
                            <%--<button type="button" id="btn_print" class="btn btn-danger">打印</button>--%>
                            <%--<button type="button" id="btn_change" class="btn btn-warning">编辑</button>--%>
                          </div>
                        </div>

                      </form>
                    </div>
                    <div class="widget-content">
                      <table class="table table-striped table-bordered table-hover" id="table004"></table>
                      <div class="widget-foot">
                        <div class="clearfix"></div>
                      </div>
                    </div>

                  </div>
                  <%--<div id="toolbar" class="btn-group">--%>
                  <%--<button id="btn_add" type="button" class="btn btn-default">--%>
                  <%--<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增--%>
                  <%--</button>--%>
                  <%--<button id="btn_save" type="button" class="btn btn-default">--%>
                  <%--<span class="glyphicon glyphicon-plus" aria-hidden="true"></span>保存--%>
                  <%--</button>--%>
                  <%--<button id="btn_delete" type="button" class="btn btn-default">--%>
                  <%--<span class="glyphicon glyphicon-remove" aria-hidden="true"></span>删除--%>
                  <%--</button>--%>
                  <%--</div>--%>
                  <table id="tb_tasks"></table>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12">
            <div class="widget">
              <div class="widget-head">
                <div class="pull-left">未审核</div>
                <div class="clearfix"></div>
              </div>
              <div class="widget-content">
                <table id="table001"></table>
                <div class="widget-foot">
                  <div class="clearfix"></div>
                </div>
              </div>
            </div>
          </div>
          <div class="col-md-12">
            <!-- Widget -->
            <div class="widget">

              <div class="widget-head">
                <div class="pull-left">已审核</div>
                <div class="widget-icons pull-right">
                  <a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>
                  <a href="#" class="wclose"><i class="icon-remove"></i></a>
                </div>
                <div class="clearfix"></div>
              </div>

              <div class="widget-content">
                <table class="table table-striped table-bordered table-hover" id="table002"></table>
                <div class="widget-foot">
                  <div class="clearfix"></div>
                </div>
              </div>
            </div>
          </div>

        </div>


        <%--<div class="row">--%>
        <%--<div class="col-md-6">--%>
        <%--<div class="widget">--%>

        <%--<div class="widget-head">--%>
        <%--<div class="pull-left">多人任务</div>--%>
        <%--<div class="widget-icons pull-right">--%>
        <%--<a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>--%>
        <%--<a href="#" class="wclose"><i class="icon-remove"></i></a>--%>
        <%--</div>--%>
        <%--<div class="clearfix"></div>--%>
        <%--</div>--%>

        <%--<div class="widget-content">--%>

        <%--<table class="table table-striped table-bordered table-hover" id="table003"></table>--%>

        <%--<div class="widget-foot">--%>
        <%--<div class="clearfix"></div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--&lt;%&ndash;<div class="col-md-6">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="widget">&ndash;%&gt;--%>

        <%--&lt;%&ndash;<div class="widget-head">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="pull-left">未通过报告</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="widget-icons pull-right">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<a href="#" class="wclose"><i class="icon-remove"></i></a>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="clearfix"></div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

        <%--&lt;%&ndash;<div class="widget-content">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<table class="table table-striped table-bordered table-hover" id="table004"></table>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="widget-foot">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="clearfix"></div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="col-md-6">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="widget">&ndash;%&gt;--%>

        <%--&lt;%&ndash;<div class="widget-head">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="pull-left">未审核报告</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="widget-icons pull-right">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<a href="#" class="wclose"><i class="icon-remove"></i></a>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="clearfix"></div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

        <%--&lt;%&ndash;<div class="widget-content">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<table class="table table-striped table-bordered table-hover" id="table005"></table>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="widget-foot">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="clearfix"></div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="col-md-6">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="widget">&ndash;%&gt;--%>

        <%--&lt;%&ndash;<div class="widget-head">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="pull-left">未打印报告</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="widget-icons pull-right">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<a href="#" class="wminimize"><i class="icon-chevron-up"></i></a>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<a href="#" class="wclose"><i class="icon-remove"></i></a>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="clearfix"></div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>

        <%--&lt;%&ndash;<div class="widget-content">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<table class="table table-striped table-bordered table-hover" id="table006"></table>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="widget-foot">&ndash;%&gt;--%>
        <%--&lt;%&ndash;<div class="clearfix"></div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
        <%--</div>--%>


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

<!-- Scroll to top -->
<span class="totop"><a href="#"><i class="icon-chevron-up"></i></a></span>

</body>
</html>