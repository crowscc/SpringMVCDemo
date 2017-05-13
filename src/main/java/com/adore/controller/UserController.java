package com.adore.controller;

import com.adore.constants.GlobalConstants;
import com.adore.model.BlogEntity;
import com.adore.model.UserEntity;
import com.adore.repository.BlogRepository;
import com.adore.repository.UserRepository;
import com.adore.util.CookieUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Created by adore on 17/5/10.
 */
@Controller
//@SessionAttributes({"username"})
public class UserController {

    @Autowired
    BlogRepository blogRepository;

    @Autowired
    UserRepository userRepository;

    @RequestMapping(value = "/add")
    public String addNote(){
        return "user/add";
    }

    @RequestMapping(value = "/addN")
    public String addNotePost(@ModelAttribute("blog") BlogEntity blogEntity){

        //String s = blogEntity.getContent();

        blogRepository.saveAndFlush(blogEntity);
        // 重定向地址
        return "redirect:/";
    }
    @RequestMapping(value = "/register")
    public String register(){
        return "demo";
    }

    @RequestMapping(value = "/registerU")
    public String register(@ModelAttribute("user")UserEntity userEntity){
        System.out.println(userRepository.findOneByUserNickname(userEntity.getNickname()));
        userRepository.saveAndFlush(userEntity);
        return "demo";
    }

    @RequestMapping(value = "/loginU")
        public String loginUser(@RequestParam String username, @RequestParam String password, @RequestParam(defaultValue = "false") boolean remeber, HttpServletRequest request,HttpServletResponse response, ModelMap modelMap){
        HttpSession session = request.getSession(false);
        UserEntity userEntity = userRepository.findOneByUserNickname(username);
        System.out.println(remeber);
        if (userEntity == null){
            modelMap.addAttribute("err","输入的邮箱不存在，请重新输入");
        }else {

            //如果验证成功就保存session和cookie并跳转
            if (userEntity.getPassword().equals(password)){
                session.setAttribute(GlobalConstants.SESSION_LOGIN_USER_NAME,userEntity);
                CookieUtil.setLoginCookie(username,response);
                /*
                *   这里通过forward跳转到另外一个controller
                *   return "forward:/hello" => 转发到能够匹配 /hello 的 controller 上
                *   return "hello" => 实际上还是转发，只不过是框架会找到该逻辑视图名对应的 View 并渲染
                *   在本项目中就是跳转到了hello.jsp
                *   return "/hello" => 同 return "hello"
                * */
                return "forward:/";
            }else {
                modelMap.addAttribute("err","输入的密码有误，请重新输入");
            }
        }
        //modelMap.addAttribute("username",username);
        return "demo";
    }

    @RequestMapping(value = "/s")
    public String loginTest(){
        return "s";
    }
    @RequestMapping(value = "/t")
    public String loginTestt(){
        return "test";
    }

    @RequestMapping(value = "/out")
    public String outout(HttpServletRequest request, HttpServletResponse response){

        CookieUtil.logoutRemove(request,response);
        // 重新请求本页面
        return "s";
    }

}
