package com.bbb.dao;

import com.aaa.util.DBhelper;
import com.bbb.entity.orders;
import com.bbb.util.DateHelper;
import com.bbb.util.PageHelper;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Component
public class ordersDao implements BaseDao<orders>
{

    @Override
    public void add(orders entity)
    {

    }

    @Override
    public void upd(orders entity)
    {
        DBhelper.executeUpdate("update orders set o_phone =?,o_aname=?,o_name=?,o_memo=? where o_id=?", entity.getO_phone(), entity.getO_aname(), entity.getO_name(), entity.getO_memo(), entity.getO_id());
    }

    public int upds(orders entity)
    {
       return DBhelper.executeUpdate("update orders set o_phone =?,o_aname=?,o_name=?,o_memo=? where o_id=?", entity.getO_phone(), entity.getO_aname(), entity.getO_name(), entity.getO_memo(), entity.getO_id());
    }

    @Override
    public void del(orders entity){
    }

    @Override
    public List<Map<String, Object>> find(Object... obj)
    {
        return null;
    }

    @Override
    public List<Map<String, Object>> page(Object... obj)
    {
        return null;
    }

    @Override
    public Map<String, Object> findOne(orders entity)
    {
        return null;
    }


    public List<Map<String, Object>> findPage(PageHelper p, Object... obj)
    {

        String sql = " select o.o_id,o.o_name,o.o_price,o.o_phone,o.o_flag,m.m_name,o.o_date,o.o_aname,od.buy_number,al.name " +
                "from orders o left join orderdetials od on o.o_id=od.o_id" +
                " left join admin_login al on al.user = o.o_user" +
                " right join dateinfo di on di.o_id=o.o_id" +
                " RIGHT JOIN merchandise m on m.m_id = od.m_id where 1=1";
        if (!"0".equals(obj[0]))
        {
            sql += " and  o.o_id = '" + obj[0] + " '";
        }

        sql += " order by o.o_date desc ";
        return DBhelper.executeQuery(sql);
    }

    public Map<String, Object> findone(orders entity)
    {
        String sql = " select * from orders o left join orderdetials od on o.o_id=od.o_id" +
                " left join admin_login al on al.user = o.o_user" +
                " right join dateinfo di on di.o_id=o.o_id" +
                " RIGHT JOIN merchandise m on m.m_id = od.m_id" +
                " where o.o_id = ?";
        return DBhelper.executeQuery(sql, entity.getO_id()).get(0);
    }

    public int count()
    {
        String sql = " select count(*) counts from orders o left join orderdetials od on o.o_id=od.o_id" +
                " left join admin_login al on al.user = o.o_user" +
                " right join dateinfo di on di.o_id=o.o_id" +
                " RIGHT JOIN merchandise m on m.m_id = od.m_id";

        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString());
    }

    public List<Map<String, Object>> findByParams(orders entity)
    {
        String sql = "select * from orderdetials od " +
                "  inner join merchandise m on od.m_id = m.m_id " +
                "  inner join orders o on o.o_id = od.o_id" +
                "  inner join img_m on img_m.m_id=m.m_id" +
                "  inner join images i on i.img_id = img_m.img_id" +
                "  inner join product_type p_t on p_t.m_id=m.m_id" +
                "   where od.o_id =? " +
                "  group by m.m_id";
        return DBhelper.executeQuery(sql, entity.getO_id());
    }




    //因为有多个不确定的参数，所以不方便使用basedao中的方法就使用了这个
    public List<Map<String, Object>> show(String begindate, String afterdate, String a_name, String oflag)
    {
        String sql = "select o.o_id,o.o_name,o.o_price,o.o_phone,o.o_flag,m.m_name,o.o_date,o.o_aname,od.buy_number,al.name,i.img_name,i.img_url,o.o_memo,o.or_flag" +
                "   from orders o right join orderdetials od on o.o_id=od.o_id" +
                "   inner join admin_login al on al.user = o.o_user" +
                "    inner join dateinfo di on di.o_id=o.o_id" +
                "      inner JOIN merchandise m on m.m_id = od.m_id" +
                "   inner join img_m on m.m_id=img_m.m_id" +
                "    inner join images i on i.img_id=img_m.img_id" +
                " where 1=1";
        if (!"".equals(a_name))
        {
            sql += " and (o.o_id='" + a_name + "' or m.m_name like '%" + a_name + "%' or al.name like '%" + a_name + "%' " +
                    " or o.o_phone like '%" + a_name + "%' or o.o_aname like '%" + a_name + "%' or o.o_name like '%"+a_name+"%'" +
                    "" +
                    "   ) ";
        }
        if (!"".equals(oflag))
        {
            sql += " and o.o_flag = '" + oflag + "' ";
        }
        if (!"".equals(begindate) && !"".equals(afterdate))
        {
            sql += " and o.o_date between '" + begindate + "' and '" + afterdate + "' ";
        }

        sql += " group by o.o_id  order by o.o_date desc ";
        return DBhelper.executeQuery(sql);
    }

    //根据参数查询多个表的总数。
    public int countByParams(String a_name, String begindate, String afterdate, String oflag)
    {
        String sql = "select (select count(*) counts\n" +
                "  from  (select count(*) from orders o right join orderdetials od on o.o_id=od.o_id                 \n" +
                "   inner join admin_login al on al.user = o.o_user\n" +
                "    inner join dateinfo di on di.o_id=o.o_id\n" +
                "   inner JOIN merchandise m on m.m_id = od.m_id\n" +
                "     inner join img_m on m.m_id=img_m.m_id\n" +
                "        inner join images i on i.img_id=img_m.img_id\n" +
                "         where  1=1 ";
        if (!"".equals(a_name))
        {
            sql += " and (o.o_id='" + a_name + "' or m.m_name like '%" + a_name + "%' or al.name like '%" + a_name + "%' " +
                    " or o.o_phone like '%" + a_name + "%' or o.o_aname like '%" + a_name + "%'  or o.o_name like '%"+a_name+"%'"+
                    "   ) ";
        }
        if (!"".equals(oflag))
        {
            sql += " and o.o_flag = '" + oflag + "' ";
        }
        if (!"".equals(begindate) && !"".equals(afterdate))
        {
            sql += " and o.o_date between'" + begindate + "' and  '" + afterdate + "' ";
        }

        sql+= "    group by o.o_id) s) counts\n" +
                "   from orders o right join orderdetials od on o.o_id=od.o_id                 \n" +
                "   inner join admin_login al on al.user = o.o_user\n" +
                "     inner join dateinfo di on di.o_id=o.o_id\n" +
                "    inner JOIN merchandise m on m.m_id = od.m_id\n" +
                "   inner join img_m on m.m_id=img_m.m_id\n" +
                "    inner join images i on i.img_id=img_m.img_id\n" +
                "     where 1=1\n";
        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString());
    }

    //获取全部订单
    public int countAll()
    {
        String sql = "select count(*) counts from orders";
        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString());
    }

    //获取已取消的订单
    public int countcancle()
    {
        String sql = "select count(*) counts from orders where o_flag=1";
        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString());
    }

    //获取已完成的订单
    public int countOk()
    {
        String sql = "select count(*) counts from orders where o_flag=4";
        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString());
    }

    //获取待发货订单
    public int countTosend()
    {
        String sql = "select count(*) counts from orders where o_flag=2";
        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString());
    }

    //待收货的订单数量
    public int countShou()
    {
        String sql = "select count(*) counts from orders where o_flag=3";
        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString());
    }

    //查询退款订单
    public List<Map<String, Object>> show_QuitMoney(String begindate, String afterdate, String a_name, String oflag)
    {
        String sql = " select o.o_id,o.o_price,m.m_name,al.name,q_m.q_id,q_m.q_date,q_m.q_memo,q_m.q_flag,q_m.q_method " +
                "from orders o right join orderdetials od on o.o_id=od.o_id" +
                " inner join quit_money q_m on o.o_id = q_m.o_id" +
                " inner join admin_login al on al.user = o.o_user" +
                " inner JOIN merchandise m on m.m_id = od.m_id" +
                " where 1=1 and (o.or_flag=0 or o.or_flag=1 or o.or_flag=2)";
        if (!"".equals(a_name))
        {
            sql += " and (q_m.q_id='" + a_name+ "' or m.m_name like '%" + a_name + "%' or al.name like '% " +a_name+" %'"+
                    "   ) ";
        }
        if (!"".equals(oflag))
        {
            sql += " and q.q_flag = '" + oflag + "' ";
        }
        if (!"".equals(begindate) && !"".equals(afterdate))
        {
            sql += " and (q_m.q_date between '" + begindate + "' and '" + afterdate + "') ";
        }

        sql += " order by q_m.q_date desc ";
        return DBhelper.executeQuery(sql);
    }
    public int show_QuitCount(String begindate, String afterdate, String a_name, String oflag)
    {
        String sql = " select count(*) counts " +
                "from orders o right join orderdetials od on o.o_id=od.o_id" +
                " inner join quit_money q_m on o.o_id = q_m.o_id" +
                " inner join admin_login al on al.user = o.o_user" +
                " inner JOIN merchandise m on m.m_id = od.m_id" +
                " where 1=1 and (o.or_flag=0 or o.or_flag=1 or o.or_flag=2)";
        if (!"".equals(a_name))
        {
            sql += " and (q_m.q_id='" + a_name+ "' or m.m_name like '%" + a_name + "%' or al.name like '% " +a_name+" %'"+
                    "   ) ";
        }
        if (!"".equals(oflag))
        {
            sql += " and q_m.q_flag = '" + oflag + "' ";
        }
        if (!"".equals(begindate) && !"".equals(afterdate))
        {
            sql += " and q_m.q_date between'" + begindate + "' and  '" + afterdate + "' ";
        }
        sql += " order by q_m.q_date desc ";
        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString());
    }
    //查询某个订单购买的总数量
    public int Buy_count(orders o)
    {
        return Integer.valueOf(DBhelper.executeQuery("select sum(buy_number) counts from orderdetials " +
                "where o_id = ?",o.getO_id()).get(0).get("counts").toString());
    }
    //根据订单查询订单信息
    public List<Map<String,Object>> findTheOrders(String o_id)
    {
        String sql = "select m.m_name,o.o_id,ors.o_date,o.buy_number,p_t.t_name,m.m_price,ors.o_phone,ors.o_flag" +
                ",ors.o_aname,ors.o_name,ors.o_number,img.img_url" +
                "    from merchandise m" +
                " inner join img_m on img_m.m_id=m.m_id" +
                "  inner join images img on img.img_id=img_m.img_id" +
                "  right join orderdetials o on m.m_id = o.m_id" +
                "  inner join product_type p_t on p_t.t_id = o.t_id " +
                "   inner join orders ors on ors.o_id = o.o_id" +
                "      inner join admin_login a_l on a_l.user= ors.o_user" +
                " where o.o_id='"+o_id+"' group by m.m_id";
        return DBhelper.executeQuery(sql);
    }
    //根据订单查询订单收货地址
    public Map<String,Object> findtheOnes(String o_id)
    {
        String sql = "select  orders.o_id,orders.o_aname,orders.o_name,orders.o_phone,admin_login.`name` from orders " +
                "inner join admin_login on orders.o_user = admin_login.user  where orders.o_id ='"+o_id+"'" ;
        return DBhelper.executeQuery(sql).get(0);
    }

    //修改订单里面的状态为3
    public void upd(String o_id,String pa_number,String e_id,String out_number)
    {
        String uuid = UUID.randomUUID().toString().replaceAll("-","");
        //修改订单状态并且修改快递公司名称
        String sql1 = "update orders set o_flag = 3,pa_id='"+uuid+"',pa_number='"+pa_number+"' where o_id='"+o_id+"'";
        DBhelper.executeUpdate(sql1);
        //修改dateinfo中的发货时间
        Date d = new Date();
        String sql2="update dateinfo set send_thing='"+ DateHelper.D2S(d) +"' where o_id='"+o_id+"'";
        DBhelper.executeUpdate(sql2);
        //根据订单编号 查询一个订单购买的商品的总量，然后添加到outstore里面
        String sql3="" +
                " select os.buy_number,orders.o_id,m.m_id,sum(buy_number) sums from orders " +
                " inner join orderdetials os on orders.o_id=os.o_id " +
                " inner join merchandise m on m.m_id = os.m_id" +
                " where orders.o_id='"+o_id+"'" +
                " group by orders.o_id";
        Map<String,Object> map1 = DBhelper.executeQuery(sql3).get(0);
        //查询每个商品购买的总数量然后循环修改仓库中的购买的每个商品的数量
        String sql6 = "select m.m_id,m.m_name,sum(orderdetials.buy_number) sums from merchandise m " +
                " inner join orderdetials  on m.m_id = orderdetials.m_id" +
                " where orderdetials.o_id ='"+o_id+"'" +
                " group by m.m_id";
        List<Map<String,Object>> list2 =DBhelper.executeQuery(sql6) ;
        for(Map<String,Object> maps:list2 )
        {
            String sql7 = "update merchandise set m_count=m_count-"+maps.get("sums")+" where m_id = "+maps.get("m_id");
            DBhelper.executeUpdate(sql7);
        }
        String sql4 = "insert into outstore(out_number,out_date,out_numbers,e_id,o_id,out_flag) values('"+out_number+"'"
                +",'"+DateHelper.D2S(d)+"'"+",'"+map1.get("sums")+"'"+",'"+e_id+"'"+",'"+o_id+"','"+0+"'"
                +")";
        DBhelper.executeUpdate(sql4);
        //查询刚刚添加在outstore里面的数据对应的编号 添加到out_m表里面，并且根据订单编号
        String sql5="" +
                " select outstore.out_id,m.m_id,os.buy_number from orderdetials os" +
                " inner join orders on os.o_id = orders.o_id" +
                " inner join outstore on outstore.o_id=orders.o_id" +
                " inner join merchandise m on os.m_id = m.m_id " +
                " where orders.o_id='"+o_id+"'";
        List<Map<String,Object>> list1= DBhelper.executeQuery(sql5);

        for(Map<String,Object> map:list1)
        {
            sql6="insert into out_m(m_id,out_id,o_number) values('"+map.get("m_id")+"'," +
                    "'"+map.get("out_id")+"',"+"'"+map.get("buy_number")+"'"
                    +")";
            DBhelper.executeUpdate(sql6);
        }
    }




}
