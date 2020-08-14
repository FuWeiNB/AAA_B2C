package com.bbb.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Controller
public class ClearSession
{
    @RequestMapping("toclear")
    public String clearSession(HttpSession session)
    {

        session.removeAttribute("$MAP");
        return "redirect:Sh";
    }
}
