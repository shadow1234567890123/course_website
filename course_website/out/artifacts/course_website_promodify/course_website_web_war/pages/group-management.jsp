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
            小组管理
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
                        <a href="#tab-label" data-toggle="tab">创建小组</a>
                    </li>
                    <li>
                        <a href="#tab-common" data-toggle="tab" onclick="findGroupInfo();">小组信息</a>
                    </li>
                    <li>
                        <a href="#tab-select" data-toggle="tab" onclick="findGroupInfoWithoutGroupLeader();">转让组长</a>
                    </li>
                    <li>
                        <a href="#tab-courseInfo" data-toggle="tab" onclick="findProject();">上传研发报告</a>
                    </li>
                    <li>
                        <a href="#tab-createGroup" data-toggle="tab" onclick="inputContr();">小组贡献度录入</a>
                    </li>
                    <li>
                        <a href="#tab-groupInfo" data-toggle="tab" onclick="groupEvaluation();">小组互评</a>
                    </li>
                </ul>
                <!--tab头/-->

                <!--tab内容-->
                <div class="tab-content">

                    <!--label显示的内容-->
                    <div class="tab-pane active" id="tab-label">

                        <div class="row data-type">

                            <div class="col-md-2 title">组号</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" value="${user.groupId}" name="" disabled>
                            </div>

                            <div class="col-md-2 title">组长姓名及学号</div>
                            <div class="col-md-4 data">
                                <input type="text" class="form-control" value="${user.name}(${user.username})" name="" disabled>
                            </div>
                            <form id="createGroup">
                                <div class="col-md-2 title">组名</div>
                                <div class="col-md-4 data">
                                    <input type="text" id="groupName" class="form-control" name="groupName" placeholder="组名">
                                </div>

                                <div class="col-md-2 title">小组宣言</div>
                                <div class="col-md-4 data">
                                    <input type="text" id="declaration" class="form-control" name="declaration" placeholder="小组宣言">
                                </div>

                                <div class="col-md-2 title">组内成员</div>
                                <div class="col-md-10 data text-center">
                                    <%--<form > &lt;%&ndash;method="post" action="/user/createGroup"&ndash;%&gt;--%>
                                    <select class="form-control select2" id="groupNumber" multiple="multiple" data-placeholder="可多选" style="width: 100%;" name="groupMember">
                                        <c:forEach items="${userList}" var="user">
                                            <option>${user.toString()}</option>
                                        </c:forEach>
                                    </select>
                                    <%--</form>--%>
                                </div>
                            </form>


                            <div class="col-md-10 data text-center" style="width: 100%">
                                <button type="button" class="btn bg-maroon" style="margin-left: 170px" onclick="createGroup();">创建</button>
                                <button type="button" class="btn bg-default" onclick="history.back(-1);"  style="margin-right:175px;">取消</button>
                            </div>

                        </div>

                    </div>

                    <!--基础控件-->
                    <div class="tab-pane" id="tab-common">
                        <table id="dataList1" class="table table-bordered table-striped table-hover dataTable">
                            <thead>
                            <tr>
                                <th class="sorting_asc sorting_asc_disabled">组号</th>
                                <th class="sorting_asc sorting_asc_disabled">成员姓名</th>
                                <th class="sorting_asc sorting_asc_disabled">成员学号</th>
                                <th class="sorting_asc sorting_asc_disabled">操作</th>
                            </tr>
                            </thead>
                            <tbody>

                            </tbody>
                        </table>

                    </div>
                    <!--基础控件/-->

                    <!--下拉框-->
                    <div class="tab-pane" id="tab-select">

                            <div style="overflow: hidden;padding-left: 7px">
                                <!-- /.form-group -->
                                <div class="form-group" style="float: left;width:200px">
                                    <label>请选择新组长:</label>
                                    <select class="form-control select2" style="width: 100%;" id="selectNewGroupLeader" name="newGroupLeader">
                                    </select>
                                </div>
                                <div style="float: left;margin-top: 23px">
                                    <button type="button" class="btn bg-maroon" style="margin-left: 15px" onclick="transferLeader();">转让</button>
                                </div>


                            </div>

                    </div>
                    <!--下拉框/-->


                    <div id="addGroupMember" class="modal modal-primary" role="dialog">
                        <div class="modal-dialog modal-lg">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h4 class="modal-title">添加组员</h4>
                                </div>
                                <div class="row data-type">
                                    <form id="addGroupMember_mul" method="post" enctype="multipart/form-data">
                                        <%--选择组长下拉框--%>
                                        <div class="row data-type" style="border: 1px solid #C4C4C4;margin-left: 30px; width: 830px;margin-top: 30px;margin-bottom: 30px">

                                            <div class="col-md-2 title">选择新组员</div>
                                            <div class="col-md-10 data">
                                                <select class="form-control select2" multiple="multiple" data-placeholder="可多选" style="width: 100%;" id="studentWithouGroupIdList" name="newGroupMemberList">

                                                </select>
                                            </div>
                                        </div>

                                    </form>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-outline" data-dismiss="modal">取消</button>
                                    <button id="realease_IndividualTask" type="button" class="btn btn-outline" onclick="addGroupMember();">确认</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!--label显示的内容-->
                    <div class="tab-pane" id="tab-courseInfo">

                        <div class="row data-type">
                            <%--<form id="reportContent" enctype="multipart/form-data" method="post" action="/course/uploadReport">--%>
                            <form id="reportContent" enctype="multipart/form-data">
                                <div class="col-md-2 title">选择项目</div>
                                <div class="col-md-4 data">
                                    <select class="form-control select2" id="selectPro" placeholder="请选择项目" style="width: 100%;" name="project">

                                    </select>
                                </div>

                                <div class="col-md-2 title">选择研发报告</div>
                                <div class="col-md-4 data">
                                    <div class="input-group" id="selectRepot">
                                        <input type="file" id="report" name="upload">
                                    </div>
                                </div>
                            </form>
                                <div class="col-md-10 data text-center" style="width: 100%">
                                    <button type="button" class="btn bg-maroon" style="margin-left: 0px" onclick="uploadReport();">上传</button>
                                    <%--<button type="button" class="btn bg-default" onclick="history.back(-1);"  style="margin-right:175px;">取消</button>--%>
                                </div>

                        </div>

                    </div>

                    <div class="tab-pane" id="tab-createGroup">
                        <form id="groupContr">
                            <div style="overflow: hidden;padding-left: 7px">
                                <!-- /.form-group -->
                                <div class="form-group" style="float: left;">
                                    <label>选择项目:</label>
                                    <select class="form-control select2" placeholder="请选择项目" style="width: 100%;" id="selectP" onchange="findGroupInf()" name="project">

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

                    <!--label显示的内容-->
                    <div class="tab-pane" id="tab-groupInfo">
                        <form id="groupEvaluationForm">
                            <div style="overflow: hidden;padding-left: 7px">
                                <!-- /.form-group -->
                                <div class="form-group" style="float: left;">
                                    <label>选择项目:</label>
                                    <select class="form-control select2" placeholder="请选择项目" style="width: 100%;" id="project" onchange="showData3()" name="project">

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
            <!--tab页/-->

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


    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }

    function showData3() {
        var option1=$("#project option:selected").text();
        $.post(
            "/course/showData3",
            {project:option1},
            // projectName:option2},
            function (data) {
                var thead="<tr>\n" +
                    "<th class=\"sorting_asc_disabled\">组号</th>\n" +
                    "<th class=\"sorting_asc_disabled\">组名</th>\n" +
                    "<th class=\"sorting_asc_disabled\">得分点一</th>\n" +
                    "<th class=\"sorting_asc_disabled\">得分点二</th>\n" +
                    "<th class=\"sorting_asc_disabled\">得分点三</th>\n" +
                    "<th class=\"sorting_asc_disabled\">总得分</th>\n" +
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
                        tbody=tbody+"<input type='text' name='scoreOne' onkeyup='addScore(this);' style='width: 140px'>";
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+"<input type='text' name='scoreTwo' onkeyup='addScore(this);' style='width: 140px'>";
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+"<input type='text' name='scoreThree' onkeyup='addScore(this);' style='width: 140px'>";
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+"<input type='text' name='score' style='width: 140px' readonly>";
                        //tbody=tbody+"<span></span>";
                        tbody=tbody+"</td>";

                        tbody=tbody+"</tr>";
                    }
                    tbody=tbody+"<tr>";
                    tbody=tbody+"<td colspan=\"6\">";
                    tbody=tbody+"<div class=\"col-md-10 data text-center\" style=\"width: 100%\">\n" +
                        "<button type=\"button\" class=\"btn bg-maroon\" style=\"margin-left: 0px\" onclick=\"submitGroupEvaluation();\">提交</button>\n" +
                        // "<button type=\"button\" class=\"btn bg-default\" onclick=\"history.back(-1);\"  style=\"margin-right:175px;\">取消</button>\n" +
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

    function addScore(obj) {
        var tr = $(obj).parent().parent();//tr对象
        var score=0;
        tr.find('td').each(function(i,td){
            if(i>1&&i<5){

                var currentScore=Number($(this).children().val());
                score=score+currentScore;
            }
            if(i==5){
                $(this).children().val(score);
            }
        });
    }

    // function valid_evaluation_Form() {
    //     var result=true;
    //
    //     var regEvaluation=/^[0-5]*$/;
    //     var td= $("#dataList3 input[readonly]");
    //     for(var i =0;i<td.length;i++){
    //         if(!regEvaluation.test($(td[i]).val())){
    //             show_validate_msg(td[i], "error", "只能为0~5之间的整数");
    //             result=false;
    //         }else{
    //             result=true;
    //             show_validate_msg(td[i], "success", "");
    //         }
    //     }
    //
    //     return result;
    // }

    function valid_groupEvaluation_form() {
        var result=true;

        var regContri=/^([0-5])$/;
        var td=$("#dataList3 input");
        for(var i=0;i<td.length;i++){
            if((i+1)%4!=0){
                    if(!regContri.test($(td[i]).val())){
                        show_validate_msg(td[i], "error", "只能为0~5分");
                        result=false;
                    }else{
                        result=true;
                        show_validate_msg(td[i], "success", "");
                    }
            }
        }

        //return false;
        //var sum=0;
        // for(var i =0;i<td.length;i=i+4){
        //     if(!regContri.test($(td[i]).val())){
        //         show_validate_msg(td[i], "error", "只能为1~3位整数");
        //         result=false;
        //     }else{
        //         result=true;
        //         sum=sum+parseInt($(td[i]).val());
        //         show_validate_msg(td[i], "success", "");
        //     }
        // }
        // if(sum!=100){
        //     result=false;
        //     alert("贡献度之和须为100");
        // }

        return result;
    }

    function submitGroupEvaluation() {

        if(!valid_groupEvaluation_form()){
            return false;
        }

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/course/saveGroupEvaluation" ,//url
            data: $('#groupEvaluationForm').serialize(),
            success: function (data) {
                alert("提交成功");
            },
            error : function() {
                alert("提交失败，请联系助教");
            }
        });

    }

    function groupEvaluation() {
        // $("#selectProject").find("option[text='请选择项目']").attr("selected",true);
        $.post(
            "/course/findProjectNameByYear",
            function (data) {
                var op="<option selected=\"selected\" disabled>请选择项目</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#project').html(op);

            },
            "json"
        )
    }

    function validate_createGroup_form() {
        var result=true;
        var groupName= $("#groupName").val();//组名
        var regGroupName=/\S/;
        if(!regGroupName.test(groupName)){
            show_validate_msg("#groupName", "error", "不能为空");
            result=false;
        }else{
            show_validate_msg("#groupName", "success", "");
        }

        var declaration= $("#declaration").val();//小组宣言
        var regDeclaration=/\S/;
        if(!regDeclaration.test(declaration)){
            show_validate_msg("#declaration", "error", "不能为空");
            result=false;
        }else{
            show_validate_msg("#declaration", "success", "");
        }

        if($("#groupNumber option:selected").text()==""){//组内成员
            alert("请选择组内成员");
            result=false;
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


    function createGroup() {
        if(!validate_createGroup_form()){
            return false;
        }

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/user/createGroup" ,//url
            data: $('#createGroup').serialize(),
            success: function (data) {
                alert("创建成功");
            },
            error : function() {
                alert("创建失败，请联系助教");
            }
        });
    }



    function findCourse2() {
        $("#selectProject").find("option[text='请选择项目']").attr("selected",true);
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


    function findProjects() {
        var option=$("#selectCourse2 option:selected").text();
        $.post(
            "/course/findProjectNameByCourseId",
            {courseNameAndYear:option},
            function (data) {
                var op="<option selected=\"selected\" disabled>请选择项目</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#selectProject').html(op);

            },
            "json"
        )
    }
    
    function findGroupInfo() {
        $.post(
            "/user/findGroupInfo",
            {groupId:${user.groupId}},
            function (data) {
                var tbody="";
                if(data!=null&&data.length>0){
                    for(var i=0;i<data.length;i++){
                        tbody=tbody+"<tr>";
                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].groupId;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].name;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].studentId;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td class=\"text-center\">\n" +
                            "\t\t\t\t\t\t\t\t<button type=\"button\" class=\"btn bg-olive btn-xs\" onclick='delGroupMember(this);'>删除</button>\n"
                            + "\t\t\t\t\t\t\t</td>";

                        tbody=tbody+"</tr>";
                    }
                    tbody=tbody+"<tr>";
                    tbody=tbody+"<td colspan=\"4\">";
                    tbody=tbody+"<div class=\"col-md-10 data text-center\" style=\"width: 100%\">\n" +
                        "<button type=\"button\" class=\"btn bg-maroon\" style=\"margin-left: 0px\" onclick=\"findStudentWithoutGroupId();\" data-toggle=\"modal\" data-target=\"#addGroupMember\">添加组员</button>\n" +
                        // "<button type=\"button\" class=\"btn bg-default\" onclick=\"history.back(-1);\"  style=\"margin-right:175px;\">取消</button>\n" +
                        "</div>";
                    tbody=tbody+"</td>";
                    tbody=tbody+"</tr>";
                    // $('#dataList').find('thead').html(thead);
                    $('#dataList1').find('tbody').html(tbody);
                }else{
                    $('#dataList1').find('tbody').html("<tr><td>没有查询到数据</td></tr>");
                }

            },
            "json"
        )
    }
    
    function findStudentWithoutGroupId() {
        $.post(
            "/user/findStudentWithoutGroupId",
            function (data) {
                var op="<option disabled>请选择学生</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#studentWithouGroupIdList').html(op);

            },
            "json"
        )
    }

    function delGroupMember(obj) {
        var tr = $(obj).parent().parent();//tr对象
        var tdcon = [];//本行所有数据
        tr.find('td').each(function(i,td){
            if($(td).find('a').length == 0){//过滤修改列
                tdcon.push($(td).html());
            }
        });
        $.ajax({
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/user/delGroupMember" ,//url
            data: {studentId:tdcon[2]},
            success: function (data) {
                // var index=obj.parentNode.rowIndex;
                // var table = document.getElementById("dataList1");
                // table.deleteRow(index)
                findGroupInfo();
                alert("删除成功");
            },
            error : function() {
                alert("删除失败，请联系助教");
            }
        });

    }

    function findGroupInfoWithoutGroupLeader() {
        $.post(
            "/user/findGroupInfoWithoutGroupLeader",
            {groupId:${user.groupId}},
            function (data) {
                var op="<option selected disabled>请选择新组长</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#selectNewGroupLeader').html(op);

            },
            "json"
        )
    }

    function transferLeader() {

        if(!validate_transferLeader_form()){
            return false;
        }

        $.ajax({
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/user/transferLeader" ,//url
            data: $('#selectNewGroupLeader').serialize(),
            success: function (data) {
                alert("转让成功");
            },
            error : function() {
                alert("转让失败，请联系助教");
            }
        });
    }

    function validate_transferLeader_form() {
        var result=true;

        if($("#selectNewGroupLeader option:selected").text()=="请选择新组长"){//转让组长
            alert("请选择新组长");
            result=false;
        }

        return result;


    }

    function findProject() {
        $.post(
            "/course/findProjectNameByYear",
            function (data) {
                var op="<option selected disabled>请选择项目</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#selectPro').html(op);

            },
            "json"
        )
    }

    function addGroupMember() {
        $.ajax({
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/user/addGroupMember" ,//url
            data: $('#addGroupMember_mul').serialize(),
            success: function (data) {
                findGroupInfo();
                $("#close").click();
                alert("添加成功");
            },
            error : function() {
                alert("添加失败，请联系助教");
            }
        });
    }

    function uploadReport() {

        if(!validate_uploadReport_form()){
            return false;
        }

        var formData=new FormData($("#reportContent")[0]);
        $.ajax({
            type: "POST",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/course/uploadReport" ,//url
            data:formData,
            async: true,
            cache: false,
            contentType: false, //必须
            processData: false, //必须
            success: function (data) {
                alert("上传成功");
                var op1="<option selected disabled>请选择项目</option>";
                for(var i=0;i<data.length;i++){
                    op1+="<option>"+data[i]+"</option>";
                }
                $('#selectPro').html(op1);
            },
            error : function() {
                alert("上传失败，请联系助教");
            }
        });
    }

    function validate_uploadReport_form() {
        var result=true;

        if($("#selectPro option:selected").text()=="请选择项目"){//选择项目
            alert("请选择项目");
            result=false;
        }

        var report= $("#report").val();//选择研发报告
        if(report==""){
            alert("请选择研发报告");
            result=false;
        }

        return result;


    }

    function inputContr() {
        $.post(
            "/course/findProjectNameByYear",
            function (data) {
                var op="<option selected disabled>请选择项目</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#selectP').html(op);
            },
            "json"
        )
    }

    function findGroupInf() {
        $.post(
            "/user/findGroupInfo",
            {groupId:${user.groupId}},
            function (data) {
                var tbody="";
                var thead="<tr>\n" +
                    "                                <th class=\"sorting_asc sorting_asc_disabled\">组号</th>\n" +
                    "                                <th class=\"sorting_asc sorting_asc_disabled\">成员姓名</th>\n" +
                    "                                <th class=\"sorting_asc sorting_asc_disabled\">成员学号</th>\n" +
                    "                                <th class=\"sorting_asc sorting_asc_disabled\">贡献度</th>\n" +
                    "                            </tr>";
                if(data!=null&&data.length>0){
                    for(var i=0;i<data.length;i++){
                        tbody=tbody+"<tr>";
                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].groupId;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].name;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].studentId;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+"<input type='text' class='' name='contribution'>";
                        tbody=tbody+"</td>";
                    }
                    tbody=tbody+"<tr>";
                    tbody=tbody+"<td colspan=\"4\">";
                    tbody=tbody+"<div class=\"col-md-10 data text-center\" style=\"width: 100%\">\n" +
                        "<button type=\"button\" class=\"btn bg-maroon\" style=\"margin-left: 0px\" onclick=\"submitGroupContri();\">提交</button>\n" +
                        // "<button type=\"button\" class=\"btn bg-default\" onclick=\"history.back(-1);\"  style=\"margin-right:175px;\">取消</button>\n"
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

    function valid_groupContr_form() {
        var result=true;

        if($("#selectP option:selected").text()=="请选择项目"){// 项目
            alert("请选择项目");
            return false;
        }

        var regContri=/^\d{1,3}$/;
        var td= $("#dataList2 input");
        var sum=0;
        for(var i =0;i<td.length;i++){
            if(!regContri.test($(td[i]).val())){
                show_validate_msg(td[i], "error", "只能为1~3位整数");
                result=false;
            }else{
                result=true;
                sum=sum+parseInt($(td[i]).val());
                show_validate_msg(td[i], "success", "");
            }
        }
        if(sum!=100){
            result=false;
            alert("贡献度之和须为100");
        }

        return result;
    }

    function submitGroupContri() {

        if(!valid_groupContr_form()){
            return false;
        }

        $.ajax({
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/course/inputGroupContribution" ,//url
            data: $('#groupContr').serialize(),
            success: function (data) {
                alert("提交成功");
            },
            error : function() {
                alert("提交失败，请联系助教");
            }
        });
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
