package com.bbb.web.zyh;

import com.bbb.dao.zyh.PowerDaoc;
import com.bbb.dao.zyh.RoleDao;
import com.bbb.entity.zyh.Role;
import com.bbb.service.zyh.PowerServicec;
import com.bbb.service.zyh.RoleService;
import com.bbb.util.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/zyh/Role")
public class RoleController {
    @Autowired
    RoleService rsv;
    @Autowired
    PowerServicec psv;
    @RequestMapping("findAll")
    public String RoleFindAll(Model m, PageHelper page, Role entity){
        page.setCount(((RoleDao)rsv.getDao()).count(entity));
        m.addAttribute("nowpage", page.getNowpage());
        m.addAttribute("total",page.getTotalPage());
        m.addAttribute("entity",entity);
        m.addAttribute("page", rsv.findByParams(page, entity));
        return "/zyh/Role/RoleMenu";
    }
    @RequestMapping("toUpd")
    public String RoleToUpd(Model m, Role entity){
        m.addAttribute("c", rsv.findone(entity));
        m.addAttribute("all",rsv.findAll());
        List<Map<String,Object>> power = (((PowerDaoc)psv.getDao()).findPower());
        List<Map<String,Object>> role = (((RoleDao)(rsv.getDao())).oneR(entity));
        for(Map<String,Object> pw : power)
        {

            if(role != null)
            {
                for(Map<String,Object> rl : role)
                {
                    if (rl.get("p_id").equals(pw.get("p_id")))
                    {
                            System.out.println("走了未0");
                            pw.put("checked", "checked");
                    }
                }
            }
        }
        m.addAttribute("power",power);
        return "/zyh/Role/RoleUpd";
    }
    @RequestMapping("upd")
    public String RoleUpd(HttpServletRequest request, Role entity){
        String[] p_id = request.getParameterValues("p_id");
        String r_id = request.getParameter("r_id");
        rsv.del(entity);
        if(p_id != null){
            for(String p: p_id){
                ((RoleDao)rsv.getDao()).insertRa(entity, p);
            }
        }
        return "redirect:/zyh/Role/findAll";
    }
}
