package com.bbb.web;

import com.bbb.entity.Product_categories;
import com.bbb.service.Product_categoriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class Product_categoriesWeb
{
    @Autowired
    Product_categoriesService pcs;

    @RequestMapping("/pcs")
    public String pcs(Model m){
            m.addAttribute("list", pcs.find());
            return "product_categories/p_index";

    }
    @RequestMapping("/p_Add")
    public String Add(Product_categories ps, Model m) {

        m.addAttribute("c_Flag",ps.getC_Flag());
        return "product_categories/p_Add";
    }
    @RequestMapping("/p_Insert")
    @ResponseBody
    public Map<String,Object> Insert(Product_categories ps, Model m ){
        pcs.add(ps);
        Map<String,Object> map = new HashMap<>();
        map.put("mag" ,1);
        return map;
    }
    @RequestMapping("/p_del")
    public String p_del(Product_categories ps){
        pcs.del(ps);
        return "pcs";
    }
    @RequestMapping("/p_Ud")
    public String p_Ud(Product_categories ps, Model m) {

        m.addAttribute("c_Name",ps.getC_Name());
        m.addAttribute("c_Id",ps.getC_Id());
        return "product_categories/p_Upd";
    }
    @RequestMapping("/p_Update")
    public void p_Update(Product_categories ps, Model m ){
        pcs.upd(ps);
        }
}

