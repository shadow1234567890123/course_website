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

<body>

<div>

	<!-- 内容头部 -->
	<section class="content-header">
		<h1>
			学生管理
			<small>学生列表</small>
		</h1>
	</section>
	<!-- 内容头部 /-->

	<!-- 正文区域 -->
	<section class="content">

		<!-- .box-body -->
		<div class="box box-primary">
			<div class="box-header with-border">
				<h3 class="box-title">列表</h3>
			</div>

			<div class="box-body">

				<!-- 数据表格 -->
				<div class="table-box">

					<!--工具栏-->
					<div class="pull-left">
						<div class="form-group form-inline">
							<div class="btn-group">
								<button type="button" class="btn btn-default" title="添加学生" data-toggle="modal" data-target="#addStudent"><i class="fa fa-file-o"></i>添加学生</button>
								<%--<button type="button" class="btn btn-default" title="删除"><i class="fa fa-trash-o"></i>删除</button>--%>
								<button type="button" class="btn btn-default" title="设置组长" data-toggle="modal" data-target="#setGroupLeader" onclick="findAllStudentByCourseId();"><i class="fa fa-ban"></i>设置组长</button>
							</div>
						</div>
					</div>
					<div id="addStudent" class="modal modal-primary" role="dialog">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close" id="close">
										<span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">添加学生</h4>
								</div>
								<div class="row data-type" style="width: 890px;margin-left: 5px;margin-top:10px;margin-bottom:10px;border: 1px solid #d2d0d0">
									<form id="addStudentForm" method="post" action="/user/addStudentForm" enctype="multipart/form-data">
										<div class="col-md-2 title">学号</div>
										<div class="col-md-4 data">
											<input id="addStudentForm_studentId" type="text" class="form-control" placeholder="学号" name="studentId">
										</div>
										<div class="col-md-2 title">姓名</div>
										<div class="col-md-4 data">
											<input id="addStudentForm_studentName" type="text" class="form-control" placeholder="姓名" name="name">
										</div>

										<div class="col-md-2 title">用户名</div>
										<div class="col-md-4 data">
											<input id="addStudentForm_username" type="text" class="form-control" placeholder="用户名" name="username">
										</div>

										<div class="col-md-2 title">专业年级</div>
										<div class="col-md-4 data">
											<input id="addStudentForm_professionalGrade" type="text" class="form-control" placeholder="专业年级" name="professionalGrade">
										</div>

										<div class="col-md-2 title">组号</div>
										<div class="col-md-4 data">
											<input id="addStudentForm_groupId" type="text" class="form-control" placeholder="组号" name="groupId">
										</div>

										<div class="col-md-2 title">是否为组长</div>
										<div class="col-md-4 data">
											<%--<input type="text" class="form-control" placeholder="角色" name="role">--%>
												<div class="form-group form-inline">
													<div class="radio"><label><input type="radio" name="optionsRadios" value="1"> 是</label></div>
													<div class="radio"><label><input type="radio" name="optionsRadios" value="2"> 否</label></div>
												</div>
										</div>
									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline" data-dismiss="modal">取消</button>
									<button id="Realease_GroupTaske" type="button" class="btn btn-outline" onclick="addStudent();">添加</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>

						<!-- /.modal-dialog -->
					</div>
					<div class="box-tools pull-right">
						<div class="has-feedback">
							<input type="text" class="form-control input-sm" placeholder="搜索">
							<span class="glyphicon glyphicon-search form-control-feedback"></span>
						</div>
					</div>
					<!--工具栏/-->

					<div id="setGroupLeader" class="modal modal-primary" role="dialog">
						<div class="modal-dialog modal-lg">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">&times;</span></button>
									<h4 class="modal-title">设置组长</h4>
								</div>
								<div class="row data-type">
									<form id="setGroupLeader_mul" method="post" enctype="multipart/form-data">
										<%--选择组长下拉框--%>
											<div class="row data-type" style="border: 1px solid #C4C4C4;margin-left: 30px; width: 870px;margin-top: 30px;margin-bottom: 30px">

												<div class="col-md-2 title">选择组长</div>
												<div class="col-md-10 data">
														<select class="form-control select2" multiple="multiple" data-placeholder="可多选" style="width: 100%;" id="studentList" name="teamLeaderList">

														</select>
												</div>
											</div>

									</form>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-outline" data-dismiss="modal">取消</button>
									<button id="realease_IndividualTask" type="button" class="btn btn-outline" onclick="setGroupLeader();">确认</button>
								</div>
							</div>
						</div>
					</div>


					<!--数据列表-->
					<table id="dataList" class="table table-bordered table-striped table-hover dataTable">
						<thead>
						<tr>
							<th class="" style="padding-right:0px;">
								<input id="selall" type="checkbox" class="icheckbox_square-blue">
							</th>
							<th class="sorting_asc">学号</th>
							<th class="sorting_desc">姓名</th>
							<th class="sorting_asc sorting_asc_disabled">用户名</th>
							<th class="sorting_desc sorting_desc_disabled">密码</th>
							<th class="sorting">专业年级</th>
							<th class="text-center sorting">角色</th>
							<th class="text-center">操作</th>
						</tr>
						</thead>
						<tbody>
						<c:forEach items="${pageInfo.list}" var="user" varStatus="status">
						<tr>
							<td><input name="ids" type="checkbox" onchange="check();" id="check"/></td>
							<td>${user.studentId}</td>
							<td>${user.name}</td>
							<td>${user.username}</td>
							<td>${user.password}</td>
							<td>${user.professionalGrade}</td>
							<td class="text-center">${user.role}</td>
							<td class="text-center">
								<button type="button" class="btn bg-olive btn-xs">详情</button>
								<button type="button" class="btn bg-olive btn-xs" onclick="delUser(this);">删除</button>
							</td>
						</tr>
						</c:forEach>
						</tbody>

					</table>
					<%--<!--数据列表/-->--%>
					<%--<div class="box-tools pull-right">--%>
						<%--<div class="has-feedback">--%>
							<%--<input type="text" class="form-control input-sm" placeholder="搜索">--%>
							<%--<span class="glyphicon glyphicon-search form-control-feedback"></span>--%>
						<%--</div>--%>
					<%--</div>--%>

				</div>
					<!-- 数据表格 /-->

			</div>
			<!-- /.box-body -->

			<!-- .box-footer-->
			<div class="box-footer">
				<div class="pull-left">
					<div class="form-group form-inline">
						总共2 页，共14 条数据。 每页
						<select class="form-control">
							<option>1</option>
							<option>2</option>
							<option>3</option>
							<option>4</option>
							<option>5</option>
						</select> 条
					</div>
				</div>

				<div class="box-tools pull-right">
					<ul class="pagination">
						<li>
							<a href="${pageContext.request.contextPath}/user/findAll?page=1&size=${pageInfo.pageSize}" aria-label="Previous">首页</a>
						</li>
						<li><a href="${pageContext.request.contextPath}/user/findAll?page=${pageInfo.pageNum-1}&size=${pageInfo.pageSize}">上一页</a></li>
						<c:forEach begin="1" end="${pageInfo.pages}" var="pageNum">
							<li><a href="${pageContext.request.contextPath}/user/findAll?page=${pageNum}&size=${pageInfo.pageSize}">${pageNum}</a></li>
						</c:forEach>
						<li><a href="${pageContext.request.contextPath}/user/findAll?page=${pageInfo.pageNum+1}&size=${pageInfo.pageSize}">下一页</a></li>
						<li>
							<a href="${pageContext.request.contextPath}/user/findAll?page=${pageInfo.pages}&size=${pageInfo.pageSize}" aria-label="Next">尾页</a>
						</li>
					</ul>
				</div>
			</div>
			<!-- /.box-footer-->
		</div>

	</section>
	<!-- 正文区域 /-->
	<!-- 内容头部 -->
	<section class="content-header">
		<h1>
			上传选课名单
			<%--<small>学生列表</small>--%>
		</h1>
	</section>
	<!-- 内容头部 /-->

	<!-- 正文区域 -->
	<section class="content">
		<div class="box box-primary">
			<div class="box-body">
				<form action="/user/fileUpload" method="post" enctype="multipart/form-data">
					<input type="file"name="upload" style="float: left;margin-top: 5px">
					<input type="submit" class="btn btn-primary" style="float: left;"/>
				</form>
			</div>
		</div>
	</section>

</div>
<!-- @@close -->
<!-- 内容区域 /-->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"/>
<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/raphael/raphael-min.js"></script>
<script src="../plugins/morris/morris.min.js"></script>
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../plugins/knob/jquery.knob.js"></script>
<script src="../plugins/daterangepicker/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script src="../plugins/treeTable/jquery.treetable.js"></script>
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../plugins/ckeditor/ckeditor.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/chartjs/Chart.min.js"></script>
<script src="../plugins/flot/jquery.flot.min.js"></script>
<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    $(document).ready(function() {

        // 激活导航位置
        setSidebarActive("admin-datalist");

        // 列表按钮
        $("#dataList td input[type='checkbox']").iCheck({
            checkboxClass: 'icheckbox_square-blue',
            increaseArea: '20%'
        });
        // 全选操作
        $("#selall").click(function() {
            var clicks = $(this).is(':checked');
            if (!clicks) {
                $("#dataList td input[type='checkbox']").iCheck("uncheck");
            } else {
                $("#dataList td input[type='checkbox']").iCheck("check");
            }
            $(this).data("clicks", !clicks);
        });

    });

    function addStudent() {
        // var form = document.getElementById("addStudentForm");
        // form.submit();

        if(!validate_addStudent_form()){
            return false;
        }

        $.ajax({
            type: "post",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/user/addStudentForm" ,//url
            data: $('#addStudentForm').serialize(),
            success: function (data) {
                //$("#close").click();
                location.href="/user/findAll?page=1&size=7";
                alert("添加成功");
            },
            error : function() {
                //$("#close").click();
                location.href="/user/findAll?page=1&size=7";
                alert("用户已存在");
            }
        });

    }

    function delUser(obj) {
        var tr = $(obj).parent().parent();//tr对象
        var tdcon = [];//本行所有数据
        tr.find('td').each(function(i,td){
            if($(td).find('a').length == 0){//过滤修改列
                tdcon.push($(td).html());
            }
        });
        $.ajax({
            type: "post",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/user/delUser" ,//url
            data: {studentId:tdcon[1]},
            success: function (data) {
				location.href="/user/findAll?page=1&size=7";
                alert("删除成功");
            },
            error : function() {
                alert("删除失败，请联系助教");
            }
        });
    }

    function findAllStudentByCourseId() {
        $.post(
            "/user/findAllStudentByCourseId",
            function (data) {
                var op="";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#studentList').html(op);

            },
            "json"
        )
    }

    function setGroupLeader() {
        $.ajax({
            type: "post",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/user/setGroupLeader" ,//url
            data: $('#setGroupLeader_mul').serialize(),
            success: function (data) {
                //location.href="/user/findAll?page=1&size=7";
                alert("设置成功");
            },
            error : function() {
                //location.href="/user/findAll?page=1&size=7";
                alert("请勿重复设置组长！");
            }
        });
        var form = document.getElementById("setGroupLeader_mul");
        form.submit();
    }

	function check() {
		console.log(this.document.getElementById("check").value);
    }
    
    function validate_addStudent_form() {
        var result=true;
        var studentId= $("#addStudentForm_studentId").val();//学号
        var regStudentId=/^\d{11}$/;
        if(!regStudentId.test(studentId)){
            show_validate_msg("#addStudentForm_studentId", "error", "只能为11位数字");
            //return false;
            result=false;
        }else{
            show_validate_msg("#addStudentForm_studentId", "success", "");
        }

        var studentName= $("#addStudentForm_studentName").val();//学生姓名
        var regStudentName=/^[\u4E00-\u9FA5\uf900-\ufa2d·s]{2,20}$/;;
        if(!regStudentName.test(studentName)){
            show_validate_msg("#addStudentForm_studentName", "error", "姓名格式不正确");
            //return false;
            result=false;
        }else{
            show_validate_msg("#addStudentForm_studentName", "success", "");
        }

        var username= $("#addStudentForm_username").val();//用户名
        var regUsername=/^\d{11}$/;
        if(!regUsername.test(username)){
            show_validate_msg("#addStudentForm_username", "error", "只能为11位数字");
            //return false;
            result=false;
        }else{
            show_validate_msg("#addStudentForm_username", "success", "");
        }

        var professionalGrade= $("#addStudentForm_professionalGrade").val();//专业年级
        var regProfessionalGrade=/^[0-9\u4e00-\u9fa5]+$/;
        if(!regProfessionalGrade.test(professionalGrade)){
            show_validate_msg("#addStudentForm_professionalGrade", "error", "只能为汉字数字组合");
            alert(professionalGrade);
            result=false;
        }else{
            show_validate_msg("#addStudentForm_professionalGrade", "success", "");
        }

        var groupId= $("#addStudentForm_groupId").val();//组号
        var regGroupId=/^[0-9]*$/;
        if(!regGroupId.test(groupId)){
            show_validate_msg("#addStudentForm_groupId", "error", "只能为数字");
            //return false;
            result=false;
            alert("学号："+groupId);
        }else{
            show_validate_msg("#addStudentForm_professionalGrade", "success", "");
        }
        return result;
    }

    function show_validate_msg(ele, status, msg) {
        //清除状态
        $(ele).parent().removeClass("has-success has-error");
        if("success"==status) {
            $(ele).parent().addClass("has-success");
            //$(ele).attr('placeholder',"");
        }else if("error"==status){
            $(ele).parent().addClass("has-error");
            $(ele).attr('placeholder',msg);
            $(ele).val("");
        }
    }


</script>
<script src="../plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="../plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="../plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="../plugins/raphael/raphael-min.js"></script>
<script src="../plugins/morris/morris.min.js"></script>
<script src="../plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="../plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="../plugins/knob/jquery.knob.js"></script>
<script src="../plugins/daterangepicker/moment.min.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.js"></script>
<script src="../plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="../plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="../plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="../plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="../plugins/fastclick/fastclick.js"></script>
<script src="../plugins/iCheck/icheck.min.js"></script>
<script src="../plugins/adminLTE/js/app.min.js"></script>
<script src="../plugins/treeTable/jquery.treetable.js"></script>
<script src="../plugins/select2/select2.full.min.js"></script>
<script src="../plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="../plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="../plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="../plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="../plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="../plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="../plugins/ckeditor/ckeditor.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="../plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="../plugins/chartjs/Chart.min.js"></script>
<script src="../plugins/flot/jquery.flot.min.js"></script>
<script src="../plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../plugins/flot/jquery.flot.categories.min.js"></script>
<script src="../plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="../plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="../plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
<script>
    $(document).ready(function() {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
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

        // 颜色选取器
        $(".my-colorpicker1").colorpicker();
        $(".my-colorpicker2").colorpicker();

    });




    $(document).ready(function() {
        // 选择框
        $(".select2").select2();
    });




    $(document).ready(function() {

        //Date picker
        $('#datepicker').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });

        // datetime picker
        $('#dateTimePicker').datetimepicker({
            format: "mm/dd/yyyy - hh:ii",
            autoclose: true,
            todayBtn: true,
            language: 'zh-CN'
        });

        //Date range picker
        $('#reservation').daterangepicker({
            locale: {
                applyLabel: '确认',
                cancelLabel: '取消',
                fromLabel: '起始时间',
                toLabel: '结束时间',
                customRangeLabel: '自定义',
                firstDay: 1
            },
            opens: 'left', // 日期选择框的弹出位置
            separator: ' 至 '
            //showWeekNumbers : true,     // 是否显示第几周
        });

        //Date range picker with time picker
        $('#reservationtime').daterangepicker({
            timePicker: true,
            timePickerIncrement: 30,
            format: 'MM/DD/YYYY h:mm A',
            locale: {
                applyLabel: '确认',
                cancelLabel: '取消',
                fromLabel: '起始时间',
                toLabel: '结束时间',
                customRangeLabel: '自定义',
                firstDay: 1
            },
            opens: 'right', // 日期选择框的弹出位置
            separator: ' 至 '
        });

        //Date range as a button
        $('#daterange-btn').daterangepicker({
                locale: {
                    applyLabel: '确认',
                    cancelLabel: '取消',
                    fromLabel: '起始时间',
                    toLabel: '结束时间',
                    customRangeLabel: '自定义',
                    firstDay: 1
                },
                opens: 'right', // 日期选择框的弹出位置
                separator: ' 至 ',
                ranges: {
                    '今日': [moment(), moment()],
                    '昨日': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
                    '最近7日': [moment().subtract(6, 'days'), moment()],
                    '最近30日': [moment().subtract(29, 'days'), moment()],
                    '本月': [moment().startOf('month'), moment().endOf('month')],
                    '上个月': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
                },
                startDate: moment().subtract(29, 'days'),
                endDate: moment()
            },
            function(start, end) {
                $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
            }
        );

    });




    $(document).ready(function() {

        /*table tree*/
        $("#collapse-table").treetable({
            expandable: true
        });

    });




    $(document).ready(function() {

        CKEDITOR.replace('editor1');

        // $(".textarea").wysihtml5({
        //     locale:'zh-CN'
        // });

        $("#markdown-textarea").markdown({
            language: 'zh',
            autofocus: false,
            savable: false
        });

    });



    $(document).ready(function() {

        // 激活导航位置
        setSidebarActive("admin-dataform");

    });
    

</script>


</body>

</html>