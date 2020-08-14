package com.bbb.dao;

import com.aaa.util.DBhelper;
import com.bbb.entity.Buycars;
import com.bbb.entity.address;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public class addressDao implements BaseDao<address>
{
    @Override
    public void add(address entity){
    }

    @Override
    public void upd(address entity)
    {

    }
    @Override
    public void del(address entity)
    {

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
    public Map<String, Object> findOne(address entity)
    {
        return null;
    }
    public List<Map<String, Object>> findAll(Object... obj)
    {
        return DBhelper.executeQuery("select * from address");
    }


    public Map<String, Object> findone(address entity)
    {
        if("0".equals(entity.getA_id()))
        {
            return null;
        }
        else
        {
            return DBhelper.executeQuery("select * from address where a_id=?",entity.getA_id()).get(0);
        }

    }
    public List<Map<String,Object>> findByUser(Buycars cars)
    {
        return DBhelper.executeQuery("select * from address where user=?",cars.getB_user());
    }
    public int count()
    {
        return 0;
    }

    public List<Map<String, Object>> findByParams(address entity)
    {
        String sql = "select * from address where a_id = ?";
        return DBhelper.executeQuery(sql,entity.getA_id());
    }
    public List<Map<String,Object>> ByUserFind(String user)
    {
        String sql = "select * from address where user = ?";
        return DBhelper.executeQuery(sql,user);
    }
    public String toupd_flag (String a_id,String user)
    {
        List<Map<String,Object>> list = DBhelper.executeQuery("select* from address where a_flag = 0 and user = ?",user);
        int number = 0;
        if(list.size() == 0)
        {
            number =  DBhelper.executeUpdate("update address set a_flag = 0 where a_id = ?",a_id);
        }
        else
        {
            DBhelper.executeUpdate("update address set a_flag = 1 where a_id = ?",list.get(0).get("a_id"));
            DBhelper.executeUpdate("update address set a_flag = 0 where a_id = ?",a_id);
        }
        return number+"";
    }
    public int del_address(String a_id,String user)
    {
        int count = 0;
        List<Map<String,Object>> list = DBhelper.executeQuery("select * from address where a_id = ? and user = ?",a_id,user);
        if(list.size() == 1)
        {
            count =0;
        }
        if("0".equals(list.get(0).get("a_flag")))
        {
            List<Map<String,Object>> list2 = DBhelper.executeQuery("select * from address where a_id !=? and user =?",a_id,user);
            DBhelper.executeUpdate("update address set a_flag = 0 where a_id = ? ",list2.get(0).get("a_id"));
            count = DBhelper.executeUpdate("delete from address where a_id =?",a_id);
        }
        else
        {
            count = DBhelper.executeUpdate("delete from address where a_id =?",a_id);
        }
        return count;
    }
    public int ByUserFinds(address a)
    {
        return DBhelper.executeQuery("select * from address where user = ?",a.getUser()).size();
    }
    //添加收货地址
    public int adds(address a)
    {
        //先查询一下该用户有没有收货地址的状态为0的 如果没有的话就直接添加一个 然后如果有的话 就要把查询出来的这个进行修改
        //改为不是默认状态下的
        int size = ByUserFinds(a);
        if(size>=10)
        {
            return 0;
        }
        else
        {
            List<Map<String,Object>> list = DBhelper.executeQuery("select* from address where a_flag = 0 and user = ?",a.getUser());
            String sql = "";
            if(list.size()==0)
            {
                sql = "insert into address(a_name,a_namedetials,user,a_phone,a_flag) values(?,?,?,?,?)";
                return DBhelper.executeUpdate(sql,a.getA_name(),a.getA_namedetials(),a.getUser(),a.getA_phone(),a.getA_flag());
            }
            else
            {
                sql = "insert into address(a_name,a_namedetials,user,a_phone,a_flag) values(?,?,?,?,?)";
                DBhelper.executeUpdate(sql,a.getA_name(),a.getA_namedetials(),a.getUser(),a.getA_phone(),a.getA_flag());
                return DBhelper.executeUpdate("update address set a_flag = 1 where a_id = ?",list.get(0).get("a_id"));
            }
        }

    }
    //先进行查询,如果里面没有就直接修改,如果里面有该默认的收货地址就先把原来默认的修改成为1然后再修改这个收货地址
    public int upds(address a)
    {
        List<Map<String,Object>> list = DBhelper.executeQuery("select* from address where a_flag = 0 and user = ?",a.getUser());
        String sql = "";

        if(list.size()==0)
        {

            sql = "update address set a_name=?,a_namedetials=?,a_flag=?,a_phone=? where a_id=?";
            return DBhelper.executeUpdate(sql,a.getA_name(),a.getA_namedetials(),a.getA_flag(),a.getA_phone(),a.getA_id());
        }
        else
        {
            sql = "update address set a_name=?,a_namedetials=?,a_flag=?,a_phone=? where a_id=?";
            DBhelper.executeUpdate(sql,a.getA_name(),a.getA_namedetials(),a.getA_flag(),a.getA_phone(),a.getA_id());
            return DBhelper.executeUpdate("update address set a_flag = 1 where a_id = ?",list.get(0).get("a_id"));
        }

    }
    public int upd_pass(String newpass,String user)
    {
        int count = DBhelper.executeUpdate("update admin_login set pass=? where user = ?",newpass,user);
        return count;
    }


}
