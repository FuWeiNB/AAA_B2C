package com.bbb.web;

import com.bbb.dao.UserDao;
import com.bbb.entity.user;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;
//注册页面表单提交的controller层
@Controller
@RequestMapping("formController")//类的窄化路径
public class formController
{
    @ResponseBody
    @RequestMapping("toform")
    public String toform(user user)//添加注册用户信息的方法
    {
        UserDao dao = new UserDao();
        Map<String,Object> map = dao.toyz(user);
        //判断获取到的这一条数据是否为空
        if(map == null)
        {
            //判断手机号是否为空
            if(user.getPhone() == null ||"null".equals(user.getPhone()))
            {
                //如果为空，去调用邮箱注册的方法
               // System.out.println(user.getUser());
                dao.add1(user);
            }
            else{//否则就是去调用添加手机号的方法
                dao.add2(user);
            }
            return "1";//返回1是注册成功
        }
        else {
            return "0";//该账号已经被注册
        }
    }
}
