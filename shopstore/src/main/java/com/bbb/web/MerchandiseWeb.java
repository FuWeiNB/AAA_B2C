package com.bbb.web;

import com.bbb.dao.MerchandiseDao;
import com.bbb.dao.addressDao;
import com.bbb.entity.Buycars;
import com.bbb.entity.Merchandise;
import com.bbb.service.MerchandiseService;
import com.bbb.service.Product_categoriesService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.*;

@Controller
public class MerchandiseWeb
{
    @Autowired
    Product_categoriesService pcs;
    @Autowired
    MerchandiseService mds;
    @Autowired
    MerchandiseDao mdd;
    @Autowired
    addressDao dao;

    @RequestMapping("/Md")
    public String Md(Model m){
        m.addAttribute("list", pcs.find());
        return "merchandise/m_Add";
    }
    int m_id =0 ;
    @RequestMapping("/Md_Add")
    public String Md_Add(Merchandise md){
        try {
            m_id = md.getM_id();
            mds.add(md);
        }
        catch (NullPointerException e)
        {
            e.printStackTrace();
        }
        return "merchandise/m_img";
    }


    String name = "";
    @RequestMapping("/uploadImg")
    @ResponseBody
    public Map<String, Object> File(HttpSession httpSession,HttpServletRequest req, @RequestParam("file")MultipartFile mf) throws IOException {
        //文件上传路径
        String path = req.getSession().getServletContext().getRealPath("/img_GFZ/");
        String path2 = "D:/mycode/shopstore/src/main/webapp/img_GFZ/";
        //判断路径是否存在
        File file = new File(path);
        if(!file.exists()){
            //创建文件夹
            file.mkdirs();
        }
        Map<String, Object> map = new HashMap<>();
        map.put("code","200");
        //获取文件名称
        //保证唯一性
        String Uid  = UUID.randomUUID().toString().replace("-","");
        name = mf.getOriginalFilename();
        name = Uid+"_"+name;
        String ph = "/img_GFZ/"+name;
        map.put("path",ph);
        map.put("name",name);
        map.put("Uid",Uid);
        //获取e_id
        //Object eid = httpSession.getAttribute("e_id");
        //int e_id = (int)eid;
        mf.transferTo(new File(path,name));
        try {
            FileInputStream fis  = new FileInputStream (path+name);
            FileOutputStream fos  = new FileOutputStream (path2+name);
            int len = 0;
            while ((len = fis.read()) != -1) {
                fos.write(len);
            }
            //未获取e_id
            mdd.add_img(Uid,name,ph,1,m_id);
            // 关闭流  先开后关  后开先关
            fos.close(); // 后开先关
            fis.close(); // 先开后关
        }
        catch (Exception e)
        {
           e.printStackTrace();
            return map;
        }
        return map;
    }

    @RequestMapping("/updateImg")
    @ResponseBody
    public Map<String, Object> updateImg(HttpServletRequest req, @RequestParam("file")MultipartFile mf) throws IOException {
        //文件上传路径
        String path = req.getSession().getServletContext().getRealPath("/img_GFZ/");
        String path2 = "D:/mycode/shopstore/src/main/webapp/img_GFZ/";
        //判断路径是否存在
        File file = new File(path);
        if(!file.exists()){
            //创建文件夹
            file.mkdirs();
        }
        Map<String, Object> map = new HashMap<>();
        map.put("code","200");
        //获取文件名称
        String ph = "/img_GFZ/"+name;
        map.put("path",ph);
        mf.transferTo(new File(path,name));
        try {
            FileInputStream fis  = new FileInputStream (path+name);
            FileOutputStream fos  = new FileOutputStream (path2+name);
            int len = 0;
            while ((len = fis.read()) != -1) {
                fos.write(len);
            }
            // 关闭流  先开后关  后开先关
            fos.close(); // 后开先关
            fis.close(); // 先开后关
        }
        catch (Exception e)
        {
            e.printStackTrace();
            return map;
        }
        return map;
    }

    @RequestMapping("/DeleteImg")
    public String DeleteImg(Merchandise m)
    {
        System.out.println(m.getI_name());
        mdd.del_img(m.getM_name());
        String path = "D:/mycode/shopstore/src/main/webapp/img_GFZ/"+m.getI_name();
        File file = new File(path);
        if(!file.exists()){
         }
        else{ boolean aa =file.delete();
            }
        return "";
    }
    @RequestMapping("/Ifid")
    @ResponseBody
    public Map<String,Object> Ifid(Merchandise m)
    {
        Map<String,Object> map = new HashMap<String, Object>();
        int If = mdd.Ifid(m);
        if(If == 1){map.put("msg",1);return map;}
        else{map.put("msg",0); return  map;}
    }

    @RequestMapping("M_list")
    public String M_list(Model m)
    {
        m.addAttribute("list",mds.find());
        m.addAttribute("p_list",mdd.find_pm());
        m.addAttribute("ptlist",mdd.find_pt());
        return "merchandise/m_index";
    }

    @RequestMapping("Up_img")
    public String Up_img(Model m,Merchandise md)
    {
        m_id = md.getM_id();
        m.addAttribute("list",mdd.find_img(md.getM_id()));
        return "merchandise/m_img";
    }

    @RequestMapping("M_Upview")
    public String M_Upview(Model m,Merchandise md)
    {
        m.addAttribute("list",mds.findOne(md));
        m.addAttribute("plist", pcs.find());
        m.addAttribute("pmlist",mdd.find_pm(md));
        m.addAttribute("ptlist",mdd.find_pt(md));

        return "merchandise/m_Upd";
    }

    @RequestMapping("/Md_Upd")    @ResponseBody
    public Map<String,Object> Md_Upd(Merchandise md){
        Map<String,Object> map = new HashMap<>();
        try {
            mdd.upd(md);
            map.put("msg",1);
        }
        catch (NullPointerException e)
        {
            map.put("msg",1);
            e.printStackTrace();
        }
        return map;
    }
    @RequestMapping("Upflag")
    public void Upflag(Merchandise md)
    {
        mdd.Upflag(md);
    }

    @RequestMapping("Select_m")
    @ResponseBody
    public Map<String,Object> Select_m()
    {

        Map<String,Object> map = new HashMap<>();
        List<Map<String,Object>> list=mdd.Select_m();
        map.put("list",list);
        return map;
    }
    @RequestMapping("/Sh")
    public String Sh(Model m,HttpServletRequest req){
        m.addAttribute("list_pc",mdd.Select_pc());
        m.addAttribute("list",mdd.Select_m());
        return "search";
    }
    @RequestMapping("/Select_pc")
    @ResponseBody
    public Map<String,Object> Select_pc(Model m){
        Map<String,Object> map = new HashMap<>();
        List<Map<String,Object>> list=pcs.find();
        map.put("list",list);
        return map;
    }
   @RequestMapping("/like_pm")
   @ResponseBody
   public String like_pm(Merchandise md) {
       List<Map<String,Object>> list= mdd.like_pm();
       StringBuffer html = new StringBuffer();
       Map<Integer,Integer> mps = new HashMap<>();

       for(Map<String,Object> ma:list)
           {
               int mid = Integer.parseInt(ma.get("m_id").toString());
               int cid = Integer.parseInt(ma.get("c_id").toString());
               int brk = 0;
               for(int id : md.getC_id())
               {
                   if(brk == 0){brk++;continue;}
                   if(id == cid)
                   {
                      int sum = 1;
                      if(mps.get(mid) == null)
                      {
                          sum = 1;
                      }
                      else {sum += mps.get(mid); }
                      mps.put(mid,sum);
                   }
               }
           }
       for(int key : mps.keySet())
       {
            if(mps.get(key) == md.getC_id().length-1)
           {
               Map<String,Object> map = mdd.find_img(key).get(0);
               html.append("<li>\n" +
                       "<a href=\"md_view?m_id="+map.get("m_id")+"\">"+
                       "\t\t\t\t\t\t\t\t\t\t<div class=\"i-pic limit\">\n" +
                       "\t\t\t\t\t\t\t\t\t\t\t<img src=\""+map.get("img_url")+"\" style=\"width:218px;height:218px;\" />\t\t\t\t\t\t\t\t\t\t\t\n" +
                       "\t\t\t\t\t\t\t\t\t\t\t<p class=\"title fl\">"+map.get("m_name")+"</p>\n" +
                       "\t\t\t\t\t\t\t\t\t\t\t<p class=\"price fl\">\n" +
                       "\t\t\t\t\t\t\t\t\t\t\t\t<b>¥</b>\n" +
                       "\t\t\t\t\t\t\t\t\t\t\t\t<strong>"+map.get("m_price")+"</strong>\n" +
                       "\t\t\t\t\t\t\t\t\t\t\t</p>\n" +
                       "\t\t\t\t\t\t\t\t\t\t\t<p class=\"number fl\">\n" +
                       "\t\t\t\t\t\t\t\t\t\t\t</p>\n" +
                       "\t\t\t\t\t\t\t\t\t\t</div>\n" +
                       "</a>"+
                       "\t\t\t\t\t\t\t\t\t</li>");
           }
       }

       return html.toString();
    }

    @RequestMapping("/like_sh")
    public String like_sh(Model m,Merchandise md){
        m.addAttribute("list_pc",mdd.Select_pc());
        String like = "%"+md.getM_name()+"%";
        m.addAttribute("list",mdd.like_sh(like));
        m.addAttribute("m_name",md.getM_name());
        return "search";
    }

    @RequestMapping("/md_view")
    public String md_view(Model m,Merchandise md){
        m.addAttribute("list_m",mdd.find_img(md.getM_id()));
        m.addAttribute("list_t",mdd.find_pt(md));
        return "introduction";
    }
    @RequestMapping("/add_sp")   @ResponseBody
    public String add_sp(Merchandise md,HttpSession hs){
        String user = hs.getAttribute("user").toString();
        String data = mdd.add_sp(md,user);
        return data;
    }
    @RequestMapping("/BuyItNow")
    public String BuyItNow(Model m,Merchandise md,HttpSession hs, Buycars cars){
        String user = hs.getAttribute("user").toString();
        int mid = md.getM_id();
        List<Map<String,Object>> list = mdd.find_img(mid);
        Map<String,Object> map = list.get(0);
        map.put("b_number",md.getM_count());
        String name = mdd.find_pt(md.getT_id()).get(0).get("t_name").toString();
        String type = mdd.find_pt(md.getT_id()).get(0).get("t_type").toString();
        map.put("t_type",type);
        map.put("t_id",md.getT_id());
        map.put("t_name",name);
        List<Map<String,Object>> lists = new ArrayList<>();
        lists.add(map);
        m.addAttribute("list",lists);
        m.addAttribute("lists", dao.findByUser(cars));
        return "shopcart";
    }


    @RequestMapping("/incomes")
    @ResponseBody
    public Map<String,Object> incomes(Model m){
        Map<String,Object> map = new HashMap<>();
        map.put("xcount",mdd.income());
        return map;
    }

}

