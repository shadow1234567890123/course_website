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
            课程管理
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
                        <a href="#tab-label" data-toggle="tab">创建课程</a>
                    </li>
                    <li>
                        <a href="#tab-common" data-toggle="tab" onclick="findCourse();">发布项目</a>
                    </li>
                    <li>
                        <a href="#tab-select" data-toggle="tab">发布关卡</a>
                    </li>
                    <li>
                        <a href="#tab-courseInfo" data-toggle="tab" onclick="findCourseInfo();">课程信息</a>
                    </li>
                    <li>
                        <a href="#tab-createGroup" data-toggle="tab" onclick="findProjects3()">计算单个项目成绩</a>
                    </li>
                    <li>
                        <a href="#tab-totalProjectScore" data-toggle="tab" onclick="calAllProjectScore()">计算项目总成绩</a>
                    </li>
                    <li>
                        <a href="#tab-groupInfo" data-toggle="tab" onclick="calCourseScore()">计算期末成绩</a>
                    </li>
                </ul>
                <!--tab头/-->

                <!--tab内容-->
                <div class="tab-content">

                    <!--label显示的内容-->
                    <div class="tab-pane active" id="tab-label">

                        <div class="row data-type">
                            <form id="createCourse" method="post" action="/course/saveCourse">
                                <div class="col-md-2 title">课程编号</div>
                                <div class="col-md-4 data">
                                    <input type="text" class="form-control" value="080503211293" id="courseId" name="courseNumber" disabled>
                                </div>

                                <div class="col-md-2 title">课程名称</div>
                                <div class="col-md-4 data">
                                    <input type="text" class="form-control" value="人工智能" id="courseName" name="courseName" disabled>
                                </div>

                                <div class="col-md-2 title">课程年份</div>
                                <div class="col-md-4 data">
                                    <input  type="text" class="form-control" placeholder="课程年份" id="courseYear" name="year">
                                </div>

                                <div class="col-md-2 data"></div>
                                <div class="col-md-4 data"></div>


                                <div class="col-md-10 data text-center" style="width: 100%">
                                    <button type="button" class="btn bg-maroon" style="margin-left: 0px" onclick="createCourse();">创建</button>
                                    <%--<button type="button" class="btn bg-default" onclick="history.back(-1);"  style="margin-right:175px;">取消</button>--%>
                                </div>
                            </form>
                        </div>

                    </div>

                    <!--基础控件-->
                    <div class="tab-pane" id="tab-common">
                        <div class="row data-type">
                            <form id="createProject" method="post" action="/course/saveProject">
                                <div class="col-md-2 title">课程</div>
                                <div class="col-md-4 data">
                                    <%--<input type="text" class="form-control" placeholder="课程号" name="courseId">--%>
                                    <select class="form-control select2" style="width: 100%;" id="selectCourse" name="courseNameAndYear">
                                        <%--<option selected="selected" disabled>请选择课程</option>--%>

                                    </select>
                                </div>

                                <%--<div class="col-md-2 title">项目号</div>--%>
                                <%--<div class="col-md-4 data">--%>
                                    <%--<input type="text" class="form-control" placeholder="项目号" name="projectId">--%>
                                <%--</div>--%>

                                <div class="col-md-2 title">项目名称</div>
                                <div class="col-md-4 data">
                                    <input type="text" id="projectName_creatProjectForm" class="form-control" placeholder="项目名称" name="projectName">
                                </div>

                                <div class="col-md-2 title">个人任务占比</div>
                                <div class="col-md-4 data">
                                    <div class="input-group">
                                        <input type="text" id="individualTaskProportion_creatProjectForm" class="form-control" placeholder="个人任务占比" name="individualTaskProportion">
                                        <span class="input-group-addon">%</span>
                                    </div>
                                </div>

                                <div class="col-md-2 title">小组任务占比</div>
                                <div class="col-md-4 data">
                                    <div class="input-group">
                                        <input type="text" id="groupTaskProportion_creatProjectForm" class="form-control" placeholder="小组任务占比" name="groupTaskProportion">
                                        <span class="input-group-addon">%</span>
                                    </div>
                                </div>

                                <div class="col-md-2 title">研发报告占比</div>
                                <div class="col-md-4 data">
                                    <div class="input-group">
                                        <input type="text" id="reportProportion_creatProjectForm" class="form-control" placeholder="研发报告占比" name="reportProportion">
                                        <span class="input-group-addon">%</span>
                                    </div>
                                </div>


                                <div class="col-md-2 title">开始日期</div>
                                <div class="col-md-4 data">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control pull-right" id="datepicker1_project" name="startDate">
                                    </div>
                                </div>

                                <div class="col-md-2 title">截止日期</div>
                                <div class="col-md-4 data">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control pull-right" id="datepicker2_project" name="deadline">
                                    </div>
                                </div>


                                <div class="col-md-2 data"></div>
                                <div class="col-md-4 data"></div>

                                <div class="col-md-2 title rowHeight2x">项目描述</div>
                                <div class="col-md-10 data rowHeight2x">
                                    <textarea class="form-control" id="projectDiscription_creatProjectForm" rows="3" placeholder="请输入..." name="projectDescription"></textarea>
                                </div>
                            </form>
                            <div class="col-md-2 title" style="background-color: white;border-right-width: 0px;"></div>
                            <div class="col-md-10 data text-center">
                                <button type="button" class="btn bg-maroon" onclick="releaseProject();" style="margin-right: 170px">发布</button>
                                <%--<button type="button" class="btn bg-default" onclick="history.back(-1);"  style="margin-right:175px;">取消</button>--%>
                            </div>

                        </div>
                    </div>
                    <!--基础控件/-->

                    <!--下拉框-->
                    <div class="tab-pane" id="tab-select">
                        <button type="button" onclick="findCourse2();" class="btn btn-primary" data-toggle="modal" data-target="#createIndividualTask">
                            发布个人任务
                        </button>

                        <div id="createIndividualTask" class="modal modal-primary" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">发布个人任务</h4>
                                    </div>
                                    <div class="row data-type">
                                        <form id="releaseIndividualTask" method="post" action="/course/saveIndividualTask" enctype="multipart/form-data">
                                            <div class="col-md-2 title">课程</div>
                                            <div class="col-md-4 data">
                                                <%--<input type="text" class="form-control" placeholder="课程号" name="courseId">--%>
                                                <select class="form-control select2" style="width: 100%;" id="selectCourse2" name="courseNameAndYear" onchange="findProjects();">
                                                    <%--<option selected="selected" disabled>请选择课程</option>--%>

                                                </select>
                                            </div>

                                            <div class="col-md-2 title">项目</div>
                                            <div class="col-md-4 data">
                                                <%--<input type="text" class="form-control" placeholder="项目号" name="projectId">--%>
                                                <select class="form-control select2" style="width: 100%;" id="selectProject" name="projectName">
                                                    <%--<option selected="selected" disabled>请选择课程</option>--%>

                                                </select>
                                            </div>

                                            <%--<div class="col-md-2 title">阶段号</div>--%>
                                            <%--<div class="col-md-4 data">--%>
                                                <%--<input type="text" class="form-control" placeholder="阶段号" name="phaseId">--%>
                                            <%--</div>--%>

                                            <div class="col-md-2 title">关卡名称</div>
                                            <div class="col-md-4 data">
                                                <input type="text" id="phaseName_individualTask" class="form-control" placeholder="关卡名称" name="phaseName">
                                            </div>

                                            <div class="col-md-2 title">运行时间要求</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group">
                                                    <input type="text" id="runTime_individualTask" class="form-control" placeholder="运行时间要求" name="runTimeRequirement">
                                                    <span class="input-group-addon">ms</span>
                                                </div>
                                            </div>


                                            <div class="col-md-2 title">相似度阈值</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group">
                                                    <input type="text" id="similarity_individualTask" class="form-control" placeholder="相似度阈值" name="similarityThreshold">
                                                    <span class="input-group-addon">%</span>
                                                </div>
                                            </div>

                                            <div class="col-md-2 title">个人任务描述</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group">
                                                    <input type="file" id="discription_individualTask" name="upload">
                                                </div>
                                            </div>

                                            <div class="col-md-2 title">测试用例</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group">
                                                    <input type="file" id="testCase_individualTask" name="testCaseAndStandardout" webkitdirectory mozdirectory>
                                                </div>
                                            </div>

                                            <%--<div class="col-md-2 title">Ant配置文件</div>--%>
                                            <%--<div class="col-md-4 data">--%>
                                                <%--<div class="input-group">--%>
                                                    <%--<input type="file" id="ant_individualTask" name="build">--%>
                                                <%--</div>--%>
                                            <%--</div>--%>


                                            <div class="col-md-2 title">开始日期</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="text" class="form-control pull-right" id="datepicker1_IndividualTask" name="startDate">
                                                </div>
                                            </div>

                                            <div class="col-md-2 title">截止日期</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="text" class="form-control pull-right" id="datepicker2_IndividualTask" name="deadline">
                                                </div>
                                            </div>



                                            <%--<div class="col-md-2 title rowHeight2x">阶段描述</div>--%>
                                            <%--<div class="col-md-10 data rowHeight2x">--%>
                                                <%--<textarea class="form-control" rows="3" placeholder="请输入..." name="phaseDescription"></textarea>--%>
                                            <%--</div>--%>
                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline" data-dismiss="modal">取消</button>
                                        <button id="realease_IndividualTask" type="button" class="btn btn-outline" onclick="releaseIndividualTask();">发布</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>

                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->

                        <button type="button" class="btn btn-primary" onclick="findCourse3();" data-toggle="modal" data-target="#createGroupTask">
                            发布小组任务
                        </button>

                        <div id="createGroupTask" class="modal modal-primary" role="dialog">
                            <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">发布小组任务</h4>
                                    </div>
                                    <div class="row data-type">
                                        <form id="releaseGroupTask" method="post" action="/course/saveGroupTask" enctype="multipart/form-data">
                                            <div class="col-md-2 title">课程</div>
                                            <div class="col-md-4 data">
                                                <%--<input type="text" class="form-control" placeholder="课程号" name="courseId">--%>
                                                <select class="form-control select2" style="width: 100%;" id="selectCourse3" name="courseNameAndYear" onchange="findProjects2();">
                                                    <%--<option selected="selected" disabled>请选择课程</option>--%>

                                                </select>
                                            </div>

                                            <div class="col-md-2 title">项目</div>
                                            <div class="col-md-4 data">
                                                <%--<input type="text" class="form-control" placeholder="项目号" name="projectId">--%>
                                                <select class="form-control select2" style="width: 100%;" id="selectProject2" name="projectName">
                                                    <%--<option selected="selected" disabled>请选择课程</option>--%>

                                                </select>
                                            </div>

                                            <div class="col-md-2 title">关卡名称</div>
                                            <div class="col-md-4 data">
                                                <input type="text" id="phaseName_groupTask" class="form-control" placeholder="关卡名称" name="phaseName">
                                            </div>

                                            <%--<div class="col-md-2 title">阶段号</div>--%>
                                            <%--<div class="col-md-4 data">--%>
                                                <%--<input type="text" class="form-control" placeholder="阶段号" name="phaseId">--%>
                                            <%--</div>--%>

                                            <div class="col-md-2 title">运行时间要求</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group">
                                                    <input type="text" id="runtime_groupTask" class="form-control" placeholder="运行时间要求" name="runTimeRequirement">
                                                    <span class="input-group-addon">ms</span>
                                                </div>
                                            </div>


                                            <div class="col-md-2 title">相似度阈值</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group">
                                                    <input type="text" id="threshold_groupTask" class="form-control" placeholder="相似度阈值" name="similarityThreshold">
                                                    <span class="input-group-addon">%</span>
                                                </div>
                                            </div>

                                            <div class="col-md-2 title">OJ评分占比</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group">
                                                    <input type="text" id="OJScoreProporation_groupTask" class="form-control" placeholder="OJ评分占比" name="OJScoreProportion">
                                                    <span class="input-group-addon">%</span>
                                                </div>
                                            </div>

                                            <div class="col-md-2 title">代码质量评分占比</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group">
                                                    <input type="text" id="codeQuality_groupTask" class="form-control" placeholder="代码质量评分占比" name="codeQualityScoreProportion">
                                                    <span class="input-group-addon">%</span>
                                                </div>
                                            </div>

                                            <div class="col-md-2 title">小组任务描述</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group">
                                                    <input type="file" id="discription_groupTask" name="upload">
                                                </div>
                                            </div>


                                            <div class="col-md-2 title">测试用例</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group">
                                                    <input type="file" id="testCase_groupTask" name="testCaseAndStandardout" webkitdirectory mozdirectory>
                                                </div>
                                            </div>

                                            <%--<div class="col-md-2 title">Ant配置文件</div>--%>
                                            <%--<div class="col-md-4 data">--%>
                                                <%--<div class="input-group">--%>
                                                    <%--<input type="file" id="ant_groupTask" name="build">--%>
                                                <%--</div>--%>
                                            <%--</div>--%>


                                            <div class="col-md-2 title">开始日期</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="text" class="form-control pull-right" id="datepicker1_groupTask" name="startDate">
                                                </div>
                                            </div>

                                            <div class="col-md-2 title">截止日期</div>
                                            <div class="col-md-4 data">
                                                <div class="input-group date">
                                                    <div class="input-group-addon">
                                                        <i class="fa fa-calendar"></i>
                                                    </div>
                                                    <input type="text" class="form-control pull-right" id="datepicker2_groupTask" name="deadline">
                                                </div>
                                            </div>


                                        </form>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-outline" data-dismiss="modal">取消</button>
                                        <button id="Realease_GroupTaske" type="button" class="btn btn-outline" onclick="releaseGroupTask();">发布</button>
                                    </div>
                                </div>
                                <!-- /.modal-content -->
                            </div>

                            <!-- /.modal-dialog -->
                        </div>
                        <!-- /.modal -->
                    </div>
                    <!--下拉框/-->

                    <!--label显示的内容-->
                    <div class="tab-pane" id="tab-courseInfo">
                        <%--<div class="row data-type">--%>
                            <%----%>
                        <%--</div>--%>
                            <table id="dataList" class="table table-bordered table-striped table-hover dataTable">
                                <thead>
                                <tr>
                                    <%--<th class="" style="padding-right:0px;">--%>
                                        <%--<input id="selall" type="checkbox" class="icheckbox_square-blue">--%>
                                    <%--</th>--%>
                                    <th class="sorting_asc sorting_asc_disabled">年度</th>
                                    <th class="sorting_asc sorting_asc_disabled">项目名</th>
                                    <th class="sorting_asc sorting_asc_disabled">关卡名称</th>
                                    <th class="sorting_asc sorting_asc_disabled">关卡种类</th>
                                    <th class="sorting_asc sorting_asc_disabled">操作</th>
                                </tr>
                                </thead>
                                <tbody>

                                </tbody>
                            </table>

                    </div>

                    <!--计算单个项目成绩-->
                    <div class="tab-pane" id="tab-createGroup">
                        <%--<div class="row data-type">--%>
                        <%--</div>--%>
                            <form id="groupEvaluationForm">
                                <div style="overflow: hidden;padding-left: 7px">
                                    <!-- /.form-group -->
                                    <div class="form-group" style="float: left;">
                                        <label>选择项目:</label>
                                        <select class="form-control select2" placeholder="请选择项目" style="width: 100%;" id="projects" onchange="window.showData4()" name="project">

                                        </select>
                                    </div>
                                    <!-- /.form-group -->
                                </div>
                                <!--数据列表-->
                                <table id="dataList4" class="table table-bordered table-striped table-hover dataTable">
                                    <thead></thead>
                                    <tbody></tbody>

                                </table>
                            </form>

                    </div>



                    <!--label显示的内容-->
                    <div class="tab-pane" id="tab-totalProjectScore">
                        <form id="projectScoreForm">
                            <table id="dataList5" class="table table-bordered table-striped table-hover dataTable">
                                <thead></thead>
                                <tbody></tbody>

                            </table>
                        </form>
                    </div>

                    <!--label显示的内容-->
                    <div class="tab-pane" id="tab-groupInfo">
                        <form id="courseTotalScoreForm">
                            <table id="dataList6" class="table table-bordered table-striped table-hover dataTable">
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

    function calCourseScore(){
        $.post(
            "/course/calCourseScore",
            // projectName:option2},
            function (data) {
                var thead="<tr>\n" +
                    //"<th class=\"sorting_asc_disabled\" rowspan='2' colspan='2'>年度</th>\n" +
                    "<th class=\"sorting_asc_disabled\">学号</th>\n" +
                    "<th class=\"sorting_asc_disabled\">姓名</th>\n" +
                    "<th class=\"sorting_asc_disabled\">项目得分</th>"+
                    "<th class=\"sorting_asc_disabled\">平时成绩</th>\n" +
                    "<th class=\"sorting_asc_disabled\">期末成绩</th>\n" +
                    //thead=thead+"<th class=\"sorting_asc_disabled\">总分</th>\n" +
                    "</tr>";
                var tbody="";
                if(data!=null&&data.length>0){
                    //if(data!=null){
                    for(var i=0;i<data.length;i++){
                        tbody=tbody+"<tr>";
                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].studentId;
                        tbody=tbody+"</td>";
                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].name;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].allProjectScore;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].regularScore;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+"<input type='text' name='totalScore' readonly value='"+data[i].courseTotalScore+"'>";
                        tbody=tbody+"</td>";

                        tbody=tbody+"</tr>";
                    }
                    tbody=tbody+"<tr>";
                    tbody=tbody+"<td colspan=\"5\">";
                    tbody=tbody+"<div class=\"col-md-10 data text-center\" style=\"width: 100%\">\n" +
                        "<button type=\"button\" class=\"btn bg-maroon\" style=\"margin-left: 0px\" onclick=\"saveCourseTotalScore();\">保存到数据库</button>\n" +
                        // "<button type=\"button\" class=\"btn bg-default\" onclick=\"history.back(-1);\"  style=\"margin-right:175px;\">取消</button>\n" +
                        "</div>";
                    tbody=tbody+"</td>";
                    tbody=tbody+"</tr>";
                    $('#dataList6').find('thead').html(thead);
                    $('#dataList6').find('tbody').html(tbody);
                }else{
                    $('#dataList6').find('tbody').html("<tr><td>没有查询到数据</td></tr>");
                }
            },
            "json"
        )
    }

    function saveCourseTotalScore() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/course/saveCourseTotalScore" ,//url
            data: $('#courseTotalScoreForm').serialize(),
            success: function (data) {
                alert("保存成功");
            },
            error : function() {
                alert("保存失败");
            }
        });
    }

    function calAllProjectScore(){
        $.post(
            "/course/calAllProjectScore",
            // projectName:option2},
            function (data) {
                var thead="<tr>\n" +
                    //"<th class=\"sorting_asc_disabled\" rowspan='2' colspan='2'>年度</th>\n" +
                    "<th class=\"sorting_asc_disabled\">学号</th>\n" +
                    //"<th class=\"sorting_asc_disabled\">姓名</th>\n" +
                    "<th class=\"sorting_asc_disabled\">姓名</th>"+
                    "<th class=\"sorting_asc_disabled\">各项目得分</th>\n" +
                    "<th class=\"sorting_asc_disabled\">项目综合得分</th>\n" +
                    //thead=thead+"<th class=\"sorting_asc_disabled\">总分</th>\n" +
                    "</tr>";
                var tbody="";
                if(data!=null&&data.length>0){
                    //if(data!=null){
                    for(var i=0;i<data.length;i++){
                        tbody=tbody+"<tr>";
                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].studentId;
                        tbody=tbody+"</td>";
                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].name;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].allScore;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+"<input type='text' name='projectTotalScore' readonly value='"+data[i].totalProjectScore+"'>";
                        tbody=tbody+"</td>";

                        tbody=tbody+"</tr>";
                    }
                    tbody=tbody+"<tr>";
                    tbody=tbody+"<td colspan=\"4\">";
                    tbody=tbody+"<div class=\"col-md-10 data text-center\" style=\"width: 100%\">\n" +
                        "<button type=\"button\" class=\"btn bg-maroon\" style=\"margin-left: 0px\" onclick=\"saveProjectTotalScore();\">保存到数据库</button>\n" +
                        // "<button type=\"button\" class=\"btn bg-default\" onclick=\"history.back(-1);\"  style=\"margin-right:175px;\">取消</button>\n" +
                        "</div>";
                    tbody=tbody+"</td>";
                    tbody=tbody+"</tr>";
                    $('#dataList5').find('thead').html(thead);
                    $('#dataList5').find('tbody').html(tbody);
                }else{
                    $('#dataList5').find('tbody').html("<tr><td>没有查询到数据</td></tr>");
                }
            },
            "json"
        )
    }

    function saveProjectTotalScore() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/course/saveProjectTotalScore" ,//url
            data: $('#projectScoreForm').serialize(),
            success: function (data) {
                alert("保存成功");
            },
            error : function() {
                alert("保存失败");
            }
        });
    }

    function showData4() {
        var option1=$("#projects option:selected").text();
        $.post(
            "/course/showData4",
            {project:option1},
            // projectName:option2},
            function (data) {
                var thead="<tr>\n" +
                    "<th class=\"sorting_asc_disabled\" style='width: 190px;'>学号</th>\n" +
                    "<th class=\"sorting_asc_disabled\" style='width: 40px;'>姓名</th>"+
                    "<th class=\"sorting_asc_disabled\" style='width: 40px;'>组号</th>"+
                    "<th class=\"sorting_asc_disabled\" style='width: 130px;'>个人任务OJ得分</th>\n" +
                    "<th class=\"sorting_asc_disabled\" style='width: 130px;'>小组任务OJ得分</th>\n" +
                    "<th class=\"sorting_asc_disabled\" style='width: 180px;'>小组任务代码质量得分</th>\n" +
                    "<th class=\"sorting_asc_disabled\" style='width: 100px;'>小组贡献度</th>\n" +
                    "<th class=\"sorting_asc_disabled\" style='width: 100px;'>小组互评得分</th>\n" +
                    "<th class=\"sorting_asc_disabled\" style='width: 100px;'>研发报告得分</th>\n" +
                    "<th class=\"sorting_asc_disabled\" style='width: 50px;'>总分</th>\n" +
                    "</tr>";
                var tbody="";
                if(data!=null&&data.length>0){
                    //if(data!=null){
                    for(var i=0;i<data.length;i++){
                        tbody=tbody+"<tr>";
                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].studentId;
                        tbody=tbody+"</td>";
                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].studentName;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].groupId;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].score1;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].score2;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].score3;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].groupContribution;//小组贡献度
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].groupEvaluation;//小组互评得分

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].reportScore;
                        tbody=tbody+"</td>";

                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+"<input type='text' name='projectScore' readonly value='"+data[i].projectScore+"'>";
                        tbody=tbody+"</td>";

                        tbody=tbody+"</tr>";
                    }
                    tbody=tbody+"<tr>";
                    tbody=tbody+"<td colspan=\"7\">";
                    tbody=tbody+"<div class=\"col-md-10 data text-center\" style=\"width: 100%\">\n" +
                        "<button type=\"button\" class=\"btn bg-maroon\" style=\"margin-left: 200px\" onclick=\"saveSingleProjectScore();\">保存到数据库</button>\n" +
                        // "<button type=\"button\" class=\"btn bg-default\" onclick=\"history.back(-1);\"  style=\"margin-right:175px;\">取消</button>\n" +
                        "</div>";
                    tbody=tbody+"</td>";
                    tbody=tbody+"</tr>";
                    $('#dataList4').find('thead').html(thead);
                    $('#dataList4').find('tbody').html(tbody);
                }else{
                    $('#dataList4').find('tbody').html("<tr><td>没有查询到数据</td></tr>");
                }
            },
            "json"
        )


    }

    function saveSingleProjectScore() {
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/course/saveSingleProjectScore" ,//url
            data: $('#groupEvaluationForm').serialize(),
            success: function (data) {
                alert("保存成功");
            },
            error : function() {
                alert("保存失败");
            }
        });
    }

    function findProjects3() {
        $.post(
            "/course/findAllProjectsByCurrentYear",
            function (data) {
                var op="<option selected=\"selected\" disabled>请选择项目</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#projects').html(op);

            },
            "json"
        )
    }

    function validate_createCourse_form() {
        var result=true;
        var courseYear= $("#courseYear").val();//课程年份
        var regCourseYear=/^\d{4}$/;
        if(!regCourseYear.test(courseYear)){
            show_validate_msg("#courseYear", "error", "只能为4位数字");
            result=false;
        }else{
            show_validate_msg("#courseYear", "success", "");
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

    function createCourse() {
        // var form = document.getElementById("createCourse");
        // form.submit();
        if(!validate_createCourse_form()){
            return false;
        }

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/course/saveCourse" ,//url
            data: $('#createCourse').serialize(),
            success: function (data) {
                alert("创建成功");
            },
            error : function() {
                alert("课程已存在，请勿重复创建！");
            }
        });
    };

    function validate_createProject_form() {
        var result=true;

        if($("#selectCourse option:selected").text()=="请选择课程"){//课程
            alert("请选择课程");
            result=false;
        }else{
            show_validate_msg("#selectCourse", "success", "");
        }

        var projectName_creatProjectForm= $("#projectName_creatProjectForm").val();//项目名称
        var regProjectName_creatProjectForm=/\S/;
        if(!regProjectName_creatProjectForm.test(projectName_creatProjectForm)){
            show_validate_msg("#projectName_creatProjectForm", "error", "不能为空");
            result=false;
        }else{
            show_validate_msg("#projectName_creatProjectForm", "success", "");
        }

        var individualTaskProportion_creatProjectForm= $("#individualTaskProportion_creatProjectForm").val();//个人任务占比
        var regIndividualTaskProportion_creatProjectForm=/^\d{1,3}$/;
        if(!regIndividualTaskProportion_creatProjectForm.test(individualTaskProportion_creatProjectForm)){
            show_validate_msg("#individualTaskProportion_creatProjectForm", "error", "只能为1~3位数字");
            result=false;
        }else{
            show_validate_msg("#individualTaskProportion_creatProjectForm", "success", "");
        }

        var groupTaskProportion_creatProjectForm= $("#groupTaskProportion_creatProjectForm").val();//小组任务占比
        var regGroupTaskProportion_creatProjectForm=/^\d{1,3}$/;
        if(!regGroupTaskProportion_creatProjectForm.test(groupTaskProportion_creatProjectForm)){
            show_validate_msg("#groupTaskProportion_creatProjectForm", "error", "只能为1~3位数字");
            result=false;
        }else{
            show_validate_msg("#groupTaskProportion_creatProjectForm", "success", "");
        }

        var reportProportion_creatProjectForm= $("#reportProportion_creatProjectForm").val();//研发报告占比
        var regReportProportion_creatProjectForm=/^\d{1,3}$/;
        if(!regReportProportion_creatProjectForm.test(reportProportion_creatProjectForm)){
            show_validate_msg("#reportProportion_creatProjectForm", "error", "只能为1~3位数字");
            result=false;
        }else{
            show_validate_msg("#reportProportion_creatProjectForm", "success", "");
        }

        var datepicker1_project= $("#datepicker1_project").val();//开始日期
        var regdatepicker1_project=/\S/;
        if(!regdatepicker1_project.test(datepicker1_project)){
            show_validate_msg("#datepicker1_project", "error", "请选择开始日期");
            result=false;
        }else{
            show_validate_msg("#datepicker1_project", "success", "");
        }

        var datepicker2_project= $("#datepicker2_project").val();//截止日期
        var regdatepicker2_project=/\S/;
        if(!regdatepicker2_project.test(datepicker2_project)){
            show_validate_msg("#datepicker2_project", "error", "请选择截止日期");
            result=false;
        }else{
            show_validate_msg("#datepicker2_project", "success", "");
        }

        var projectDiscription_creatProjectForm= $("#projectDiscription_creatProjectForm").val();//项目描述
        var regProjectDiscription_creatProjectForm=/\S/;
        if(!regProjectDiscription_creatProjectForm.test(projectDiscription_creatProjectForm)){
            show_validate_msg("#projectDiscription_creatProjectForm", "error", "请输入项目描述");
            result=false;
        }else{
            show_validate_msg("#projectDiscription_creatProjectForm", "success", "");
        }
        //alert(parseInt(individualTaskProportion_creatProjectForm)+parseInt(groupTaskProportion_creatProjectForm)+parseInt(reportProportion_creatProjectForm));
        if((parseInt(individualTaskProportion_creatProjectForm)+parseInt(groupTaskProportion_creatProjectForm)+parseInt(reportProportion_creatProjectForm))!=100){
            alert("个人任务,小组任务,研发报告占比之和需为100");
            show_validate_msg("#individualTaskProportion_creatProjectForm", "error", "只能为1~3位数字");
            show_validate_msg("#groupTaskProportion_creatProjectForm", "error", "只能为1~3位数字");
            show_validate_msg("#reportProportion_creatProjectForm", "error", "只能为1~3位数字");
            result=false;
        }

        return result;


    }

    function releaseProject() {
        // var form = document.getElementById("createProject");
        // form.submit();
        if(!validate_createProject_form()){
            return false;
        }

        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/course/saveProject" ,//url
            data: $('#createProject').serialize(),
            success: function (data) {
                alert("发布成功");
            },
            error : function() {
                alert("发布失败");
            }
        });
    }

    function releaseIndividualTask() {
        // var form = document.getElementById("releaseIndividualTask");
        // form.submit();

        if(!validate_createIndividualTask_form()){
            return false;
        }

        var formData=new FormData($("#releaseIndividualTask")[0]);
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/course/saveIndividualTask" ,//url
            data: formData,
            async: false,
            cache: false,
            contentType: false, //必须
            processData: false, //必须
            success: function (data) {
                alert("发布成功");
            },
            error : function() {
                alert("发布失败");
            }
        });


    }

    function validate_createIndividualTask_form() {
        var result=true;

        if($("#selectCourse2 option:selected").text()=="请选择课程"){// 课程
            alert("请选择课程");
            result=false;
        }

        if($("#selectProject option:selected").text()=="请选择项目"){// 项目
            alert("请选择项目");
            result=false;
        }

        var phaseName_individualTask= $("#phaseName_individualTask").val();//关卡名称
        var regPhaseName_individualTask=/\S/;
        if(!regPhaseName_individualTask.test(phaseName_individualTask)){
            show_validate_msg("#phaseName_individualTask", "error", "不能为空");
            result=false;
        }else{
            show_validate_msg("#phaseName_individualTask", "success", "");
        }

        var runTime_individualTask= $("#runTime_individualTask").val();//运行时间要求
        var regRunTime_individualTask=/^\d+$|^\d+\.\d+$/g;
        if(!regRunTime_individualTask.test(runTime_individualTask)){
            show_validate_msg("#runTime_individualTask", "error", "只能为数字");
            result=false;
        }else{
            show_validate_msg("#runTime_individualTask", "success", "");
        }

        var similarity_individualTask= $("#similarity_individualTask").val();//相似度阈值
        var regSimilarity_individualTask=/^\d+$|^\d+\.\d+$/g;
        if(!regSimilarity_individualTask.test(similarity_individualTask)){
            show_validate_msg("#similarity_individualTask", "error", "只能为数字");
            result=false;
        }else{
            show_validate_msg("#similarity_individualTask", "success", "");
        }

        var discription_individualTask= $("#discription_individualTask").val();//个人任务描述
        if(discription_individualTask==""){
            alert("请选择个人任务描述文件");
            result=false;
        }

        var testCase_individualTask= $("#testCase_individualTask").val();//测试用例
        if(testCase_individualTask==""){
            alert("请选择测试用例文件");
            result=false;
        }

        var ant_individualTask= $("#ant_individualTask").val();//Ant配置文件
        if(ant_individualTask==""){
            alert("请选择Ant配置文件");
            result=false;
        }

        var datepicker1_IndividualTask= $("#datepicker1_IndividualTask").val();//开始日期
        var regDatepicker1_IndividualTask=/\S/;
        if(!regDatepicker1_IndividualTask.test(datepicker1_IndividualTask)){
            show_validate_msg("#datepicker1_IndividualTask", "error", "请选择开始日期");
            result=false;
        }else{
            show_validate_msg("#datepicker1_IndividualTask", "success", "");
        }

        var datepicker2_IndividualTask= $("#datepicker2_IndividualTask").val();//截止日期
        var regDatepicker2_IndividualTask=/\S/;
        if(!regDatepicker2_IndividualTask.test(datepicker1_IndividualTask)){
            show_validate_msg("#datepicker2_IndividualTask", "error", "请选择截止日期");
            result=false;
        }else{
            show_validate_msg("#datepicker2_IndividualTask", "success", "");
        }

        return result;
    }

    function releaseGroupTask() {
        // var form = document.getElementById("releaseGroupTask");
        // form.submit();
        if(!validate_createGroupTask_form()){
            return false;
        }

        var formData=new FormData($("#releaseGroupTask")[0]);
        $.ajax({
            //几个参数需要注意一下
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/course/saveGroupTask" ,//url
            data: formData,
            async: true,
            cache: false,
            contentType: false, //必须
            processData: false, //必须
            success: function (data) {
                alert("发布成功");
            },
            error : function() {
                alert("发布失败");
            }
        });
    }

    function validate_createGroupTask_form() { //创建小组任务
        var result=true;

        if($("#selectCourse3 option:selected").text()=="请选择课程"){// 课程
            alert("请选择课程");
            result=false;
        }

        if($("#selectProject2 option:selected").text()=="请选择项目"){//  发布小组任务 项目
            alert("请选择项目");
            result=false;
        }

        var phaseName_groupTask= $("#phaseName_groupTask").val();//关卡名称
        var regPhaseName_groupTask=/\S/;
        if(!regPhaseName_groupTask.test(phaseName_groupTask)){
            show_validate_msg("#phaseName_groupTask", "error", "不能为空");
            result=false;
        }else{
            show_validate_msg("#phaseName_groupTask", "success", "");
        }

        var runtime_groupTask= $("#runtime_groupTask").val();//运行时间要求
        var regRuntime_groupTask=/^\d+$|^\d+\.\d+$/g;
        if(!regRuntime_groupTask.test(runtime_groupTask)){
            show_validate_msg("#runtime_groupTask", "error", "只能为数字");
            result=false;
        }else{
            show_validate_msg("#runtime_groupTask", "success", "");
        }

        var threshold_groupTask= $("#threshold_groupTask").val();//相似度阈值
        var regThreshold_groupTask=/^\d{1,3}$/;;
        if(!regThreshold_groupTask.test(threshold_groupTask)){
            show_validate_msg("#threshold_groupTask", "error", "只能为1~3位数字");
            result=false;
        }else{
            show_validate_msg("#threshold_groupTask", "success", "");
        }

        var OJScoreProporation_groupTask= $("#OJScoreProporation_groupTask").val();//OJ评分占比
        var regOJScoreProporation_groupTask=/^\d{1,3}$/;;
        if(!regOJScoreProporation_groupTask.test(OJScoreProporation_groupTask)){
            show_validate_msg("#OJScoreProporation_groupTask", "error", "只能为1~3位数字");
            result=false;
        }else{
            show_validate_msg("#OJScoreProporation_groupTask", "success", "");
        }

        var codeQuality_groupTask= $("#codeQuality_groupTask").val();//代码质量评分占比
        var regCodeQuality_groupTask=/^\d{1,3}$/;;
        if(!regCodeQuality_groupTask.test(codeQuality_groupTask)){
            show_validate_msg("#codeQuality_groupTask", "error", "只能为1~3位数字");
            result=false;
        }else{
            show_validate_msg("#codeQuality_groupTask", "success", "");
        }

        var discription_groupTask= $("#discription_groupTask").val();//小组任务描述
        if(discription_groupTask==""){
            alert("请选择个人任务描述文件");
            result=false;
        }

        var testCase_groupTask= $("#testCase_groupTask").val();//测试用例
        if(testCase_groupTask==""){
            alert("请选择测试用例文件");
            result=false;
        }

        var ant_groupTask= $("#ant_groupTask").val();//Ant配置文件
        if(ant_groupTask==""){
            alert("请选择Ant配置文件");
            result=false;
        }

        var datepicker1_groupTask= $("#datepicker1_groupTask").val();//开始日期
        var regDatepicker1_groupTask=/\S/;
        if(!regDatepicker1_groupTask.test(datepicker1_groupTask)){
            show_validate_msg("#datepicker1_groupTask", "error", "请选择开始日期");
            result=false;
        }else{
            show_validate_msg("#datepicker1_groupTask", "success", "");
        }

        var datepicker2_groupTask= $("#datepicker2_groupTask").val();//截止日期
        var regDatepicker2_groupTask=/\S/;
        if(!regDatepicker2_groupTask.test(datepicker2_groupTask)){
            show_validate_msg("#datepicker2_groupTask", "error", "请选择截止日期");
            result=false;
        }else{
            show_validate_msg("#datepicker2_groupTask", "success", "");
        }

        if((parseInt(OJScoreProporation_groupTask)+parseInt(codeQuality_groupTask))!=100){
            alert("OJ评分占比,代码质量评分占比之和需为100");
            show_validate_msg("#OJScoreProporation_groupTask", "error", "只能为1~3位数字");
            show_validate_msg("#codeQuality_groupTask", "error", "只能为1~3位数字");
            result=false;
        }

        return result;
    }


    function findCourse() {
        $.post(
            "/course/findAllCourseAndAllProject",
            function (data) {
                var op="<option selected=\"selected\" disabled>请选择课程</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#selectCourse').html(op);

            },
            "json"
        )
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

    function findProjects2() {
        var option=$("#selectCourse3 option:selected").text();
        $.post(
            "/course/findProjectNameByCourseId",
            {courseNameAndYear:option},
            function (data) {
                var op="<option selected=\"selected\" disabled>请选择项目</option>";
                for(var i=0;i<data.length;i++){
                    op+="<option>"+data[i]+"</option>";
                }
                $('#selectProject2').html(op);

            },
            "json"
        )
    }

    function findCourseInfo() {
        $.post(
            "/course/findCourseInfo",
            function (data) {
                var tbody="";
                if(data!=null&&data.length>0){
                    for(var i=0;i<data.length;i++){
                        tbody=tbody+"<tr>";
                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].year;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].projectName;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].phaseName;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td>";
                        tbody=tbody+data[i].phaseType;
                        tbody=tbody+"</td>";

                        tbody=tbody+"<td class=\"text-center\">\n" +
                            "\t\t\t\t\t\t\t\t<button type=\"button\" class=\"btn bg-olive btn-xs\">详情</button>\n"
                            + "\t\t\t\t\t\t\t</td>";

                        tbody=tbody+"</tr>";
                    }
                    // $('#dataList').find('thead').html(thead);
                    $('#dataList').find('tbody').html(tbody);
                }else{
                    $('#dataList').find('tbody').html("<tr><td>没有查询到数据</td></tr>");
                }

            },
            "json"
        )
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
