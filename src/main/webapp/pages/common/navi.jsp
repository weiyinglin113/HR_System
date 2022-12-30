<%--
  Created by IntelliJ IDEA.
  User: 月が綺麗
  Date: 2020/12/26 0026
  Time: 23:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    a {
        text-decoration: none;
    }

    ul {
        list-style: none;
    }


    .wrap {
        width: 1200px;
        margin: 0 auto;
    }

    .menu a {
        color: #2d3436;
    }

    .menu > li {
        float: left;
        height: 60px;
        text-align: center;
        line-height: 60px;
        background-color: #4e76ff;
        transition: .4s;
    }

    .menu li a h2:hover {
        color: white;
    }

    .menu .index {
        width: 160px;
    }

    .menu .boa {
        width: 280px;
        padding: 0 30px;
    }

    .menu .user {
        width: 200px;
        font-size: 16px;
    }

    .menu .boa h2:hover {
        color: white;
    }


    .boa .box1 {
        display: none;
    }

    .boa .box2 {
        display: none;
    }

    .boa .box3 {
        display: none;
    }

    @keyframes move1 {

        /*设置animation动画参数*/
        0% {
            /*动画开始时*/
            height: 0px;
        }

        100% {
            /*动画结束时*/
            height: 250px
        }
    }

    @keyframes move2 {

        /*设置animation动画参数*/
        0% {
            /*动画开始时*/
            height: 0px;
        }

        100% {
            /*动画结束时*/
            height: 200px
        }
    }



    .boa:hover .box1 {
        display: block;
        height: 250px;
        background-color: #4e76ff;
        animation: move1 1s ease backwards;
    }

    .boa:hover .box2 {
        display: block;
        height: 200px;
        background-color: #4e76ff;
        animation: move2 1s ease backwards;
    }

    .boa:hover .box3 {
        display: block;
        height: 200px;
        background-color: #4e76ff;
        animation: move2 1s ease backwards;
    }

    .menu .box li:hover {
        color: white;
    }

    .box {
        overflow: hidden;
        transition: .5s;
        left: 20px;
        background-color: #4e76ff;
    }

    .box li {
        height: 50px;
        text-align: center;
        line-height: 50px;
        font-size: 18px;
    }

    .clearfix:after {
        content: '';
        display: block;
        clear: both;
    }

    .user a:hover {
        color: white;
    }

</style>
<nav>
    <div class="wrap">
        <ul class="menu clearfix">
            <li class="index"><a href="pages/user/index.jsp"><h2>首页</h2></a></li>

            <li class="boa">
                <h2>资源档案管理</h2>
                <ul class="box box1">
                    <a href="archive/register.jsp">
                        <li>人力资源档案登记</li>
                    </a>
                    <a href="userInfo/check">
                        <li>人力资源档案复核</li>
                    </a>
                    <a href="archive/query.jsp">
                        <li>人力资源档案查询</li>
                    </a>
                    <a href="archive/update.jsp">
                        <li>人力资源档案变更</li>
                    </a>
                    <a href="archive/delete.jsp">
                        <li>人力资源档案删除</li>
                    </a>
                </ul>
            </li>

            <li class="boa">
                <h2>薪酬标准管理</h2>
                <ul class="box box2">
                    <a href="${pageContext.request.contextPath}/salInfo/code">
                        <li>薪酬标准登记</li>
                    </a>
                    <a href="salInfo/check">
                        <li>薪酬标准复核</li>
                    </a>

                    <a href="salarysystem/salaryquery.jsp">
                        <li>薪酬标准查询</li>
                    </a>
                    <a href="salInfo/update">
                        <li>薪酬标准变更</li>
                    </a>
                </ul>
            </li>

            <li class="boa">
                <h2>薪酬发放管理</h2>
                <ul class="box box3">
                    <a href="salarysystem/paymentregister.jsp">
                        <li>薪酬发放登记</li>
                    </a>
                    <a href="salarysystem/paymentcheckone.jsp">
                        <li>薪酬发放复核</li>
                    </a>
                    <a href="salarysystem/paymentquery.jsp">
                        <li>薪资发放查询</li>
                    </a>
                    <a href="salarysystem/showpaymentinfo.jsp">
                        <li>薪资付款</li>
                    </a>
                </ul>
            </li>

            <li class="user">
                <c:if test="${!empty sessionScope.user}">
                    ${sessionScope.user.username}，你好
                    <a href="user/logout">注销</a>
                </c:if>
            </li>

        </ul>
    </div>

</nav>