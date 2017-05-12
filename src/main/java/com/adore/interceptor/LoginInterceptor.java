package com.adore.interceptor;

import com.adore.constants.GlobalConstants;
import com.adore.model.UserEntity;
import org.apache.log4j.Logger;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Created by adore on 17/5/12.
 */
public class LoginInterceptor implements HandlerInterceptor {

    //日志
    protected Logger log = Logger.getLogger(getClass());

    @Override
    public boolean preHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o) throws Exception {
        HttpSession session = httpServletRequest.getSession();
        String[] ingoreUrls = new String[]{"/login", "/register"};
        String url = httpServletRequest.getRequestURI().toString();
        UserEntity userEntity = (UserEntity) session.getAttribute(GlobalConstants.SESSION_LOGIN_USER_NAME);
        for (String ingoreUrl : ingoreUrls) {
            if (url.contains(ingoreUrl)) {
                return true;
            }
        }
        if (userEntity == null){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/register");
        }
        return true;
    }

    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {


    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}
