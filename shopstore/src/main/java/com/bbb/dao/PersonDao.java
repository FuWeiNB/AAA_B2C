package com.bbb.dao;

import com.aaa.util.DBhelper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public class PersonDao
{
    //查全部
    public List<Map<String,Object>> showPersonOrders(String user)
    {
        /*System.out.println("user"+user);
        String sql1="select os.o_id,sum(os.buy_number) sums,os.m_id from orderdetials os " +
                " inner join orders o on os.o_id = o.o_id" +
                " where o.o_user ='"+user+"' group by o.o_id"; //这个查的是这个用户的订单编号 这个订单的购买的总数量，商品编号
        List<Map<String,Object>> lists = DBhelper.executeQuery(sql1);
        System.out.println("lists"+lists);
        List<Map<String,Object>> listss= new ArrayList<>();
        //然后循环  通过商品编号获得
        for(int i = 0;i<lists.size();i++)
        {
            Map<String,Object> maps = new HashMap<>();

            String sql2= "select m.m_name,p_c.c_Name,ims.img_url,m.m_price,m.m_id,os.o_id,\n" +
                    "  a_l.user,a_l.name,os.o_price,di.send_thing,di.submit_thing,os.o_flag,o_date,p_t.t_name,os.o_date\n" +
                    "  from merchandise m\n" +
                    "  inner join p_m on m.m_id = p_m.m_id\n" +
                    "  inner join product_categories p_c on p_c.c_id = p_m.c_id\n" +
                    "  right join orderdetials ors on ors.m_id = m.m_id\n" +
                    "  inner join orders os on ors.o_id = os.o_id\n" +
                    "  right join dateinfo di on di.o_id = os.o_id\n" +
                    "  inner join img_m on img_m.m_id = m.m_id\n" +
                    "  inner join images ims on img_m.img_id=ims.img_id\n" +
                    "  inner join admin_login a_l on a_l.user=os.o_user\n" +
                    "  inner join product_type p_t on p_t.m_id = m.m_id\n" +
                    "  where a_l.user ='"+user+"'\n and m.m_id='" +lists.get(i).get("m_id")+"'"+
                    "   group by os.o_id  " +
                    " order by os.o_date \n" ;
            maps.put("sums",lists.get(i).get("sums"));
            maps = DBhelper.executeQuery(sql2).get(i);

            listss.add(maps);
        }
        System.out.println(listss);*/
        String sql = "" +
                " select m.m_name,p_c.c_Name,ims.img_url,m.m_price,m.m_id,os.o_id,sum(ors.buy_number) sums," +
                "  a_l.user,a_l.name,os.o_price,di.send_thing,di.submit_thing,os.o_flag,o_date,p_t.t_name,os.o_date" +
                "  from merchandise m " +
                "  inner join p_m on m.m_id = p_m.m_id" +
                "  inner join product_categories p_c on p_c.c_id = p_m.c_id" +
                "  right join orderdetials ors on ors.m_id = m.m_id" +
                "  inner join orders os on ors.o_id = os.o_id" +
                "  right join dateinfo di on di.o_id = os.o_id" +
                "  inner join img_m on img_m.m_id = m.m_id" +
                "  inner join images ims on img_m.img_id=ims.img_id" +
                "  inner join admin_login a_l on a_l.user=os.o_user" +
                "  inner join product_type p_t on p_t.m_id = m.m_id" +
                "  where a_l.user = "+user+ " and os.or_flag is null " +
                "  group by os.o_id" +
                "  order by os.o_date desc";
        return DBhelper.executeQuery(sql);
    }
    //查待付款或者已取消
    public List<Map<String,Object>> showPersonOrdersBy1(String user)
    {
        String sql = "" +
                " select m.m_name,p_c.c_Name,ims.img_url,m.m_price,m.m_id,os.o_id,sum(ors.buy_number) sums," +
                "  a_l.user,a_l.name,os.o_price,di.send_thing,di.submit_thing,os.o_flag,o_date,p_t.t_name,os.o_date" +
                "  from merchandise m " +
                "  inner join p_m on m.m_id = p_m.m_id" +
                "  inner join product_categories p_c on p_c.c_id = p_m.c_id" +
                "  right join orderdetials ors on ors.m_id = m.m_id" +
                "  inner join orders os on ors.o_id = os.o_id" +
                "  right join dateinfo di on di.o_id = os.o_id" +
                "  inner join img_m on img_m.m_id = m.m_id" +
                "  inner join images ims on img_m.img_id=ims.img_id" +
                "  inner join admin_login a_l on a_l.user=os.o_user" +
                "  inner join product_type p_t on p_t.m_id = m.m_id" +
                "  where a_l.user = "+user+
                " and (os.o_flag = 0 or os.o_flag=1) and os.or_flag is null" +
                " group by os.o_id " +
                " order by os.o_date desc";
        return DBhelper.executeQuery(sql);
    }
    //查待发货
    public List<Map<String,Object>> showPersonOrdersBy2(String user)
    {
        String sql = "" +
                " select m.m_name,p_c.c_Name,ims.img_url,m.m_price,m.m_id,os.o_id,sum(ors.buy_number) sums," +
                "  a_l.user,a_l.name,os.o_price,di.send_thing,di.submit_thing,os.o_flag,o_date,p_t.t_name,os.o_date" +
                "  from merchandise m " +
                "  inner join p_m on m.m_id = p_m.m_id" +
                "  inner join product_categories p_c on p_c.c_id = p_m.c_id" +
                "  right join orderdetials ors on ors.m_id = m.m_id" +
                "  inner join orders os on ors.o_id = os.o_id" +
                "  right join dateinfo di on di.o_id = os.o_id" +
                "  inner join img_m on img_m.m_id = m.m_id" +
                "  inner join images ims on img_m.img_id=ims.img_id" +
                "  inner join admin_login a_l on a_l.user=os.o_user" +
                "  inner join product_type p_t on p_t.m_id = m.m_id" +
                "   where a_l.user = "+user+" and os.o_flag = 2 and os.or_flag is null" +
                " group by os.o_id " +
                " order by os.o_date desc";
        return DBhelper.executeQuery(sql);
    }
    //查待收货
    public List<Map<String,Object>> showPersonOrdersBy3(String user)
    {
        String sql = "" +
                " select m.m_name,p_c.c_Name,ims.img_url,m.m_price,m.m_id,os.o_id,sum(ors.buy_number) sums," +
                "  a_l.user,a_l.name,os.o_price,di.send_thing,di.submit_thing,os.o_flag,o_date,p_t.t_name,os.o_date" +
                "  from merchandise m " +
                "  inner join p_m on m.m_id = p_m.m_id" +
                "  inner join product_categories p_c on p_c.c_id = p_m.c_id" +
                "  right join orderdetials ors on ors.m_id = m.m_id" +
                "  inner join orders os on ors.o_id = os.o_id" +
                "  right join dateinfo di on di.o_id = os.o_id" +
                "  inner join img_m on img_m.m_id = m.m_id" +
                "  inner join images ims on img_m.img_id=ims.img_id" +
                "  inner join admin_login a_l on a_l.user=os.o_user" +
                "  inner join product_type p_t on p_t.m_id = m.m_id" +
                "  where a_l.user = "+user+" and os.o_flag = 3 and os.or_flag is null" +
                " group by os.o_id " +
                " order by os.o_date desc";
        return DBhelper.executeQuery(sql);
    }
    //查已完成
    public List<Map<String,Object>> showPersonOrdersBy4(String user)
    {
        String sql = "" +
                " select m.m_name,p_c.c_Name,ims.img_url,m.m_price,m.m_id,os.o_id,(select count(*) from orderdetials  where o_id ='db8ebad08b4e4fc49890c50bfdc27a6d') sums," +
                "  a_l.user,a_l.name,os.o_price,di.send_thing,di.submit_thing,os.o_flag,o_date,p_t.t_name,os.o_date" +
                "  from merchandise m " +
                "  inner join p_m on m.m_id = p_m.m_id" +
                "  inner join product_categories p_c on p_c.c_id = p_m.c_id" +
                "  right join orderdetials ors on ors.m_id = m.m_id" +
                "  inner join orders os on ors.o_id = os.o_id" +
                "  right join dateinfo di on di.o_id = os.o_id" +
                "  inner join img_m on img_m.m_id = m.m_id" +
                "  inner join images ims on img_m.img_id=ims.img_id" +
                "  inner join admin_login a_l on a_l.user=os.o_user" +
                "  inner join product_type p_t on p_t.m_id = m.m_id" +
                "  where a_l.user = "+user+" and os.o_flag = 4 and os.or_flag is null" +
                " group by os.o_id " +
                "order by os.o_date desc";
        return DBhelper.executeQuery(sql);
    }
    //查看详情中的获得收货地址
    public Map<String,Object> findtheAddress(String o_id)
    {
        String sql = "select orders.o_id,orders.o_name,orders.o_aname,orders.o_flag,orders.pa_number,orders.o_phone,pa_id" +
                " ,outstore.out_number,dio.send_thing,dio.submit_thing" +
                " from orders " +
                " inner join outstore on orders.o_id=outstore.o_id" +
                " inner join dateinfo dio on dio.o_id = orders.o_id" +
                " where orders.o_id = '"+o_id+"'";
        if(DBhelper.executeQuery(sql).size()==0)
        {
            sql = "select orders.o_id,orders.o_name,orders.o_aname,orders.o_flag,orders.pa_number,orders.o_phone,pa_id" +
                    " ,dio.send_thing,dio.submit_thing" +
                    " from orders " +
                    " inner join dateinfo dio on dio.o_id = orders.o_id" +
                    " where orders.o_id = '"+o_id+"'";
        }
        return DBhelper.executeQuery(sql).get(0);
    }
    //通过订单编号，查询里面的商品信息
    public List<Map<String,Object>> showshopInfo(String o_id)
    {
        String sql ="select m.m_name,p_c.c_Name,img_url,m.m_price,otl.buy_number,m.m_price * otl.buy_number counts,otl.o_id \n" +
                " from merchandise m\n" +
                " inner join p_m on m.m_id = p_m.m_id\n" +
                " inner join product_categories p_c on p_c.c_id =p_m.c_id\n" +
                " right join img_m on img_m.m_id = m.m_id\n" +
                " left join images on images.img_id = img_m.img_id\n" +
                " inner join orderdetials otl on m.m_id = otl.m_id\n" +
                " where otl.o_id='"+o_id+"'" +
                " group by m_name";
        return DBhelper.executeQuery(sql);
    }
    //修改订单的or_flag 这个是用于用户点击删除订单的操作时执行的。
    public int updateOr_flag(String o_id)
    {
        String sql ="update orders set or_flag = 0 where o_id = '"+o_id+"'";
        return DBhelper.executeUpdate(sql);
    }
    //修改订单的o_flag 这个是用户点击确认收货时执行的
    public int updateO_flag(String o_id)
    {
        String sql = "update orders set o_flag=4 where o_id='"+o_id+" ' ";
        return DBhelper.executeUpdate(sql);
    }
    //查询输入的密码和数据库中的密码匹配不匹配
    public Map<String,Object> c2Pass(String admin_id)
    {
       return  DBhelper.executeQuery("select * from admin_login where user='"+admin_id+"'").get(0);
    }


}
