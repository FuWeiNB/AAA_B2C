package com.bbb.dao.zyh;

import com.aaa.util.DBhelper;
import com.bbb.entity.zyh.Instore;
import com.bbb.entity.zyh.Merchandise;
import com.bbb.entity.zyh.Payorders;
import com.bbb.util.PageHelper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public class PayordersDao {
    public List<Map<String,Object>> goodsFindAll(PageHelper page, Merchandise mer){
        String sql = "select m.m_id,m.m_name,m.m_count,pro.c_Id,pro.c_Name from merchandise m " +
                " inner join p_m on p_m.m_id = m.m_id " +
                " inner join product_categories pro on p_m.c_id=pro.c_id " +
                " where 1=1";
        if(mer.getC_id() != null && mer.getC_id() != "") sql +=" and m.c_id="+mer.getC_id();
        if(mer.getM_name() != null && mer.getM_name() != "") sql += " and m.m_name like '%"+mer.getM_name()+"%'";
        sql += " group by m.m_id limit ?,?";
        return DBhelper.executeQuery(sql,page.getBegin(),page.getPageSize());
    }
    public int goodscount(Merchandise mer){
        String sql = "select * from merchandise m " +
                " inner join p_m on p_m.m_id = m.m_id " +
                " inner join product_categories pro on p_m.c_id=pro.c_id where 1=1";
        if(mer.getC_id() != null && mer.getC_id() != "") sql +=" and m.c_id="+mer.getC_id();
        if(mer.getM_name() != null && mer.getM_name() != "") sql += " and m.m_name like '%"+mer.getM_name()+"%'";
        sql+=" group by m.m_id";
        return Integer.valueOf(DBhelper.executeQuery(sql).size());
    }
    public List<Map<String,Object>> findProduct_ca(){
        return DBhelper.executeQuery("select c_Id,c_Name from product_categories");
    }
    public Map<String,Object> toTrolley(Merchandise mer){
        return DBhelper.executeQuery("select * from merchandise where m_id=?",mer.getM_id()).get(0);
    }
    public void insertIn_m(Object... obj){
        DBhelper.executeUpdate("insert into instore(in_id,in_flag,m_price,in_num1,in_price1,m_id,s_id) values(?,?,?,?,?,?,?)", obj);
    }
    public void UpdateInStore(Object... obj){
        DBhelper.executeUpdate("update instore set in_flag=? where in_id=?",obj);
    }
    public void insertPayorders(Object... obj){
        DBhelper.executeUpdate("insert into payorders(pay_price,pay_flag,in_id,pay_in_date) values(?,?,?,now())",obj);
    }
    public void UpdatePayorder(Object... obj){
        DBhelper.executeUpdate("update payorders set pay_flag=? where in_id=?",obj);
    }
    public void UpdatePayorders(Object... obj){
        DBhelper.executeUpdate("update payorders set emp_id=?,pay_flag='3',pay_date=now(),pay_price2=? where in_id=?",obj);
    }
    public void UpdateIn_m(Object... obj){
        DBhelper.executeUpdate("update instore set in_flag='3',e_id=?,in_num2=?,in_price2=?,in_memo=? where in_id=?", obj);
    }
    public Map<String, Object> one(Object... obj) {
        List<Map<String,Object>> list = DBhelper.executeQuery("select * from merchandise where m_id=?",obj);
        return list.size() > 0 ? list.get(0) : null;
    }
    public Map<String,Object> findOrders(Object... obj){
        List<Map<String,Object>> list = DBhelper.executeQuery("select * from payorders where in_id=?", obj);
        return list.size() > 0 ? list.get(0) : null;
    }
    public List<Map<String,Object>> findInstoreByOrderId(String in_id)
    {
        return DBhelper.executeQuery("select * from instore i left join merchandise m on i.m_id=m.m_id where i.in_id=?", in_id);
    }
    public List<Map<String,Object>> findInstore(String in_id)
    {
        return DBhelper.executeQuery("select * from instore i left join merchandise m on i.m_id=m.m_id left join supplier s on s.s_id=i.s_id where i.in_id=?", in_id);
    }
    public Map<String, Object> Payone(Object... obj) {
        List<Map<String,Object>> list = DBhelper.executeQuery("select * from payorders pay left join emp e on pay.emp_id=e.e_id where pay.pay_id=?", obj);
        return list.size() > 0 ? list.get(0) : null;
    }
    public List<Map<String,Object>> OrdersFindAll(PageHelper page, Payorders entity){

        String sql = "select * from payorders where 1=1";
        if(entity.getMin() != null && entity.getMax() != null && entity.getMin() != "" && entity.getMax() != "") sql += " and pay_date between '"+entity.getMin()+"' and '"+entity.getMax()+"'";
        if(entity.getPay_flag() != null && entity.getPay_flag() != "") sql += " and pay_flag="+entity.getPay_flag();
        sql += " limit ?,?";
        return  DBhelper.executeQuery(sql,page.getBegin(),page.getPageSize());
    }
    public int OrdersCount(Payorders entity){
        String sql = "select count(*) from payorders where 1=1";
        if(entity.getMin() != null && entity.getMax() != null && entity.getMin() != "" && entity.getMax() != "") sql += " and pay_date between '"+entity.getMin()+"' and '"+entity.getMax()+"'";
        if(entity.getPay_flag() != null && entity.getPay_flag() != "") sql += " and pay_flag="+entity.getPay_flag();
        return  Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("count(*)").toString());
    }
    public void MercountAdd(Instore entity){
        List<Map<String,Object>> list = DBhelper.executeQuery("select * from instore where In_id=?",entity.getIn_id());
        for(Map<String,Object> map : list){
            int i = Integer.valueOf(DBhelper.executeQuery("select m_count from merchandise where m_id=?",map.get("m_id")).get(0).get("m_count").toString());
            int j = Integer.valueOf(map.get("in_num2").toString());
            int count = i+j;
            DBhelper.executeUpdate("update merchandise set m_count=? where m_id=?",count,map.get("m_id"));
            DBhelper.executeUpdate("update instore set in_flag=4 where in_id=?",entity.getIn_id());
            DBhelper.executeUpdate("update payorders set pay_flag=4 where in_id=?",entity.getIn_id());
        }
    }
    public String verify(String id, String pass){
        Map<String,Object> map = DBhelper.executeQuery("select * from emp where e_name=? and e_pass=?",id,pass).get(0);
        String signa = null;
        if(map.size() > 0)
        {
            for(int i=0; i<map.size(); i++){
                int j = Integer.valueOf(map.get("r_id").toString());
                if(j == 3 || j == 7) signa = "caigou";
                else if(j == 6 || j == 10) signa ="caiwu";
                else signa = "cuowu";
            }
        }
        else signa = "mei";
        return signa;
    }
}
