package com.bbb.service;

import com.bbb.dao.BaseDao;
import com.bbb.dao.ordersDao;
import com.bbb.entity.orders;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class OrdersService extends BaseService<orders>
{
    @Autowired
    ordersDao dao;

    public BaseDao<orders> getDao()
    {
        return dao;
    }
    public List<Map<String,Object>> show(String begindate,String afterdate,String a_name,String oflag)
    {
        return dao.show(begindate,afterdate,a_name,oflag);
    }
    public int countByParams(String a_name,String begindate,String afterdate,String oflag)
    {
        return dao.countByParams(a_name,begindate,afterdate,oflag);
    }
    public int countAll()
    {
        return dao.countAll();
    }
    public int countcancle()
    {
        return dao.countcancle();
    }
    public int countOk()
    {
        return dao.countOk();
    }
    public int countTosend()
    {
        return dao.countTosend();
    }
    public int countShou()
    {
        return dao.countShou();
    }
    //查询退款的订单
    public List<Map<String, Object>> show_QuitMoney(String begindate, String afterdate, String a_name, String oflag)
    {
        return dao.show_QuitMoney(begindate,afterdate,a_name,oflag);
    }
    public int show_QuitCount(String begindate, String afterdate, String a_name, String oflag)
    {
        return dao.show_QuitCount(begindate,afterdate,a_name,oflag);
    }
    public int Buy_count(orders o)
    {
        return dao.Buy_count(o);
    }
    public List<Map<String,Object>> findTheOrders(String o_id)
    {
        return dao.findTheOrders(o_id);
    }
    public Map<String,Object> findtheOnes(String o_id)
    {
        return dao.findtheOnes(o_id);
    }
    public void upd(String o_id,String pa_number,String e_id,String out_number)
    {
        dao.upd(o_id,pa_number,e_id,out_number);
    }
}

