package com.bbb.dao;

import com.aaa.util.DBhelper;
import com.bbb.entity.user;

import java.util.List;
import java.util.Map;

public class UserDao
{
    public void add1(user user)//注册添加邮箱
    {

        DBhelper.executeUpdate("insert into admin_login(user,pass,email,flag) values(?,?,?,0)",user.getUser(),user.getPass(),user.getEmail());
    }
    public void add2(user user)//注册添加手机号
    {

        DBhelper.executeUpdate("insert into admin_login(pass,phone,flag) values(?,?,0)",user.getPass(),user.getPhone());
    }

    public int findOne()//查user,因为数据库中user不是自增，且为字符类型
    {
        String sql = "select max(user) user from admin_login";
        int number = Integer.valueOf(DBhelper.executeQuery(sql).get(0).get("user").toString())  ;
        return number;
    }
    public Map<String,Object> toyz(user user)//判断页面输入信息是否与数据库中的信息相等
    {

        List<Map<String, Object>> list = DBhelper.executeQuery("select * from admin_login");
        Map<String,Object> maps = null;
        for(Map<String,Object> map :list){
            if(user.getPhone()!=null&&user.getPhone().equals(map.get("phone")))
            {
                //System.out.println("输入的名称和密码正确");
                maps=map;
            }
            if(user.getEmail()!= null&&user.getEmail().equals(map.get("email")))
            {
                //System.out.println("输入的名称和密码正确");
                maps=map;
            }
        }
        return maps;
    }
    public Map<String,Object> showtheAll()
    {
        Map<String,Object> map = DBhelper.executeQuery("select max(user) maxs from admin_login ").get(0);
        Map<String,Object> map2 = DBhelper.executeQuery("select * from admin_login where user = ?",map.get("user")).get(0);
        return map2;
    }


}
