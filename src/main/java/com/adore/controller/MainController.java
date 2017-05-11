package com.adore.controller;

import com.adore.model.BlogEntity;
import com.adore.model.UserEntity;
import com.adore.repository.BlogRepository;
import com.adore.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Crow on 17/5/8.
 */
@Controller
public class MainController {

    //自动装配数据库接口
    @Autowired
    UserRepository userRepository;

    @Autowired
    BlogRepository blogRepository;

    //get请求 主页面
    @RequestMapping(value = "/",method = RequestMethod.GET)
    public String index(ModelMap modelMap){
        List<BlogEntity> blogList = blogRepository.findAll();
        modelMap.addAttribute("blogList", blogList);
        return "index";
    }

    //get请求 管理用户界面
    @RequestMapping(value = "/admin/users",method = RequestMethod.GET)
    public String getUsers(ModelMap modelMap){
        //查询用户记录
        List<UserEntity> userEntities = userRepository.findAll();

        //将所有用户记录传递给jsp
        modelMap.addAttribute("userList",userEntities);

        return "admin/users";
    }

    //get请求 访问添加用户页面
    @RequestMapping(value = "/admin/users/add",method = RequestMethod.GET)
    public String addUser(){
        return "admin/addUser";
    }

    //post请求 处理添加用户页面的请求
    @RequestMapping(value = "/admin/users/addP",method = RequestMethod.POST)
    public String addUserPost(@ModelAttribute("user") UserEntity userEntity){
        //post传递的是一个UserEntity对象

        userRepository.saveAndFlush(userEntity);

        return "redirect:/admin/users";

    }

    //查看用户详情
    //用简单的@PathVariable
    @RequestMapping(value = "/admin/users/show/{id}",method = RequestMethod.GET)
    public String showUser(@PathVariable("id") Integer userID,ModelMap modelMap){

        //从数据库中查找userID用户
        UserEntity userEntity = userRepository.findOne(userID);

        modelMap.addAttribute("user",userEntity);
        return "admin/userDetail";

    }

    @RequestMapping(value = "/admin/users/update/{id}",method =RequestMethod.GET)
    public String updateUser(@PathVariable("id") Integer userID, ModelMap modelMap){
        UserEntity userEntity = userRepository.findOne(userID);

        modelMap.addAttribute("user",userEntity);
        return "admin/updateUser";
    }

//    // 更新用户信息 操作
//    @RequestMapping(value = "/admin/users/updateP", method = RequestMethod.POST)
//    public String updateUserPost(@ModelAttribute("userP") UserEntity user) {
//
//        // 更新用户信息
//        userRepository.updateUser(user.getNickname(), user.getFirstName(),
//                user.getLastName(), user.getPassword(), user.getId());
//        userRepository.flush(); // 刷新缓冲区
//        return "redirect:/admin/users";
//    }

    //删除用户
    @RequestMapping(value = "/admin/users/delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable Integer id,ModelMap modelMap){

        userRepository.delete(id);
        userRepository.flush();
        return "redirect:/admin/users";
    }
}
