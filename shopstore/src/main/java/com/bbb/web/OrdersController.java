package com.bbb.web;

import com.bbb.dao.addressDao;
import com.bbb.dao.ordersDao;
import com.bbb.entity.orders;
import com.bbb.service.AddressService;
import com.bbb.service.OrdersService;
import com.bbb.util.DateHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

@Controller
@RequestMapping("orders")
public class OrdersController
{
      @Autowired
      OrdersService os;
      @Autowired
      AddressService as;
      @Autowired
      ordersDao odao;
      @Autowired
      addressDao adao;

    /*  @RequestMapping("show")
      public String show(Model m, PageHelper p)
      {
          p.setNowpage(p.getNowpage()+"");
          p.setCount(os.count());
          p.setPageSize(10);
          m.addAttribute("list",os.findPage(p));
          m.addAttribute("page",p);
          return "/orders/showorders";
      }
*/

    /*
    不论什么类型，直接解析为json格式,并且可以直接返回出去，在前台使用layui中layui自动把你传过去的json解析成table所需的数据
     */
    @ResponseBody
    @RequestMapping("showss")
    public Map<String,Object> shows(Model m, HttpServletRequest req,String date,String a_name,String oflag)
    {


        String begindate = "";
        String afterdate = "";
        if(null==a_name||"".equals(a_name))
        {
            a_name = "";
        }
        if(null!=date&&!"".equals(date)&&!"0".equals(date))
        {
            //通过拆分的方式获得第一个时期 因为layui获取日期的从2020-01-02 - 2020-01-20
            //所以要拆分空格的下标第零位的日期也就是2020-01-02
            begindate = date.split(" ")[0];
            afterdate = date.split("- ")[1];
        }
        if(oflag==null)
        {
            oflag ="";
        }
        Map<String, Object> tableData = new HashMap<String, Object>();
        //这是layui要求返回的json数据格式  下边这四个是必须的参数 必须传的 这个是
        tableData.put("code", 0);
        tableData.put("msg", "");
        System.out.println(os.countByParams(a_name,begindate,afterdate,oflag));
        //将全部数据的条数作为count传给前台（一共多少条）
        tableData.put("count", os.countByParams(a_name,begindate,afterdate,oflag));
        //将分页后的数据返回（每页要显示的数据）
        tableData.put("data", os.show(begindate,afterdate,a_name,oflag));
        //返回给前端
        return tableData;
    }
    //查看订单详情,因为订单信息太多，在列表中不能够现实完全
    @RequestMapping("toview")
    public String toview(orders o,Model m)
    {
        //通过订单编号去查询该订单购买的商品
        m.addAttribute("lists",odao.findByParams(o));
        //通过订单编号去查询订单的详情
        m.addAttribute("map",odao.findone(o));
        m.addAttribute("buyCount",os.Buy_count(o));
        return "orders/ordersView";
    }
    @RequestMapping("toupd")
    public String toupd(Model m,orders o)
    {
        Map<String,Object> map = odao.findone(o);
        m.addAttribute("list",adao.findAll());
        m.addAttribute("map",odao.findone(o));
        return "orders/orderUpd";
    }

    @ResponseBody()
    @RequestMapping("upd")
    public String upd(Model m,orders o)
    {
        int count = odao.upds(o);
        return count+"";
    }

    @RequestMapping("toviews")
    public String tosend(orders o,Model m)
    {
        //通过订单编号去查询该订单购买的商品
        m.addAttribute("list",odao.findByParams(o));
        //通过订单编号去查询订单的详情
        m.addAttribute("map",odao.findone(o));
        return "orders/ordersTosend";
    }
    //这个是用来统计各种总数的方法
    @ResponseBody
    @RequestMapping("counts")
    public String[] counts()
    {
        Map<String,Object> map = new HashMap<String,Object>( );
        map.put("allcount",os.countAll());
        map.put("canclecount",os.countcancle());
        map.put("countOk",os.countOk());
        map.put("Tosend",os.countTosend());
        map.put("countShou",os.countShou());
        String[] name = {os.countAll()+"",os.countcancle()+"",os.countOk()+"",os.countTosend()+"",os.countShou()+""};
       /* JsonConfig config = new JsonConfig();
        String rs = JSONObject.fromObject(map, config).toString();*/
        return name;
    }

    //查询退款的详情
    @ResponseBody
    @RequestMapping("ExitView")
    public Map<String,Object> toExit(Model m, HttpServletRequest req,String date,String a_name,String oflag)
    {

        String begindate = "";
        String afterdate = "";
        if(null==a_name||"".equals(a_name))
        {
            a_name = "";
        }
        if(null!=date&&!"".equals(date)&&!"0".equals(date))
        {
            //通过拆分的方式获得第一个时期 因为layui获取日期的从2020-01-02 - 2020-01-20
            //所以要拆分空格的下标第零位的日期也就是2020-01-02
            begindate = date.split(" ")[0];
            afterdate = date.split("- ")[1];
        }
        if(oflag==null)
        {
            oflag ="";
        }
        Map<String, Object> tableData = new HashMap<String, Object>();
        //这是layui要求返回的json数据格式
        tableData.put("code", 0);
        tableData.put("msg", "");
        //将全部数据的条数作为count传给前台（一共多少条）
        tableData.put("count", os.show_QuitCount(begindate,afterdate,a_name, oflag));
        //将分页后的数据返回（每页要显示的数据）
        tableData.put("data", os.show_QuitMoney(begindate,afterdate,a_name,oflag));
        //返回给前端
        return tableData;
    }


    //发货
    @RequestMapping("tosend")
    public String tosend(String o_id, Model m)
    {
        m.addAttribute("list",os.findTheOrders(o_id));
        m.addAttribute("map",os.findtheOnes(o_id));
        return "/orders/send";
    }
    @ResponseBody
    @RequestMapping("send")
    public String send(String o_id,String pa_number,HttpServletRequest request)
    {
        Date d = new Date();
        Random dd = new Random();
        int number = dd.nextInt()*100;
        String date=DateHelper.D2R(d);
        String numbers = date+""+number;
        HttpSession session = request.getSession();
        Map<String,Object> maps = (HashMap) session.getAttribute("e_id");
        System.out.println(maps.get("e_id")+"date:"+date);
        os.upd(o_id,pa_number,maps.get("e_id").toString(),numbers);
        return "1";
    }



}
