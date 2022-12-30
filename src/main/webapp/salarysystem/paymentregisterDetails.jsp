<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<html>
<head>
    <title>查看薪酬发放登记明细</title>
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
    <p>您正在做的业务是：人力资源>>薪酬发放管理>>薪酬发放登记明细</p>

    <c:if test = "${empty userInfoList}">
        <div class = "msg">
            <p>没有员工信息！<a href = "pages/user/index.jsp">返回首页</a></p>
        </div>
    </c:if>

    <c:if test = "${!empty userInfoList}">
        <p>薪酬发放单编号：${userInfoList.size()}</p>
        <p>机构：${usezrInfoList.size()}</p>
        <p>总人数：${userInfoList.size()}人，基本薪酬总额：，实发总额：</p>
        <td>登记人</td>
        <td>
            <input type = "text" name = "name" style = "width: 100px; height: 25px">
        </td>
        </p>

        <table>
            <tr>
                <th style = "width: 150px; height: 25px">档案编号</th>
                <th style = "width: 150px">姓名</th>
                <th style = "width: 150px">基本工资</th>
                <th style = "width: 150px">交通补助</th>
                <th style = "width: 150px">午餐补助</th>
                <th style = "width: 150px">通信补助</th>
                <th style = "width: 150px">养老保险</th>
                <th style = "width: 150px">失业保险</th>
                <th style = "width: 150px">医疗保险</th>
                <th style = "width: 150px">住房公积金</th>
                <th style = "width: 150px">奖励奖金</th>
                <th style = "width: 150px">应扣奖金</th>
            </tr>

            <c:forEach items = "${userInfoList}" var = "userInfo" varStatus = "stat">
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

                        <%--                    如果为空,说明是查询所有员工信息 --%>
                    <c:if test = "${empty infoList}">
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
                    </c:if>

                        <%--                    如果不为空,说明是按条件查询所有员工信息 --%>
                    <c:if test = "${!empty infoList}">
                        <td>
                                ${infoList.get(0)}
                        </td>

                        <td>
                                ${infoList.get(1)}
                        </td>

                        <td>
                                ${infoList.get(2)}
                        </td>

                        <td>
                                ${infoList.get(3)}
                        </td>
                    </c:if>

                    <td style = "text-align: center">
                        <a href = "userInfo/showDetails?archiveId=${userInfo.archiveId}&message=query">查看明细</a>
                    </td>
                </tr>


            </c:forEach>
        </table>

    </c:if>

</div>

</body>
</html>