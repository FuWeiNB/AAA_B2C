package com.bbb.entity;

import java.util.ArrayList;
import java.util.Date;

public class orders
{
    private String o_id;
    private double o_price;
    private String o_user;
    private int o_flag ;
    private Date o_date;
    //某个订单的联系电话
    private String o_phone;
    //某个订单的收货地址
    private String o_aname;
    //某个订单的收货人
    private String o_name;
    private String pa_number;
    //订单备注
    private String o_memo;
    private String o_ids[];
    //订单包含的订单项（这里讲订单项封装了进来，因为一个订单拥有多个订单项）
    private ArrayList<orderdetials> list = new ArrayList<orderdetials>();

    public String getPa_number()
    {
        return pa_number;
    }

    public void setPa_number(String pa_number)
    {
        this.pa_number = pa_number;
    }



    public String[] getO_ids()
    {
        return o_ids;
    }

    public void setO_ids(String[] o_ids)
    {
        this.o_ids = o_ids;
    }

    public String getO_name()
    {
        return o_name;
    }

    public void setO_name(String o_name)
    {
        this.o_name = o_name;
    }

    public String getO_memo()
    {
        return o_memo;
    }

    public void setO_memo(String o_memo)
    {
        this.o_memo = o_memo;
    }

    public String getO_aname()
    {
        return o_aname;
    }

    public void setO_aname(String o_aname)
    {
        this.o_aname = o_aname;
    }

    public String getO_id()
    {
        return o_id;
    }

    public void setO_id(String o_id)
    {
        this.o_id = o_id;
    }

    public double getO_price()
    {
        return o_price;
    }

    public void setO_price(double o_price)
    {
        this.o_price = o_price;
    }

    public String getO_user()
    {
        return o_user;
    }

    public void setO_user(String o_user)
    {
        this.o_user = o_user;
    }

    public int getO_flag()
    {
        return o_flag;
    }

    public void setO_flag(int o_flag)
    {
        this.o_flag = o_flag;
    }

    public Date getO_date()
    {
        return o_date;
    }

    public void setO_date(Date o_date)
    {
        this.o_date = o_date;
    }

    public String getO_phone()
    {
        return o_phone;
    }

    public void setO_phone(String o_phone)
    {
        this.o_phone = o_phone;
    }
}
