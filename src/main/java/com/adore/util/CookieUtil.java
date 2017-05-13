package com.adore.util;

import com.adore.constants.GlobalConstants;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by adore on 17/5/13.
 */
public class CookieUtil {

    public final static boolean setLoginCookie(String account, HttpServletResponse response) {
        String ssid = SecretUtil.calcMD5(account);
        int timeout = 7 * 24 * 60 * 60;
        // 把帐号保存到Cookie中 并控制有效期
        Cookie accountCookie = new Cookie("account", account);
        //accountCookie.setDomain(".adorecorw.cn");           // 设置域名
        accountCookie.setDomain("localhost");           // 设置域名
        accountCookie.setPath("/");                                // 设置路径
        accountCookie.setMaxAge(timeout);

        // 把加密结果保存到Cookie中 并控制有效期
        Cookie ssidCookie = new Cookie("ssid", ssid);
        //ssidCookie.setDomain(".adorecorw.cn");           // 设置域名
        ssidCookie.setDomain("localhost");           // 设置域名
        ssidCookie.setPath("/");                              // 设置路径
        ssidCookie.setMaxAge(timeout);

        response.addCookie(accountCookie);
        response.addCookie(ssidCookie);
        return true;

    }

    public final static boolean logoutRemove(HttpServletRequest request, HttpServletResponse response) {
        // 删除Cookie中的帐号
        Cookie accountCookie = new Cookie("account", "");
        //accountCookie.setDomain(".adorecorw.cn");           // 设置域名
        accountCookie.setDomain("localhost");           // 设置域名

        accountCookie.setPath("/");                              // 设置路径
        accountCookie.setMaxAge(0);

        // 删除Cookie中的加密结果
        Cookie ssidCookie = new Cookie("ssid", "");
        //ssidCookie.setDomain(".adorecorw.cn");           // 设置域名
        ssidCookie.setDomain("localhost");           // 设置域名
        ssidCookie.setPath("/");                              // 设置路径
        ssidCookie.setMaxAge(0);

        response.addCookie(accountCookie);
        response.addCookie(ssidCookie);

        HttpSession session = request.getSession();
        if (session.getAttribute(GlobalConstants.SESSION_LOGIN_USER_NAME) != null) {
            session.removeAttribute("username");
            session.invalidate();
        }
        return true;
    }
}
