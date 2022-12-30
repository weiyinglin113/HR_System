
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<html>
<head>
    <title>Title</title>
    <%@ include file = "../base/basePath.jsp" %>
    <link href = "static/css/navigation.css" rel = "stylesheet" type = "text/css">

    <style type = "text/css">
        nav {
            position: relative;
            z-index: 999;
        }

        .mainbody {
            text-align: center;
            width: 1200px;
            height:400px;
            margin: 60px auto;
            font-size: 80px;
            background-color: rgb(94, 254, 244);
        }

        .mainbody p{
            color:black;
            line-height: 400px;

        }

        @keyframes masked-animation {
            0% {
                background-position: 0 0;
            }
            100% {
                background-position: -100% 0;
            }
        }

        .mainbody .welcome p {
            margin-top: 17%;
        }

    </style>

    <script type = "text/javascript">
        $(function ()
        {
            if (${empty sessionScope.user})
            {
                window.location.href = "index.jsp"
            }
        });
    </script>

</head>

<body>

<%@ include file = "/pages/common/navi.jsp" %>

<div class = "mainbody">
    <p>人力资源管理系统</p>
</div>

</body>
</html>
