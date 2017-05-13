<%@ page import="java.security.MessageDigest" %><%--
  Created by IntelliJ IDEA.
  User: adore
  Date: 17/5/13
  Time: 10:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="UTF-8" isErrorPage="false" %>
<%@page import="com.adore.util.SecretUtil"%>

<%

    boolean loggin = false;

    String account = null;
    String ssid = null;

    // 获取Cookie中的account与ssid
    if(request.getCookies() != null){
        Cookie cookies[] = request.getCookies();
        for (int i =0 ; i<cookies.length;i++){
            Cookie cookie = cookies[i];
            if(cookie.getName().equals("account"))
                account = cookie.getValue();
            if(cookie.getName().equals("ssid"))
                ssid = cookie.getValue();
        }

    }
    if(account != null && ssid != null){
        // 如果加密规则正确, 则视为已经登录
        loggin = ssid.equals(SecretUtil.calcMD5(account));
    }
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title><%= loggin ? "欢迎您回来" : "请先登录" %></title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div align="center" style="margin:10px; ">
    <fieldset>
        <legend>当前有效的 Cookie</legend>
        <script>document.write(document.cookie);</script>
    </fieldset>
    <fieldset>
        <legend><%= loggin ? "欢迎您回来" : "请先登录" %></legend>
        <% if(loggin){ %>
        欢迎您, ${ cookie.account.value }.
        <a href="/outout">注销</a>
        <% } else { %>
        <form action="/coU" method="post">
            <table>
                <tr>
                    <td>
                        帐号：
                    </td>
                    <td>
                        <input type="text" name="account" style="width:200px; ">
                    </td>
                </tr>
                <tr>
                    <td>
                        密码：
                    </td>
                    <td>
                        <input type="password" name="password" style="width:200px; ">
                    </td>
                </tr>
                <tr>
                    <td>
                        有效期：
                    </td>
                    <td>
                        <input type="radio" name="timeout" value="-1" checked> 关闭浏览器即失效 <br/>
                        <input type="radio" name="timeout" value="<%= 30 * 24 * 60 * 60 %>"> 30天内有效 <br/>
                        <input type="radio" name="timeout" value="<%= Integer.MAX_VALUE %>"> 永久有效 <br/>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <input type="submit" value=" 登  录 " class="button">
                    </td>
                </tr>
            </table>
        </form>
        <% } %>
    </fieldset>
</div>

</body>
</html>