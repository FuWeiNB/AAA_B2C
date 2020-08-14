package com.bbb.web.zyh;

import com.aaa.util.DBhelper;
import com.bbb.dao.zyh.SupplierDao;
import com.bbb.entity.zyh.Instore;
import com.bbb.entity.zyh.Merchandise;
import com.bbb.entity.zyh.Payorders;
import com.bbb.entity.zyh.Trolley;
import com.bbb.service.zyh.PayordersService;
import com.bbb.util.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("/zyh/Payorders")
public class PayordersController {
    @Autowired
    PayordersService pos;
    @Autowired
    SupplierDao dao;
    @RequestMapping("goodsfindAll")
    public String GoodsFindAll(Model m, PageHelper page, Merchandise entity, HttpServletRequest request){
        page.setCount(pos.goodscount(entity));
        HttpSession session = request.getSession();
        m.addAttribute("goods", pos.goodsFindAll(page,entity));
        m.addAttribute("mer",entity);
        m.addAttribute("Product_ca",pos.findProduct_ca());
        m.addAttribute("nowpage",page.getNowpage());
        m.addAttribute("total",page.getTotalPage());
        m.addAttribute("emp_id", session.getAttribute("emp_id"));
        return "/zyh/Payorders/goodsMenu";
    }

    @RequestMapping("toTro")
    public String GoodstoTrolley(Model m, Merchandise mer){
        m.addAttribute("one", pos.toTrolley(mer));
        m.addAttribute("supplier",dao.findSupplier(mer));
        return "/zyh/Payorders/goodsView";
    }
    @RequestMapping("trolley")
    public void GoodsTrolley(HttpServletRequest request, HttpServletResponse response, Trolley entity, String emp_id) throws ServletException, IOException {
        Map<String,Object> mei = DBhelper.executeQuery("select * from supplier where s_id=?",entity.getS_id()).get(0);
       request.setCharacterEncoding("utf-8");
       response.setCharacterEncoding("utf-8");
        HttpSession session = request.getSession();

//        List<Map<String,Object>> list = null;
        Map<String,Trolley> trolley = null;
        if(session.getAttribute("trolley") == null) trolley = new HashMap<String, Trolley>();
        else trolley = (HashMap<String, Trolley>)session.getAttribute("trolley");
        if(trolley.get(entity.getM_id()) == null)
        {
            Trolley c = new Trolley();
            c.setM_id(entity.getM_id());
            c.setNumber(entity.getNumber());
            c.setM_name(entity.getM_name());
            c.setM_oldprice(entity.getM_oldprice());
            c.setS_name(entity.getS_name());
            c.setS_id(entity.getS_id());
            c.setS_name(mei.get("s_name").toString());
            trolley.put(entity.getM_id(),c);
        }
        else
        {
            Trolley t = trolley.get(entity.getM_id());
            int oldNumber =Integer.valueOf(t.getNumber());
            int newNumber = Integer.valueOf(entity.getNumber());
            Integer n = oldNumber+newNumber;
            t.setNumber(n.toString());
            trolley.put(entity.getM_id(),t);
        }
        session.setAttribute("trolley", trolley);
        response.sendRedirect("goodsToTro.jsp");
    }

    @RequestMapping("PayordersTotro")
    public String PayordersTotro(HttpServletRequest request){
        String[] m_id = request.getParameterValues("m_id");
        String[] m_price =request.getParameterValues("m_oldprice");
        String[] number = request.getParameterValues("oldnumber");
        String[] s_id = request.getParameterValues("s_id");
        String[] ctotal = request.getParameterValues("ctotal");
        String pay_price = request.getParameter("Stotal");
        String pay_id = UUID.randomUUID().toString().replace("-", "");
        pos.insertPayorders(pay_price,0,pay_id);
        for(int i = 0 ; i < m_id.length&&i<s_id.length&&i<m_price.length&&i<number.length&&i<ctotal.length;i++)
        {
            pos.insertIn_m(pay_id,0,m_price[i],number[i],ctotal[i],m_id[i],s_id[i]);
        }
        HttpSession session  = request.getSession();
        Map<String, Trolley> map  = (HashMap<String,Trolley>)session.getAttribute("trolley");
        for(String goods : m_id)
        {
            if(map.get(goods) != null)
            {
                map.remove(goods);
            }
        }
        return "redirect:/zyh/Payorders/OrdersFind";
    }

    @RequestMapping("OrdersFind")
    public String OrdersFIndAll(Model m, PageHelper page, Payorders entity){
        page.setCount(pos.OrdersCount(entity));
        m.addAttribute("orders", pos.OrdersFindAll(page,entity));
        m.addAttribute("pay_flag",entity.getPay_flag());
        m.addAttribute("min",entity.getMin());
        m.addAttribute("max",entity.getMax());
        m.addAttribute("now",page.getNowpage());
        m.addAttribute("total",page.getTotalPage());
        return "/zyh/Payorders/OrdersMenu";
    }
    @RequestMapping("approve")
    public String Approve(Model m,Instore entity){
        m.addAttribute("payorders",pos.findOrders(entity.getIn_id()));
        m.addAttribute("approves", pos.findInstore(entity.getIn_id()));
        return "/zyh/Payorders/Approve";
    }
    @RequestMapping("purchase")
    public String Purchase(Model m,Instore entity){
        m.addAttribute("purchase",pos.findInstore(entity.getIn_id()));
        m.addAttribute("in_id",entity.getIn_id());
        return "/zyh/Payorders/Trolley";
    }
    @RequestMapping("bu")
    public String Bu(HttpServletRequest request){
        String pay_id = request.getParameter("in_id");
        pos.UpdatePayorder(2,pay_id);
        pos.UpdateInStore(2,pay_id);
        return "redirect:/zyh/Payorders/OrdersFind";
    }
    @RequestMapping("yes")
    public String Yes(HttpServletRequest request){
        String pay_id = request.getParameter("in_id");
        pos.UpdatePayorder(1,pay_id);
        pos.UpdateInStore(1,pay_id);
        return "redirect:/zyh/Payorders/OrdersFind";
    }
    @RequestMapping("OrdersDetils")
    public String toOrdersDetils(Model m, Instore entity, String nowpage){
        m.addAttribute("payorders",pos.findOrders(entity.getIn_id()));
        m.addAttribute("detils",pos.findDetlisByOrderId(entity.getIn_id()));
        m.addAttribute("now",nowpage);
        return "/zyh/Payorders/InstoreMenu";
    }
    @RequestMapping("alipayReturnUrl")
    public String alipayReturnUrl(){
        return "redirect:OrdersFind";
    }
    @RequestMapping("alipayNotifyUrl")
    public String alipayNotifyUrl(){
        return "redirect:OrdersFind";
    }


    @RequestMapping("MercountAdd")
    public String MercountAdd(Instore entity){
        pos.MercountAdd(entity);
        return "redirect:/zyh/Payorders/OrdersFind";
    }
    @RequestMapping("signature")
    public void Signature(HttpServletRequest request,HttpServletResponse response){
        String id = request.getParameter("id");
        String pass = request.getParameter("pass");
        String signa = pos.Signature(id,pass);
        try {
            response.setContentType("application/json");
            response.getWriter().write(signa);;
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
