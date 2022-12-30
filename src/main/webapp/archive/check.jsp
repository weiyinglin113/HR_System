
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<html>
<head>
    <title>复核</title>
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
        }

        .main table tr td a {
            color: #ff0300;
            text-decoration: none;
        }

    </style>

</head>

<body>

<%@ include file = "/pages/common/navi.jsp" %>

<div class = "main">
    <p class = "first-p">您正在做的业务是：人力资源>>人力资源档案管理>>人力资源档案复核</p>

    <c:if test = '${!sessionScope.user.role.equals("人事经理")}'>
        <div class = "msg">
            <p class = "second-p">你没有权限查看该页面！<a href = "pages/user/index.jsp">返回首页</a></p>
        </div>
    </c:if>

    <c:if test = '${sessionScope.user.role.equals("人事经理")}'>
        <c:if test = "${empty checkUserList}">
            <div class = "msg">
                <p class = "second-p">没有待复核的员工信息！<a href = "pages/user/index.jsp">返回首页</a></p>
            </div>
        </c:if>

        <c:if test = "${!empty checkUserList}">
            <p style = "margin-top: 60px">当前等待复核的人力资源档案总数：${checkUserList.size()}例</p>

            <table>
                <tr>
                    <th style = "width: 150px; height: 25px">档案编号</th>
                    <th style = "width: 150px">姓名</th>
                    <th style = "width: 150px">性别</th>
                    <th style = "width: 150px">一级机构</th>
                    <th style = "width: 150px">二级机构</th>
                    <th style = "width: 150px">三级机构</th>
                    <th style = "width: 150px">职位名称</th>
                    <th style = "width: 150px">复核</th>
                </tr>

                <c:forEach items = "${checkUserList}" var = "userInfo" varStatus = "stat">
                    <tr>
                        <td style = "height: 25px">
                                ${userInfo.archiveId}
                        </td>

                        <td>
                                ${userInfo.name}
                        </td>

                        <td>
                                ${userInfo.gender}
                        </td>

                        <td>
                                ${firstList.get(stat.index)}
                        </td>

                        <td>
                                ${secondList.get(stat.index)}
                        </td>

                        <td>
                                ${thirdList.get(stat.index)}
                        </td>

                        <td>
                                ${jobList.get(stat.index)}
                        </td>

                        <td style = "text-align: center">
                            <a href = "userInfo/showDetails?archiveId=${userInfo.archiveId}&message=check">复核</a>
                        </td>
                    </tr>


                </c:forEach>
            </table>

        </c:if>
    </c:if>


</div>

</body>
</html>
