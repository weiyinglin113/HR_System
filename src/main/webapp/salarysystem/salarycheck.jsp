<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<html>
<head>
    <title>薪酬标准复核</title>
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
            background-color: rgb(94, 254, 244);
        }

        .main .first-p {
            margin-bottom: 60px;
        }

        .main .second-p {
            text-align: center;
        }

        .main table {
            border-collapse: collapse;
        }

        .main table tr th {
            border: 2px #000000 solid;
            background-color: #4cfa65;
        }

        .main table tr td {
            border: 2px #000000 solid;
            font-family: 楷体;
        }

        .main table tr td a {
            color: #ff0300;
            text-decoration: none;
        }

    </style>

</head>

<body>

<%@ include file = "../pages/common/navi.jsp" %>

<div class = "main">
    <p class = "first-p">您正在做的业务是：人力资源>>薪酬标准管理>>薪酬标准复核</p>

    <c:if test = '${!(sessionScope.user.role.equals("薪资专员")||sessionScope.user.role.equals("薪资经理"))}'>
        <div class = "msg">
            <p class = "second-p">你没有权限查看该页面！<a href = "pages/user/index.jsp">返回首页</a></p>
        </div>
    </c:if>

    <c:if test = '${sessionScope.user.role.equals("薪资专员")||sessionScope.user.role.equals("薪资经理")}'>
        <c:if test = "${empty salInfoList}">
            <div class = "msg">
                <p class = "second-p">没有待复核的薪酬信息！<a href = "pages/user/index.jsp">返回首页</a></p>
            </div>
        </c:if>

        <c:if test = "${!empty salInfoList}">
            <p style = "margin-top: 60px">当前等待复核的薪酬总数：${salInfoList.size()}例</p>

            <table>
                <tr>
                    <th style = "width: 200px; height: 25px">薪酬标准编号</th>
                    <th style = "width: 200px">薪酬标准名称</th>
                    <th style = "width: 200px">薪酬总额</th>
                    <th style = "width: 200px">制定人</th>
                    <th style = "width: 200px">登记人</th>
                    <th style = "width: 200px">复核</th>
                </tr>

                <c:forEach items = "${salInfoList}" var = "salInfo" >
                    <tr>
                        <td style = "height: 25px;text-align: center">
                                ${salInfo.salaryId}
                        </td>

                        <td style="text-align: center">
                                ${salInfo.salaryname}
                        </td >

                        <td style="text-align: center">
                                ${salInfo.salaryamount}
                        </td>

                        <td style="text-align: center">
                                ${salInfo.enacters}
                        </td >
                        <td style="text-align: center">
                                ${salInfo.registrar}
                        </td>



                        <td style = "text-align: center">
                            <a href = "salInfo/showDetails?salaryId=${salInfo.salaryId}&message=check">复核</a>
                        </td>
                    </tr>


                </c:forEach>
            </table>

        </c:if>
    </c:if>


</div>

</body>
</html>