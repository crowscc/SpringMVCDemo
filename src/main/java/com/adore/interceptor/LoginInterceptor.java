package com.adore.interceptor;

import com.adore.constants.GlobalConstants;
import com.adore.model.UserEntity;
import com.adore.repository.UserRepository;
import com.adore.util.SecretUtil;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by adore on 17/5/12.
 */
public class LoginInterceptor implements HandlerInterceptor {

    @Autowired
    UserRepository userRepository;
    //日志
    protected Logger log = Logger.getLogger(getClass());

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        HttpSession session = request.getSession(true);
        String[] ingoreUrls = new String[]{"/noLoginHome"};
        String url = request.getRequestURI().toString();
        UserEntity userEntity = (UserEntity) session.getAttribute(GlobalConstants.SESSION_LOGIN_USER_NAME);
        if (userEntity!=null){
            return true;
        }
        for (String ingoreUrl : ingoreUrls) {
            if (url.contains(ingoreUrl)) {
                return true;
            }
        }
        Cookie[] cookies = request.getCookies();
        boolean login = false;                        // 是否登录
        String account = null;                        // 账号
        String ssid = null;                           // SSID标识
        if(cookies !=null){               // 如果Cookie不为空
            for(Cookie cookie :cookies){  // 遍历Cookie
                if(cookie.getName().equals("account"))  // 如果Cookie名为 account
                    account = cookie.getValue();       // 保存account内容
                if(cookie.getName().equals("ssid")) // 如果为SSID
                    ssid = cookie.getValue();          // 保存SSID内容
            }
        }
        if(account != null && ssid !=null){    // 如果account、SSID都不为空
            login =ssid.equals(SecretUtil.calcMD5(account));
            userEntity =userRepository.findOneByUserNickname(account);
            WebUtils.setSessionAttribute(request,GlobalConstants.SESSION_LOGIN_USER_NAME,userEntity);
            //session.setAttribute(GlobalConstants.SESSION_LOGIN_USER_NAME, userEntity);
            // 如果加密规则正确, 则视为已经登录
        }
        if (userEntity == null){
            response.sendRedirect(request.getContextPath()+"/noLogin");
        }
        return true;
    }
    /**
     * 该方法将在Controller执行之后，返回视图之前执行，ModelMap表示请求Controller处理之后返回的Model对象，所以可以在
     * 这个方法中修改ModelMap的属性，从而达到改变返回的模型的效果。
     */
    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {


    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
