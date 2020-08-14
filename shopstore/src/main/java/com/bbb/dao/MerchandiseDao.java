package com.bbb.dao;

import com.aaa.util.DBhelper;
import com.bbb.entity.Merchandise;
import org.springframework.stereotype.Component;

import java.util.Date;
import java.util.List;
import java.util.Map;

@Component
public class MerchandiseDao implements BaseDao<Merchandise>
{
    public int Ifid(Merchandise entity)
    {
        List list = DBhelper.executeQuery("select *from merchandise where m_id = ?",entity.getM_id());
        if(list.size() >0)
        {
            return 1;
        }
        return 0;
    }
    public void add(Merchandise entity)
    {
        DBhelper.executeUpdate("Insert into merchandise(m_id,m_number,m_name,m_price,m_count,m_bookprice,m_oldprice,m_detail,m_flag,m_date) values(?,?,?,?,?,?,?,?,?,?) ",entity.getM_id(),entity.getM_number(),entity.getM_name(),entity.getM_price(),entity.getM_count(),entity.getM_bookprice(),entity.getM_oldprice(),entity.getM_detail(),entity.getM_flag(),new Date());
        String [] type = entity.getT_type();
        String [] name = entity.getT_name();
        int index = 0;
        int lens  = 0;
        for(int lengths : entity.getLengths()) {
            lens+=lengths;
        }
        int i = 0;
        for(int lengths : entity.getLengths())
        {
                for (int IF = 0;i < lens;i++ )
                {
                    if (IF < lengths)
                    {
                        try {
                            //System.out.println("type"+new String(type[index].getBytes("iso-8859-1"),"UTF-8")+"name"+new String(name[i].getBytes("iso-8859-1"),"UTF-8"));
                            DBhelper.executeUpdate("Insert into product_type(t_type,t_name,m_id) values(?,?,?)",type[index],name[i],entity.getM_id());
                        }catch (Exception e){e.printStackTrace();}
                        IF++;
                    }
                    else {break;}
                }
                index ++;
        }
        for(int id : entity.getC_id())
        {
            DBhelper.executeUpdate("Insert into p_m(c_id,m_id) values(?,?)",id,entity.getM_id());
        }

    }
    public void add_img(String id ,String name ,String url,int e_id,int m_id)
    {
        DBhelper.executeUpdate("Insert into  images(img_id,img_name,img_url,img_date,e_id) values(?,?,?,?,?)",id,name,url,new Date(),e_id);
        DBhelper.executeUpdate("Insert into  img_m(img_id,m_id) values(?,?)",id,m_id);
    }
    public void del_img(String id)
    {
        DBhelper.executeUpdate("delete from img_m where img_id = ?",id);
        DBhelper.executeUpdate("delete from images where img_id = ?",id);
    }


    public void upd(Merchandise entity)
    {
        DBhelper.executeUpdate("update Merchandise set m_number = ?,m_name = ?,m_price = ?,m_count = ?,m_bookprice = ?,m_oldprice = ?,m_detail = ?,m_flag = ?,m_date = ? where m_id = ?",entity.getM_number(),entity.getM_name(),entity.getM_price(),entity.getM_count(),entity.getM_bookprice(),entity.getM_oldprice(),entity.getM_detail(),entity.getM_flag(),new Date(),entity.getM_id());
        DBhelper.executeUpdate("delete from p_m where m_id = ?",entity.getM_id());
        DBhelper.executeUpdate("delete from product_type where m_id = ?",entity.getM_id());

        String [] type = entity.getT_type();
        String [] name = entity.getT_name();
        int index = 0;
        int lens  = 0;
        //System.out.println(entity.getLengths().length);
            for(int lengths : entity.getLengths()) {
                lens+=lengths;
            }
            int i = 0;
            for(int lengths : entity.getLengths())
            {
                //System.out.println(lengths);
                for (int IF = 0;i < lens;i++ )
                {
                    if (IF < lengths)
                    {
                        try {
                            DBhelper.executeUpdate("Insert into product_type(t_type,t_name,m_id) values(?,?,?)",type[index],name[i],entity.getM_id());
                        }catch (Exception e){e.printStackTrace();}
                        IF++;
                    }
                    else {break;}
                }
                index ++;
            }
            for(int id : entity.getC_id())
            {
                DBhelper.executeUpdate("Insert into p_m(c_id,m_id) values(?,?)",id,entity.getM_id());
            }
    }

    public void  Upflag(Merchandise entity)
    {
        DBhelper.executeUpdate("update Merchandise set m_flag = ? where m_id = ?",entity.getM_flag(),entity.getM_id());
        }
    public void del(Merchandise entity)
    {

    }

    public List<Map<String, Object>> find(Object... obj)
    {
        return DBhelper.executeQuery("Select *from merchandise");
    }
    public List<Map<String, Object>> find_pm(Object... obj)
    {
        return DBhelper.executeQuery("Select *from  merchandise m inner JOIN p_m p on p.m_id = m.m_Id inner JOIN product_categories pc on pc.c_Id = p.c_id");
    }

    public List<Map<String, Object>> page(Object... obj)
    {
        return null;
    }

    public Map<String, Object> findOne(Merchandise entity) {
        return DBhelper.executeQuery("Select * from merchandise where m_id = ?",entity.getM_id()).get(0);
    }
    public List<Map<String, Object>> find_pm(Merchandise entity)
    {
        return DBhelper.executeQuery("Select *from  merchandise m inner JOIN p_m p on p.m_id = m.m_Id where m.m_id = ?",entity.getM_id());
    }
    public List<Map<String, Object>> Select_m()
    {
        return DBhelper.executeQuery("Select *from  merchandise m inner JOIN img_m im on im.m_id = m.m_Id  inner JOIN images i on i.img_id = im.img_id where m.m_flag=1 group by m.m_id");
    }

    public List<Map<String, Object>> Select_pc()
    {
        return DBhelper.executeQuery("Select *from product_categories where c_Flag = 0");
    }
    public List<Map<String,Object>> like_pm()
    {
        return DBhelper.executeQuery("Select * from merchandise m INNER JOIN p_m pm on m.m_id = pm.m_id ");
    }
    public List<Map<String,Object>> like_sh(String like)
    {
        return DBhelper.executeQuery("Select * from merchandise m INNER JOIN p_m pm on m.m_id = pm.m_id INNER JOIN img_m im on im.m_id = m.m_id \n" +
                " INNER JOIN images i on i.img_id = im.img_id  where m.m_name like ?   group by m.m_id ",like);
    }
    public List<Map<String, Object>> find_pt(Merchandise md)
    {
        return DBhelper.executeQuery("select * from product_type where m_id = ?",md.getM_id());
    }
    public List<Map<String, Object>> find_pt()
    {
        return DBhelper.executeQuery("select * from product_type ");
    }
    public List<Map<String, Object>> find_img(int mid)
    {
        return DBhelper.executeQuery("select *from merchandise m INNER JOIN img_m im on m.m_id = im.m_id INNER join images ig on im.img_id = ig.img_id where m.m_id = ?",mid);
    }

    public String add_sp(Merchandise md,String user)
    {

        if(user != null)
        {
            List<Map<String,Object>> list_sp = DBhelper.executeQuery("select *from buycars where m_id = ? and b_user=?",md.getM_id(),user);
            Map<String,Object> map = findOne(md);
            int counts = Integer.parseInt(map.get("m_count").toString());
            if(list_sp.size() > 0)
            {
                int  count = Integer.parseInt(list_sp.get(0).get("b_number").toString())+md.getM_count();
                if(counts < count)
                {
                    return "购买数量超过库存";
                }
                else
                {
                    DBhelper.executeUpdate("Update buycars set b_number = ? where m_id = ?  ",count,md.getM_id());
                    return "加入成功！";
                }
            }
            else
             {
                 DBhelper.executeUpdate("Insert into buycars (m_id,b_user,b_number,t_id) values(?,?,?,?)  ",md.getM_id(),user,md.getM_count(),md.getT_id());
                 return "加入成功！";
              }
        }
        else{
            return "请先登陆！";
        }
    }
    public List<Map<String, Object>> find_pt(int tid)
    {
        return DBhelper.executeQuery("select * from product_type where t_id = ?",tid);
    }

    public double[] income ()
    {
        double[] sum = new double[3];
        sum[0] = Double.parseDouble(DBhelper.executeQuery("select sum(o_price) sum from orders where o_flag = 4").get(0).get("sum").toString());
        sum[1] = Double.parseDouble(DBhelper.executeQuery("select sum(in_price2) sums from instore  where in_flag = 3").get(0).get("sums").toString());
        sum[2] = sum[0] - sum[1];
        return sum;
    }

}
