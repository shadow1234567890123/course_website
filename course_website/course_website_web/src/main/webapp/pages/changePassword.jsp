<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
</head>
<body>
<div class="login-box">
    <div class="login-logo">


        <a href="all-admin-index.html"><b>AI</b>课程网站</a>


    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
        <p class="login-box-msg">修改密码</p>
        <form action="/user/modifyPassword" method="post" id="modifyPassword">
            <div class="form-group has-feedback">
                <input type="text" value="${user.username}" disabled class="form-control" placeholder="用户名" name="username">
                <span class="glyphicon glyphicon-user form-control-feedback"></span>
            </div>
            <div class="form-group has-feedback">
                <input type="password" id="newPassword1" class="form-control" placeholder="新密码" name="newPassword">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>

            <div class="form-group has-feedback">
                <input type="password" id="newPassword2" class="form-control" placeholder="确认新密码">
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="row">
                <%--<div class="col-xs-8">--%>
                    <%--<div class="checkbox icheck">--%>
                        <%--<label><input type="checkbox"> 记住 下次自动登录</label>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <!-- /.col -->
                <div class="col-xs-4">
                    <button class="btn btn-primary btn-block btn-flat" onclick="modify()" type="button" style="margin-left: 110px">修改</button>
                </div>
                <!-- /.col -->
            </div>
        </form>


        <!-- /.social-auth-links -->


    </div>
    <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<!-- jQuery 2.2.3 -->
<!-- Bootstrap 3.3.6 -->
<!-- iCheck -->
<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
<script>
    $(function() {
        $('input').iCheck({
            checkboxClass: 'icheckbox_square-blue',
            radioClass: 'iradio_square-blue',
            increaseArea: '20%' // optional
        });
    });

    function modify() {
        if(!validate_addStudent_form()){
            return false;
        }

        $.ajax({
            type: "POST",//方法类型
            dataType: "text",//预期服务器返回的数据类型
            url: "/user/modifyPassword" ,//url
            data:$('#modifyPassword').serialize(),
            success: function (data) {
                alert("修改成功");
                window.location.href="${pageContext.request.contextPath}/pages/login.jsp";
            },
            error : function() {
                alert("修改失败，请联系助教");
                window.location.href="${pageContext.request.contextPath}/pages/login.jsp";
            }
        });
    }

    function validate_addStudent_form() {
        var result=true;
        var newPassword1= $("#newPassword1").val();
        var newPassword2= $("#newPassword2").val();
        if(newPassword1!=newPassword2){
            show_validate_msg("#newPassword1", "error", "两次密码不一致");
            show_validate_msg("#newPassword2", "error", "两次密码不一致\"");
            result=false;
        }else{
            show_validate_msg("#newPassword1", "success", "");
            show_validate_msg("#newPassword2", "success", "");
            result=true;
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

    $("#login").click(function () {
        $.post("/user/login",{username:"14070011022",password:"14070011022"},function (data) {
            alert(data);
        });
    });
</script>
</body>
</html>
