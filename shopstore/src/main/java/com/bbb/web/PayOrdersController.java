package com.bbb.web;

import com.alibaba.fastjson.JSON;
import com.bbb.service.PayOrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("hourse")
public class PayOrdersController
{
    @Autowired
    PayOrdersService pos;

    @ResponseBody
    @RequestMapping("showsuppliers")
    public Map<String,Object> showSupplier(Model m)
    {
        Map<String, Object> tableData = new HashMap<String, Object>();
        //这是layui要求返回的json数据格式
        tableData.put("code", 0);
        tableData.put("msg", "");
        //将全部数据的条数作为count传给前台（一共多少条）
        tableData.put("count", pos.count());
        //将分页后的数据返回（每页要显示的数据）
        tableData.put("data", pos.show_Supplier());
        //返回给前端
        return tableData;
    }
    @ResponseBody
    @RequestMapping("showsu")
    public String toshow(HttpServletResponse resp)
    {
        List<Map<String,Object>> list = pos.show_Supplier();
        StringBuffer buffer = new StringBuffer("<select name='s_id' id='s_id' onchange='changeshop(this.value)'>");

        for(Map<String,Object> map:list)
        {
            buffer.append(
                    "<option value='"+map.get("s_id")+"'>"+map.get("s_name")+"</option>");
        }
        buffer.append("</select>");
        resp.setCharacterEncoding("utf-8");
        return JSON.toJSONString(buffer);
    }
    //这个是进货订单里面查看商品名称的方法，在页面上显示
    @ResponseBody
    @RequestMapping("showshop")
    public String showshop(HttpServletResponse resp)
    {
        List<Map<String,Object>> list = pos.showshop();
        int count = 1;
        StringBuffer buffer = new StringBuffer("<select name='m_id'  id='m_id'  onchange='changeshop(this.value)'><option value='0' >--请选择--</option>");

        for(Map<String,Object> map:list)
        {
            buffer.append(
                    "<option value='"+map.get("m_id")+"'>"+map.get("m_name")+"</option>");
        }
        buffer.append("</select>");
        resp.setCharacterEncoding("utf-8");
        return JSON.toJSONString(buffer);
    }
    //这个是进货订单里面获取商品编号，根据商品编号获得这个商品的信息
    @ResponseBody
    @RequestMapping("showshopinfo")
    public String showshopinfo(HttpServletResponse resp,String m_id)
    {

        Map<String,Object> map = pos.showshopinfo(m_id);
        resp.setCharacterEncoding("utf-8");
        return JSON.toJSONString(map);
    }
}
