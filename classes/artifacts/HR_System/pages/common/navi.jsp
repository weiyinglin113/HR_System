<%--
  Created by IntelliJ IDEA.
  User: 月が綺麗
  Date: 2020/12/26 0026
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>

<nav>
    <div class = "wrap">
        <ul class = "menu clearfix">
            <li class = "index"><a href = "pages/user/index.jsp"><h2>首页</h2></a></li>

            <li class = "boa">
                <h2>资源档案管理</h2>
                <ul class = "box box1">
                    <a href = "pages/archive/register.jsp">
                        <li>人力资源档案登记</li>
                    </a>
                    <a href = "userInfo/check">
                        <li>人力资源档案复核</li>
                    </a>
                    <a href = "pages/archive/query.jsp">
                        <li>人力资源档案查询</li>
                    </a>
                    <a href = "pages/archive/update.jsp">
                        <li>人力资源档案变更</li>
                    </a>
                    <a href = "pages/archive/delete.jsp">
                        <li>人力资源档案删除</li>
                    </a>
                </ul>
            </li>

            <li class = "boa">
                <h2>薪酬标准管理</h2>
                <ul class = "box box2">
                    <a href = "javascript:void(0)">
                        <li>薪酬标准登记</li>
                    </a>
                    <a href = "javascript:void(0)">
                        <li>薪酬标准变更</li>
                    </a>
                    <a href = "javascript:void(0)">
                        <li>薪酬标准复核</li>
                    </a>
                </ul>
            </li>

            <li class = "boa">
                <h2>薪酬发放管理</h2>
                <ul class = "box box3">
                    <a href = "javascript:void(0)">
                        <li>薪酬发放登记</li>
                    </a>
                    <a href = "javascript:void(0)">
                        <li>薪酬发放复核</li>
                    </a>
                </ul>
            </li>

            <li class = "user">
                <c:if test = "${!empty sessionScope.user}">
                    ${sessionScope.user.username}，你好
                    <a href="user/logout">注销</a>
                </c:if>
            </li>

        </ul>
    </div>

</nav>