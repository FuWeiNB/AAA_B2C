package com.bbb.web;

import com.bbb.entity.admin_login;
import com.bbb.service.AdminService;
import com.bbb.util.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpServletRequest;

//用户管理Controller层
@Controller
@RequestMapping("admin")//类的窄化路径
public class AdminController
{
    @Autowired
    AdminService svr;
    @RequestMapping("toUpd")
    public String toUpd(Model m, String user)
    {
        m.addAttribute("map", svr.findtheone(user));

        return "/admin/upd";
    }
    @RequestMapping("Update")
    public String Update(admin_login entity)
    {
        svr.upd(entity);

        return "redirect:findAll";
    }
    @RequestMapping("findAll")
    public String findAll(Model m, HttpServletRequest request,admin_login entity)
    {
        String nowpage = request.getParameter("nowpage");
        PageHelper ph = new PageHelper();
        ph.setNowpage(nowpage);
        ph.setCount(svr.count(entity));
        m.addAttribute("page",ph);
        m.addAttribute("list",svr.findPage(ph,entity));
        m.addAttribute("flag",entity.getFlag());
        return "/admin/admins";
    }
}
