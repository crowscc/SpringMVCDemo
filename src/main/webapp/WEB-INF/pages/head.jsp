<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<nav class="navbar navbar-default">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#defaultNavbar1" aria-expanded="false"><span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span></button>
            <a class="navbar-brand" href="#">吾志</a></div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="defaultNavbar1">
            <ul class="nav navbar-nav">
                <li class="active"><a href="/">首页<span class="sr-only">(current)</span></a></li>
                <li><a href="#">此刻</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="/add">写日记</a></li>
                <li class="dropdown"><a href="" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">设置<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">个人资料设置</a></li>
                        <li><a href="#">修改密码</a></li>
                        <li><a href="#">隐私设置</a></li>
                        <li role="separator" class="divider"></li>
                        <li><a href="/out">退出</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>