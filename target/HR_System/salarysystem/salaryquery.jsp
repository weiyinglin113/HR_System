<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2022/12/23
  Time: 0:14
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<html>
<head>
    <title>薪资标准查询</title>
    <%@ include file = "../pages/base/basePath.jsp" %>
    <link href = "../static/css/navigation.css" rel = "stylesheet" type = "text/css">

    <style type = "text/css">
        nav {
            position: relative;
            z-index: 999;
        }

        .main {
            width: 1200px;
            margin: 60px auto;
            padding: 10px 0;
            background-color: rgb(51, 252, 254);
        }

        .main form {
            width: 571px;
            margin: 60px auto 20px;
        }

        .main .second-op, .main .third-op, .main .job-op {
            display: none;
        }
        .main .second-p {
            text-align: center;
        }
        .main table {
            border-collapse: separate;
            border-spacing: 0px 20px;
        }

        .main .first-col {
            width: 200px;
            text-align: center;
            background-color: #4cfa65;
        }

        .main  table td input {
            height: 30px;
            width: 300px;
        }

        .main .btn {
            width: 100%;
            margin: 20px auto;
        }

        .main .btn input {
            width: 60px;
            height: 30px;
            font-size: 17px;
            margin: 0 100px;
        }

    </style>

</head>
<body>

<%@ include file = "/pages/common/navi.jsp" %>

<div class = "main">
    <p>您正在做的业务是：人力资源>>薪酬标准管理>>薪酬标准查询</p>
<c:if test = '${!(sessionScope.user.role.equals("薪资专员")||sessionScope.user.role.equals("薪资经理"))}'>
    <div class = "msg">
        <p class = "second-p">你没有权限查看该页面！<a href = "pages/user/index.jsp">返回首页</a></p>
    </div>
</c:if>

<c:if test = '${sessionScope.user.role.equals("薪资专员")||sessionScope.user.role.equals("薪资经理")}'>

<form action = "salInfo/querySal?message=query" method = "post">
        <table>
            <tr>
                <td class = "first-col">请输入薪酬标准编号</td>
                <td colspan = "4">
                    <input type="text" name="salaryId"  >
                </td>
            </tr>

            <tr>
                <td class = "first-col">请输入关键字</td>
                <td colspan = "4">
                    <input type="text" name="xxx">
                </td>
            </tr>
            <tr>
                <td class = "first-col">请输入登记时间</td>
                <td>
                    <input type = "text" name = "start_time" style = "width: 100px; height: 30px">
                </td>
                <td style = "width: 30px; text-align: center">至</td>
                <td>
                    <input type = "text" name = "end_time" style = "width: 100px; height: 30px">
                </td>
                <td>（YYYY-MM-DD）</td>
            </tr>

        </table>

        <div class = "btn">
            <%--<input type = "hidden" name = "message" value = "query">--%>
            <input type = "submit" value = "查询">
            <input type = "reset" value = "重置">
        </div>
    </form>
</c:if>
</div>



</body>
</html>

