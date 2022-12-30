
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<html>
<head>
    <title>登记</title>
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
            background-color: rgb(94, 254, 244);
        }

        .main p {
            margin-bottom: 10px;
        }

        .main .btn {
            text-align: right;
            margin-bottom: 10px;
        }

        .main .btn input {
            width: 60px;
            height: 30px;
            font-size: 17px;
        }

        .main table {
            border-collapse: collapse;
        }

        .main table tr td {
            border: 2px #000000 solid;
            background-color: #4cfa65;
        }

        .main .second-op, .main .third-op, .main .job-op {
            display: none;
        }

        .main table textarea {
            font-size: 15px;
            font-family: "Microsoft YaHei UI";
        }

    </style>

</head>

<body onload = "startTime()">

<%@ include file = "/pages/common/navi.jsp" %>

<div class = "main">
    <p>您正在做的业务是：人力资源>>人力资源档案管理>>人力资源档案登记</p>

    <form action = "userInfo/register" method = "post">
        <table>
            <tr>
                <td style = "width: 120px">I级机构</td>
                <td style = "width: 180px">
                    <select id = "first" name = "first_mechaId" onchange = "changeSecond()"
                            style = "width: 100%; height: 25px">
                        <option>请选择</option>
                        <option value = "1">集团</option>
                    </select>
                </td>

                <td style = "width: 120px">II级机构</td>
                <td style = "width: 180px">
                    <select id = "second" name = "second_mechaId" onchange = "changeThird()"
                            style = "width: 100%; height: 25px">
                        <option value = "0">请选择</option>
                        <option value = "1" class = "second-op">软件公司</option>
                        <option value = "2" class = "second-op">生物科技公司</option>
                    </select>
                </td>

                <td style = "width: 120px">III级机构</td>
                <td style = "width: 180px">
                    <select id = "third" name = "third_mechaId" style = "width: 100%; height: 25px">
                        <option value = "0">请选择</option>
                        <option value = "1" class = "third-op">外包组</option>
                        <option value = "2" class = "third-op">测试组</option>
                        <option value = "3" class = "third-op">开发组</option>
                        <option value = "4" class = "third-op">外包组</option>
                        <option value = "5" class = "third-op">测试组</option>
                        <option value = "6" class = "third-op">开发组</option>
                    </select>
                </td>

                <td style = "width: 120px">建档时间</td>
                <td style = "width: 178px">
                    <span id = "time" style = "height: 25px"></span>
                </td>

            </tr>

            <tr>
                <td>职位分类</td>
                <td>
                    <select id = "job_cla" name = "job_classId" onchange = "changeJob()"
                            style = "width: 100%; height: 25px">
                        <option>请选择</option>
                        <option value = "1">系统类</option>
                        <option value = "2">安全类</option>
                        <option value = "3">维护类</option>
                        <option value = "4">管理类</option>
                        <option value = "5">测试类</option>
                        <option value = "6">销售类</option>
                    </select>
                </td>

                <td>职位名称</td>
                <td>
                    <select id = "job" name = "jobId" style = "width: 100%; height: 25px">
                        <option value = "0">请选择</option>
                        <option value = "1" class = "job-op">软件设计师</option>
                        <option value = "2" class = "job-op">软件分析师</option>
                        <option value = "3" class = "job-op">信息安全工程师</option>
                        <option value = "4" class = "job-op">运维工程师</option>
                        <option value = "5" class = "job-op">项目经理</option>
                        <option value = "6" class = "job-op">软件架构师</option>
                        <option value = "7" class = "job-op">数据库管理员</option>
                        <option value = "8" class = "job-op">测试工程师</option>
                        <option value = "9" class = "job-op">销售经理</option>
                        <option value = "10" class = "job-op">销售助理</option>
                    </select>
                </td>

                <td>职称</td>
                <td>
                    <select name = "ptId" style = "width: 100%; height: 25px">
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
                    <select name = "majorId" style = "width: 100%; height: 25px">
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
                    <input type = "text" name = "name" style = "width: 100%; height: 25px">
                </td>

                <td>性别</td>
                <td>
                    <select name = "gender" style = "width: 100%; height: 25px">
                        <option>请选择</option>
                        <option value = "男">男</option>
                        <option value = "女">女</option>
                    </select>
                </td>

                <td>身份证号码</td>
                <td>
                    <input type = "text" name = "IDCard" style = "width: 100%; height: 25px">
                </td>

                <td>民族</td>
                <td>
                    <select name = "nationId" style = "width: 100%; height: 25px">
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
                    <select name = "salaryId" style = "width: 100%; height: 25px">
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
                    <input type = "text" name = "bank" style = "width: 100%; height: 25px">
                </td>

                <td>账号</td>
                <td>
                    <input type = "text" name = "bank_card" style = "width: 100%; height: 25px">
                </td>

                <td>登记人</td>
                <td>
                    <input type = "text" name = "registrar" value = "admin" style = "width: 100%; height: 25px">
                </td>
            </tr>

            <tr>
                <td>年龄</td>
                <td>
                    <input type = "text" name = "age" style = "width: 100%; height: 25px">
                </td>

                <td>学历</td>
                <td>
                    <select name = "educationId" style = "width: 100%; height: 25px">
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
                    <input type = "text" name = "email" style = "width: 100%; height: 25px">
                </td>

            </tr>

            <tr>
                <td>住址</td>
                <td colspan = "3">
                    <input type = "text" id = "address" name = "address" style = "width: 100%; height: 25px">
                </td>

                <td>手机</td>
                <td colspan = "3">
                    <input type = "text" name = "mobilephone" style = "width: 100%; height: 25px">
                </td>

            </tr>

            <tr>
                <td>个人履历</td>
                <td colspan = "7" style = "width: 1000px">
                    <textarea name = "resume" style = "width: 100%; height: 60px; resize: none"></textarea>
                </td>
            </tr>

            <tr>
                <td>家庭关系信息</td>
                <td colspan = "7">
                    <textarea name = "family_relation" style = "width: 100%; height: 60px; resize: none"></textarea>
                </td>
            </tr>

            <tr>
                <td>备注</td>
                <td colspan = "7">
                    <textarea name = "remarks" style = "width: 100%; height: 60px; resize: none"></textarea>
                </td>
            </tr>

            <div class = "btn">
                <input type = "submit" value = "提交">
                <input type = "reset" value = "清除">
            </div>

        </table>
    </form>
</div>

<script>
    function changeSecond()
    {
        var second = $('.second-op');
        var third = $('.third-op');
        if ($('#first option:selected').val() == 1)
        {
            $('#second').val(0);
            $('#third').val(0);
            second[0].style.display = "block";
            second[1].style.display = "block";

            third[0].style.display = "none";
            third[1].style.display = "none";
            third[2].style.display = "none";
            third[3].style.display = "none";
            third[4].style.display = "none";
            third[5].style.display = "none";
        }
        else
        {
            $('#second').val(0);
            $('#third').val(0);
            second[0].style.display = "none";
            second[1].style.display = "none";

            third[0].style.display = "none";
            third[1].style.display = "none";
            third[2].style.display = "none";
            third[3].style.display = "none";
            third[4].style.display = "none";
            third[5].style.display = "none";
        }
    }

    function changeThird()
    {
        var third = $('.third-op');
        if ($('#second option:selected').val() == 1)
        {
            $('#third').val(0);
            third[0].style.display = "block";
            third[1].style.display = "block";
            third[2].style.display = "block";
            third[3].style.display = "none";
            third[4].style.display = "none";
            third[5].style.display = "none";
        }
        else if ($('#second option:selected').val() == 2)
        {
            $('#third').val(0);
            third[0].style.display = "none";
            third[1].style.display = "none";
            third[2].style.display = "none";
            third[3].style.display = "block";
            third[4].style.display = "block";
            third[5].style.display = "block";
        }
        else
        {
            $('#third').val(0);
            third[0].style.display = "none";
            third[1].style.display = "none";
            third[2].style.display = "none";
            third[3].style.display = "none";
            third[4].style.display = "none";
            third[5].style.display = "none";
        }
    }

    function changeJob()
    {
        var job = $('.job-op');
        if ($('#job_cla option:selected').val() == 1)
        {
            $('#job').val(0);
            job[0].style.display = "block";
            job[1].style.display = "block";
            job[2].style.display = "none";
            job[3].style.display = "none";
            job[4].style.display = "none";
            job[5].style.display = "none";
            job[6].style.display = "none";
            job[7].style.display = "none";
            job[8].style.display = "none";
            job[9].style.display = "none";
        }
        else if ($('#job_cla option:selected').val() == 2)
        {
            $('#job').val(0);
            job[0].style.display = "none";
            job[1].style.display = "none";
            job[2].style.display = "block";
            job[3].style.display = "none";
            job[4].style.display = "none";
            job[5].style.display = "none";
            job[6].style.display = "none";
            job[7].style.display = "none";
            job[8].style.display = "none";
            job[9].style.display = "none";
        }
        else if ($('#job_cla option:selected').val() == 3)
        {
            $('#job').val(0);
            job[0].style.display = "none";
            job[1].style.display = "none";
            job[2].style.display = "none";
            job[3].style.display = "block";
            job[4].style.display = "none";
            job[5].style.display = "none";
            job[6].style.display = "none";
            job[7].style.display = "none";
            job[8].style.display = "none";
            job[9].style.display = "none";
        }
        else if ($('#job_cla option:selected').val() == 4)
        {
            $('#job').val(0);
            job[0].style.display = "none";
            job[1].style.display = "none";
            job[2].style.display = "none";
            job[3].style.display = "none";
            job[4].style.display = "block";
            job[5].style.display = "block";
            job[6].style.display = "block";
            job[7].style.display = "none";
            job[8].style.display = "none";
            job[9].style.display = "none";
        }
        else if ($('#job_cla option:selected').val() == 5)
        {
            $('#job').val(0);
            job[0].style.display = "none";
            job[1].style.display = "none";
            job[2].style.display = "none";
            job[3].style.display = "none";
            job[4].style.display = "none";
            job[5].style.display = "none";
            job[6].style.display = "none";
            job[7].style.display = "block";
            job[8].style.display = "none";
            job[9].style.display = "none";
        }
        else if ($('#job_cla option:selected').val() == 6)
        {
            $('#job').val(0);
            job[0].style.display = "none";
            job[1].style.display = "none";
            job[2].style.display = "none";
            job[3].style.display = "none";
            job[4].style.display = "none";
            job[5].style.display = "none";
            job[6].style.display = "none";
            job[7].style.display = "none";
            job[8].style.display = "block";
            job[9].style.display = "block";
        }
        else
        {
            $('#job').val(0);
            job[0].style.display = "none";
            job[1].style.display = "none";
            job[2].style.display = "none";
            job[3].style.display = "none";
            job[4].style.display = "none";
            job[5].style.display = "none";
            job[6].style.display = "none";
            job[7].style.display = "none";
            job[8].style.display = "none";
            job[9].style.display = "none";
        }
    }

    function startTime()
    {
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

</script>

</body>
</html>
