package com.bbb.web.zyh;

import com.bbb.dao.zyh.EmpDao;
import com.bbb.entity.zyh.Dept;
import com.bbb.entity.zyh.Emp;
import com.bbb.entity.zyh.Role;
import com.bbb.service.zyh.EmpService;
import com.bbb.util.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/zyh/Emp")
public class EmpController {
    @Autowired
    EmpService esv;
    @RequestMapping("findAll")
    public String EmpFindAll(Model m, PageHelper p, Emp emp, Dept dept, Role role){
        if(emp.getE_flag() == null && emp.getE_flag() == "") emp.setE_flag("0");
        p.setCount(((EmpDao)esv.getDao()).count(emp, dept, role));
        m.addAttribute("nowpage", p.getNowpage());
        m.addAttribute("total",p.getTotalPage());
        m.addAttribute("emp", emp);
        m.addAttribute("dept", dept);
        m.addAttribute("role", role);
        m.addAttribute("paging", ((EmpDao)esv.getDao()).paging(p,emp,dept,role));
        return "/zyh/Emp/EmpMenu";
    }
    @RequestMapping("toAdd")
    public String EmpToAdd(Model m){
        m.addAttribute("dept", ((EmpDao)esv.getDao()).findDept());
        return "/zyh/Emp/EmpAdd";
    }
    @RequestMapping("getRole")
    @ResponseBody
    public void EmpGetRole(Role role, HttpServletResponse response) {
        List<Map<String,Object>> list = ((EmpDao)esv.getDao()).findRole(role);
        StringBuffer buffer = new StringBuffer("<option value='-1'>--请选择--</option>");
        for(Map<String,Object> map : list)
        {
            buffer.append("<option value=\""+map.get("r_id")+"\">"+map.get("r_name")+"</option>");
        }
        try {
            response.setContentType("application/json");
            response.setCharacterEncoding("utf-8");
            response.getWriter().write(buffer.toString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
    @RequestMapping("add")
    public String EmpAdd(Emp emp){
        esv.add(emp);
        return "redirect:/zyh/Emp/findAll";
    }

    @RequestMapping("del")
    public String DepartmentDrop(Emp entity) {
        esv.del(entity);
        return "redirect:/zyh/Emp/findAll";
    }

    @RequestMapping("toUpd")
    public String DepartmentToUpd(Model m, Emp entity,Role role) {
        m.addAttribute("one", esv.findone(entity));
        m.addAttribute("role",((EmpDao)esv.getDao()).findRole(role));
        m.addAttribute("dept", ((EmpDao)esv.getDao()).findDept());
        return "/zyh/Emp/EmpUpd";
    }

    @RequestMapping("upd")
    public String DepartmentAlter(Emp entity) {
        esv.upd(entity);
        return "redirect:/zyh/Emp/findAll";
    }
}
