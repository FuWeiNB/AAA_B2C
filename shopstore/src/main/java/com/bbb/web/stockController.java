package com.bbb.web;

import com.bbb.service.stockService;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("hourse")
public class stockController
{
    @Autowired
    stockService ss;
    @ResponseBody
    @RequestMapping("showall")
    public Map<String,Object> showAll(String a_name,String date,String flag)
    {
        String begindate = "";
        String afterdate = "";
        if("2".equals(flag)||"null".equals(flag)||null==flag)
        {
            flag = "";
        }
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
        Map<String, Object> tableData = new HashMap<String, Object>();
        //这是layui要求返回的json数据格式
        tableData.put("code", 0);
        tableData.put("msg", "");
        if(ss.countAll(a_name,begindate,afterdate,flag) == 0)
        {
            tableData.put("count",0);
        }
        else
        {
            //将全部数据的条数作为count传给前台（一共多少条）
            tableData.put("count", ss.countAll(a_name, begindate, afterdate,flag));
        }
        //将分页后的数据返回（每页要显示的数据）
        tableData.put("data", ss.showAll(a_name,begindate,afterdate,flag));
        //返回给前端
        return tableData;
    }

    @ResponseBody
    @RequestMapping("shownow")
    public Map<String,Object> showNow(String a_name)
    {

        if(null==a_name||"".equals(a_name))
        {
            a_name = "";
        }
        Map<String, Object> tableData = new HashMap<String, Object>();
        //这是layui要求返回的json数据格式
        tableData.put("code", 0);
        tableData.put("msg", "");
        if(ss.showNowCount(a_name) == 0)
        {
            tableData.put("count",0);
        }
        else
        {
            //将全部数据的条数作为count传给前台（一共多少条）
            tableData.put("count",ss.showNowCount(a_name));
        }
        //将分页后的数据返回（每页要显示的数据）
        tableData.put("data", ss.showNow(a_name));
        //返回给前端
        return tableData;
    }

    @ResponseBody
    @RequestMapping("showThisweek")
    public Map<String,Object> showYes(String a_name)
    {

        if(null==a_name||"".equals(a_name))
        {
            a_name = "";
        }
        Map<String, Object> tableData = new HashMap<String, Object>();
        //这是layui要求返回的json数据格式
        tableData.put("code", 0);
        tableData.put("msg", "");
        if(ss.showThisWeekCount(a_name) == 0)
        {
            tableData.put("count",0);
        }
        else
        {
            //将全部数据的条数作为count传给前台（一共多少条）
            tableData.put("count",ss.showThisWeekCount(a_name));
        }
        //将分页后的数据返回（每页要显示的数据）
        tableData.put("data", ss.showThisWeek(a_name));
        //返回给前端
        return tableData;
    }

    @ResponseBody
    @RequestMapping("showThisMonth")
    public Map<String,Object> ThisMonth(String a_name)
    {

        if(null==a_name||"".equals(a_name))
        {
            a_name = "";
        }
        Map<String, Object> tableData = new HashMap<String, Object>();
        //这是layui要求返回的json数据格式
        tableData.put("code", 0);
        tableData.put("msg", "");
        if(ss.showThisMonthCount(a_name) == 0)
        {
            tableData.put("count",0);
        }
        else
        {
            //将全部数据的条数作为count传给前台（一共多少条）
            tableData.put("count",ss.showThisMonthCount(a_name));
        }
        //将分页后的数据返回（每页要显示的数据）
        tableData.put("data", ss.showThisMonth(a_name));
        //返回给前端
        return tableData;
    }

    @ResponseBody
    @RequestMapping("showUpMonth")
    public Map<String,Object> showUpMonthCount(String a_name)
    {

        if(null==a_name||"".equals(a_name))
        {
            a_name = "";
        }
        Map<String, Object> tableData = new HashMap<String, Object>();
        //这是layui要求返回的json数据格式
        tableData.put("code", 0);
        tableData.put("msg", "");
        if(ss.showUpMonthCount(a_name) == 0)
        {
            tableData.put("count",0);
        }
        else
        {
            //将全部数据的条数作为count传给前台（一共多少条）
            tableData.put("count",ss.showUpMonthCount(a_name));
        }
        //将分页后的数据返回（每页要显示的数据）
        tableData.put("data", ss.showUpMonth(a_name));
        //返回给前端
        return tableData;
    }

    //查看某个商品在每段时间的入库和出库数量
    @ResponseBody
    @RequestMapping("instore")
    public Map<String,Object> showTheOne(String m_id)
    {
        Map<String, Object> tableData = new HashMap<String, Object>();
        //这是layui要求返回的json数据格式
        tableData.put("code", 0);
        tableData.put("msg", "");
        //将全部数据的条数作为count传给前台（一共多少条）
        if(ss.findtheInStoreCount(m_id) == 0)
        {
            tableData.put("count",0);
        }
        else
        {
            tableData.put("count", ss.findtheInStoreCount(m_id));
        }
        //将分页后的数据返回（每页要显示的数据）
        tableData.put("data", ss.findtheInStore(m_id));
        //返回给前端
        return tableData;

    }

    //查看某个商品在每段时间的入库和出库数量
    @ResponseBody
    @RequestMapping("outstore")
    public Map<String,Object> showOutthetore(String m_id)
    {
        Map<String, Object> tableData = new HashMap<String, Object>();
        //这是layui要求返回的json数据格式
        tableData.put("code", 0);
        tableData.put("msg", "");
        //将全部数据的条数作为count传给前台（一共多少条）
        if(ss.findtheOutStoreCount(m_id) == 0)
        {
            tableData.put("count", 0);
        }
        else
        {
            //将分页后的数据返回（每页要显示的数据）
            tableData.put("count", ss.findtheOutStoreCount(m_id));
        }
        tableData.put("data", ss.findtheOutStore(m_id));
        //返回给前端
        return tableData;
    }

    @ResponseBody
    @RequestMapping("count")
    public String showcount(String m_id)
    {
        Map<String,Object> map = new HashMap<>();

        if(ss.inStoreCount(m_id) == null)
        {
            map.put("inCount",0);
        }
        else
        {
            Map<String,Object> map2 = ss.inStoreCount(m_id);
            map.put("inCount",map2.get("sums"));
            map.put("m_name",map2.get("m_name"));

        }
        if(ss.OutStoreCount(m_id) == 0)
        {
            map.put("outCount",0);
        }
        else
        {
            map.put("outCount", ss.OutStoreCount(m_id));
        }

        JsonConfig config = new JsonConfig();
        String rs = JSONObject.fromObject(map, config).toString();
        return rs;
    }

    @ResponseBody
    @RequestMapping("showAllOut")
    public Map<String,Object> showAllout(String a_name,String date)
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
        Map<String, Object> tableData = new HashMap<String, Object>();
        //这是layui要求返回的json数据格式
        tableData.put("code", 0);
        tableData.put("msg", "");
        if(ss.showAlloutCount(a_name,begindate,afterdate) == 0)
        {
            tableData.put("count",0);
        }
        else
        {
            //将全部数据的条数作为count传给前台（一共多少条）
            tableData.put("count", ss.showAlloutCount(a_name,begindate,afterdate));
        }
        //将分页后的数据返回（每页要显示的数据）
        tableData.put("data", ss.showAllOut(a_name,begindate,afterdate));
        //返回给前端
        return tableData;
    }

    @RequestMapping("showshopinfos")
    public String showshopinfo(String m_id, Model m )
    {
        m.addAttribute("map",ss.findtheShop(m_id));
        return "/hourse/stockDetials";
    }



}
