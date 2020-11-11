<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
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

<style>
    .secondCol{
        width: 150px;
    }
</style>

<body style="background-color:#ecf0f5">

<div class="content-wrapper" style="margin-left: 0px;background-color: white">

            <table id="invoice" class="table table-bordered table-striped table-hover dataTable" style="width: 1000px; margin-left: 50px;margin-top: 90px">
                <%--<table border="1px solid black">--%>
                <%--<tbody>--%>
                <tr>
                    <td style="width: 200px">申请人：</td>
                    <td style="width: 100px" class="secondCol">工号及电话</td>
                    <td colspan="2"><input type="text"></td>
                </tr>
                <tr>
                    <td rowspan="4" style="text-align: center;vertical-align: middle">付款单位信息</td>
                    <td class="secondCol">名称</td>
                    <td colspan="2"><input type="text"></td>
                </tr>
                <tr>
                    <td class="secondCol">纳税人识别号</td>
                    <td colspan="2"><input type="text"></td>
                </tr>
                <tr>
                    <td class="secondCol">地址、电话</td>
                    <td colspan="2"><input type="text"></td>
                </tr>
                <tr>
                    <td class="secondCol">开户行及账号</td>
                    <td colspan="2"><input type="text"></td>
                </tr>

                <tr><%--6--%>
                    <td rowspan="4" style="text-align: center;vertical-align: middle">经费性质</td>
                    <td class="secondCol">纵向</td>
                    <%--<td colspan="2"><div class="radio"><label><input type="radio" name="optionsRadios" value="1">中央资金往来票据</label></div></td>--%>
                    <td colspan="2"><label style="font-weight: normal"><input type="radio" name="optionsRadios" value="1">中央资金往来票据</label></td>
                </tr>

                <tr><%--7--%>
                    <td class="secondCol">横向</td>
                    <td>税务发票</td>
                    <td>
                        <%--<div class="radio" style="float: left"><label><input type="radio" name="optionsRadios" value="2">增值税专用发票</label></div>--%>
                        <%--<div class="radio" style="float: left"><label><input type="radio" name="optionsRadios" value="3">增值税普通发票</label></div>--%>
                        <label style="font-weight: normal"><input type="radio" name="optionsRadios" value="2">增值税专用发票</label>
                        <label style="font-weight: normal"><input type="radio" name="optionsRadios" value="3">增值税普通发票</label>
                    </td>
                </tr>

                <tr><%--8--%>
                    <td rowspan="2" class="secondCol">其它</td>
                    <td colspan="2">
                        <%--<div class="radio"><label><input type="radio" name="optionsRadios" value="4">中央资金往来票据</label></div>--%>
                        <label style="font-weight: normal"><input type="radio" name="optionsRadios" value="4">中央资金往来票据</label>
                    </td>
                </tr>

                <tr><%--9--%>
                    <td>税务发票</td>
                    <td>
                        <%--<div class="radio" style="float: left"><label><input type="radio" name="optionsRadios" value="5">增值税专用发票</label></div>--%>
                        <%--<div class="radio" style="float: left"><label><input type="radio" name="optionsRadios" value="6">增值税普通发票</label></div>--%>
                        <label style="font-weight: normal"><input type="radio" name="optionsRadios" value="5">增值税专用发票</label>
                        <label style="font-weight: normal"><input type="radio" name="optionsRadios" value="6">增值税普通发票</label>
                    </td>
                </tr>

                <tr><%--10--%>
                    <td style="text-align: center;vertical-align: middle">合同</td>
                    <td class="secondCol"><a href="https://www.baidu.com">超链接</a></td>
                    <td colspan="2">合同金额：<input type="text"> 万元</td>
                </tr>

                <tr><%--11--%>
                    <td style="text-align: center;vertical-align: middle">是否已认定免费</td>
                    <td class="secondCol"><div class="checkbox"><label><input type="checkbox" value="1">是</label></div></td>
                    <td colspan="2">若否：扣除账本号 <input type="text"></td>
                </tr>

                <tr><%--12--%>
                    <td style="text-align: center;vertical-align: middle">本次开票金额</td>
                    <td class="secondCol"><input type="text" style="width: 80px"> 万元</td>
                    <td colspan="2">开票内容：
                        <select class="form-control select2" style="width: 180px;">
                            <option selected="selected">技术开发费</option>
                            <option>Alaska</option>
                        </select>
                    </td>
                </tr>

                <tr><%--13--%>
                    <td style="text-align: center;vertical-align: middle">承诺到款时间</td>
                    <td colspan="3">
                        <div class="col-md-4 data">
                            <div class="input-group date">
                                <div class="input-group-addon">
                                    <i class="fa fa-calendar"></i>
                                </div>
                                <input type="text" class="form-control pull-right" id="datepicker1">
                            </div>
                        </div>
                    </td>
                </tr>

                <tr><%--14--%>
                    <td style="text-align: center;vertical-align: middle">申请人承诺</td>
                    <td colspan="3">
                            本人保证该款项在承诺时间内入到学校账户。若因特殊原因款项当年不能到账，本人
                        负责收回预借的收据(发票)原件退还财务部门。若在规定时间内既无法使款项到账，
                        也未将收据(发票)原件收回，同意财务部门冻结本人全部项目经费，并逐月本人工资、
                        津贴中扣除 <input type="text" style="width: 80px"> 元，以抵交预借收据(发票)金额，知道款项到位或
                        追回预借的收据(发票)为止。
                    </td>
                </tr>



    </table>

</div>

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
        $('#datepicker1').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });
        //Date picker
        $('#datepicker2').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });
        //Date picker
        $('#datepicker1_project').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });
        //Date picker
        $('#datepicker2_project').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });

        //Date picker
        $('#datepicker1_IndividualTask').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });
        //Date picker
        $('#datepicker2_IndividualTask').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });

        //Date picker
        $('#datepicker1_groupTask').datepicker({
            autoclose: true,
            language: 'zh-CN'
        });
        //Date picker
        $('#datepicker2_groupTask').datepicker({
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
