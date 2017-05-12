package com.adore.controller;

import com.adore.constants.GlobalConstants;
import com.adore.model.BlogEntity;
import com.adore.model.UserEntity;
import com.adore.repository.BlogRepository;
import com.adore.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
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
        System.out.println("111111111111111");
        return "demo";
    }

    @RequestMapping(value = "/registerU")
    public String register(@ModelAttribute("user")UserEntity userEntity){
        System.out.println(userRepository.findName(userEntity.getNickname()).size());
        userRepository.saveAndFlush(userEntity);
        return "demo";
    }

    @RequestMapping(value = "/loginU")
    public String loginUser(@RequestParam String username, HttpServletRequest request, ModelMap modelMap){
        HttpSession session = request.getSession();
        UserEntity userEntity = userRepository.findName(username).get(0);
        //modelMap.addAttribute("username",username);
        session.setAttribute(GlobalConstants.SESSION_LOGIN_USER_NAME,userEntity);
        return "s";
    }

    @RequestMapping(value = "/s")
    public String loginTest(){
        return "s";
    }
    @RequestMapping(value = "/out")
    public String loginOut(HttpServletRequest request, ModelMap modelMap){
        HttpSession session = request.getSession();
        session.removeAttribute("username");
        session.invalidate();
        return "s";
    }
}
