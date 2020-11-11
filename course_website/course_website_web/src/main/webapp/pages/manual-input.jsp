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
<body style="background-color:#ecf0f5">

<div class="content-wrapper" style="margin-left: 0px">
    <!-- 内容头部 -->
    <section class="content-header">
        <h1>
            手动录入
        </h1>
    </section>
    <!-- 内容头部 /-->

    <!-- 正文区域 -->
    <section class="content">

        <div class="box-body">

            <!--tab页-->
            <div class="nav-tabs-custom">

                <!--tab头-->
                <ul class="nav nav-tabs">
                    <li class="active">
                        <a href="#tab-label" data-toggle="tab" onclick="findCourse1();">研发报告评分</a>
                    </li>
                    <li>
                        <a href="#tab-common" data-toggle="tab" onclick="findCourse2();">录入平时成绩</a>
                    </li>
                    <li>
                        <a href="#tab-codeQuality" data-toggle="tab" onclick="findCourse3();">代码质量评分</a>
                    </li>
                </ul>
                <!--tab头/-->

                <!--tab内容-->
                <div class="tab-content">

                    <!--label显示的内容-->
                    <div class="tab-pane active" id="tab-label">
                        <form id="reportScore">
                            <div style="overflow: hidden;padding-left: 7px">
                                <!-- /.form-group -->
                                <div class="form-group" style="float: left;">
                                    <label>请选择课程:</label>
                                    <select class="form-control select2" style="width: 100%;" onchange="window.selectProject1();" id="selectCourse1" name="course">
                                        <option selected="selected" disabled>请选择课程</option>
                                        <c:forEach items="${courses}" var="course">
                                            <option>${course}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <!-- /.form-group -->

                                <!-- /.form-group -->
                                <div class="form-group" style="float: left; margin-left: 20px;">
                                    <label>请选择项目:</label>
                                    <select class="form-control select2" style="width: 100%;" onchange="showData1();" id="selectProject1" name="project">
                                        <option selected="selected" disabled>请选择项目</option>
                                    </select>
                                </div>
                                <!-- /.form-group -->
                            </div>
                            <!--数据列表-->
                            <table id="dataList1" class="table table-bordered table-striped table-hover dataTable">
                                <thead></thead>
                                <tbody></tbody>
                            </table>
                        </form>
                    </div>

                    <!--基础控件-->
                    <div class="tab-pane" id="tab-common" href="">
                        <form id="regularScoreForm">
                            <div style="overflow: hidden;padding-left: 7px">
                                <!-- /.form-group -->
                                <div class="form-group" style="float: left;">
                                    <label>请选择课程:</label>
                                    <select class="form-control select2" style="width: 100%;" onchange="query()" id="selectCourse2" name="course">

                                    </select>
                                </div>
                                <!-- /.form-group -->
                            </div>
                            <!--数据列表-->
                            <table id="dataList2" class="table table-bordered table-striped table-hover dataTable">
                                <thead></thead>
                                <tbody></tbody>

                            </table>
                        </form>
                    </div>
                    <!--基础控件/-->

                    <!--label显示的内容-->
                    <div class="tab-pane" id="tab-codeQuality">
                        <form id="codeQuality">
                            <div style="overflow: hidden;padding-left: 7px">
                                <!-- /.form-group -->
                                <div class="form-group" style="float: left;">
                                    <label>请选择课程:</label>
                                    <select class="form-control select2" style="width: 100%;" onchange="window.selectProject3();" id="selectCourse3" name="course">

                                    </select>
                                </div>
                                <!-- /.form-group -->

                                <!-- /.form-group -->
                                <div class="form-group" style="float: left; margin-left: 20px;">
                                    <label>请选择项目:</label>
                                    <select class="form-control select2" style="width: 100%;" onchange="window.selectPhase3();" id="selectProject3" name="project">
                                        <option selected="selected" disabled>请选择项目</option>
                                    </select>
                                </div>
                                <!-- /.form-group -->

                                <!-- /.form-group -->
                                <div class="form-group" style="float: left; margin-left: 20px;">
                                    <label>请选择关卡:</label>
                                    <select class="form-control select2" style="width: 100%;" onchange="window.showData3();" id="selectPhase3" name="phase">
                                        <option selected="selected" disabled>请选择关卡</option>
                                    </select>
                                </div>
                                <!-- /.form-group -->
                            </div>
                            <!--数据列表-->
                            <table id="dataList3" class="table table-bordered table-striped table-hover dataTable">
                                <thead></thead>
                                <tbody></tbody>
                            </table>
                        </form>
                    </div>

                </div>
                <!--tab内容/-->

            </div>

        </div>
    </section>

    <!-- 正文区域 /-->
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

    function validate_reportScore_form(){
        var result=true;

        var reg=new RegExp("^(\\d|[1-9]\\d|100)$");
        var td= $("#dataList1 input");
        for(var i =0;i<td.length;i++){
            if(!reg.test($(td[i]).val())){
                show_validate_msg(td[i], "error", "只能为1~100的整数");
                result=false;
            }else{
                result=true;
                show_validate_msg(td[i], "success", "");
            }
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

    function findCourse1() {
        $.post(
            "/course/findAllCourseAndAllProject",
            function (data) {
                var op="<option selected=\"selected\" disabled>请选择课程</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#selectCourse1').html(op);

            },
            "json"
        )
    }

    function findCourse2() {
        $.post(
            "/course/findAllCourseAndAllProject",
            function (data) {
                var op="<option selected=\"selected\" disabled>请选择课程</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#selectCourse2').html(op);

            },
            "json"
        )
    }

    function findCourse3() {
        $.post(
            "/course/findAllCourseAndAllProject",
            function (data) {
                var op="<option selected=\"selected\" disabled>请选择课程</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#selectCourse3').html(op);

            },
            "json"
        )
    }

    function selectProject1() {
        var option=$("#selectCourse1 option:selected").text();
        $.post(
            "/course/findProjectNameByCourseId",
            {courseNameAndYear:option},
            function (data) {
                var op="<option selected=\"selected\" disabled>请选择项目</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#selectProject1').html(op);

            },
            "json"
        )
    }

    function selectProject3() {
        var option=$("#selectCourse3 option:selected").text();
        $.post(
            "/course/findProjectNameByCourseId",
            {courseNameAndYear:option},
            function (data) {
                var op="<option selected=\"selected\" disabled>请选择项目</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#selectProject3').html(op);

            },
            "json"
        )
    }

    function selectPhase3() {
        var option1=$("#selectCourse3 option:selected").text();
        var option2=$("#selectProject3 option:selected").text();
        $.post(
            "/course/findPhaseNameByCourseIdAndProjectId",
            {courseNameAndYear:option1,projectName:option2},
            function (data) {
                var op="<option selected=\"selected\" disabled>请选择阶段</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#selectPhase3').html(op);
            },
            "json"
        )
    }
    
    function showData1() {


        var option1=$("#selectCourse1 option:selected").text();
        // var option2=$("#selectProject1 option:selected").text();
        $.post(
            "/course/showData1",
            {courseNameAndYear:option1},
            // projectName:option2},
            function (data) {
                var thead="<tr>\n" +
                    "<th class=\"sorting_asc_disabled\">组号</th>\n" +
                    "<th class=\"sorting_asc_disabled\">组名</th>\n" +
                    "<th class=\"sorting_asc_disabled\">得分</th>\n" +
                    "</tr>";
                var tbody="";
                if(data!=null&&data.length>0){
                    for(var i=0;i<data.length;i++){
                        tbody=tbody+"<tr>";
                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].groupId;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].groupName;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+"<input type='text' name='score'>";
                        tbody=tbody+"</td>";

                        tbody=tbody+"</tr>";
                    }
                    tbody=tbody+"<tr>";
                    tbody=tbody+"<td colspan=\"3\">";
                    tbody=tbody+"<div class=\"col-md-10 data text-center\" style=\"width: 100%\">\n" +
                        "<button type=\"button\" class=\"btn bg-maroon\" style=\"margin-left: 0px\" onclick=\"submit1();\">提交</button>\n" +
                        // "<button type=\"button\" class=\"btn bg-default\" onclick=\"history.back(-1);\"  style=\"margin-right:175px;\">取消</button>\n" +
                        "</div>";
                    tbody=tbody+"</td>";
                    tbody=tbody+"</tr>";
                    $('#dataList1').find('thead').html(thead);
                    $('#dataList1').find('tbody').html(tbody);
                }else{
                    $('#dataList1').find('tbody').html("<tr><td>没有查询到数据</td></tr>");
                }
            },
            "json"
        )
    }

    function submit1() {

        if(!validate_reportScore_form()){
            return false;
        }

        $.ajax({
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/course/reportScore" ,//url
            data:$('#reportScore').serialize(),
            success: function (data) {
                alert("提交成功");
            },
            error : function() {
                alert("提交失败，请联系助教");
            }
        });
    }

    function validate_regularScore_form(){
        var result=true;

        var reg=/^([0-9]|10)$/;
        var td= $("#dataList2 input");
        for(var i =0;i<td.length;i++){
            if(!reg.test($(td[i]).val())){
                show_validate_msg(td[i], "error", "只能为1~10的整数");
                result=false;
            }else{
                result=true;
                show_validate_msg(td[i], "success", "");
            }
        }
        return result;
    }

    function submit2() {

        if(!validate_regularScore_form()){
           return false;
        }

        $.ajax({
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/course/regularScore" ,//url
            data:$('#regularScoreForm').serialize(),
            success: function (data) {
                alert("提交成功");
            },
            error : function() {
                alert("提交失败，请联系助教");
            }
        });
    }


    function showData3() {
        var option1=$("#selectCourse3 option:selected").text();
        // var option2=$("#selectProject1 option:selected").text();
        $.post(
            "/course/showData1",
            {courseNameAndYear:option1},
            // projectName:option2},
            function (data) {
                var thead="<tr>\n" +
                    "<th class=\"sorting_asc_disabled\">组号</th>\n" +
                    "<th class=\"sorting_asc_disabled\">组名</th>\n" +
                    "<th class=\"sorting_asc_disabled\">得分</th>\n" +
                    "</tr>";
                var tbody="";
                if(data!=null&&data.length>0){
                    for(var i=0;i<data.length;i++){
                        tbody=tbody+"<tr>";
                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].groupId;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].groupName;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+"<input type='text' name='score'>";
                        tbody=tbody+"</td>";

                        tbody=tbody+"</tr>";
                    }
                    tbody=tbody+"<tr>";
                    tbody=tbody+"<td colspan=\"3\">";
                    tbody=tbody+"<div class=\"col-md-10 data text-center\" style=\"width: 100%\">\n" +
                        "<button type=\"button\" class=\"btn bg-maroon\" style=\"margin-left: 0px\" onclick=\"submit3();\">提交</button>\n" +
                        //"<button type=\"button\" class=\"btn bg-default\" onclick=\"history.back(-1);\"  style=\"margin-right:175px;\">取消</button>\n" +
                        "</div>";
                    tbody=tbody+"</td>";
                    tbody=tbody+"</tr>";
                    $('#dataList3').find('thead').html(thead);
                    $('#dataList3').find('tbody').html(tbody);
                }else{
                    $('#dataList3').find('tbody').html("<tr><td>没有查询到数据</td></tr>");
                }
            },
            "json"
        )
    }

    function validate_codeQualityScore_form(){
        var result=true;

        var reg=new RegExp("^(\\d|[1-9]\\d|100)$");
        var td= $("#dataList3 input");
        for(var i =0;i<td.length;i++){
            if(!reg.test($(td[i]).val())){
                show_validate_msg(td[i], "error", "只能为1~100的整数");
                result=false;
            }else{
                result=true;
                show_validate_msg(td[i], "success", "");
            }
        }
        return result;
    }

    function submit3() {

        if(!validate_codeQualityScore_form()){
            return false;
        }

        $.ajax({
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/course/codeQualityScore" ,//url
            data:$('#codeQuality').serialize(),
            success: function (data) {
                alert("提交成功");
            },
            error : function() {
                alert("提交失败，请联系助教");
            }
        });
    }


    function query(){
        var option=$("#selectCourse2 option:selected").text();
        $.post(
            "/user/findAllStudent",
            {courseNameAndYear:option},
            function (data) {
                var thead="<tr>\n" +
                    "<th class=\"sorting_asc sorting_asc_disabled\">学号</th>\n" +
                    "<th class=\"sorting_asc sorting_asc_disabled\">姓名</th>\n" +
                    "<th class=\"sorting_asc sorting_asc_disabled\">得分</th>\n" +
                    "</tr>";
                var tbody="";
                if(data!=null&&data.length>0){
                    for(var i=0;i<data.length;i++){
                        tbody=tbody+"<tr>";
                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].studentId;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].name;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+"<input type='text' name='regularScore'>";
                        tbody=tbody+"</td>";

                        tbody=tbody+"</tr>";
                    }
                    tbody=tbody+"<tr>";
                    tbody=tbody+"<td colspan=\"3\">";
                    tbody=tbody+"<div class=\"col-md-10 data text-center\" style=\"width: 100%\">\n" +
                        "<button type=\"button\" class=\"btn bg-maroon\" style=\"margin-left: 0px\" onclick=\"submit2();\">提交</button>\n" +
                        //"<button type=\"button\" class=\"btn bg-default\" onclick=\"history.back(-1);\"  style=\"margin-right:175px;\">取消</button>\n" +
                        "</div>";
                    tbody=tbody+"</td>";
                    tbody=tbody+"</tr>";
                    $('#dataList2').find('thead').html(thead);
                    $('#dataList2').find('tbody').html(tbody);
                }else{
                    $('#dataList2').find('tbody').html("<tr><td>没有查询到数据</td></tr>");
                }
            },
            "json"
        )
    }

    function inputReportScore() {
        var optionOne=$("#course_report option:selected");
        var optionTwo=$("#project_report option:selected");
        if(optionOne.val()!="请选择项目"&&optionTwo.val()!="请选择项目"){
            $.post(
                "/user/findAllGroupByCourseId?courseId=1",
                function (data) {
                    var thead="<tr>\n" +
                        "<th class=\"sorting_asc_disabled\">组号</th>\n" +
                        "<th class=\"sorting_asc_disabled\">组名</th>\n" +
                        "<th class=\"sorting_asc_disabled\">得分</th>\n" +
                        "</tr>";
                    var tbody="";
                    if(data!=null&&data.length>0){
                        for(var i=0;i<data.length;i++){
                            tbody=tbody+"<tr>";
                            tbody=tbody+"<td>";
                            tbody=tbody+data[i].groupId;
                            tbody=tbody+"</td>";

                            tbody=tbody+"<td>";
                            tbody=tbody+data[i].groupName;
                            tbody=tbody+"</td>";

                            tbody=tbody+"<td>";
                            tbody=tbody+"<input type='text'>";
                            tbody=tbody+"</td>";

                            tbody=tbody+"</tr>";
                        }
                        tbody=tbody+"<tr>";
                        tbody=tbody+"<td colspan=\"3\">";
                        tbody=tbody+"<div class=\"col-md-10 data text-center\" style=\"width: 100%\">\n" +
                            "<button type=\"button\" class=\"btn bg-maroon\" style=\"margin-left: 170px\" onclick=\"createCourse();\">提交</button>\n" +
                            "<button type=\"button\" class=\"btn bg-default\" onclick=\"history.back(-1);\"  style=\"margin-right:175px;\">取消</button>\n" +
                            "</div>";
                        tbody=tbody+"</td>";
                        tbody=tbody+"</tr>";
                        $('#dataList1').find('thead').html(thead);
                        $('#dataList1').find('tbody').html(tbody);
                    }else{
                        $('#dataList1').find('tbody').html("<tr><td>没有查询到数据</td></tr>");
                    }
                },
                "json"
            )
        }
    }


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    function createCourse() {
        var form = document.getElementById("createCourse");
        form.submit();
    };



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
