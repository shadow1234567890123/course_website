<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>AI课程网站</title>
<meta name="description" content="AdminLTE2定制版">
<meta name="keywords" content="AdminLTE2定制版">

<!-- Tell the browser to be responsive to screen width -->
<meta
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no"
	name="viewport">
<!-- Bootstrap 3.3.6 -->
<!-- Font Awesome -->
<!-- Ionicons -->
<!-- iCheck -->
<!-- Morris chart -->
<!-- jvectormap -->
<!-- Date Picker -->
<!-- Daterange picker -->
<!-- Bootstrap time Picker -->
<!--<link rel="stylesheet" href="${pageContext.request.contextPath}/${pageContext.request.contextPath}/${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.css">-->
<!-- bootstrap wysihtml5 - text editor -->
<!--数据表格-->
<!-- 表格树 -->
<!-- select2 -->
<!-- Bootstrap Color Picker -->
<!-- bootstrap wysihtml5 - text editor -->
<!--bootstrap-markdown-->
<!-- Theme style -->
<!-- AdminLTE Skins. Choose a skin from the css/skins
       folder instead of downloading all of them to reduce the load. -->
<!-- Ion Slider -->
<!-- ion slider Nice -->
<!-- bootstrap slider -->
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- jQuery 2.2.3 -->
<!-- jQuery UI 1.11.4 -->
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<!-- Bootstrap 3.3.6 -->
<!-- Morris.js charts -->
<!-- Sparkline -->
<!-- jvectormap -->
<!-- jQuery Knob Chart -->
<!-- daterangepicker -->
<!-- datepicker -->
<!-- Bootstrap WYSIHTML5 -->
<!-- Slimscroll -->
<!-- FastClick -->
<!-- iCheck -->
<!-- AdminLTE App -->
<!-- 表格树 -->
<!-- select2 -->
<!-- bootstrap color picker -->
<!-- bootstrap time picker -->
<!--<script src="${pageContext.request.contextPath}/${pageContext.request.contextPath}/${pageContext.request.contextPath}/plugins/timepicker/bootstrap-timepicker.min.js"></script>-->
<!-- Bootstrap WYSIHTML5 -->
<!--bootstrap-markdown-->
<!-- CK Editor -->
<!-- InputMask -->
<!-- DataTables -->
<!-- ChartJS 1.0.1 -->
<!-- FLOT CHARTS -->
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
<!-- jQuery Knob -->
<!-- Sparkline -->
<!-- Morris.js charts -->
<!-- Ion Slider -->
<!-- Bootstrap slider -->
<!-- 页面meta /-->

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<%--<jsp:include page="header.jsp"></jsp:include>--%>
		<!-- 页面头部 -->
		<header class="main-header">
			<!-- Logo -->
			<a href="all-admin-index.html" class="logo"> <!-- mini logo for sidebar mini 50x50 pixels -->
				<span class="logo-mini"><b>AI</b></span> <!-- logo for regular state and mobile devices -->
				<span class="logo-lg"><b>AI</b>课程网站</span>
			</a>
			<!-- Header Navbar: style can be found in header.less -->
			<nav class="navbar navbar-static-top">
				<!-- Sidebar toggle button-->
				<a href="#" class="sidebar-toggle" data-toggle="offcanvas"
				   role="button"> <span class="sr-only">Toggle navigation</span>
				</a>

				<div class="navbar-custom-menu">
					<ul class="nav navbar-nav">

						<li class="dropdown user user-menu"><a href="#"
															   class="dropdown-toggle" data-toggle="dropdown"> <img
								src="${pageContext.request.contextPath}/img/user2-160x160.jpg"
								class="user-image" alt="User Image"> <span class="hidden-xs">
							${user.name}
					</span>

						</a>
							<ul class="dropdown-menu">
								<!-- User image -->
								<li class="user-header"><img
										src="${pageContext.request.contextPath}/img/user2-160x160.jpg"
										class="img-circle" alt="User Image"></li>

								<!-- Menu Footer-->
								<li class="user-footer">
									<div class="pull-left">
										<a href="${pageContext.request.contextPath}/pages/changePassword.jsp" class="btn btn-default btn-flat">修改密码</a>
									</div>
									<div class="pull-right">
										<a href="${pageContext.request.contextPath}/pages/login.jsp"
										   class="btn btn-default btn-flat">注销</a>
									</div>
								</li>
							</ul></li>
					</ul>
				</div>
			</nav>
		</header>
		<!-- 页面头部 /-->

		<!-- 导航侧栏 -->
		<%--<jsp:include page="aside.jsp"></jsp:include>--%>
		<aside class="main-sidebar">
			<!-- sidebar: style can be found in sidebar.less -->
			<section class="sidebar">
				<!-- Sidebar user panel -->
				<div class="user-panel">
					<div class="pull-left image">
						<img src="${pageContext.request.contextPath}/img/user2-160x160.jpg"
							 class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${user.name}</p>
						<a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
					</div>
				</div>

				<!-- sidebar menu: : style can be found in sidebar.less -->
				<ul class="sidebar-menu">
					<%--<li class="header">菜单</li>--%>
					<%--<li id="admin-index">--%>
						<%--<a href="${pageContext.request.contextPath}/pages/main.jsp">--%>
							<%--<i class="fa fa-dashboard"></i>--%>
							<%--<span>首页</span>--%>
						<%--</a>--%>
					<%--</li>	<!--首页-->--%>


					<li class="treeview">
						<a href="#">
							<i class="fa fa-cogs"></i>
							<span>管理模块</span>
							<span class="pull-right-container">
						<i class="fa fa-angle-left pull-right"></i>
					</span>
						</a>


						<ul class="treeview-menu">

							<li id="group-management">
								<a href="#">
									<i class="fa fa-circle-o"></i> 分组管理
								</a>
							</li>

						</ul>


					</li>   <!--管理模块-->

					<li class="treeview">
						<a href="#">
							<i class="fa fa-cube"></i>
							<span>项目模块</span>
							<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>
						<ul class="treeview-menu">
							<li id="current-stage" class="">
								<a href="#">
									<i class="fa fa-circle-o"></i> 当前关卡
								</a>
							</li>

						</ul>
					</li>   <!--项目模块-->


					<li class="treeview">
						<a href="#">
							<i class="glyphicon glyphicon-book"></i>
							<span>资料模块</span>
							<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span>
						</a>


						<ul class="treeview-menu">
							<li id="material-list">
								<a href="#">
									<i class="fa fa-circle-o"></i> 资料列表
								</a>
							</li>
							<li id="upload-material">
								<a href="#">
									<i class="fa fa-circle-o"></i> 上传资料
								</a>
							</li>
						</ul>

					</li>   <!--资料模块-->

						<li class="treeview">
							<a href="#">
								<i class="fa fa-desktop"></i>
								<span>对战平台</span>
								<span class="pull-right-container">
								<i class="fa fa-angle-left pull-right"></i>
							</span>
							</a>


							<ul class="treeview-menu">
								<li id="match">
									<a href="#">
										<i class="fa fa-circle-o"></i> 棋手对战
									</a>
								</li>
								<li id="rank">
									<a href="#">
										<i class="fa fa-circle-o"></i> 战绩排名
									</a>
								</li>
							</ul>

						</li>   <!--对战平台-->

				</ul>
			</section>

			<!-- /.sidebar -->
		</aside>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">
			<iframe id="student" width="100%" height="799px" src="${pageContext.request.contextPath}/project/findCurrentProjectAndStage">
			<%--<img src="${pageContext.request.contextPath}/img/center.jpg"--%>
				<%--width="100%" height="100%" />--%>
			</iframe>
			<%--<form action="/user/fileUpload" method="post" enctype="multipart/form-data">--%>
				<%--选择文件：<input type="file" name="upload"/>--%>
				<%--<input type="submit" value="上传">
			</form>--%>
		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.0.0
		</div>
		<strong>Copyright &copy; 2014-2017 <a
			href="http://www.ouc.edu.cn/">智能信息处理实验室</a>.
		</strong> All rights reserved. </footer>
		<!-- 底部导航 /-->

	</div>

	<script
		src="${pageContext.request.contextPath}/plugins/jQuery/jquery-3.2.1.js"></script>

	<script type="text/javascript">
		$().ready(function(){
			$("#student-management").click(
			    function () {
					$("#student").attr({src:"${pageContext.request.contextPath}/user/findAll?page=1&size=7"});
                }
			);
            $("#class-management").click(
                function () {
                    $("#student").attr({src:"${pageContext.request.contextPath}/pages/class-management.jsp"});
                }
            );
            $("#login").click(
                function () {
                    $("#student").attr({src:"${pageContext.request.contextPath}/pages/login.jsp"});
                }
            );
            $("#current-stage").click(
                function () {
                    $("#student").attr({src:"${pageContext.request.contextPath}/project/findCurrentProjectAndStage"});
                }
            );
            $("#auto-scoring").click(
                function () {
                    $("#student").attr({src:"${pageContext.request.contextPath}/pages/auto-scoring.jsp"});
                }
            );
            $("#manual-input").click(
                function () {
                    $("#student").attr({src:"${pageContext.request.contextPath}/course/findAllCourse"});
                }
            );
            $("#material-list").click(
                function () {
                    $("#student").attr({src:"/material/findAllMaterial"});
                }
            );
            $("#upload-material").click(
                function () {
                    $("#student").attr({src:"${pageContext.request.contextPath}/pages/upload-material.jsp"});
                }
            );
            $("#verify-material").click(
                function () {
                    $("#student").attr({src:"${pageContext.request.contextPath}/pages/verify-material.jsp"});
                }
            );
            $("#group-management").click(
                function () {
                    $("#student").attr({src:"${pageContext.request.contextPath}/user/findAllStudentWithoutGroupByCourseId"});
                }
            );
            $("#invoice").click(
                function () {
                    $("#student").attr({src:"${pageContext.request.contextPath}/pages/invoice.jsp"});
                }
            );
            $("#rank").click(
                function () {
                    $("#student").attr({src:"${pageContext.request.contextPath}/pages/rank.jsp"});
                }
            );
            $("#match").click(
                function () {
                    $("#student").attr({src:"${pageContext.request.contextPath}/challenge/match"});
                }
            );

		});
	</script>



	<script
		src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script>
		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}

		$(document).ready(function() {
			// 激活导航位置
			setSidebarActive("admin-index");
		});
	</script>
</body>

</html>