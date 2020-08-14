package com.bbb.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@Controller
@RequestMapping("/home")
@SessionAttributes("uname")
public class ViewController {

    @RequestMapping("/list")
    public String cc(ModelMap model){
        return "index";
    }

    @RequestMapping("/rooms")
    public String h(ModelMap model,String uname,String roomid){
        model.put("uname",uname);
        model.put("roomid", roomid);
        return "sendMessage";
    }
}