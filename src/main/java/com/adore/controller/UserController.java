package com.adore.controller;

import com.adore.model.BlogEntity;
import com.adore.repository.BlogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by adore on 17/5/10.
 */
@Controller
public class UserController {

    @Autowired
    BlogRepository blogRepository;

    @RequestMapping(value = "/add")
    public String addNote(){
        return "user/add";
    }

    @RequestMapping(value = "/addN")
    public String addNotePost(@ModelAttribute("blog") BlogEntity blogEntity){
        blogRepository.saveAndFlush(blogEntity);
        // 重定向地址
        return "redirect:/";
    }

}
