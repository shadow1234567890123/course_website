<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>资料列表</title>
    <link rel="stylesheet" href="../plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="../plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/iCheck/square/blue.css">
    <link rel="stylesheet" href="../plugins/morris/morris.css">
    <link rel="stylesheet" href="../plugins/jvectormap/jquery-jvectormap-1.2.2.css">
    <link rel="stylesheet" href="../plugins/datepicker/datepicker3.css">
    <link rel="stylesheet" href="../plugins/daterangepicker/daterangepicker.css">
    <link rel="stylesheet" href="../plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
    <link rel="stylesheet" href="../plugins/datatables/dataTables.bootstrap.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.css">
    <link rel="stylesheet" href="../plugins/treeTable/jquery.treetable.theme.default.css">
    <link rel="stylesheet" href="../plugins/select2/select2.css">
    <link rel="stylesheet" href="../plugins/colorpicker/bootstrap-colorpicker.min.css">
    <link rel="stylesheet" href="../plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="../plugins/adminLTE/css/skins/_all-skins.min.css">
    <link rel="stylesheet" href="../css/style.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.css">
    <link rel="stylesheet" href="../plugins/ionslider/ion.rangeSlider.skinNice.css">
    <link rel="stylesheet" href="../plugins/bootstrap-slider/slider.css">
    <link rel="stylesheet" href="../plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>
<body>
<%--<a href="download?filename=${requestScope.material.upload.originalFilename}">--%>
<%--${requestScope.material.upload.originalFilename}--%>
<%--</a>--%>
<div class="box">
<div class="box-header">
    <h2 class="box-title">资料列表</h2>
</div>
<!-- /.box-header -->
<div class="box-body">
<table id="example2" class="table table-bordered table-hover">
<thead>
<tr>
    <th>文件</th>
    <th>上传人</th>
    <th>上传时间</th>
</tr>
</thead>
    <tbody>
        <c:forEach items="${materials}" var="material">
            <tr>
            <td><a href="/material/download?filename=${material.fileName}">${material.fileName}</a></td>
            <td>${material.uploaderName}</td>
                <td>${material.uploadTime}</td>
            </tr>
        </c:forEach>
    </tbody>
</table>
    </div>
    <!-- /.box-body -->
    </div>
    <!-- /.box -->
</body>
</html>
