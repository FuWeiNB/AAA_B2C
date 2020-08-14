package com.bbb.web;

import com.bbb.dao.PersonDao;
import com.bbb.dao.addressDao;
import com.bbb.entity.address;
import com.bbb.service.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("person")
public class PersonController
{
    @Autowired
    PersonService ps;
    @Autowired
    addressDao adao;
    @Autowired
    PersonDao pdao;
    //显示个人的订单信息
    @RequestMapping("toshowOrders")
    public String tshowPersonOrders(HttpServletRequest request)
    {
        HttpSession session = request.getSession();
        Map<String,Object> map = (HashMap) session.getAttribute("$MAP");
        if (map != null)
        {
            //List<Map<String,Object>> list = ps.ByUserShow("1"); // 这个是根据我用户的编号，来获得用户的订单号
            List<Map<String, Object>> list1 = ps.showPersonOrders(map.get("user").toString());

            //跳转页面
            request.setAttribute("list", list1);
            //待付款或者已取消
            request.setAttribute("list1", ps.showPersonOrdersBy1(map.get("user").toString()));
            request.setAttribute("list2", ps.showPersonOrdersBy2(map.get("user").toString()));
            request.setAttribute("list3", ps.showPersonOrdersBy3(map.get("user").toString()));
            request.setAttribute("list4", ps.showPersonOrdersBy4(map.get("user").toString()));
        }


        return "/person/orders";
    }

    //订单的详情
    @RequestMapping("ordersDetials")
    public ModelAndView ordersDetials(String o_id)
    {
        ModelAndView mav = new ModelAndView();
        List<Map<String, Object>> list = ps.showshopInfo(o_id);
        double d = 0;
        for (Map<String, Object> map : list)
        {
            d += Double.parseDouble(map.get("counts").toString());
        }
        mav.setViewName("/person/ordersinfo");
        mav.addObject("price", d);
        mav.addObject("address", ps.findtheAddress(o_id));
        mav.addObject("list", list);
        return mav;
    }

    //删除订单 其实就是用户自己看不到了
    @ResponseBody
    @RequestMapping("todel")
    public ModelAndView todelOrders(String o_id, HttpSession session)
    {
        //System.out.println(o_id);
        session.getAttribute("$MAP");
        int count = ps.updateOr_flag(o_id);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/person/toshowOrders");
        return mav;
    }

    //这个是确认收货按钮执行的
    @ResponseBody
    @RequestMapping("tosubmit")
    public ModelAndView tosubmit(String o_id, HttpSession session)
    {
        int count = ps.updateO_flag(o_id);
        ModelAndView mav = new ModelAndView();
        mav.setViewName("redirect:/person/toshowOrders");
        return mav;
    }

    //修改密码
    @ResponseBody
    @RequestMapping("torepass")
    public String torepass(String oldpass, HttpSession session)
    {
        //需要先获得session中用户的编号，然后与数据库中的数据作对比然后如果相等就证明正确，不相等返回0
        Map<String, Object> map1 = (HashMap) session.getAttribute("$MAP");
        Map<String, Object> map2 = ps.c2Pass(map1.get("user").toString());
        if (map2.get("pass").equals(oldpass))
        {
            return "1";
        } else
        {
            return "0";
        }

    }

    //当提交成功之后 清空session回到商品界面 并且左上角
    @RequestMapping("submit")
    public String submit(HttpServletRequest request,String newpass,String user)
    {
        int count =  adao.upd_pass(newpass,user);
        request.getSession().removeAttribute("$MAP");
        return "index";
    }

    //查看个人的地址管理
    @RequestMapping("ByUserFind")
    public String ByUserFind(HttpSession session, Model m)
    {

        Map<String,Object> map = (HashMap)session.getAttribute("$MAP");
        if(map == null)
        {
            return "";
        }
        m.addAttribute("list",adao.ByUserFind(map.get("user").toString()));
        return "/person/address";
    }
    //修改地址管理中的状态时，需要先查询一下该用户的所有收货地址中那个收货地址是默认的
    //然后修改为普通的地址，然后再通过选中的这个地址编号 修改他的状态修改为默认
    @RequestMapping("toupd_flag")
    @ResponseBody
    public String toupd_flag(String a_id,HttpSession session)
    {
        Map<String,Object> map = (HashMap)session.getAttribute("$MAP");
        String count = adao.toupd_flag(a_id,map.get("user").toString());
        return count;
    }
    @RequestMapping("del_address")
    @ResponseBody
    public int del_address(String a_id,HttpSession session)
    {
        Map<String,Object> map = (HashMap)session.getAttribute("$MAP");
        int count = adao.del_address(a_id,map.get("user").toString());
        return count;
    }

    @RequestMapping("add_address")
    @ResponseBody
    public int add_address(HttpSession session, address as)
    {
        Map<String,Object> map = (HashMap)session.getAttribute("$MAP");
        as.setUser(map.get("user").toString());
        int count = adao.adds(as);
        return count;
    }

    @RequestMapping("upd_address")
    @ResponseBody
    public int upd_address(HttpSession session, address as)
    {
        int count = adao.upds(as);
        return count;
    }

    @RequestMapping("toupd_address")
    public ModelAndView toupd_address(HttpSession session, address as,Model m)
    {
        Map<String,Object> map = (HashMap)session.getAttribute("$MAP");
        ModelAndView mav = new ModelAndView();
        mav.addObject("list",adao.ByUserFind(map.get("user").toString()));
        mav.addObject("map",adao.findone(as));
        mav.setViewName("person/updAddress");
        return mav;
    }


}
