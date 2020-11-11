<%--
  Created by IntelliJ IDEA.
  User: 朱琳
  Date: 2019-11-26
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Rank</title>
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
          href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>
<body >
<div class="box-header">
    <h2 class="box-title"><b>战绩排名</b></h2>
</div>
<!-- /.box-header -->
<div class="box-body">
    <table id="example1" class="table table-bordered table-striped">
        <thead>
        <tr>
            <th>序号</th>
            <th>组号</th>
            <th>组名</th>
            <th>成绩</th>
            <th>棋类</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Trident</td>
            <td>Internet Explorer 4.0
            </td>
            <td>Win 95+</td>
            <td> 4</td>
            <td>X</td>
        </tr>
        <tr>
            <td>Trident</td>
            <td>Internet Explorer 5.0
            </td>
            <td>Win 95+</td>
            <td>5</td>
            <td>C</td>
        </tr>
        <tr>
            <td>Trident</td>
            <td>Internet Explorer 5.5
            </td>
            <td>Win 95+</td>
            <td>5.5</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Trident</td>
            <td>Internet Explorer 6
            </td>
            <td>Win 98+</td>
            <td>6</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Trident</td>
            <td>Internet Explorer 7</td>
            <td>Win XP SP2+</td>
            <td>7</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Trident</td>
            <td>AOL browser (AOL desktop)</td>
            <td>Win XP</td>
            <td>6</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Firefox 1.0</td>
            <td>Win 98+ / OSX.2+</td>
            <td>1.7</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Firefox 1.5</td>
            <td>Win 98+ / OSX.2+</td>
            <td>1.8</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Firefox 2.0</td>
            <td>Win 98+ / OSX.2+</td>
            <td>1.8</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Firefox 3.0</td>
            <td>Win 2k+ / OSX.3+</td>
            <td>1.9</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Camino 1.0</td>
            <td>OSX.2+</td>
            <td>1.8</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Camino 1.5</td>
            <td>OSX.3+</td>
            <td>1.8</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Netscape 7.2</td>
            <td>Win 95+ / Mac OS 8.6-9.2</td>
            <td>1.7</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Netscape Browser 8</td>
            <td>Win 98SE+</td>
            <td>1.7</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Netscape Navigator 9</td>
            <td>Win 98+ / OSX.2+</td>
            <td>1.8</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Mozilla 1.0</td>
            <td>Win 95+ / OSX.1+</td>
            <td>1</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Mozilla 1.1</td>
            <td>Win 95+ / OSX.1+</td>
            <td>1.1</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Mozilla 1.2</td>
            <td>Win 95+ / OSX.1+</td>
            <td>1.2</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Mozilla 1.3</td>
            <td>Win 95+ / OSX.1+</td>
            <td>1.3</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Mozilla 1.4</td>
            <td>Win 95+ / OSX.1+</td>
            <td>1.4</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Mozilla 1.5</td>
            <td>Win 95+ / OSX.1+</td>
            <td>1.5</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Mozilla 1.6</td>
            <td>Win 95+ / OSX.1+</td>
            <td>1.6</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Mozilla 1.7</td>
            <td>Win 98+ / OSX.1+</td>
            <td>1.7</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Mozilla 1.8</td>
            <td>Win 98+ / OSX.1+</td>
            <td>1.8</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Seamonkey 1.1</td>
            <td>Win 98+ / OSX.2+</td>
            <td>1.8</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Gecko</td>
            <td>Epiphany 2.20</td>
            <td>Gnome</td>
            <td>1.8</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Webkit</td>
            <td>Safari 1.2</td>
            <td>OSX.3</td>
            <td>125.5</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Webkit</td>
            <td>Safari 1.3</td>
            <td>OSX.3</td>
            <td>312.8</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Webkit</td>
            <td>Safari 2.0</td>
            <td>OSX.4+</td>
            <td>419.3</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Webkit</td>
            <td>Safari 3.0</td>
            <td>OSX.4+</td>
            <td>522.1</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Webkit</td>
            <td>OmniWeb 5.5</td>
            <td>OSX.4+</td>
            <td>420</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Webkit</td>
            <td>iPod Touch / iPhone</td>
            <td>iPod</td>
            <td>420.1</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Webkit</td>
            <td>S60</td>
            <td>S60</td>
            <td>413</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Presto</td>
            <td>Opera 7.0</td>
            <td>Win 95+ / OSX.1+</td>
            <td>-</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Presto</td>
            <td>Opera 7.5</td>
            <td>Win 95+ / OSX.2+</td>
            <td>-</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Presto</td>
            <td>Opera 8.0</td>
            <td>Win 95+ / OSX.2+</td>
            <td>-</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Presto</td>
            <td>Opera 8.5</td>
            <td>Win 95+ / OSX.2+</td>
            <td>-</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Presto</td>
            <td>Opera 9.0</td>
            <td>Win 95+ / OSX.3+</td>
            <td>-</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Presto</td>
            <td>Opera 9.2</td>
            <td>Win 88+ / OSX.3+</td>
            <td>-</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Presto</td>
            <td>Opera 9.5</td>
            <td>Win 88+ / OSX.3+</td>
            <td>-</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Presto</td>
            <td>Opera for Wii</td>
            <td>Wii</td>
            <td>-</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Presto</td>
            <td>Nokia N800</td>
            <td>N800</td>
            <td>-</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Presto</td>
            <td>Nintendo DS browser</td>
            <td>Nintendo DS</td>
            <td>8.5</td>
            <td>C/A<sup>1</sup></td>
        </tr>
        <tr>
            <td>KHTML</td>
            <td>Konqureror 3.1</td>
            <td>KDE 3.1</td>
            <td>3.1</td>
            <td>C</td>
        </tr>
        <tr>
            <td>KHTML</td>
            <td>Konqureror 3.3</td>
            <td>KDE 3.3</td>
            <td>3.3</td>
            <td>A</td>
        </tr>
        <tr>
            <td>KHTML</td>
            <td>Konqureror 3.5</td>
            <td>KDE 3.5</td>
            <td>3.5</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Tasman</td>
            <td>Internet Explorer 4.5</td>
            <td>Mac OS 8-9</td>
            <td>-</td>
            <td>X</td>
        </tr>
        <tr>
            <td>Tasman</td>
            <td>Internet Explorer 5.1</td>
            <td>Mac OS 7.6-9</td>
            <td>1</td>
            <td>C</td>
        </tr>
        <tr>
            <td>Tasman</td>
            <td>Internet Explorer 5.2</td>
            <td>Mac OS 8-X</td>
            <td>1</td>
            <td>C</td>
        </tr>
        <tr>
            <td>Misc</td>
            <td>NetFront 3.1</td>
            <td>Embedded devices</td>
            <td>-</td>
            <td>C</td>
        </tr>
        <tr>
            <td>Misc</td>
            <td>NetFront 3.4</td>
            <td>Embedded devices</td>
            <td>-</td>
            <td>A</td>
        </tr>
        <tr>
            <td>Misc</td>
            <td>Dillo 0.8</td>
            <td>Embedded devices</td>
            <td>-</td>
            <td>X</td>
        </tr>
        <tr>
            <td>Misc</td>
            <td>Links</td>
            <td>Text only</td>
            <td>-</td>
            <td>X</td>
        </tr>
        <tr>
            <td>Misc</td>
            <td>Lynx</td>
            <td>Text only</td>
            <td>-</td>
            <td>X</td>
        </tr>
        <tr>
            <td>Misc</td>
            <td>IE Mobile</td>
            <td>Windows Mobile 6</td>
            <td>-</td>
            <td>C</td>
        </tr>
        <tr>
            <td>Misc</td>
            <td>PSP browser</td>
            <td>PSP</td>
            <td>-</td>
            <td>C</td>
        </tr>
        <tr>
            <td>Other browsers</td>
            <td>All others</td>
            <td>-</td>
            <td>-</td>
            <td>U</td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <th>序号</th>
            <th>组号</th>
            <th>组名</th>
            <th>成绩</th>
            <th>棋类</th>
        </tr>
        </tfoot>
    </table>
</div>
</div>
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
<script>
    $.widget.bridge('uibutton', $.ui.button);
</script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/locales/bootstrap-datetimepicker.zh-CN.js"></script>
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


    $(function() {
        $("#example1").DataTable();
        $('#example2').DataTable({
            "paging": true,
            "lengthChange": false,
            "searching": false,
            "ordering": true,
            "info": true,
            "autoWidth": false
        });
    });


    // 激活导航位置
    setSidebarActive("tables-data");
</script>
</body>
</html>
