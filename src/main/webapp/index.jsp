<%--
  Created by IntelliJ IDEA.
  User: 月が綺麗
  Date: 2020/12/23 0023
  Time: 17:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录</title>
    <%@ include file="pages/base/basePath.jsp" %>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" media="screen"
          rel="stylesheet" type="text/css">
    <link href="static/css/login_sigup.css" rel="stylesheet" type="text/css">

    <style>
        input:-internal-autofill-previewed,
        input:-internal-autofill-selected {
            -webkit-text-fill-color: #ffffff !important;
            transition: background-color 5000s ease-in-out 0s !important;
        }
    </style>
    <script>
        window.onload = function init() {
            stopback();
        }
        function stopback() {
            if (window.history && window.history.pushState) {
                $(window).on("popstate", function () {
                    window.history.pushState("forward", null, "#");
                    window.history.forward(1);
                });
            }
            window.history.pushState("forward", null, "#"); //在IE中必须得有这两行
            window.history.forward(1);
        }
    </script>
</head>

<body>
<div class="main mainbox">
    <form action="user/login" method="post" class="form-login front">
        <div>
            <h1>登录</h1>

            <div class="item">
                <%--                <i class = "fa fa-user-circle-o" aria-hidden = "true"></i>--%>
                <input class="user" type="text" name="username" placeholder="账户">
            </div>

            <div class="item">
                <%--                <i class = "fa fa-key" aria-hidden = "true"></i>--%>
                <input type="password" name="password" placeholder="密码">
            </div>

            <button type="submit">登录</button>

            <div class="tap">
                <p style="margin-top: 40px">还没有账号？你可以</p>
                <p>点击这里去 <a id="sigup">注册</a></p>
            </div>

        </div>
    </form>

    <form action="user/regist" method="post" class="form-register back" onsubmit="return checkForm(this)">
        <div>
            <h1>注册</h1>

            <div class="item">
                <%--                <i class = "fa fa-user-circle-o" aria-hidden = "true"></i>--%>
                <input type="text" name="username" placeholder="用户名" value="" onfocus="FocusItem(this)"
                       onblur="CheckItem(this)"><span></span>
            </div>

            <div class="item">
                <%--                <i class = "fa fa-key" aria-hidden = "true"></i>--%>
                <input type="password" name="password" placeholder="密码"  value="" onfocus="FocusItem(this)"
                       onblur="CheckItem(this)"><span></span>
            </div>

            <div class="item">
                <%--                <i class = "fa fa-envelope-o" aria-hidden = "true"></i>--%>
                <input type="text" name="email" placeholder="邮箱" value="" onfocus="FocusItem(this)"
                       onblur="CheckItem(this)"><span></span>
            </div>
            <div class="item ">
                <%--                <i class = "fa fa-envelope-o" aria-hidden = "true"></i>--%>
                <input type="text " name="role" placeholder="角色" value="" onfocus="FocusItem(this)"
                       onblur="CheckItem(this)"><span></span>
            </div>
            <button type="submit">注册</button>

            <div class="tap">
                <p style="margin-top: 40px">已经有账号？你可以</p>
                <p>点击这里去 <a id="login">登录</a></p>
            </div>

        </div>
    </form>

</div>

<script type="text/javascript" src="static/script/login_sigup.js"></script>

</body>
</html>
