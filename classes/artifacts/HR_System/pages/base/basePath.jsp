<%--
  Created by IntelliJ IDEA.
  User: weiyinglin
  Date: 2022/12/24 0024
  Time: 8:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" isELIgnored = "false" language = "java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<%
    String basePath = request.getScheme()
            + "://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/";

    pageContext.setAttribute("basePath", basePath);

%>
<%--<% System.out.println(basePath); %>--%>
<base href = "<%=basePath%>">
<script type = "text/javascript" src = "static/script/jquery-1.7.2.js"></script>
