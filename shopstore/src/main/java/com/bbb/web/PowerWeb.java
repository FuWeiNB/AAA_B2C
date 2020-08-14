package com.bbb.web;

import com.bbb.service.Powerservice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PowerWeb {
    @Autowired
    Powerservice pow;

    @RequestMapping("/list")
    public String find(Model m) {
        m.addAttribute("list", pow.find(1));
        return "First";
    }
}
