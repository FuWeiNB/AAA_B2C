package com.bbb.service;

import com.bbb.dao.PersonDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class PersonService
{
    @Autowired
    PersonDao pd;

    public List<Map<String, Object>> showPersonOrders(String user)
    {
        return pd.showPersonOrders(user);
    }
    public List<Map<String,Object>> showPersonOrdersBy1(String user)
    {
        return pd.showPersonOrdersBy1(user);
    }
    public List<Map<String,Object>> showPersonOrdersBy2(String user)
    {
        return pd.showPersonOrdersBy2(user);
    }
    public List<Map<String,Object>> showPersonOrdersBy3(String user)
    {
        return pd.showPersonOrdersBy3(user);
    }
    public List<Map<String,Object>> showPersonOrdersBy4(String user)
    {
        return pd.showPersonOrdersBy4(user);
    }
    public List<Map<String,Object>> showshopInfo(String o_id)
    {
        return pd.showshopInfo(o_id);
    }
    public Map<String,Object> findtheAddress(String o_id)
    {
        return pd.findtheAddress(o_id);
    }
    public int updateOr_flag(String o_id)
    {
        return pd.updateOr_flag(o_id);
    }
    public int updateO_flag(String o_id)
    {
        return pd.updateO_flag(o_id);
    }
    public Map<String,Object> c2Pass(String admin_id)
    {
        return pd.c2Pass(admin_id);
    }

}
