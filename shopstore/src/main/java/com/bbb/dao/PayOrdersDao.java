package com.bbb.dao;

import com.aaa.util.DBhelper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;

@Component
public class PayOrdersDao
{
    public List<Map<String,Object>> showall()
    {
        String sql = "select s.s_name,p.pay_date,p.pay_oldnumber,p.pay_newnumber," +
                "p.pay_price,p.pay_number,p.pay_flag,m.m_name,m.m_bookprice,e.e_name" +
                " from supplier s inner join payorders p on s.s_id = p.s_id" +
                " left join emp e on e.e_id = p.emp_id" +
                " right join pay_m pay on pay.pay_id = p.pay_id" +
                " left join merchandise m on m.m_id = pay.pay_id";
        return DBhelper.executeQuery(sql);
    }
    public int add()
    {
        return 0;
    }
    public List<Map<String,Object>> show_Supplier()
    {
        String sql = "select * from supplier";
        return DBhelper.executeQuery(sql);
    }
    public int count()
    {
        String sql = "select count(*) counts from supplier";
        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString());
    }
    //显示商品信息名称
    public List<Map<String,Object>> showshop()
    {
        String sql = "select m.m_id,m.m_name,m.m_oldprice,p_t.t_name,m.m_number from merchandise m " +
                "inner join product_type p_t on m.m_id=p_t.m_id ";
        return DBhelper.executeQuery(sql);
    }
    //根据商品编号来查询商品信息
    public Map<String,Object> showshopinfo(String m_id)
    {
        String sql = "select m.m_id,m.m_name,m.m_oldprice,p_t.t_name,m.m_number from merchandise m " +
                "inner join product_type p_t on m.m_id=p_t.m_id where m.m_id="+m_id;
        return DBhelper.executeQuery(sql).get(0);
    }


}
