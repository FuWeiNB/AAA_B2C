package com.bbb.dao;

import com.aaa.util.DBhelper;
import com.bbb.entity.Buycars;
import com.bbb.entity.Login;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Component
public class BuycarsDao implements BaseDao<Buycars>
{

    public void add(Buycars entity) {

    }
    public void upd(Buycars entity) {

    }

    public void del(Buycars entity) {
       for(int b_id : entity.getB_id())
       {
           DBhelper.executeUpdate("delete from buycars where b_id = ?",b_id);
       }
    }

    public List<Map<String, Object>> find(Object... obj) {
        return DBhelper.executeQuery("select *from buycars b INNER JOIN merchandise m on b.m_id = m.m_id INNER JOIN img_m im on im.m_id = m.m_id\n" +
                "INNER JOIN images i on i.img_id = im.img_id INNER JOIN product_type p on p.t_id = b.t_id  where b.b_user = ? GROUP BY m.m_id",obj);
    }

    public List<Map<String, Object>> page(Object... obj) {
        return null;
    }

    @Override
    public Map<String, Object> findOne(Buycars entity) {
        return DBhelper.executeQuery("select * from address where a_id =?",entity.getA_id()).get(0);
    }

    public Map<String, Object> findOne(Login entity) {
        return null;
    }

    public void add_Ods(Buycars entity)
    {
        System.out.println(entity.getO_phone());
        String o_id = UUID.randomUUID().toString().replace("-","");
        int[] m_id = entity.getM_id();
        int[] buy_number = entity.getBuy_number();
        int[] t_id = entity.getT_id();
         DBhelper.executeUpdate("Insert into orders(o_id,o_price,o_user,o_flag,o_date,o_phone,o_aname,o_name,o_memo) values(?,?,?,?,?,?,?,?,?)",o_id,entity.getO_price(),entity.getB_user(),2,new Date(),entity.getO_phone(),entity.getO_site(),entity.getO_name(),entity.getO_memo());

        for(int i = 0;i < entity.getM_id().length;i++)
        {
            DBhelper.executeUpdate("Insert into orderdetials(o_id,m_id,buy_number,t_id) values(?,?,?,?)",o_id,m_id[i],buy_number[i],t_id[i]);
        }
        DBhelper.executeUpdate("insert into dateinfo(p_orders,pay_orders,o_id) value(?,?,?)",new Date(),new Date(),o_id);
        del(entity);


    }


}
