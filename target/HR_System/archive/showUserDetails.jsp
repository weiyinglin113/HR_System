
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<html>
<head>
    <title>查看详细信息</title>
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

        .main table {
            margin: 0 auto;
            border-collapse: collapse;
        }

        .main table tr td {
            border: 2px #000000 solid;
            background-color: #4cfa65;
        }

        .main .btn {
            text-align: right;
            margin-bottom: 10px;
        }

        .main .btn input {
            font-size: 17px;
        }

    </style>

</head>

<body onload = "message()">

<%@ include file = "/pages/common/navi.jsp" %>

<div class = "main">
    <p>您正在做的业务是：人力资源>>人力资源档案管理>>人力资源档案查询</p>
    <div class = "btn">
        <input type = "button" value = "返回" onclick = "back()" style = "width: 60px; height: 30px">
    </div>
    <table>
        <tr>
            <td style = "height: 25px">档案编号</td>
            <td colspan = "7">
                ${userInfo.archiveId}
            </td>
        </tr>

        <tr>
            <td style = "width: 120px; height: 25px">I级机构</td>
            <td style = "width: 180px">
                ${InfoList.get(0)}
            </td>

            <td style = "width: 120px">II级机构</td>
            <td style = "width: 180px">
                ${InfoList.get(1)}
            </td>

            <td style = "width: 120px">III级机构</td>
            <td style = "width: 180px">
                ${InfoList.get(2)}
            </td>

            <td style = "width: 120px">建档时间</td>
            <td style = "width: 178px">
                ${userInfo.create_archive_time}
            </td>

        </tr>

        <tr>
            <td style = "height: 25px">职位分类</td>
            <td>
                ${InfoList.get(3)}
            </td>

            <td>职位名称</td>
            <td>
                ${InfoList.get(4)}
            </td>

            <td>职称</td>
            <td>
                ${InfoList.get(5)}
            </td>

            <td>学历专业</td>
            <td>
                ${InfoList.get(6)}
            </td>

        </tr>

        <tr>
            <td style = "height: 25px">姓名</td>
            <td>
                ${userInfo.name}
            </td>

            <td>性别</td>
            <td>
                ${userInfo.gender}
            </td>

            <td>身份证号码</td>
            <td>
                ${userInfo.IDCard}
            </td>

            <td>民族</td>
            <td>
                ${InfoList.get(7)}
            </td>

        </tr>

        <tr>
            <td style = "height: 25px">薪酬标准</td>
            <td>
                ${InfoList.get(8)}
            </td>

            <td>开户行</td>
            <td>
                ${userInfo.bank}
            </td>

            <td>账号</td>
            <td>
                ${userInfo.bank_card}
            </td>

            <td>登记人</td>
            <td>
                ${userInfo.registrar}
            </td>
        </tr>

        <tr>
            <td style = "height: 25px">年龄</td>
            <td>
                ${userInfo.age}
            </td>

            <td>学历</td>
            <td>
                ${InfoList.get(9)}
            </td>

            <td>EMAIL</td>
            <td colspan = "3">
                ${userInfo.email}
            </td>

        </tr>

        <tr>
            <td style = "height: 25px">住址</td>
            <td colspan = "3">
                ${userInfo.address}
            </td>

            <td>手机</td>
            <td colspan = "3">
                ${userInfo.mobilephone}
            </td>

        </tr>

        <tr>
            <td style = "height: 60px">个人履历</td>
            <td colspan = "7" style = "width: 1000px">
                ${userInfo.resume}
            </td>
        </tr>

        <tr>
            <td style = "height: 60px">家庭关系信息</td>
            <td colspan = "7">
                ${userInfo.family_relation}
            </td>
        </tr>

        <tr>
            <td style = "height: 60px">备注</td>
            <td colspan = "7">
                ${userInfo.remarks}
            </td>
        </tr>

<%--       如果为delete,说明是删除页面发过来的请求,删除  --%>
        <c:if test = '${message.equals("delete")}'>
            <div class = "btn">
                <input type = "button" value = "删除" onclick = "action('delete')" style = "width: 60px; height: 30px">
            </div>
        </c:if>
        <%--       如果为delete,说明是删除页面发过来的请求,恢复  --%>
        <c:if test = '${message.equals("recover")}'>
            <div class = "btn">
                <input type = "button" value = "恢复" onclick = "action('recover')" style = "width: 60px; height: 30px">
            </div>
        </c:if>

    </table>
</div>

<script type = "text/javascript">
    function back()
    {
        window.location.href = "userInfo/queryUser";
    }
    function message()
    {
        if (${empty message})
        {
            $('.main p').css('margin-bottom','70px');
        }
        else
        {
            $('.main p').css('margin-bottom','40px');
        }
    }

    function action(message)
    {
        if (message == "delete")
        {
            window.location.href = "userInfo/deleteUserInfo?archiveId=${userInfo.archiveId}";
        }
        else
        {
            window.location.href = "userInfo/recoverUserInfo?archiveId=${userInfo.archiveId}";
        }
    }

</script>

</body>
</html>
