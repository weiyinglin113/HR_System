<%@ page contentType="text/html;charset=UTF-8" language="java" autoFlush="false" buffer="300kb" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>薪资标准复核</title>
    <%@ include file="../pages/base/basePath.jsp" %>
    <link href="../static/css/navigation.css" rel="stylesheet" type="text/css">

    <style type="text/css">
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
            text-align: center;
        }

        .main table tr td {
            border: 2px #000000 solid;
            background-color: #98F6C7;
        }

        /*#4cfa65*/
        .main .second-op, .main .third-op, .main .job-op {
            display: none;
        }

        .main table textarea {
            font-size: 15px;
            font-family: "Microsoft YaHei UI";
        }

        .main table tr td input {
            border: none;
        }
    </style>

</head>

<body onload="startTime();checkOption()">

<%@ include file="/pages/common/navi.jsp" %>

<div class="main">
    <p>您正在做的业务是：人力资源>>薪资标准管理>>薪资标准复核</p>

    <form action="salInfo/passCheck" method="post">
        <table>
            <%--            <tr>onchange="changeSecond()--%>
            <%--                薪资标准编号--%>
            <tr>
                <td style="width: 170px">薪酬标准编号</td>
                <td style="width: 230px">
                    <input type="text" id="salaryId" name="salaryId" value="${salInfo.salaryId}"
                           readonly="readonly"
                           style="width: 100%; height: 25px ;text-align: center;">
                </td>
                <%--薪资标准名称--%>
                <td style="width: 170px">薪酬标准名称</td>
                <td style="width: 230px">
                    <input type="text" id="second" name="salaryname" readonly="readonly" value="${salInfo.salaryname}"
                           style="width: 100%; height: 25px ;text-align: center;">
                </td>

                <%--薪资金额--%>
                <td style="width: 170px ">薪酬金额(<span style="color: red">￥</span>)</td>
                <td style="width: 230px">
                    <input type="text" id="salaryamount" name="salaryamount" readOnly=readOnly
                           value="${salInfo.salaryamount}"
                           style="width: 100%; height: 25px ;text-align: center; color: black">
                </td>
            </tr>

            <%--                制订人--%>
            <tr>
                <td style="width: 170px">制定人</td>
                <td style="width: 230px">
                    <input type="text" name="enacters" required="required" maxLength={6} value="${salInfo.enacters}"
                           placeholder="请输入" readonly="readonly"
                           style="width: 100%; height: 25px;text-align: center;" onkeydown="keydown()">
                </td>
                <%--登记人--%>
                <td style="width: 170px">登记人</td>
                <td style="width: 230px">
                    <input type="text" name="registrar" readonly="readonly"
                           required="required" value="${salInfo.registrar}"
                           style="width: 100%; height: 25px;text-align: center;">
                </td>
                <%--登记时间--%>
                <td style="width: 170px"> 登记时间</td>
                <td id="time" name="register_time" style="width: 230px ;background-color:white;height: 25px;">
                    <fmt:formatDate value="${salInfo.register_time}" pattern="yyyy-MM-dd HH:mm:ss"/></td>

                </td>
            </tr>
            <%--                复核意见--%>
            <tr>
                <td style="width: 170px">复核意见</td>
                <td style="width: 1030px" colspan="5">
                <textarea name="advice" required="required"  maxlength="30"
                          placeholder="请输入"
                          style="width: 100%; height: 60px;text-align: left;font-family: 楷体;resize: none;font-size: 18px;"
                          onkeydown="keydown()">

                    </textarea>
                </td>
            </tr>


            <%--                序号--%>
            <tr>
                <td colspan="2">序号</td>

                <%--薪酬项目名称--%>
                <td colspan="2">薪资项目名称<span
                        style="font-size:10px ;color: red ;font-family: 方正少儿简体; ">（三险一金根据计算基本工资自动得出）</span></td>

                <%--金额--%>
                <td colspan="2">金额(<span style="color: red">￥</span>)</td>
            </tr>
            <%--基本工资--%>
            <tr>
                <td colspan="2">1</td>
                <td colspan="2">
                    基本工资
                </td>
                <td colspan="2"><input type="text" id="basicsalary" name="basicsalary" required="required"
                                       readonly="readonly"
                                       value="${salInfo.basicsalary}"
                                       onchange="setsal(this);" onfocus="benull_b()" onkeydown="keydown(event)"
                                       style="width: 100%; height: 25px;background-color: #98F6C7 ;text-align: center; color: black">
                </td>
            </tr>
            <%--交通补助--%>
            <tr>
                <td colspan="2">2</td>
                <td colspan="2">
                    交通补助
                </td>
                <td colspan="2"><input id="Transportation_sal" type="text" name="Transportation_sal" required="required"
                                       readonly="readonly"
                                       value="${salInfo.transportation_sal}"
                                       style="width: 100%; height: 25px;background-color: #98F6C7 ;text-align: center; color: black">
                </td>
            </tr>
            <%--年薪补助--%>
            <tr>
                <td colspan="2">3</td>
                <td colspan="2">
                    年薪补助
                </td>
                <td colspan="2"><input id="Yeal_end_sal" type="text" name="Year_end_sal" required="required"
                                       readonly="readonly"
                                       value="${salInfo.year_end_sal}"
                                       style="width: 100%; height: 25px ;background-color: #98F6C7 ;text-align: center;color: black">
                </td>
            </tr>
            <%--通信补助--%>
            <tr>
                <td colspan="2">4</td>
                <td colspan="2">
                    通信补助
                </td>
                <td colspan="2"><input id="phone_sal" type="text" name="phone_sal" readonly="readonly"
                                       value="${salInfo.phone_sal}"
                                       style="width: 100%; height: 25px ;background-color: #98F6C7 ;text-align: center; color: black">
                </td>
            </tr>
            <%--养老保险--%>
            <tr>
                <td colspan="2">5</td>
                <td colspan="2">
                    养老保险
                </td>
                <td colspan="2">
                    <input type="text" id="oldAge_sal" name="oldAge_sal" readOnly=readOnly
                           value="${salInfo.oldAge_sal}"
                           style="width: 100%; height: 25px ;background-color: #98F6C7 ;text-align: center;color: black">
                </td>
            </tr>
            <%--失业保险--%>
            <tr>
                <td colspan="2">6</td>
                <td colspan="2">
                    失业保险
                </td>
                <td colspan="2"><input type="text" id="unemployment_sal" name="unemployment_sal" readOnly=readOnly
                                       value="${salInfo.unemployment_sal}"
                                       style="width: 100%; height: 25px ;background-color: #98F6C7 ;text-align: center; color: black">
                </td>
            </tr>
            <%--            医疗保险--%>
            <tr>
                <td colspan="2">7</td>
                <td colspan="2">
                    医疗保险
                </td>
                <td colspan="2"><input type="text" id="health_sal" name="health_sal" readOnly=readOnly
                                       value="${salInfo.health_sal}"
                                       style="width: 100%; height: 25px ;background-color: #98F6C7;text-align: center;color: black">
                </td>
            </tr>
            <%--            住房公积金--%>
            <tr>
                <td colspan="2">8</td>
                <td colspan="2">
                    住房公积金
                </td>
                <td colspan="2"><input id="housing_sal" type="text" name="housing_sal" readOnly=readOnly
                                       value="${salInfo.housing_sal}"
                                       style="width: 100%; height: 25px;background-color: #98F6C7;text-align: center; color: black">
                </td>
            </tr>

            <div class="btn">
                <input type="submit" value="复核通过" style="width: 120px; height: 30px">
                <input type="button" value="返回" onclick="back()" style="width: 60px; height: 30px">
            </div>

        </table>
    </form>
</div>
<!--[if lt IE 9]>
<script type="text/javascript">
    jQuery(function ($) {
        var el;
        $("select").each(function () {
            el = $(this);
            el.data("origWidth", el.css("width"));
            // el.data("oriWidth",85);
        })
                .focusin(function () {
                    el = $(this);
                    el.css("width", "auto");

                    //if(el.width() < el.data("oriWidth")){
                    //    el.css("width", el.data("origWidth"));
                    //}

                })
                .bind("blur change ", function () {
                    el = $(this);
                    el.css("width", el.data("origWidth"));
                });
    });
</script>
<![endif]-->
<script>
    function back() {
        window.location.href = "salInfo/check";
    }

    function keydown(event) {
        if (event.key === 'Enter') {
            event.preventDefault();
        }
    }

</script>

</body>
</html>
