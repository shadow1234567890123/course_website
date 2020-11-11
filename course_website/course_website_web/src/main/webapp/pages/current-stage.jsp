<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/9/11
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
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
    <style>
        .project_title {
            font-size: 17px;
        }

        .project_information {
            font-size: 17px;
        }

        .stage_title {
            font-size: 20px;
        }

        .stage_information {
            font-size: 17px;
        }

        .cover {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100vh;
            background: rgba(0, 0, 0, 0.4);
            display: none;
        }

    </style>
</head>
<body>

<div class="cover">
    <div class="cover-box"></div>
</div>

<!-- 内容头部 -->
<section class="content-header">
    <h1>
        关卡信息
    </h1>
</section>
<!-- 内容头部 /-->

<section class="content">

    <div class="box-body">

        <!--tab页-->
        <div class="nav-tabs-custom">

            <!--tab头-->
            <ul class="nav nav-tabs">
                <li class="active">
                    <a href="#tab-label" data-toggle="tab">当前关卡</a>
                </li>
                <li>
                    <%--<a href="#tab-common" data-toggle="tab" onclick="beforeStageInfo();">既往关卡</a>--%>
                    <a href="#tab-common" data-toggle="tab">既往关卡</a>
                </li>

            </ul>
            <!--tab头/-->

            <!--tab内容-->
            <div class="tab-content">

                <!--基础控件-->
                <div class="tab-pane active" id="tab-label">
                    <div class="row data-type">
                        <!-- /.box-header -->
                        <div class="box-body">
                            <div class="box-group" id="accordion">
                                <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                                <div class="panel box box-primary">
                                    <div class="box-header with-border">
                                        <h4 class="box-title">
                                            <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"
                                               class="stage_title">
                                                当前项目信息
                                            </a>
                                        </h4>
                                    </div>
                                    <div id="collapseOne" class="panel-collapse collapse in">
                                        <div class="box-body">
                                            <c:if test="${empty currentProject}">
                                                <table class="table table-bordered table-striped table-hover dataTable">
                                                    <thead>
                                                    <tr>
                                                        <th class="sorting_asc sorting_asc_disabled">暂无项目信息</th>
                                                    </tr>
                                                    </thead>

                                                </table>
                                            </c:if>

                                            <c:if test="${not empty currentProject}">
                                                <div class="row data-type" style="border: 1px solid #e1dbdb">
                                                    <div class="col-md-2 title">项目名称</div>
                                                    <div class="col-md-4 data">
                                                        <input type="text" class="form-control"
                                                               value="${currentProject.projectName}" disabled>
                                                    </div>


                                                    <div class="col-md-2 title">个人任务占比</div>
                                                    <div class="col-md-4 data">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control"
                                                                   value="${currentProject.individualTaskProportion}"
                                                                   disabled>
                                                            <span class="input-group-addon">%</span>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-2 title">开始日期</div>
                                                    <div class="col-md-4 data">
                                                        <input type="text" class="form-control"
                                                               value="${currentProject.startDate}" disabled>
                                                    </div>

                                                    <div class="col-md-2 title">小组任务占比</div>
                                                    <div class="col-md-4 data">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control"
                                                                   value="${currentProject.groupTaskProportion}"
                                                                   disabled>
                                                            <span class="input-group-addon">%</span>
                                                        </div>
                                                    </div>

                                                    <div class="col-md-2 title">截止日期</div>
                                                    <div class="col-md-4 data">
                                                        <input type="text" class="form-control pull-right"
                                                               value="${currentProject.deadline}" disabled>
                                                    </div>

                                                    <div class="col-md-2 title">研发报告占比</div>
                                                    <div class="col-md-4 data">
                                                        <div class="input-group">
                                                            <input type="text" class="form-control"
                                                                   value="${currentProject.reportProportion}" disabled>
                                                            <span class="input-group-addon">%</span>
                                                        </div>
                                                    </div>


                                                    <div class="col-md-2 title rowHeight2x">项目描述</div>
                                                    <div class="col-md-10 data rowHeight2x">
                                                        <textarea class="form-control" rows="3"
                                                                  disabled>${currentProject.projectDescription}</textarea>
                                                    </div>

                                                </div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <%--<div>此处往下为当前阶段信息</div>--%>
                            <!-- we are adding the .panel class so bootstrap.js collapse plugin detects it -->
                            <div class="panel box box-primary">
                                <div class="box-header with-border">
                                    <h4 class="box-title">
                                        <span class="stage_title">当前关卡信息</span>
                                    </h4>
                                </div>
                                <div class="panel-collapse collapse in">


                                    <div class="box-body">
                                        <c:if test="${empty currentStage}">

                                            <table id="dataList"
                                                   class="table table-bordered table-striped table-hover dataTable">
                                                <thead>
                                                <tr>
                                                    <th class="sorting_asc sorting_asc_disabled">暂无关卡信息</th>
                                                </tr>
                                                </thead>

                                            </table>
                                        </c:if>
                                    </div>

                                    <!--关卡信息从此处开始-->

                                    <c:if test="${not empty currentStage}">
                                        <table id="dataList"
                                               class="table table-bordered table-striped table-hover dataTable">
                                            <thead>
                                            <tr>
                                                <th class="sorting_asc sorting_asc_disabled">关卡名称</th>
                                                <th class="sorting_asc sorting_asc_disabled">关卡类型</th>
                                                <th class="sorting_asc sorting_asc_disabled">文档下载</th>
                                                <th class="sorting_asc sorting_asc_disabled">截止时间</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <tr>
                                                <td>${currentStage.phaseName}</td>
                                                <td>${currentStage.phaseType}</td>
                                                <td><a href="/course/downloadCurrentStage"
                                                       style="font-size: 16px">${currentStage.fileName}</a></td>
                                                <td>${currentStage.deadline}</td>
                                            </tr>
                                            </tbody>

                                        </table>

                                        <!-- /.box-body -->
                                    </c:if>


                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->

                        <c:if test="${not empty currentStage}">
                        <!-- 内容头部 -->
                        <section class="content-header">
                            <h1>
                                上传代码
                            </h1>
                        </section>
                        <section class="content">
                            <div class="box box-primary">
                                <div class="box-body">
                                    <form action="/project/filesUpload" method="post" enctype="multipart/form-data"
                                          id="codeFile">
                                        <input type="file" id="fileFolder" name="fileFolder"
                                               style="float: left;margin-top: 5px" webkitdirectory mozdirectory>
                                        <span class=""
                                              style="width: 165px;float:left;margin-left: 5px;;margin-top: 6px;font-weight: 800;font-size: 14px">main函数所在的全类名：</span>
                                        <input type="text" name="fullClassName" placeholder="例：main.Main"
                                               class="form-control" style="width: 180px;float:left;margin-left: 1px">
                                        <input type="button" id="submitButton" value="提交" class="btn btn-primary"
                                               onclick="submitCode(this);" style="float: left;margin-left: 15px"/>
                                    </form>
                                </div>
                                <!--显示提交记录-->
                                <c:if test="${not empty record}">
                                    <div style="font: 16px solid black;font-weight: bold;margin-left: 12px">提交记录:</div>
                                    <div>
                                        <table id="" class="table table-bordered table-striped table-hover dataTable">
                                            <thead>
                                            <tr>
                                                <th>OJ得分</th>
                                                <th>提交时间</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach items="${record}" var="r" varStatus="status">
                                                <tr>
                                                    <td>${r.OJScore}</td>
                                                    <td>${r.time}</td>
                                                </tr>
                                            </c:forEach>
                                            </tbody>

                                        </table>
                                    </div>
                                </c:if>
                                <c:if test="${empty record}">
                                    <div style="font: 16px solid black;font-weight: bold;margin-left: 12px">提交记录:</div>
                                    <div>
                                        <table  class="table table-bordered table-striped table-hover dataTable">

                                            <thead>
                                            <tr>
                                                <th class="sorting_asc sorting_asc_disabled">暂无提交记录</th>
                                            </tr>
                                            </thead>

                                        </table>
                                    </div>
                                </c:if>
                            </div>
                        </section>
                        <!-- 正文区域 -->
                </c:if>


                    </div>
                </div>
                <!--基础控件/-->

                <!--既往关卡信息-->
                <div class="tab-pane" id="tab-common"><!--基础控件/-->
                    <div class="row data-type" id="beforeStageInfo">
                        <!--数据列表-->
                        <%--<table id="dataList2" class="table table-bordered table-striped table-hover dataTable"--%>
                               <%--style="width: 1044px;margin-left: 15px">--%>
                            <%--<thead>--%>
                            <%--</thead>--%>
                            <%--<tbody>--%>
                            <%--</tbody>--%>
                        <%--</table>--%>

                        <%--<div class="box-header with-border">--%>
                            <%--<h4 class="box-title">--%>
                                <%--<a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"--%>
                                   <%--class="stage_title">--%>
                                    <%--项目一--%>
                                <%--</a>--%>
                            <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="collapseTwo" class="panel-collapse collapse in">--%>
                            <%--<div class="box-body">--%>
                                <%--dfghsfh--%>
                            <%--</div>--%>
                        <%--</div>--%>

                        <c:set value="0" var="index" />
                        <c:forEach items="${ps}" var="project" varStatus="status">
                            <c:set var="index" value="${index+1}" />
                            <div class="box-header with-border">
                                <h4 class="box-title">
                                    <a data-toggle="collapse" data-parent="#accordion" href="#项目${index}"
                                       class="stage_title">
                                            ${project.projectName}
                                    </a>
                                </h4>
                            </div>
                            <div id="项目${index}" class="panel-collapse collapse in">
                                <div class="box-body">

                                    小组贡献度：${project.groupContribution} &nbsp;&nbsp;&nbsp; 小组互评得分：${project.groupEvaluation} &nbsp;&nbsp;&nbsp;  研发报告得分：${project.reportScore} &nbsp;&nbsp;&nbsp; 总分：${project.totalScore}

                                    <c:if test="${not empty project.programTasks}">
                                        <div>
                                            <table  class="table table-bordered table-striped table-hover dataTable">

                                                <thead>
                                                <tr>
                                                    <th>关卡名称</th>
                                                    <th>关卡类型</th>
                                                    <th>OJ得分</th>
                                                    <th>代码质量得分</th>
                                                </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${project.programTasks}" var="tasks" varStatus="status">
                                                    <tr>
                                                        <td>${tasks.phaseName}</td>
                                                        <td>${tasks.phaseType}</td>
                                                        <td>${tasks.OJScore}</td>
                                                        <td>${tasks.codeQualityScore}</td>
                                                    </tr>
                                                </c:forEach>
                                                </tbody>

                                            </table>
                                        </div>
                                    </c:if>

                                    <c:if test="${empty project.programTasks}">
                                        <div>
                                            <table  class="table table-bordered table-striped table-hover dataTable">

                                                <thead>
                                                <tr>
                                                    <th class="sorting_asc sorting_asc_disabled">暂无关卡记录</th>
                                                </tr>
                                                </thead>

                                            </table>
                                        </div>
                                    </c:if>

                                </div>
                            </div>
                        </c:forEach>

                        <%--<div class="box-header with-border">--%>
                            <%--<h4 class="box-title">--%>
                                <%--<a data-toggle="collapse" data-parent="#accordion" href="#项目1"--%>
                                   <%--class="stage_title">--%>
                                    <%--项目二--%>
                                <%--</a>--%>
                            <%--</h4>--%>
                        <%--</div>--%>
                        <%--<div id="项目1" class="panel-collapse collapse in">--%>
                            <%--<div class="box-body">--%>
                                <%--的说法是--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    </div>
                </div>
            </div>
            <!--tab内容/-->

        </div>
        <!--tab页/-->


    </div>

</section>
<!-- 正文区域 /-->


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
    $(document).ready(function () {
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

    function beforeStageInfo() {

        $.post(
            "/course/showData2",
            function (data) {
                // var content = "";
                // if (data != null && data.length > 0) {
                //     for (var i = 0; i < data.length; i++) {
                //         //alert(data[i].programTasks[i].OJScore);
                //         // content=content+"<div class=\"box-header with-border\">\n" +
                //         //     "                            <h4 class=\"box-title\">";
                //         // content=content+"<a data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"#项目1\"";
                //         // content=content+"class=\"stage_title\">";
                //         // content=content+data[i].projectName;
                //         // content=conent+"</a>\n" +
                //         //     "                            </h4>\n" +
                //         //     "                        </div>";
                //         // content=content+"<div id=\"项目1\" class=\"panel-collapse collapse in\">";
                //         // content=content+"<div class=\"box-body\">";
                //         // content=content+data[i].programTasks[i].OJScore;
                //         // content=content+"</div>\n" +
                //         //     "                        </div>";
                //     }
                //     $('#beforeStageInfo').html(content);
                // } else {
                //     $('#beforeStageInfo').html("<tr><td>暂无既往关卡信息</td></tr>");
                // }
            }
            //"json"

        )


        // $.post(
        //     "/course/showData2",
        //     function (data) {
        //         var thead = "<tr>\n" +
        //             "                                    <th class=\"sorting_asc sorting_asc_disabled\">项目名称</th>\n" +
        //             "                                    <th class=\"sorting_asc sorting_asc_disabled\">关卡名称</th>\n" +
        //             "                                    <th class=\"sorting_asc sorting_asc_disabled\">关卡类型</th>\n" +
        //             "                                    <th class=\"sorting_desc sorting_desc_disabled\">OJ评分</th>\n" +
        //             "                                </tr>";
        //         var tbody = "";
        //         if (data != null && data.length > 0) {
        //             for (var i = 0; i < data.length; i++) {
        //                 tbody = tbody + "<tr>";
        //                 tbody = tbody + "<td>";
        //                 tbody = tbody + data[i].projectName;
        //                 tbody = tbody + "</td>";
        //
        //                 tbody = tbody + "<td>";
        //                 tbody = tbody + data[i].phaseName;
        //                 tbody = tbody + "</td>";
        //
        //                 tbody = tbody + "<td>";
        //                 tbody = tbody + data[i].phaseType;
        //                 tbody = tbody + "</td>";
        //
        //                 tbody = tbody + "<td>";
        //                 tbody = tbody + data[i].score;
        //                 tbody = tbody + "</td>";
        //
        //                 tbody = tbody + "</tr>";
        //             }
        //             $('#dataList2').find('thead').html(thead);
        //             $('#dataList2').find('tbody').html(tbody);
        //         } else {
        //             $('#dataList2').find('tbody').html("<tr><td>暂无既往关卡信息</td></tr>");
        //         }
        //     },
        //     "json"
        // )
    }


    function submitCode(obj) {
        obj.setAttribute("disabled", true);
        var formData = new FormData($("#codeFile")[0]);

        $.ajax({
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/project/filesUpload",//url
            data: formData,
            async: true,
            cache: false,
            contentType: false, //必须
            processData: false, //必须
            success: function (data) {
                $('#submitButton').removeAttr("disabled");
                //alert("提交成功,你的OJ评分为：" + data);
                location.href="/project/findCurrentProjectAndStage";
            },
            error: function () {
                $('#submitButton').removeAttr("disabled");
                alert("提交失败，请联系助教");
            }
        });
    }


    // 激活导航位置
    setSidebarActive("elements-general");
</script>
</body>
</html>
