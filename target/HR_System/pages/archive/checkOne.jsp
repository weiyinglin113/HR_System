<%--
  Created by IntelliJ IDEA.
  User: 月が綺麗
  Date: 2020/12/26 0026
  Time: 22:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<html>
<head>
    <title>复核</title>
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
            background-color: rgb(51, 252, 254);
        }

        .main p {
            margin-bottom: 10px;
        }

        .main .btn {
            text-align: right;
            margin-bottom: 10px;
        }

        .main .btn input {
            font-size: 17px;
        }

        .main table {
            border: 1px black solid;
            border-collapse: collapse;
        }

        .main table tr td {
            border: 2px #000000 solid;
            background-color: #4cfa65;
        }

        .main table textarea {
            font-size: 15px;
            font-family: "Microsoft YaHei UI";
        }

    </style>

</head>

<body onload = "startTime(); checkOption()">

<%@ include file = "/pages/common/navi.jsp" %>

<div class = "main">
    <p>您正在做的业务是：人力资源>>人力资源档案管理>>人力资源档案复核</p>

    <form action = "userInfo/passCheck" method = "post">
        <table>
            <tr>
                <td style = "height: 25px">档案编号</td>
                <td colspan = "7">
                    ${userInfo.archiveId}
                    <input type = "hidden" name = "archiveId" value = "${userInfo.archiveId}">
                </td>
            </tr>

            <tr>
                <td style = "width: 120px; height: 25px">I级机构</td>
                <td style = "width: 180px">
                    ${InfoList.get(0)}
                    <input type = "hidden" name = "first_mechaId" value = "${userInfo.first_mechaId}">
                </td>

                <td style = "width: 120px">II级机构</td>
                <td style = "width: 180px">
                    ${InfoList.get(1)}
                    <input type = "hidden" name = "second_mechaId" value = "${userInfo.second_mechaId}">
                </td>

                <td style = "width: 120px">III级机构</td>
                <td style = "width: 180px">
                    ${InfoList.get(2)}
                    <input type = "hidden" name = "third_mechaId" value = "${userInfo.third_mechaId}">
                </td>

                <td style = "width: 120px">复核时间</td>
                <td style = "width: 178px">
                    <span id = "time" style = "height: 25px"></span>
                    <input type = "hidden" name = "create_archive_time" value = "${userInfo.create_archive_time}">
                </td>

            </tr>

            <tr>
                <td>职位分类</td>
                <td>
                    ${InfoList.get(3)}
                    <input type = "hidden" name = "job_classId" value = "${userInfo.job_classId}">
                </td>

                <td>职位名称</td>
                <td>
                    ${InfoList.get(4)}
                    <input type = "hidden" name = "jobId" value = "${userInfo.jobId}">
                </td>

                <td>职称</td>
                <td>
                    <select name = "ptId" id = "pt" style = "width: 100%; height: 25px">
                        <option>请选择</option>
                        <option value = "1">经理</option>
                        <option value = "2">设计师</option>
                        <option value = "3">工程师</option>
                        <option value = "4">评测师</option>
                        <option value = "5">管理师</option>
                    </select>
                </td>

                <td>学历专业</td>
                <td>
                    <select name = "majorId" id = "major" style = "width: 100%; height: 25px">
                        <option>请选择</option>
                        <option value = "1">软件工程</option>
                        <option value = "2">通信工程</option>
                        <option value = "3">网络工程</option>
                        <option value = "4">信息工程</option>
                        <option value = "5">物联网工程</option>
                        <option value = "6">计算机应用技术</option>
                        <option value = "7">信息与计算科学</option>
                        <option value = "8">计算机科学与技术</option>
                        <option value = "9">信息管理与信息系统</option>
                        <option value = "10">电子信息科学与技术</option>
                        <option value = "11">数据科学与大数据技术</option>
                    </select>
                </td>

            </tr>

            <tr>
                <td>姓名</td>
                <td>
                    <input type = "text" name = "name" value = "${userInfo.name}" style = "width: 100%; height: 25px">
                </td>

                <td>性别</td>
                <td>
                    <select name = "gender" id = "gender" style = "width: 100%; height: 25px">
                        <option>请选择</option>
                        <option value = "男">男</option>
                        <option value = "女">女</option>
                    </select>
                </td>

                <td>身份证号码</td>
                <td>
                    <input type = "text" name = "IDCard" value = "${userInfo.IDCard}"
                           style = "width: 100%; height: 25px">
                </td>

                <td>民族</td>
                <td>
                    <select name = "nationId" id = "nation" style = "width: 100%; height: 25px">
                        <option>请选择</option>
                        <option value = "1">汉</option>
                        <option value = "2">满</option>
                        <option value = "3">回</option>
                        <option value = "4">藏</option>
                        <option value = "5">苗</option>
                        <option value = "6">白</option>
                        <option value = "7">蒙古</option>
                        <option value = "8">高山</option>
                        <option value = "9">撒拉</option>
                        <option value = "10">景颇</option>
                        <option value = "11">维吾尔</option>
                        <option value = "12">哈萨克</option>
                        <option value = "13">塔塔尔</option>
                    </select>
                </td>

            </tr>

            <tr>
                <td>薪酬标准</td>
                <td>
                    <select name = "salaryId" id = "salary" style = "width: 100%; height: 25px">
                        <option>请选择</option>
                        <option value = "1">未定义/0</option>
                        <option value = "2">产品设计师/5000</option>
                        <option value = "3">产品开发师/6000</option>
                        <option value = "4">产品工程师/7000</option>
                        <option value = "5">产品经理/8000</option>
                    </select>
                </td>

                <td>开户行</td>
                <td>
                    <input type = "text" name = "bank" value = "${userInfo.bank}" style = "width: 100%; height: 25px">
                </td>

                <td>账号</td>
                <td>
                    <input type = "text" name = "bank_card" value = "${userInfo.bank_card}"
                           style = "width: 100%; height: 25px">
                </td>

                <td>登记人</td>
                <td>
                    <input type = "text" name = "registrar" value = "admin" style = "width: 100%; height: 25px">
                </td>
            </tr>

            <tr>
                <td>年龄</td>
                <td>
                    <input type = "text" name = "age" value = "${userInfo.age}" style = "width: 100%; height: 25px">
                </td>

                <td>学历</td>
                <td>
                    <select name = "educationId" id = "education" style = "width: 100%; height: 25px">
                        <option>请选择</option>
                        <option value = "1">小学</option>
                        <option value = "2">初中</option>
                        <option value = "3">高中</option>
                        <option value = "4">专科</option>
                        <option value = "5">本科</option>
                        <option value = "6">硕士</option>
                        <option value = "7">博士</option>
                    </select>
                </td>

                <td>EMAIL</td>
                <td colspan = "3">
                    <input type = "text" name = "email" value = "${userInfo.email}" style = "width: 100%; height: 25px">
                </td>

            </tr>

            <tr>
                <td>住址</td>
                <td colspan = "3">
                    <input type = "text" id = "address" name = "address" value = "${userInfo.address}"
                           style = "width: 100%; height: 25px">
                </td>

                <td>手机</td>
                <td colspan = "3">
                    <input type = "text" name = "mobilephone" value = "${userInfo.mobilephone}"
                           style = "width: 100%; height: 25px">
                </td>

            </tr>

            <tr>
                <td>个人履历</td>
                <td colspan = "7" style = "width: 1000px">
                    <textarea name = "resume" id = "resume"
                              style = "width: 100%; height: 60px; resize: none"></textarea>
                </td>
            </tr>

            <tr>
                <td>家庭关系信息</td>
                <td colspan = "7">
                    <textarea name = "family_relation" id = "family_relation"
                              style = "width: 100%; height: 60px; resize: none"></textarea>
                </td>
            </tr>

            <tr>
                <td>备注</td>
                <td colspan = "7">
                    <textarea name = "remarks" id = "remarks"
                              style = "width: 100%; height: 60px; resize: none"></textarea>
                </td>
            </tr>

            <div class = "btn">
                <input type = "submit" value = "复核通过" style = "width: 120px; height: 30px">
                <input type = "reset" value = "清除" style = "width: 60px; height: 30px">
                <input type = "button" value = "返回" onclick = "back()" style = "width: 60px; height: 30px">
            </div>

        </table>
    </form>
</div>

<script>
    function back()
    {
        window.location.href = "userInfo/check";
    }

    function checkOption()
    {
        for (var i = 1; i < 6; i++)
        {
            if ("${userInfo.ptId}" == i)
            {
                // console.log("你妹的" + typeof i.toString());
                $('#pt').val(i);
                break;
            }
        }

        for (var i = 1; i < 12; i++)
        {
            if ("${userInfo.majorId}" == i)
            {
                $('#major').val(i);
                break;
            }
        }

        if ("${userInfo.gender}" == "男")
        {
            $('#gender').val("男");
        }
        else
        {
            $('#gender').val("女");
        }

        for (var i = 1; i < 14; i++)
        {
            if ("${userInfo.nationId}" == i)
            {
                $('#nation').val(i);
                break;
            }
        }

        for (var i = 1; i < 6; i++)
        {
            if ("${userInfo.salaryId}" == i)
            {
                $('#salary').val(i);
                break;
            }
        }

        for (var i = 1; i < 8; i++)
        {
            if ("${userInfo.educationId}" == i)
            {
                $('#education').val(i);
                break;
            }
        }

        $('#resume').val("${userInfo.resume}");
        $('#family_relation').val("${userInfo.family_relation}");
        $('#remarks').val("${userInfo.remarks}");

    }

    function startTime()
    {
        // console.log("你妹的");
        var today = new Date();//定义日期对象
        var yyyy = today.getFullYear();//通过日期对象的getFullYear()方法返回年
        var MM = today.getMonth() + 1;//通过日期对象的getMonth()方法返回年
        var dd = today.getDate();//通过日期对象的getDate()方法返回年
        var hh = today.getHours();//通过日期对象的getHours方法返回小时
        var mm = today.getMinutes();//通过日期对象的getMinutes方法返回分钟
        var ss = today.getSeconds();//通过日期对象的getSeconds方法返回秒
        // 如果分钟或小时的值小于10，则在其值前加0，比如如果时间是下午3点20分9秒的话，则显示15：20：09
        MM = checkTime(MM);
        dd = checkTime(dd);
        hh = checkTime(hh);
        mm = checkTime(mm);
        ss = checkTime(ss);

        $('#time').html(yyyy + "-" + MM + "-" + dd + " " + hh + ":" + mm + ":" + ss);
        setTimeout('startTime()', 1000);//每一秒中重新加载startTime()方法
    }

    function checkTime(i)
    {
        if (i < 10)
        {
            i = "0" + i;
        }
        return i;
    }

    setInterval("startTime()", 100);
</script>

</body>
</html>
