<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>操作成功</title>
    <%@ include file="../pages/base/basePath.jsp" %>

    <style type="text/css">
        .success {
            width: 1200px;
            height: 500px;
            margin: 7% auto;
            text-align: center;
            border: 1px solid #000000;
            font-size: 30px;
            background-color: rgb(51, 252, 254);
        }

        .success p {
            margin-top: 17%;
        }

        .success a {
            color: #ff0300;
        }
    </style>

</head>

<body>
<div class="success">
    <c:if test="${!empty addSuccess}">
        <p>添加成功！<a href="${pageContext.request.contextPath}/salInfo/code">返回</a></p>
    </c:if>

    <c:if test="${!empty checkSuccess}">
        <p>复核成功！<a href="salInfo/check">返回</a></p>
    </c:if>

    <c:if test="${!empty updateSuccess}">
        <p>更新成功！<a href="salInfo/update">返回查询页面</a></p>
    </c:if>

    <c:if test="${!empty deleteSuccess}">
        <p>更新成功！<a href="pages/archive/delete.jsp">返回查询页面</a></p>
    </c:if>

    <c:if test="${!empty recoverSuccess}">
        <p>恢复成功！<a href="pages/archive/delete.jsp">返回查询页面</a></p>
    </c:if>

    <c:if test="${!empty sigUpSuccess}">
        <p>注册成功！<a href="index.jsp">返回登录页面</a></p>
    </c:if>

</div>
</body>

</html>
