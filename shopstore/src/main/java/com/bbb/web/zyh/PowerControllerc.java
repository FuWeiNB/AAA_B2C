package com.bbb.web.zyh;

import com.bbb.dao.zyh.PowerDaoc;
import com.bbb.entity.zyh.power;
import com.bbb.service.zyh.PowerServicec;
import com.bbb.util.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/zyh/Power")
public class PowerControllerc {
    @Autowired
    PowerServicec psv;
    @RequestMapping("findAll")
    public String PowerFindAll(Model m, PageHelper p, power entity){
        p.setCount(psv.count(entity));
        m.addAttribute("nowpage",p.getNowpage());
        m.addAttribute("total",p.getTotalPage());
        m.addAttribute("entity", entity);
        m.addAttribute("power", psv.findByParams(p, entity));
        m.addAttribute("mgr",((PowerDaoc)psv.getDao()).findByMgr());
        m.addAttribute("all",((PowerDaoc)psv.getDao()).findPower());
        return "/zyh/Power/PowerMenu";
    }
    @RequestMapping("toAdd")
    public String PowerToAdd(Model m, power entity){
        m.addAttribute("mgr",((PowerDaoc)psv.getDao()).findByMgr());
        m.addAttribute("all",((PowerDaoc)psv.getDao()).findPower());
        return "/zyh/Power/PowerAdd";
    }
    @RequestMapping("add")
    public String PowerAdd(power entity){
        psv.add(entity);
        return "redirect:/zyh/Power/findAll";
    }
    @RequestMapping("toUpd")
    public String PowerToUpd(Model m, power entity){
        m.addAttribute("one", psv.findone(entity));
        m.addAttribute("mgr",((PowerDaoc)psv.getDao()).findByMgr());
        m.addAttribute("all",((PowerDaoc)psv.getDao()).findPower());
        return "/zyh/Power/PowerUpd";
    }
    @RequestMapping("upd")
    public String PowerUpd(power entity){
        psv.upd(entity);
        return "redirect:/zyh/Power/findAll";
    }
    @RequestMapping("del")
    public String PowerDel(power entity){
        psv.del(entity);
        return "redirect:/zyh/Power/findAll";
    }
}
