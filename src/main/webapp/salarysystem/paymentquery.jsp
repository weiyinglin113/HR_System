<%--
  Created by IntelliJ IDEA.
  User: 月が綺麗
  Date: 2020/12/27 0027
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<html>
<head>
    <title>查询</title>
    <%@ include file = "../pages/base/basePath.jsp" %>
    <link href = "static/css/navigation.css" rel = "stylesheet" type = "text/css">

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

        .main table {
            border-collapse: separate;
            border-spacing: 0px 20px;
        }

        .main .first-col {
            width: 200px;
            text-align: center;
            background-color: #4cfa65;
        }

        .main select {
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
    <p>您正在做的业务是：人力资源>>薪酬发放管理>>薪酬发放查询</p>

    <form action = "userInfo/queryUser?message=update" method = "post">
        <table>

            <tr>
                <td class = "first-col">请输入薪酬发放单编号</td>
                <td>
                    <input type = "text" name = "salaryID" style = "width: 100px; height: 30px">
                </td>
            </tr>

            <tr>
                <td class = "first-col">请输入关键字</td>
                <td>
                    <input type = "text" name = "keyword" style = "width: 100px; height: 30px">
                </td>
            </tr>

            <tr>
                <td class = "first-col">请输入发放时间</td>
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
            <%--<input type = "hidden" name = "message" value = "update">--%>
            <input type = "submit" value = "查询">
            <input type = "reset" value = "重置">
        </div>
    </form>
</div>

<script>
    function changeSecond()
    {
        var second = $('.second-op');
        var third = $('.third-op');
        if ($('#first option:selected').val() == 1)
        {
            $('#second').val(0);
            $('#third').val(0);
            second[0].style.display = "block";
            second[1].style.display = "block";

            third[0].style.display = "none";
            third[1].style.display = "none";
            third[2].style.display = "none";
            third[3].style.display = "none";
            third[4].style.display = "none";
            third[5].style.display = "none";
        }
        else
        {
            $('#second').val(0);
            $('#third').val(0);
            second[0].style.display = "none";
            second[1].style.display = "none";

            third[0].style.display = "none";
            third[1].style.display = "none";
            third[2].style.display = "none";
            third[3].style.display = "none";
            third[4].style.display = "none";
            third[5].style.display = "none";
        }
    }

    function changeThird()
    {
        var third = $('.third-op');
        if ($('#second option:selected').val() == 1)
        {
            $('#third').val(0);
            third[0].style.display = "block";
            third[1].style.display = "block";
            third[2].style.display = "block";
            third[3].style.display = "none";
            third[4].style.display = "none";
            third[5].style.display = "none";
        }
        else if ($('#second option:selected').val() == 2)
        {
            $('#third').val(0);
            third[0].style.display = "none";
            third[1].style.display = "none";
            third[2].style.display = "none";
            third[3].style.display = "block";
            third[4].style.display = "block";
            third[5].style.display = "block";
        }
        else
        {
            $('#third').val(0);
            third[0].style.display = "none";
            third[1].style.display = "none";
            third[2].style.display = "none";
            third[3].style.display = "none";
            third[4].style.display = "none";
            third[5].style.display = "none";
        }
    }

    function changeJob()
    {
        var job = $('.job-op');
        if ($('#job_cla option:selected').val() == 1)
        {
            $('#job').val(0);
            job[0].style.display = "block";
            job[1].style.display = "block";
            job[2].style.display = "none";
            job[3].style.display = "none";
            job[4].style.display = "none";
            job[5].style.display = "none";
            job[6].style.display = "none";
            job[7].style.display = "none";
            job[8].style.display = "none";
            job[9].style.display = "none";
        }
        else if ($('#job_cla option:selected').val() == 2)
        {
            $('#job').val(0);
            job[0].style.display = "none";
            job[1].style.display = "none";
            job[2].style.display = "block";
            job[3].style.display = "none";
            job[4].style.display = "none";
            job[5].style.display = "none";
            job[6].style.display = "none";
            job[7].style.display = "none";
            job[8].style.display = "none";
            job[9].style.display = "none";
        }
        else if ($('#job_cla option:selected').val() == 3)
        {
            $('#job').val(0);
            job[0].style.display = "none";
            job[1].style.display = "none";
            job[2].style.display = "none";
            job[3].style.display = "block";
            job[4].style.display = "none";
            job[5].style.display = "none";
            job[6].style.display = "none";
            job[7].style.display = "none";
            job[8].style.display = "none";
            job[9].style.display = "none";
        }
        else if ($('#job_cla option:selected').val() == 4)
        {
            $('#job').val(0);
            job[0].style.display = "none";
            job[1].style.display = "none";
            job[2].style.display = "none";
            job[3].style.display = "none";
            job[4].style.display = "block";
            job[5].style.display = "block";
            job[6].style.display = "block";
            job[7].style.display = "none";
            job[8].style.display = "none";
            job[9].style.display = "none";
        }
        else if ($('#job_cla option:selected').val() == 5)
        {
            $('#job').val(0);
            job[0].style.display = "none";
            job[1].style.display = "none";
            job[2].style.display = "none";
            job[3].style.display = "none";
            job[4].style.display = "none";
            job[5].style.display = "none";
            job[6].style.display = "none";
            job[7].style.display = "block";
            job[8].style.display = "none";
            job[9].style.display = "none";
        }
        else if ($('#job_cla option:selected').val() == 6)
        {
            $('#job').val(0);
            job[0].style.display = "none";
            job[1].style.display = "none";
            job[2].style.display = "none";
            job[3].style.display = "none";
            job[4].style.display = "none";
            job[5].style.display = "none";
            job[6].style.display = "none";
            job[7].style.display = "none";
            job[8].style.display = "block";
            job[9].style.display = "block";
        }
        else
        {
            $('#job').val(0);
            job[0].style.display = "none";
            job[1].style.display = "none";
            job[2].style.display = "none";
            job[3].style.display = "none";
            job[4].style.display = "none";
            job[5].style.display = "none";
            job[6].style.display = "none";
            job[7].style.display = "none";
            job[8].style.display = "none";
            job[9].style.display = "none";
        }
    }

</script>

</body>
</html>

