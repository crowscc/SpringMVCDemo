<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta charset="utf-8" />
    <title>登录页面</title>

    <meta name="description" content="User login page" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0" />


    <link href="../style/css/st.css" rel="stylesheet" />

    <!-- bootstrap & fontawesome -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/font-awesome/4.2.0/css/font-awesome.min.css" />

    <!-- text fonts -->
    <link rel="stylesheet" href="assets/fonts/fonts.googleapis.com.css" />

    <!-- ace styles -->
    <link rel="stylesheet" href="assets/css/ace.min.css" />
    <link rel="stylesheet" href="assets/css/ace-skins.min.css" />


    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-part2.min.css" />
    <![endif]-->
    <link rel="stylesheet" href="assets/css/ace-rtl.min.css" />

    <!--[if lte IE 9]>
    <link rel="stylesheet" href="assets/css/ace-ie.min.css" />
    <![endif]-->

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <script src="assets/js/ace-extra.min.js"></script>

    <!--[if lt IE 9]>
    <script src="assets/js/html5shiv.min.js"></script>
    <script src="assets/js/respond.min.js"></script>
    <![endif]-->
</head>

<body class="login-layout light-login">
<jsp:include page="head.jsp" />


        <!-- Brand and toggle get grouped for better mobile display -->

<div class="main-container">
    <div class="main-content">
        <div class="col-md-2">
        </div>
        <div class="col-md-4">
            <div class="span6">
                <h2>
                    吾志是一个简单、私密的日记本。
                </h2>

                <div class="reason">
                    <strong>私密</strong> ：完全私密的个人空间，在这里你可以安心的记录最真实的自己。
                </div>
                </br>
                <div class="reason">
                    <strong>简单</strong> ：去繁就简，专注于提供简洁、纯粹的日记功能。
                </div>

            </div>
        </div>
        <div class="col-md-4">
        <div class="row">
            <div class="col-sm-10 col-sm-offset-1">
                <div class="login-container">
                    <div class="center">
                    </div>
                    <div class="space-6"></div>
                    <div class="position-relative">
                        <div id="login-box" class="login-box visible widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header blue lighter bigger">
                                        <i class="ace-icon fa fa-coffee green"></i>
                                        请输入您的信息
                                    </h4>
                                    <div class="space-6"></div>
                                    <form action="/loginU" method="post" commandName="user" name="loginForm" onsubmit="return validateloginForm();">
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" name="username" class="form-control" placeholder="Username" />
															<i class="ace-icon fa fa-user"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" name="password" class="form-control" placeholder="Password" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
                                                <div>${err}</div>
                                            </label>

                                            <div class="space"></div>
                                            <div class="clearfix">
                                                <label class="inline">
                                                    <input type="checkbox" name="remeber" class="ace" />
                                                    <span class="lbl"> 记住登陆</span>
                                                </label>

                                                <button type="submit" class="width-35 pull-right btn btn-sm btn-primary">
                                                    <i class="ace-icon fa fa-key"></i>
                                                    <span class="bigger-110" >登录</span>
                                                </button>
                                            </div>

                                            <div class="space-4"></div>
                                        </fieldset>
                                    </form>

                                </div><!-- /.widget-main -->
                                <div class="toolbar clearfix">
                                    <div>
                                        <a href="#" data-target="#forgot-box" class="forgot-password-link">
                                            <i class="ace-icon fa fa-arrow-left"></i>
                                            忘记密码
                                        </a>
                                    </div>

                                    <div>
                                        <a href="#" data-target="#signup-box" class="user-signup-link">
                                            注册
                                            <i class="ace-icon fa fa-arrow-right"></i>
                                        </a>
                                    </div>
                                </div>
                            </div><!-- /.widget-body -->
                        </div><!-- /.login-box -->

                        <div id="forgot-box" class="forgot-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header red lighter bigger">
                                        <i class="ace-icon fa fa-key"></i>
                                        找回密码
                                    </h4>

                                    <div class="space-6"></div>
                                    <p>
                                        输入您的电子邮件和接收指令
                                    </p>

                                    <form>
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="email" class="form-control" placeholder="Email" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
                                            </label>

                                            <div class="clearfix">
                                                <button type="button" class="width-35 pull-right btn btn-sm btn-danger">
                                                    <i class="ace-icon fa fa-lightbulb-o"></i>
                                                    <span class="bigger-110">发送邮件</span>
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div><!-- /.widget-main -->

                                <div class="toolbar center">
                                    <a href="#" data-target="#login-box" class="back-to-login-link">
                                        返回登录
                                        <i class="ace-icon fa fa-arrow-right"></i>
                                    </a>
                                </div>
                            </div><!-- /.widget-body -->
                        </div><!-- /.forgot-box -->

                        <div id="signup-box" class="signup-box widget-box no-border">
                            <div class="widget-body">
                                <div class="widget-main">
                                    <h4 class="header green lighter bigger">
                                        <i class="ace-icon fa fa-users blue"></i>
                                        用户注册
                                    </h4>

                                    <div class="space-6"></div>
                                    <p>填写信息: </p>

                                    <form action="/registerU" method="post" commandName="user" name="singForm" onsubmit="return validatesingupForm();">
                                        <fieldset>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" id="email" name="email" class="form-control" placeholder="邮箱" />
															<i class="ace-icon fa fa-envelope"></i>
														</span>
                                                <div>${registerEmailErr}</div>
                                            </label>
                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="text" id="nickname" name="nickname" class="form-control" placeholder="昵称" />
															<i class="ace-icon fa fa-user"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" id="password" name="password" class="form-control" placeholder="密码" />
															<i class="ace-icon fa fa-lock"></i>
														</span>
                                            </label>

                                            <label class="block clearfix">
														<span class="block input-icon input-icon-right">
															<input type="password" id="passwordR" class="form-control" placeholder="确认密码" />
															<i class="ace-icon fa fa-retweet"></i>
														</span>
                                            </label>
                                            <label>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="privacy" id="optionsRadios1" value=1 checked>日记仅自己可见
                                                    </label>
                                                </div>
                                                <div class="radio">
                                                    <label>
                                                        <input type="radio" name="privacy" id="optionsRadios2" value=0 >日记对大家公开
                                                    </label>
                                                </div>
                                            </label>
                                            <label class="block">
                                                <input type="checkbox" class="ace" name="accept" />
                                                <span class="lbl">
															接受
															<a href="#">用户协议</a>
														</span>
                                            </label>

                                            <div class="space-24"></div>

                                            <div class="clearfix">
                                                <button type="reset" class="width-30 pull-left btn btn-sm">
                                                    <i class="ace-icon fa fa-refresh"></i>
                                                    <span class="bigger-110">重置</span>
                                                </button>

                                                <button type="submit" class="width-65 pull-right btn btn-sm btn-success">
                                                    <span class="bigger-110">注册</span>

                                                    <i class="ace-icon fa fa-arrow-right icon-on-right"></i>
                                                </button>
                                            </div>
                                        </fieldset>
                                    </form>
                                </div>

                                <div class="toolbar center">
                                    <a href="#" data-target="#login-box" class="back-to-login-link">
                                        <i class="ace-icon fa fa-arrow-left"></i>
                                        返回登录
                                    </a>
                                </div>
                            </div><!-- /.widget-body -->
                        </div><!-- /.signup-box -->
                    </div><!-- /.position-relative -->
                </div>
            </div><!-- /.col -->
        </div><!-- /.row -->
        </div>
    </div><!-- /.main-content -->
    <div class="col-md-2">
    </div>
</div><!-- /.main-container -->

<!-- basic scripts -->

<!--[if !IE]> -->
<script src="assets/js/jquery.2.1.1.min.js"></script>

<!-- <![endif]-->

<!--[if IE]>
<script src="assets/js/jquery.1.11.1.min.js"></script>
<![endif]-->

<!--[if !IE]> -->
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery.min.js'>"+"<"+"/script>");
</script>

<!-- <![endif]-->

<!--[if IE]>
<script type="text/javascript">
    window.jQuery || document.write("<script src='assets/js/jquery1x.min.js'>"+"<"+"/script>");
</script>
<![endif]-->
<script type="text/javascript">
    if('ontouchstart' in document.documentElement) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>

<script type="text/javascript">
    function validateloginForm(){
        var x=document.forms["loginForm"]["username"].value;
        var atpos=x.indexOf("@");
        var dotpos=x.lastIndexOf(".");
        if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
            alert("e-mail 地址错误，请重新输入");
            return false;
        }
        var x=document.forms["loginForm"]["password"].value;
        if (x==null || x=="")
        {
            alert("密码不能为空");
            return false;
        }
    }

    function validatesingupForm() {

        var x=document.forms["singForm"]["email"].value;
        var atpos=x.indexOf("@");
        var dotpos=x.lastIndexOf(".");
        if (atpos<1 || dotpos<atpos+2 || dotpos+2>=x.length){
            alert("e-mail 地址错误，请重新输入");
            return false;
        }
        var x=document.forms["singForm"]["password"].value;

        if (x==null || x=="")
        {
            alert("密码不能为空");
            return false;
        }
        var pwd1=document.forms["singForm"]["password"].value;
        var pwd2=document.forms["singForm"]["passwordR"].value;
        if (pwd1!=pwd2){
            alert("两次输入的密码不一致")
            return false;
        }
        var accept=document.forms["singForm"]["accept"].checked;
        if (accept==false ){
            alert("未接受用户协议");
            return false;
        }
    }
</script>
<!-- inline scripts related to this page -->
<script type="text/javascript">
    jQuery(function($) {
        $(document).on('click', '.toolbar a[data-target]', function(e) {
            e.preventDefault();
            var target = $(this).data('target');
            $('.widget-box.visible').removeClass('visible');//hide others
            $(target).addClass('visible');//show target
        });
    });
</script>

<script type="text/javascript">
    //init method one
    $(document).ready(function(){
        if (${boxTar} == '1'){
            $('.widget-box.visible').removeClass('visible');//hide others
            $('#signup-box').addClass('visible');//show target
            }
    });
</script>
<div style="text-align:center;">
</div>
<script type="text/javascript">
    if("ontouchend" in document) document.write("<script src='assets/js/jquery.mobile.custom.min.js'>"+"<"+"/script>");
</script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/typeahead-bs2.min.js"></script>

<!-- page specific plugin scripts -->

<!-- ace scripts -->

<script src="assets/js/ace-elements.min.js"></script>
<script src="assets/js/ace.min.js"></script>

<!-- inline scripts related to this page -->
<div style="display:none"><script src='http://v7.cnzz.com/stat.php?id=155540&web_id=155540' language='JavaScript' charset='gb2312'></script></div>
</body>
</html>
