package com.bbb.web.zyh;

import com.bbb.dao.zyh.SupplierDao;
import com.bbb.entity.zyh.Supplier;
import com.bbb.util.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/zyh/Supplier")
public class SupplierController {
    @Autowired
    SupplierDao dao;
    @RequestMapping("findAll")
    public String SupplierFindAll(Model m, Supplier entity , PageHelper page){
        page.setCount(dao.count(entity));
        m.addAttribute("Supplier", dao.findAll(page,entity));
        m.addAttribute("Product_ca",dao.findProduct_ca());
        m.addAttribute("entity",entity);
        m.addAttribute("nowpage",page.getNowpage());
        m.addAttribute("total",page.getTotalPage());
        return "/zyh/Supplier/SupplierMenu";
    }
    @RequestMapping("toAdd")
    public String SupplierToAdd(Model m){
        m.addAttribute("Product_ca",dao.findProduct_ca());
        return "/zyh/Supplier/SupplierAdd";
    }
    @RequestMapping("add")
    public String SupplierAdd(Supplier entity){
        dao.insert(entity);
        return "redirect:/zyh/Supplier/findAll";
    }
    @RequestMapping("del")
    public String SupplierDrop(Supplier entity){
        dao.delete(entity);
        return "redirect:/zyh/Supplier/findAll";
    }
    @RequestMapping("toUpd")
    public String SupplierToUpd(Model m, Supplier entity){
        m.addAttribute("one", dao.findOne(entity));
        m.addAttribute("Product_ca",dao.findProduct_ca());
        return "/zyh/Supplier/SupplierUpd";
    }
    @RequestMapping("upd")
    public String SupplierUpd(Supplier entity){
        dao.update(entity);
        return "redirect:/zyh/Supplier/findAll";
    }
}
