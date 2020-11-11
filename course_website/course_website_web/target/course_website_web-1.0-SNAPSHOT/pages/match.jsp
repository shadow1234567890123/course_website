<%--
  Created by IntelliJ IDEA.
  User: 朱琳
  Date: 2019-11-26
  Time: 21:20
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Match</title>
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
    <style type="text/css">
        #prompt{
            color: red;
        }
    </style>
</head>
<body>
<div class="box box-primary">
    <div class="box-header with-border">
        <h3 class="box-title"><b>棋手对战</b><span id="prompt"></span></h3>
    </div>
    <!-- /.box-header -->
    <!-- form start -->
    <form action="" enctype="multipart/form-data" method="post" id="form">
        <div class="box-body">
            <div class="form-group" >
                <label>棋类:</label>
                <select class="form-control select2" id="gameId" name="gameId" style="width: 100%;" onchange="gameChange(this.options[this.options.selectedIndex].value)" >
                    <option selected="selected" disabled>棋类</option>
                    <c:forEach items="${sessionScope.gameList}" var="game">
                        <option value="${game.gameId}">${game.gameName}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group" >
                <label>提交棋手</label>
                <select class="form-control " name="groupId2" id="player">
                    <option selected="selected" disabled>请先选择棋类</option>
                </select>
            </div>
            <div class="form-group">
                <label>对战场数</label>
                <select class="form-control" name="matchCount" id="matchCount">
                    <option value="2">2次</option>
                    <option value="5" >5次</option>
                </select>
            </div>

            <div class="form-group">

                <div class="nav-tabs-custom">

                    <!--tab头-->
                    <ul class="nav nav-tabs">
                        <li class="active">
                            <a href="#tab-msg" data-toggle="tab">棋手信息</a>
                        </li>
                        <li>
                            <a href="#tab-change" data-toggle="tab">提交棋手</a>
                        </li>
                    </ul>
                    <!--tab头/-->
                    <div class="tab-content">
                        <div class="tab-pane active" id="tab-msg">
                            <div class="row data-type">

                                <div class="col-md-2 title" >组号</div>
                                <div class="col-md-4 data text" >
                                    <input name="groupId1" value="${user.groupId}" readonly></input>
                                </div>

                                <div class="col-md-2 title">上次提交日期</div>
                                <div class="col-md-4 data text" id="submitDate">
                                </div>

                                <div class="col-md-2 title rowHeight2x">备注信息</div>
                                <div class="col-md-10 data rowHeight2x">
                                    <textarea class="form-control" rows="3"
                                              disabled="disabled" name="comment" id="comment"></textarea>
                                </div>

                            </div>
                        </div>
                        <div class="tab-pane" id="tab-change">
                            <div class="row data-type">
                                <div class="col-md-2 title">组号</div>
                                <div class="col-md-4 data text">
                                    ${user.groupId}
                                </div>

                                <div class="col-md-2 title">提交棋手</div>
                                <div class="col-md-4 data text">
                                    <input type="file" id="fileFolder" name="fileFolder" webkitdirectory mozdirectory >
                                </div>

                                <div class="col-md-2 title rowHeight2x">备注信息</div>
                                <div class="col-md-10 data rowHeight2x" >
                                    <textarea class="form-control" rows="3" placeholder="请输入..." name="newComment" id="newComment"></textarea>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="box-footer">
                    <button type="submit" class="btn btn-primary" id="submit" >发起挑战</button>
                </div>
            </div>
            <!-- /.box-body -->
    </form>
    <div class="row">
        <div class="col-xs-12">
            <div class="box">
                <div class="box-header">
                    <h3 class="box-title"><b>对战结果</b></h3>

                    <div class="box-tools">
                        <div class="input-group input-group-sm" style="width: 200px;">
                            <input type="text" name="table_search" class="form-control pull-right" placeholder="Search">

                            <div class="input-group-btn">
                                <button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>
                            </div>
                            <div class="input-group-btn">
                                <button class="btn btn-default"><i class="fa fa-refresh"></i></button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.box-header -->
                <div class="box-body table-responsive no-padding">
                    <table class="table table-hover">
                        <tr>
                            <th>序号</th>
                            <th>对方棋手</th>
                            <th>棋手等级</th>
                            <th>场数</th>
                            <th>胜率（%）</th>
                            <th>提交日期</th>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>John Doe</td>
                            <td>困难</td>
                            <td>11</td>
                            <td><span class="label label-success">50</span></td>
                            <td>11-7-2014</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Alexander Pierce</td>
                            <td>困难</td>
                            <td>11</td>
                            <td><span class="label label-warning">80</span></td>
                            <td>11-7-2014</td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>Bob Doe</td>
                            <td>困难</td>
                            <td>11</td>
                            <td><span class="label label-primary">100</span></td>
                            <td>11-7-2014</td>
                        </tr>
                    </table>
                </div>
                <!-- /.box-body -->
            </div>
            <!-- /.box -->
        </div>
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
    $(document).ready(function () {
        // 选择框
        $(".select2").select2();

        // WYSIHTML5编辑器
        $(".textarea").wysihtml5({
            locale: 'zh-CN'
        });

        //表单提交判断fileFolder
        $("#submit").click(
            function () {
                var value =$("#prompt")[0].innerHTML
                console.log("prompt="+value)
                if(value!=''){
                    if ($("#fileFolder").val()=='') {
                        alert("您还未提交过棋手")
                        return false;
                    }
                }
                //检查是否选择棋手
                var playerId=$("#player option:selected").val()
                // Number.isInteger(playerId);
                if (playerId=="请先选择棋类") {
                    alert("请选择有棋手的棋类")
                    return false;
                }
                //判断是否在前面加0
                function getNow(s) {
                    return s < 10 ? '0' + s: s;
                }

                var myDate = new Date();

                var year=myDate.getFullYear();        //获取当前年
                var month=myDate.getMonth()+1;   //获取当前月
                var date=myDate.getDate();            //获取当前日


                var h=myDate.getHours();              //获取当前小时数(0-23)
                var m=myDate.getMinutes();          //获取当前分钟数(0-59)
                var s=myDate.getSeconds();

                var now=year+'-'+getNow(month)+"-"+getNow(date)+" "+getNow(h)+':'+getNow(m)+":"+getNow(s);

                var formData = new FormData($("#form")[0]);  //重点：要用这种方法接收表单的参数
                $.ajax({
                    url : "/challenge/battle?localFirst=false",
                    type : 'POST',
                    data : formData,
                    // 告诉jQuery不要去处理发送的数据
                    processData : false,
                    // 告诉jQuery不要去设置Content-Type请求头
                    contentType : false,
                    async : false,
                    success : function() {
                        $("#submitDate").html(now);
                        $("#comment").val($("#newComment").val());
                        $("#prompt")[0].innerHTML=""
                        alert("提交成功")
                    }
                });
                return  false;
            }
        );

    });
    //选中棋类后，筛选棋手

    function gameChange(tx){

        $.post(
            "/challenge/chooseGame?gameId="+tx,
            function (data) {
                console.log(data)
                var selecthtml="";
                if(data!=null&&data.length>0){
                    for (var i=0;i<data.length;i++){
                        selecthtml+="<option value='"+data[i].name+"'>"+data[i].name+"</option>";
                    }
                }else{
                    var msg="该棋类还没有上传棋手"
                    selecthtml+="<option>"+msg+"</option>";
                }
                // $('#player').find('select').html(selecthtml);
                $('#player').html(selecthtml);
            },
            "json"
        )
        //获取此种棋类用户的棋手提交信息
        $.post(
            "/challenge/playerInfo?gameId="+tx,
            function (data) {
                console.log(data)
                if(data.ifSubmit){
                    $("#submitDate").html(data.submitDate);
                    $("#comment").val(data.comment);
                    $("#prompt")[0].innerHTML=""
                }else{
                    //用户在该棋类没有提交过代码
                    $("#prompt")[0].innerHTML="   您在该棋类没有提交过棋手"
                }
            },
            "json"
        )
    }
    // 设置激活菜单
    function setSidebarActive(tagUri) {
        var liObj = $("#" + tagUri);
        if (liObj.length > 0) {
            liObj.parent().parent().addClass("active");
            liObj.addClass("active");
        }
    }


    $(function () {
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
