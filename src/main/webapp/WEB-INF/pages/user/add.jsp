<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>SpringMVC Demo 首页</title>
    <script src="../style/js/clock.js"></script>
    <link href="../style/css/st.css" rel="stylesheet" />
    <!-- 新 Bootstrap 核心 CSS 文件 -->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="//cdn.bootcss.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<jsp:include page="../head.jsp" />
<div class="container">
    <div class="row">
        <div class="col-md-8">
            <div class="page-header text-center">
                <h1><small>
                    <div id="clock">
                        <script language="javascript">showtime();</script>
                    </div>
                </small></h1>
            </div>
            <!-- 写文章 -->
            <form role="form" action="/addN" method="post" commandName="blog">
                <div class="form-group">
                    <label>日记</label>
                    <label>${sessionScope.username.id}</label>
                    <textarea class="form-control" rows="10" name="content"></textarea>
                </div>
                <div>
                    <input type="hidden" name="userByUserId.id" value=${sessionScope.username.id}>
                    <!--<input type="hidden" name="pubDate" value="2015-03-19">-->
                    <button class="btn btn-default" type="submit">写完啦</button>
                </div>
            </form>
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