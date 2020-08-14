package com.bbb.dao;

import com.aaa.util.DBhelper;
import com.bbb.entity.admin_login;
import com.bbb.util.PageHelper;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.Map;
@Component
public class AdminDao
{
    public int add(admin_login entity) {
         return 0;
    }

    public int upd(admin_login entity) {
       return  DBhelper.executeUpdate("update admin_login set flag = ? where user =?",entity.getFlag(),entity.getUser());
    }

    public int del(admin_login entity) {
        return 0;
    }

    public List<Map<String, Object>> findAll(Object... obj) {
        return DBhelper.executeQuery("select * from admin_login");
    }

    public List<Map<String, Object>> findPage(PageHelper p, admin_login entity)
    {
        String sql ="select * from admin_login where 1=1";
        if(!"0".equals(entity.getFlag()))
        {
            sql += " and flag like '%"+entity.getFlag()+"%'";
        }
        if(entity.getName() != null)
        {
            sql += " and name like '%"+entity.getName()+"%'";
        }
        sql += " limit ?,?";
        return DBhelper.executeQuery(sql, p.getBegin(),p.getPageSize());
    }
    public Map<String, Object> findOne(admin_login entity) {
        return DBhelper.executeQuery("select * from admin_login where user=?",entity.getUser()).get(0);
    }
    public Map<String, Object> findtheOne(String user) {
        return DBhelper.executeQuery("select * from admin_login where user=?",user).get(0);
    }

    public int count(admin_login entity)
    {
        String sql ="select count(*) counts from admin_login where 1=1";
        if(entity.getFlag() != 2)
        {
            sql += " and flag like '%"+entity.getFlag()+"%'";
        }
        if(entity.getName() != null)
        {
            sql += " and name like '%" + entity.getName() + "%'";
        }
        return Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("counts").toString());

    }

    public List<Map<String, Object>> findByParams(admin_login entity) {
        return null;
    }
    public int counts(admin_login entity) {
        return 0;
    }
    public Map<String,Object> login(Object... obj)
    {
        List<Map<String, Object>> list = DBhelper.executeQuery("select * from admin_login where name=? and pass=? ", obj);
        return list.size() == 0 ? null :list.get(0);
    }
    public Map<String,Object> adminlogin(Object... obj)
    {
        List<Map<String, Object>> list = DBhelper.executeQuery("select * from admin_login where flag = 0");
        Map<String,Object> maps = null;
        for(Map<String,Object> map :list)
        {
                if(obj[0].equals(map.get("name"))&&obj[1].equals(map.get("pass")))
                {
                    System.out.println("输入的名称和密码正确");
                    maps=map;
                }
                if(obj[0].equals(map.get("email"))&&obj[1].equals(map.get("pass")))
                {
                    System.out.println("邮箱输入正确");
                    maps=map;
                }
                if(obj[0].equals(map.get("phone"))&&obj[1].equals(map.get("pass")))
                {
                    System.out.println("手机号输入正确");
                    maps=map;
                }

        }
        return maps;
    }
}
