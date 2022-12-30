<%--
  Created by IntelliJ IDEA.
  User: 月が綺麗
  Date: 2020/12/27 0027
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<html>
<head>
    <title>删除档案</title>
    <%@ include file = "../base/basePath.jsp" %>
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
            background-color: rgb(94, 254, 244);
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
    <p>您正在做的业务是：人力资源>>人力资源档案管理>>人力资源档案删除管理</p>

    <c:if test = "${empty userInfoList && empty deleteUserInfoList}">
        <div class = "msg">
            <p>没有员工信息！<a href = "pages/user/index.jsp">返回首页</a></p>
        </div>
    </c:if>

    <c:if test = "${!empty userInfoList || !empty deleteUserInfoList}">
        <p style = "margin-top: 60px">符合条件的人力资源档案总数：${userInfoList.size()}例</p>

        <table>
            <tr>
                <th style = "width: 150px; height: 25px">档案编号</th>
                <th style = "width: 150px">姓名</th>
                <th style = "width: 150px">性别</th>
                <th style = "width: 150px">一级机构</th>
                <th style = "width: 150px">二级机构</th>
                <th style = "width: 150px">三级机构</th>
                <th style = "width: 150px">职位名称</th>
                <th style = "width: 150px">操作</th>
            </tr>

            <c:if test = "${!empty userInfoList}">
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
                            <a href = "userInfo/showDetails?archiveId=${userInfo.archiveId}&message=delete">删除</a>
                        </td>
                    </tr>
                </c:forEach>
            </c:if>

            <c:if test = "${!empty deleteUserInfoList}">
                <c:forEach items = "${deleteUserInfoList}" var = "userInfo" varStatus = "stat">
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

                            <%-- 如果是查询条件为空，则infoList为空 --%>
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

                            <%-- 如果是查询条件不为空，则infoList不为空 --%>
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
                            <a href = "userInfo/showDetails?archiveId=${userInfo.archiveId}&message=recover">恢复</a>
                        </td>
                    </tr>

                </c:forEach>
            </c:if>


        </table>

    </c:if>

</div>

</body>
</html>
