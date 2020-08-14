package com.bbb.web.zyh;

import com.bbb.entity.zyh.Dept;
import com.bbb.service.zyh.DeptService;
import com.bbb.util.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/zyh/Dept")
public class DeptController {
    @Autowired
    DeptService dsv;
    @RequestMapping("findAll")
    public String findByParams(Model m, PageHelper p, Dept entity){
        p.setCount(dsv.count(entity));
        m.addAttribute("nowpage",p.getNowpage());
        m.addAttribute("total",p.getTotalPage());
        m.addAttribute("entity", entity);
        m.addAttribute("dept", dsv.findByParams(p, entity));
        return "/zyh/Dept/DeptMenu";
    }


    @RequestMapping("del")
    public String DepartmentDrop(Dept entity) {
        dsv.del(entity);
        return "redirect:/zyh/Dept/findAll";
    }

    @RequestMapping("toUpd")
    public String DepartmentToat(Model m, Dept entity) {
        m.addAttribute("map", dsv.findone(entity));
        return "/zyh/Dept/DeptUpd";
    }

    @RequestMapping("upd")
    public String DepartmentAlter(Dept entity) {
        dsv.upd(entity);
        return "redirect:/zyh/Dept/findAll";
    }

    @RequestMapping("add")
    public String DepartmentAdd(Dept entity) {
        dsv.add(entity);
        return "redirect:/zyh/Dept/findAll";
    }
}
