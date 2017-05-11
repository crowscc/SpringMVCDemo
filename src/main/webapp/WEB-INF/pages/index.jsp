<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Date" %>
<%@ page import="java.lang.*" %>
<%@ page import="java.sql.Timestamp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC Demo 首页</title>
    <link href="../style/css/st.css" rel="stylesheet" />
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/    html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<jsp:include page="head.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <!-- 文章区 -->
            <div class="row">
                <div class="page-header">
                    <h1>日记<small>__过往</small></h1>
                </div>
                <div class="col-md-12">
                    <c:forEach items="${blogList}" var ="blog">
                        <c:set var="date" value="${blog.pubDate}" scope="application"></c:set>
                        <%
                            Timestamp date = (Timestamp) application.getAttribute("date");
                            String[] info = date.toString().split(" ");
                            String[] NYR = info[0].split("-");
                            String[] SJ = info[1].split(":");
                        %>
                        <div class="col-md-1">
                            <!--时间-->
                            <div class="date"><span><%=NYR[1]%></span><%=NYR[2]%></div>
                        </div>
                        <div class="col-md-11">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="col-lg-12" >

                                        <div class="note_content">${blog.content}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div>
        <div class="col-md-4">日期区</div>
    </div>
</div>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>